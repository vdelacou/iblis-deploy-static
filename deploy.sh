#!/bin/bash
npm install
npm install -g serverless
serverless deploy -v
export S3_BUCKET=$(serverless info -v | grep BucketSiteName | sed s/BucketSiteName\:\ //g | awk '{print $1}')
export CLOUDFRONT_DISTRIBUTION_ID=$(serverless info -v | grep CloudFrontDistributionId | sed s/CloudFrontDistributionId\:\ //g | awk '{print $1}')
pip install awscli --upgrade --ignore-installed six
aws s3 sync build/ s3://$S3_BUCKET --delete --cache-control max-age=31536000,public
aws s3 cp s3://$S3_BUCKET/index.html s3://$S3_BUCKET/index.html --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type text/html
aws s3 cp s3://$S3_BUCKET/fr/index.html s3://$S3_BUCKET/fr/index.html --metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate --content-type text/html
aws configure set preview.cloudfront true
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"