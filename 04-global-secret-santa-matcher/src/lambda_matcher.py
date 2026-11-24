import os
import random
import boto3

dynamodb = boto3.resource('dynamodb')
ses = boto3.client('ses')

TABLE_NAME = os.environ.get('DYNAMODB_TABLE', 'SecretSantaParticipants')
SENDER_EMAIL = os.environ.get('SENDER_EMAIL', 'noreply@yourdomain.com')
table = dynamodb.Table(TABLE_NAME)

def generate_matches(participants):
    if len(participants) < 2:
        raise ValueError("At least 2 participants are required for Secret Santa.")

    shuffled = participants.copy()
    random.shuffle(shuffled)

    matches = []
    num_participants = len(shuffled)

    for i in range(num_participants):
        giver = shuffled[i]
        receiver = shuffled[(i + 1) % num_participants]
        matches.append((giver, receiver))

    return matches

def lambda_handler(event, context):
    response = table.scan()
    participants = response.get('Items', [])

    if len(participants) < 2:
        return {'statusCode': 400, 'body': 'Not enough participants registered.'}

    matches = generate_matches(participants)
    
    sent_count = 0
    for giver, receiver in matches:
        email_body = f"""
Hello {giver['Name']},

🎄 Welcome to the Global Secret Santa Gift Exchange! 🎁

You have been assigned as Secret Santa for:
Recipient Name: {receiver['Name']}
Wishlist / Notes: {receiver.get('Wishlist', 'No wishlist provided')}

Please keep this assignment secret! Happy holidays!
"""
        try:
            ses.send_email(
                Source=SENDER_EMAIL,
                Destination={'ToAddresses': [giver['Email']]},
                Message={
                    'Subject': {'Data': '🎅 Your Secret Santa Match Details!'},
                    'Body': {'Text': {'Data': email_body}}
                }
            )
            sent_count += 1
        except Exception as e:
            print(f"Failed to send email to {giver['Email']}: {str(e)}")

    return {
        'statusCode': 200,
        'body': f'Successfully matched and emailed {sent_count} participants.'
    }