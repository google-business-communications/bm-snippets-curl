# Replace the __CONVERSATION_ID__
# Make sure a service account key file exists at ./service_account_key.json

curl -X POST \
"https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/messages?forceFallback=true" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "`oauth2l header --json ./service_account_key.json businessmessages`" \
-d "{
    'messageId': '86b11a9c-6d29-499a-b516-444e9d2a5543',
    'text': 'Hello world!',
    'fallback': 'Hello, world!\n\nSay \"Hello\" at https://www.growingtreebank.com',
    'suggestions': [
      {
        'action': {
          'text': 'Hello',
          'postbackData': 'hello-formal',
          'openUrlAction': {
            'url': 'https://www.growingtreebank.com',
          }
        },
      },
    ],
    'representative': {
      'avatarImage': 'https://lh3.googleusercontent.com/LjlQXZGF-3C0yv99xAKpv942l62ZV8nhG59rR8PXbqR_ue2_AJY67X7dlEKi_a21vgswYqVD0E7fdFYcku4uQjDncYVSVA65IUBVRm4=w153',
      'displayName': 'Chatbot',
      'representativeType': 'BOT'
    }
  }"