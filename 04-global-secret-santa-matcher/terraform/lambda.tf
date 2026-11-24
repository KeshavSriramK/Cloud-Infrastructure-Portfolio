data "archive_file" "register_zip" {
  type        = "zip"
  source_file = "${path.module}/../src/lambda_register.py"
  output_path = "${path.module}/register.zip"
}

data "archive_file" "matcher_zip" {
  type        = "zip"
  source_file = "${path.module}/../src/lambda_matcher.py"
  output_path = "${path.module}/matcher.zip"
}

resource "aws_lambda_function" "register" {
  filename         = data.archive_file.register_zip.output_path
  function_name    = "secret_santa_register"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_register.lambda_handler"
  runtime          = "python3.11"
  source_code_hash = data.archive_file.register_zip.output_base64sha256

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.participants.name
    }
  }
}

resource "aws_lambda_function" "matcher" {
  filename         = data.archive_file.matcher_zip.output_path
  function_name    = "secret_santa_matcher"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_matcher.lambda_handler"
  runtime          = "python3.11"
  source_code_hash = data.archive_file.matcher_zip.output_base64sha256

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.participants.name
      SENDER_EMAIL   = "your-verified-ses-email@example.com"
    }
  }
}