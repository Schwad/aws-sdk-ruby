# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


require 'aws-sdk-kms'
require 'aws-sigv4'
require 'aws-sdk-core'

# This module provides support for Amazon Simple Storage Service. This module is available in the
# `aws-sdk-s3` gem.
#
# # Client
#
# The {Client} class provides one method for each API operation. Operation
# methods each accept a hash of request parameters and return a response
# structure.
#
#     s3 = Aws::S3::Client.new
#     resp = s3.abort_multipart_upload(params)
#
# See {Client} for more information.
#
# # Errors
#
# Errors returned from Amazon Simple Storage Service are defined in the
# {Errors} module and all extend {Errors::ServiceError}.
#
#     begin
#       # do stuff
#     rescue Aws::S3::Errors::ServiceError
#       # rescues all Amazon Simple Storage Service API errors
#     end
#
# See {Errors} for more information.
#
# @!group service
module Aws
  module S3
    autoload :Types, 'aws-sdk-s3/types'
    autoload :ClientApi, 'aws-sdk-s3/client_api'

    module Plugins
      autoload :Accelerate, 'aws-sdk-s3/plugins/accelerate'
      autoload :AccessGrants, 'aws-sdk-s3/plugins/access_grants'
      autoload :ARN, 'aws-sdk-s3/plugins/arn'
      autoload :BucketDns, 'aws-sdk-s3/plugins/bucket_dns'
      autoload :BucketNameRestrictions, 'aws-sdk-s3/plugins/bucket_name_restrictions'
      autoload :Dualstack, 'aws-sdk-s3/plugins/dualstack'
      autoload :Endpoints, 'aws-sdk-s3/plugins/endpoints'
      autoload :Expect100Continue, 'aws-sdk-s3/plugins/expect_100_continue'
      autoload :ExpressSessionAuth, 'aws-sdk-s3/plugins/express_session_auth'
      autoload :GetBucketLocationFix, 'aws-sdk-s3/plugins/get_bucket_location_fix'
      autoload :Http200Errors, 'aws-sdk-s3/plugins/http_200_errors'
      autoload :IADRegionalEndpoint, 'aws-sdk-s3/plugins/iad_regional_endpoint'
      autoload :LocationConstraint, 'aws-sdk-s3/plugins/location_constraint'
      autoload :Md5, 'aws-sdk-s3/plugins/md5'
      autoload :Redirects, 'aws-sdk-s3/plugins/redirects'
      autoload :S3HostId, 'aws-sdk-s3/plugins/s3_host_id'
      autoload :S3Signer, 'aws-sdk-s3/plugins/s3_signer'
      autoload :SkipWholeMultipartGetChecksums, 'aws-sdk-s3/plugins/skip_whole_multipart_get_checksums'
      autoload :SSECPK, 'aws-sdk-s3/plugins/sse_cpk'
      autoload :StreamingRetry, 'aws-sdk-s3/plugins/streaming_retry'
      autoload :UrlEncodedKeys, 'aws-sdk-s3/plugins/url_encoded_keys'
    end

    autoload :Plugins, 'aws-sdk-s3/plugins'
    autoload :Client, 'aws-sdk-s3/client'
    autoload :Errors, 'aws-sdk-s3/errors'
    autoload :Waiters, 'aws-sdk-s3/waiters'
    autoload :Resource, 'aws-sdk-s3/resource'
    autoload :EndpointParameters, 'aws-sdk-s3/endpoint_parameters'
    autoload :EndpointProvider, 'aws-sdk-s3/endpoint_provider'
    autoload :Endpoints, 'aws-sdk-s3/endpoints'
    autoload :Bucket, 'aws-sdk-s3/bucket'
    autoload :BucketAcl, 'aws-sdk-s3/bucket_acl'
    autoload :BucketCors, 'aws-sdk-s3/bucket_cors'
    autoload :BucketLifecycle, 'aws-sdk-s3/bucket_lifecycle'
    autoload :BucketLifecycleConfiguration, 'aws-sdk-s3/bucket_lifecycle_configuration'
    autoload :BucketLogging, 'aws-sdk-s3/bucket_logging'
    autoload :BucketNotification, 'aws-sdk-s3/bucket_notification'
    autoload :BucketPolicy, 'aws-sdk-s3/bucket_policy'
    autoload :BucketRequestPayment, 'aws-sdk-s3/bucket_request_payment'
    autoload :BucketTagging, 'aws-sdk-s3/bucket_tagging'
    autoload :BucketVersioning, 'aws-sdk-s3/bucket_versioning'
    autoload :BucketWebsite, 'aws-sdk-s3/bucket_website'
    autoload :MultipartUpload, 'aws-sdk-s3/multipart_upload'
    autoload :MultipartUploadPart, 'aws-sdk-s3/multipart_upload_part'
    autoload :Object, 'aws-sdk-s3/object'
    autoload :ObjectAcl, 'aws-sdk-s3/object_acl'
    autoload :ObjectSummary, 'aws-sdk-s3/object_summary'
    autoload :ObjectVersion, 'aws-sdk-s3/object_version'
    autoload :Customizations, 'aws-sdk-s3/customizations'
    autoload :EventStreams, 'aws-sdk-s3/event_streams'
    autoload :AccessGrantsCredentials, 'aws-sdk-s3/access_grants_credentials'
    autoload :AccessGrantsCredentialsProvider, 'aws-sdk-s3/access_grants_credentials_provider'
    autoload :BucketRegionCache, 'aws-sdk-s3/bucket_region_cache'
    autoload :Encryption, 'aws-sdk-s3/encryption'
    autoload :EncryptionV2, 'aws-sdk-s3/encryption_v2'
    autoload :ExpressCredentials, 'aws-sdk-s3/express_credentials'
    autoload :ExpressCredentialsProvider, 'aws-sdk-s3/express_credentials_provider'
    autoload :FileDownloader, 'aws-sdk-s3/file_downloader'
    autoload :FilePart, 'aws-sdk-s3/file_part'
    autoload :FileUploader, 'aws-sdk-s3/file_uploader'
    autoload :LegacySigner, 'aws-sdk-s3/legacy_signer'
    autoload :MultipartFileUploader, 'aws-sdk-s3/multipart_file_uploader'
    autoload :MultipartStreamUploader, 'aws-sdk-s3/multipart_stream_uploader'
    autoload :MultipartUploadError, 'aws-sdk-s3/multipart_upload_error'
    autoload :ObjectCopier, 'aws-sdk-s3/object_copier'
    autoload :ObjectMultipartCopier, 'aws-sdk-s3/object_multipart_copier'
    autoload :PresignedPost, 'aws-sdk-s3/presigned_post'
    autoload :Presigner, 'aws-sdk-s3/presigner'
  end

  GEM_VERSION = '1.157.0'

end
