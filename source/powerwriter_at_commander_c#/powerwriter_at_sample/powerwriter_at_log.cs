using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace powerwriter_at_log
{
    public class PW_At_Log
    {
        // Log type
        public enum E_AT_LOG_TYPE
        {
            LOGN,
            LOGI,
            LOGD,
            LOGW,
            LOGE,
            __LOG_TYPE_MAX
        };

        // log type
        private static string[] S_POWERWRITER_AT_LOG_PREFIX = new string[]
        {
            "",
            "[Info ]:",
            "[Debug]:",
            "[Warn ]:",
            "[Error]:"
        };

        private static string GetLogPrefix(E_AT_LOG_TYPE type)
        {
            int index = (int)type;
            if (index >= 0 && index < S_POWERWRITER_AT_LOG_PREFIX.Length)
            {
                return S_POWERWRITER_AT_LOG_PREFIX[index];
            }
            return "[UNKNOWN]: ";
        }

        public static void powerwriter_at_log(E_AT_LOG_TYPE type, string format, params object[] args)
        {
#if POWERWRITER_AT_LOGGER_ENABLE
            string prefix = GetLogPrefix(type);
            Console.WriteLine($"{prefix}{string.Format(format, args)}");
#endif
        }
    }
}
