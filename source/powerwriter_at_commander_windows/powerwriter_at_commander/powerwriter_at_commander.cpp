
#include "SerialPortApp.h"

SerialPortApp m_App;

/* Send AT Command */
bool powerwriter_data_out(S_ATCmdFrame * pf, int timeout)
{
	return m_App.OnSend(pf, pf->m_frameLength);
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

	/* Introduction */
	powerwriter_at_introduction();

	return m_App.RunATBenchmark(false, powerwriter_data_out, powerwriter_event_out);
}