using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace powerwriter_at_config
{
    public static class PW_At_Constants
    {
        public const int POWERWRITER_AT_PACKAGE_ALIGN = 16;             // package align size 
        public const int PW_OEM_LENGTH = 8;                             // PowerWriter OEM length
        public const int PW_SN_LENGTH = 32;                             // PowerWriter SN length
        public const int PW_VERSION_LENGTH = 8;                         // PowerWriter version information length
        public const int PW_TARGET_NAME_MAX = 16;                       // PowerWriter target name max length
        public const int PW_TARGET_ID_MAX = 16;                         // Target chip ID MAX size
        public const int PW_PACKAGE_SIZE = 256;                         // Buffer size of block data
        public const int PW_OB_MAX = 1024;                              // Target chip option uint8 MAX size;
        public const int PW_ENUM_MAX = int.MaxValue;                    // PowerWriter default enum max value
        public const int PW_AT_DEFAULT_BAUDRATE = 9600;         		// PowerWriter AT command default baud rate
        public const int PW_AT_TIMEOUT_BASE = 5000;                     // PowerWriter AT command timeout general
        public const int PW_AT_TIMEOUT_MIN = 100;                       // PowerWriter AT command timeout min
    };
}
