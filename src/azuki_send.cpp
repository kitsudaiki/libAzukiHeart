 /**
 * @file        azuki_send.cpp
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

#include <libAzukiHeart/azuki_send.h>
#include <libAzukiHeart/azuki_messages.h>

#include <libKitsunemimiHanamiCommon/component_support.h>
#include <libKitsunemimiHanamiCommon/structs.h>
#include <libKitsunemimiHanamiNetwork/hanami_messaging.h>
#include <libKitsunemimiHanamiNetwork/hanami_messaging_client.h>

using Kitsunemimi::Hanami::HanamiMessaging;
using Kitsunemimi::Hanami::HanamiMessagingClient;
using Kitsunemimi::Hanami::SupportedComponents;

namespace Azuki
{

/**
 * @brief sendSetCpuSpeedMessage
 * @param speedState
 */
void
sendSetCpuSpeedMessage(const SpeedState speedState)
{
    // create message
    Kitsunemimi::ErrorContainer error;
    HanamiMessagingClient* client = HanamiMessaging::getInstance()->azukiClient;
    if(client == nullptr) {
        return;
    }

    SetCpuSpeed_Message msg;
    msg.speedState = speedState;
    uint8_t buffer[96*1024];
    const uint64_t size = msg.createBlob(buffer, 96*1024);

    // send
    client->sendGenericMessage(buffer, size, error);
}

}
