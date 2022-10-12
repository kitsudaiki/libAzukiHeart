/**
 * @file        azuki_messages.h
 *
 * @author      Tobias Anker <tobias.anker@kitsunemimi.moe>
 *
 * @copyright   Apache License Version 2.0
 *
 *      Copyright 2022 Tobias Anker
 *
 *      Licensed under the Apache License, Version 2.0 (the "License");
 *      you may not use this file except in compliance with the License.
 *      You may obtain a copy of the License at
 *
 *          http://www.apache.org/licenses/LICENSE-2.0
 *
 *      Unless required by applicable law or agreed to in writing, software
 *      distributed under the License is distributed on an "AS IS" BASIS,
 *      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *      See the License for the specific language governing permissions and
 *      limitations under the License.
 */

#ifndef AZUKI_MESSAGES_H
#define AZUKI_MESSAGES_H

#include <libKitsunemimiHanamiCommon/messages.h>

using Kitsunemimi::Hanami::HanamiMessage;
using Kitsunemimi::DataBuffer;

namespace Azuki
{

enum AzukiMessageTypes
{
    UNDEFINED_MESSAGE_TYPE = 0,
    SET_CPU_SPEED_MESSAGE_TYPE = 1,
};

//==================================================================================================

class SetCpuSpeed_Message
        : public HanamiMessage
{
public:
    SetCpuSpeed_Message();
    ~SetCpuSpeed_Message();

    enum SpeedState {
        MINIMUM_SPEED = 0,
        AUTOMATIC_SPEED = 1,
        MAXIMUM_SPEED = 2,
    };

    uint64_t speedState = MINIMUM_SPEED;

    bool read(void* data, const uint64_t dataSize);
    uint64_t createBlob(uint8_t* result, const uint64_t bufferSize);
};

}

#endif // AZUKI_MESSAGES_H
