# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::Account
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::Account::EndpointProvider',
        rbs_type: 'untyped',
        docstring: 'The endpoint provider used to resolve endpoints. Any '\
                   'object that responds to `#resolve_endpoint(parameters)` '\
                   'where `parameters` is a Struct similar to '\
                   '`Aws::Account::EndpointParameters`'
      ) do |cfg|
        Aws::Account::EndpointProvider.new
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
          when :accept_primary_email_update
            Aws::Account::Endpoints::AcceptPrimaryEmailUpdate.build(context)
          when :delete_alternate_contact
            Aws::Account::Endpoints::DeleteAlternateContact.build(context)
          when :disable_region
            Aws::Account::Endpoints::DisableRegion.build(context)
          when :enable_region
            Aws::Account::Endpoints::EnableRegion.build(context)
          when :get_alternate_contact
            Aws::Account::Endpoints::GetAlternateContact.build(context)
          when :get_contact_information
            Aws::Account::Endpoints::GetContactInformation.build(context)
          when :get_primary_email
            Aws::Account::Endpoints::GetPrimaryEmail.build(context)
          when :get_region_opt_status
            Aws::Account::Endpoints::GetRegionOptStatus.build(context)
          when :list_regions
            Aws::Account::Endpoints::ListRegions.build(context)
          when :put_alternate_contact
            Aws::Account::Endpoints::PutAlternateContact.build(context)
          when :put_contact_information
            Aws::Account::Endpoints::PutContactInformation.build(context)
          when :start_primary_email_update
            Aws::Account::Endpoints::StartPrimaryEmailUpdate.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
