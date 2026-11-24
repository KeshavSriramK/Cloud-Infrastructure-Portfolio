#1. Creating an AWS S3 bucket. Note: bucket names must be globally unique.
resource "aws_s3_bucket" "website" {
    bucket = "my-simplestatic-webiste-bucket-2026"
    force_destroy = true
}


#2. Enable static Website Hosting.
resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.website.id

    index_document {
        suffix = "index.html"
    }
}


#3. Upload the index.html file to the S3 bucket.
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.website.id
    key    = "index.html"
    source = "index.html"
    content_type = "text/html"
}