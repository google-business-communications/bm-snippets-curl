# Replace the __CONVERSATION_ID__
# Make sure a service account key file exists at ./service_account_key.json

curl -X POST "https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/events?eventId=6a0af2c6-787d-4097-870d-93fe20351747" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "`oauth2l header --json ./service_account_key.json businessmessages`" \
-d "{
  'eventType': 'TYPING_STARTED',
  'representative': {
    'avatarImage': 'https://lh3.googleusercontent.com/LjlQXZGF-3C0yv99xAKpv942l62ZV8nhG59rR8PXbqR_ue2_AJY67X7dlEKi_a21vgswYqVD0E7fdFYcku4uQjDncYVSVA65IUBVRm4=w153',
    'displayName': 'Chatbot',
    'representativeType': 'BOT'
  },
}"