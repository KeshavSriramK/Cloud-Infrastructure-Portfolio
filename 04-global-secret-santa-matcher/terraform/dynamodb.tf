resource "aws_dynamodb_table" "participants" {
  name         = "SecretSantaParticipants"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ParticipantID"

  attribute {
    name = "ParticipantID"
    type = "S"
  }
}