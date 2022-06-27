
#include "SerialPortApp.h"

SerialPortApp m_App;

/* Send AT Command */
bool powerwriter_data_out(void * data, size_t size, int timeout)
{
	return m_App.OnSend(data, size);
}

/* The AT event was received */
void powerwriter_event_out(void * obj, S_ATCmdEvent event)
{
	S_ATChannel	* ch = (S_ATChannel *)obj;

	switch (event)
	{
		/* received package */
	case ATEventCmd:
	{
		const S_ATCmdFrame * frame;
		if (frame = powerwriter_at_received_frame(ch)) {
			powerwriter_at_log(LOGD, "AT received cmd: [%04X]\r\n", frame->m_payload.m_cmdType);
		}
	}
	break;
	case ATEventError:
	{
		powerwriter_at_log(LOGE, "AT received error: [%04X]\r\n", powerwriter_at_last_error(ch));
		break;
	}
	default:
		break;
	}
}

int main() {
	return m_App.RunATBenchmark(true, powerwriter_data_out, powerwriter_event_out);
}