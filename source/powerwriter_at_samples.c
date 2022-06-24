/**
 * @file    powerwriter_at_samples.c
 * @brief   PowerWriter open communication interface
 *
 * PowerWriter AT
 * Copyright (c) 2009-2021, ICWorkshop Limited, All Rights Reserved
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "powerwriter_at_api.h"

void powerwriter_at_introduction()
{
    powerwriter_at_log(LOGI, "\t\t\t\tPowerWriter open communication interface\r\n");
    powerwriter_at_log(LOGI, "\r\n");
    powerwriter_at_log(LOGI, "The PowerWriter AT open interface allows you to control PowerWriter behavior, implement \r\n");
    powerwriter_at_log(LOGI, "highly flexible personalized and customized requirements, native hardware support, and  \r\n");
    powerwriter_at_log(LOGI, "cross-platform.For more information, visit: \r\n");
    powerwriter_at_log(LOGI, "https://docs.powerwriter.com/docs/powerwriter_for_arm/reference/ATCommand\r\n");
    powerwriter_at_log(LOGI, "\r\n");
    powerwriter_at_log(LOGI, "\r\n");
    powerwriter_at_log(LOGI, "ICWorkshop HPT Dep Team(PowerWriter)\r\n");
    powerwriter_at_log(LOGI, "Technical support: csh@icworkshop.com\r\n");
    powerwriter_at_log(LOGI, "www.icworkshop.com / www.powerwriter.cn(.com)\r\n");
}

void powerwriter_at_samples()
{
    powerwriter_at_introduction(); /* Introduction */
}
