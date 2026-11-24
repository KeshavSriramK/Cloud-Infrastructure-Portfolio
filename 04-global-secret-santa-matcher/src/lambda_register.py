import json
import os
import uuid
import boto3

dynamodb = boto3.resource('dynamodb')
TABLE_NAME = os.environ.get('DYNAMODB_TABLE', 'SecretSantaParticipants')
table = dynamodb.Table(TABLE_NAME)

def lambda_handler(event, context):
    try:
        body = json.loads(event.get('body', '{}'))
        name = body.get('name')
        email = body.get('email')
        wishlist = body.get('wishlist', '')

        if not name or not email:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Name and Email are required.'})
            }

        participant_id = str(uuid.uuid4())
        
        table.put_item(
            Item={
                'ParticipantID': participant_id,
                'Name': name,
                'Email': email,
                'Wishlist': wishlist,
                'Matched': False
            }
        )

        return {
            'statusCode': 201,
            'body': json.dumps({'message': 'Participant registered successfully!', 'id': participant_id})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }