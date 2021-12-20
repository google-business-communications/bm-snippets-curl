# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This code sends an image to the user with a fallback text.
# Read more: https://developers.google.com/business-communications/business-messages/guides/how-to/message/send?hl=en#images

# Replace the __CONVERSATION_ID__ with a conversation id that you can send messages to
# Make sure a service account key file exists at ./service_account_key.json

curl -X POST "https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/messages" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "`oauth2l header --json ./service_account_key.json businessmessages`" \
-d "{
    'messageId': '$(uuidgen)',
    'representative': {
      'avatarImage': 'https://developers.google.com/identity/images/g-logo.png',
      'displayName': 'Chatbot',
      'representativeType': 'BOT'
    },
    'fallback': 'Hello, world!\nAn image has been sent with Business Messages.',
    'image': {
      'contentInfo':{
        'altText': 'Image alternative text',
        'fileUrl': 'https://storage.googleapis.com/kitchen-sink-sample-images/cute-dog.jpg',
        'forceRefresh': 'false'
      }
    },
  }"