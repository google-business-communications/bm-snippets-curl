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

# This code sends a text message to the user with an authentication request suggestion
# that allows the user to authenticate with OAuth. It also has a fallback text.
# Read more: https://developers.google.com/business-communications/business-messages/guides/how-to/message/send?hl=en#authentication-request-suggestion

# Replace the __CONVERSATION_ID__ with a conversation id that you can send messages to
# Make sure a service account key file exists at ./service_account_key.json
# Replace the __CLIENT_ID__
# Replace the __CODE_CHALLENGE__
# Replace the __SCOPE__

curl --http1.1 -X POST "https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/messages" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "$(oauth2l header --json ./service_account_key.json businessmessages)" \
-d '{
  "messageId": "'$(uuidgen)'",
  "text": "Sign in to continue the conversation.",
  "fallback": "Visit support.growingtreebank.com to continue.",
  "suggestions": [
    {
      "authenticationRequest": {
        "oauth": {
          "clientId": "__CLIENT_ID__",
          "codeChallenge": "__CODE_CHALLENGE__",
          "scopes": [
            "__SCOPE__"
          ]
        }
      }
    }
  ],
  "representative": {
    "avatarImage": "https://developers.google.com/identity/images/g-logo.png",
    "displayName": "Chatbot",
    "representativeType": "BOT"
  }
}'