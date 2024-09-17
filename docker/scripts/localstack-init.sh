awslocal s3 mb s3://local-food-tour-assets
awslocal s3api put-bucket-acl --bucket local-food-tour-assets --acl public-read
awslocal s3 cp --recursive /s3/data s3://local-food-tour-assets
