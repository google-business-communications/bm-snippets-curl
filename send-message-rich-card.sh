## Copyright 2022 Google LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     https://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

# This code sends a rich card to the user with a fallback text.
# Read more: https://developers.google.com/business-communications/business-messages/guides/how-to/message/send?hl=en#rich-cards

# Replace the __CONVERSATION_ID__ with a conversation id that you can send messages to
# Make sure a service account key file exists at ./service_account_key.json

curl --http1.1 -X POST "https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/messages" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "$(oauth2l header --json ./service_account_key.json businessmessages)" \
-d '{
  "messageId": "'$(uuidgen)'",
  "representative": {
    "avatarImage": "https://developers.google.com/identity/images/g-logo.png",
    "displayName": "Chatbot",
    "representativeType": "BOT"
  },
  "fallback": "Hello, world!\nSent with Business Messages\n\nReply with \"Suggestion #1\" or \"Suggestion #2\"",
  "richCard": {
    "standaloneCard": {
      "cardContent": {
        "title": "Hello, world!",
        "description": "Sent with Business Messages.",
        "media": {
          "height": "TALL",
          "contentInfo":{
            "altText": "Google logo",
            "fileUrl": "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
            "forceRefresh": false
          }
        },
        "suggestions": [
          {
            "reply": {
              "text": "Suggestion #1",
              "postbackData": "suggestion_1"
            }
          },
          {
            "reply": {
              "text": "Suggestion #2",
              "postbackData": "suggestion_2"
            }
          }
        ]
      }
    }
  }
}'