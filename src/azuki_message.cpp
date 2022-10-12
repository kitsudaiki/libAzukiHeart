
/**
 * @file        shiori_messages.cpp
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

#include <libAzukiHeart/azuki_messages.h>

namespace Azuki
{

//==================================================================================================

/**
 * @brief constructor
 */
SetCpuSpeed_Message::SetCpuSpeed_Message()
    : HanamiMessage()
{
    m_type = SET_CPU_SPEED_MESSAGE_TYPE;
}

/**
 * @brief destructor
 */
SetCpuSpeed_Message::~SetCpuSpeed_Message() {}

/**
 * @brief read message from bytes
 *
 * @param data data-pointer to read
 * @param dataSize number of bytes to read
 *
 * @return false, if message is broken, else true
 */
bool
SetCpuSpeed_Message::read(void* data, const uint64_t dataSize)
{
    if(initRead(data, dataSize) == false) {
        return false;
    }

    if(readUint(data, speedState) == false) {
        return false;
    }

    return true;
}

/**
 * @brief convert message content into binary to send
 *
 * @param result data-buffer for the resulting binary
 */
uint64_t
SetCpuSpeed_Message::createBlob(uint8_t* result, const uint64_t bufferSize)
{
    const uint64_t totalMsgSize = sizeof(MessageHeader)
                                  + sizeof(Entry)
                                  + sizeof(speedState);

    if(bufferSize < totalMsgSize) {
        return 0;
    }

    uint64_t pos = 0;
    pos += initBlob(&result[pos], totalMsgSize);
    pos += appendUint(&result[pos], speedState);

    assert(pos == totalMsgSize);

    return pos;
}

}
