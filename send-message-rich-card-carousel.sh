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
    'fallback': 'Card #1\nThe description for card #1\n\nCard #2\nThe description for card #2\n\nReply with \"Card #1\" or \"Card #2\"',
    'richCard': {
      'carouselCard': {
        'cardWidth': 'MEDIUM',
        'cardContents': [
          {
            'title': 'Card #1',
            'description': 'The description for card #1',
            'suggestions': [
              {
                'reply': {
                  'text': 'Card #1',
                  'postbackData': 'card_1'
                }
              }
            ],
            'media': {
              'height': 'MEDIUM',
              'contentInfo': {
                'fileUrl': 'https://storage.googleapis.com/kitchen-sink-sample-images/cute-dog.jpg',
                'forceRefresh': 'false',
              }
            }
          },
          {
            'title': 'Card #2',
            'description': 'The description for card #2',
            'suggestions': [
              {
                'reply': {
                  'text': 'Card #2',
                  'postbackData': 'card_2'
                }
              }
            ],
            'media': {
              'height': 'MEDIUM',
              'contentInfo': {
                'fileUrl': 'https://storage.googleapis.com/kitchen-sink-sample-images/elephant.jpg',
                'forceRefresh': 'false',
              }
            }
          }
        ]
      }
    }
  }"