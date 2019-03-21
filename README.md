# IBLIS-DEPLOY-STATIC

_**Deploy Multi-Language Static HTML on CDN.**_

**_With Serverless Framework and AWS CloudFront. Delete Cache on redeploying and force redirect according to browser language_**

Repository for this medium article: [Deploy Multi-Language Static HTML on CDN](https://medium.com/@vdelacou/serverless-graphql-with-aws-appsync-and-dynamodb-3dcbe29f026e)

Please read the article if you have any questions

## Why

With the rise of Single Page Application (SPA), the use of a Content Delivery Network (CDN) is more than recommended.
It allows us to have fast and reliable static hosting with easy HTTPS set up around the world.
I love CloudFront, but I was always frustrated with 2 things, that I can do with .htaccess or Nginx configuration:

- When I deploy a new version, I want it accessible immediately (clean server and browser cache)
- If browser it's in French, I want to redirect the user to /fr/index.html (for example)

## Features

- Automatic S3 Bucket set-up (all object private)
- Automatic Cloudfront set-up with policy access to the bucket
- Set up of AWS lambda with CloudFront Egde
- Redirect user according to browser language
- Copy the file to S3 Bucket
- Clean S3 Object Cache when redeploy
- Invalidate CDN Distribution when redeploy

## Library and Tools

- [AWS S3](https://aws.amazon.com/s3/) To Store the files for our website (html, css, js)
- [AWS CloudFront](https://aws.amazon.com/cloudfront/) For delivered our website on a CDN
- [Serverless](https://serverless.com/) To help us deploying our infrastructure
- [Serverless CLoudFront Lambda Edge](https://github.com/silvermine/serverless-plugin-cloudfront-lambda-edge) To associate a Lambda function with CloudFront Edge

## Deploy the site in src folder

Install and follow [instructions](https://serverless.com/framework/docs/providers/aws/guide/installation/) to setup serverless with AWS

Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

Then Launch

`./deploy.sh`

## Deploy with BitBucket Pipelines

We add the `bitbucket-pipelines.yml` file for you to use [the bitbucket pipleines](https://bitbucket.org/product/features/pipelines) out of the box.

## Contribute

1.  [Fork](https://help.github.com/articles/fork-a-repo/) this repository to your own GitHub account and then [clone](https://help.github.com/articles/cloning-a-repository/) it to your local device
2.  Make the necessary changes and ensure that the tests are passing
3.  Send a pull request

## Known issues

- None for the moment

## License

Please, refer to LICENSE file
