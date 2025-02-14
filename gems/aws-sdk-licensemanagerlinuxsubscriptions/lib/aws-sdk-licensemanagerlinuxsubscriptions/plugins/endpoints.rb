# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::LicenseManagerLinuxSubscriptions
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::LicenseManagerLinuxSubscriptions::EndpointProvider',
        rbs_type: 'untyped',
        docstring: 'The endpoint provider used to resolve endpoints. Any '\
                   'object that responds to `#resolve_endpoint(parameters)` '\
                   'where `parameters` is a Struct similar to '\
                   '`Aws::LicenseManagerLinuxSubscriptions::EndpointParameters`'
      ) do |cfg|
        Aws::LicenseManagerLinuxSubscriptions::EndpointProvider.new
      end

      # @api private
      class Handler < Seahorse::Client::Handler
        def call(context)
          unless context[:discovered_endpoint]
            params = parameters_for_operation(context)
            endpoint = context.config.endpoint_provider.resolve_endpoint(params)

            context.http_request.endpoint = endpoint.url
            apply_endpoint_headers(context, endpoint.headers)

            context[:endpoint_params] = params
            context[:endpoint_properties] = endpoint.properties
          end

          context[:auth_scheme] =
            Aws::Endpoints.resolve_auth_scheme(context, endpoint)

          @handler.call(context)
        end

        private

        def apply_endpoint_headers(context, headers)
          headers.each do |key, values|
            value = values
              .compact
              .map { |s| Seahorse::Util.escape_header_list_string(s.to_s) }
              .join(',')

            context.http_request.headers[key] = value
          end
        end

        def parameters_for_operation(context)
          case context.operation_name
          when :deregister_subscription_provider
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::DeregisterSubscriptionProvider.build(context)
          when :get_registered_subscription_provider
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::GetRegisteredSubscriptionProvider.build(context)
          when :get_service_settings
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::GetServiceSettings.build(context)
          when :list_linux_subscription_instances
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::ListLinuxSubscriptionInstances.build(context)
          when :list_linux_subscriptions
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::ListLinuxSubscriptions.build(context)
          when :list_registered_subscription_providers
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::ListRegisteredSubscriptionProviders.build(context)
          when :list_tags_for_resource
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::ListTagsForResource.build(context)
          when :register_subscription_provider
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::RegisterSubscriptionProvider.build(context)
          when :tag_resource
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::TagResource.build(context)
          when :untag_resource
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::UntagResource.build(context)
          when :update_service_settings
            Aws::LicenseManagerLinuxSubscriptions::Endpoints::UpdateServiceSettings.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
