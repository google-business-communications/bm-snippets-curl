# Replace the __CONVERSATION_ID__
# Make sure a service account key file exists at ./service_account_key.json

curl -X POST "https://businessmessages.googleapis.com/v1/conversations/__CONVERSATION_ID__/messages" \
-H "Content-Type: application/json" \
-H "User-Agent: curl/business-messages" \
-H "`oauth2l header --json ./service_account_key.json businessmessages`" \
-d "{
    'messageId': '86b11a9c-6d29-499a-b516-444e9d2a5543',
    'representative': {
      'avatarImage': 'https://lh3.googleusercontent.com/LjlQXZGF-3C0yv99xAKpv942l62ZV8nhG59rR8PXbqR_ue2_AJY67X7dlEKi_a21vgswYqVD0E7fdFYcku4uQjDncYVSVA65IUBVRm4=w153',
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