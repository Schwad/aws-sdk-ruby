# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::EC2

  class KeyPairInfo

    extend Aws::Deprecations

    # @overload def initialize(name, options = {})
    #   @param [String] name
    #   @option options [Client] :client
    # @overload def initialize(options = {})
    #   @option options [required, String] :name
    #   @option options [Client] :client
    def initialize(*args)
      options = Hash === args.last ? args.pop.dup : {}
      @name = extract_name(args, options)
      @data = options.delete(:data)
      @client = options.delete(:client) || Client.new(options)
      @waiter_block_warned = false
    end

    # @!group Read-Only Attributes

    # @return [String]
    def name
      @name
    end
    alias :key_name :name

    # The ID of the key pair.
    # @return [String]
    def key_pair_id
      data[:key_pair_id]
    end

    # If you used CreateKeyPair to create the key pair:
    #
    # * For RSA key pairs, the key fingerprint is the SHA-1 digest of the
    #   DER encoded private key.
    #
    # * For ED25519 key pairs, the key fingerprint is the base64-encoded
    #   SHA-256 digest, which is the default for OpenSSH, starting with
    #   [OpenSSH 6.8][1].
    #
    # If you used ImportKeyPair to provide Amazon Web Services the public
    # key:
    #
    # * For RSA key pairs, the key fingerprint is the MD5 public key
    #   fingerprint as specified in section 4 of RFC4716.
    #
    # * For ED25519 key pairs, the key fingerprint is the base64-encoded
    #   SHA-256 digest, which is the default for OpenSSH, starting with
    #   [OpenSSH 6.8][1].
    #
    #
    #
    # [1]: http://www.openssh.com/txt/release-6.8
    # @return [String]
    def key_fingerprint
      data[:key_fingerprint]
    end

    # The type of key pair.
    # @return [String]
    def key_type
      data[:key_type]
    end

    # Any tags applied to the key pair.
    # @return [Array<Types::Tag>]
    def tags
      data[:tags]
    end

    # The public key material.
    # @return [String]
    def public_key
      data[:public_key]
    end

    # If you used Amazon EC2 to create the key pair, this is the date and
    # time when the key was created, in [ISO 8601 date-time format][1], in
    # the UTC time zone.
    #
    # If you imported an existing key pair to Amazon EC2, this is the date
    # and time the key was imported, in [ISO 8601 date-time format][1], in
    # the UTC time zone.
    #
    #
    #
    # [1]: https://www.iso.org/iso-8601-date-and-time-format.html
    # @return [Time]
    def create_time
      data[:create_time]
    end

    # @!endgroup

    # @return [Client]
    def client
      @client
    end

    # Loads, or reloads {#data} for the current {KeyPairInfo}.
    # Returns `self` making it possible to chain methods.
    #
    #     key_pair_info.reload.data
    #
    # @return [self]
    def load
      resp = Aws::Plugins::UserAgent.metric('RESOURCE_MODEL') do
        @client.describe_key_pairs(key_names: [@name])
      end
      @data = resp.key_pairs[0]
      self
    end
    alias :reload :load

    # @return [Types::KeyPairInfo]
    #   Returns the data for this {KeyPairInfo}. Calls
    #   {Client#describe_key_pairs} if {#data_loaded?} is `false`.
    def data
      load unless @data
      @data
    end

    # @return [Boolean]
    #   Returns `true` if this resource is loaded.  Accessing attributes or
    #   {#data} on an unloaded resource will trigger a call to {#load}.
    def data_loaded?
      !!@data
    end

    # @deprecated Use [Aws::EC2::Client] #wait_until instead
    #
    # Waiter polls an API operation until a resource enters a desired
    # state.
    #
    # @note The waiting operation is performed on a copy. The original resource
    #   remains unchanged.
    #
    # ## Basic Usage
    #
    # Waiter will polls until it is successful, it fails by
    # entering a terminal state, or until a maximum number of attempts
    # are made.
    #
    #     # polls in a loop until condition is true
    #     resource.wait_until(options) {|resource| condition}
    #
    # ## Example
    #
    #     instance.wait_until(max_attempts:10, delay:5) do |instance|
    #       instance.state.name == 'running'
    #     end
    #
    # ## Configuration
    #
    # You can configure the maximum number of polling attempts, and the
    # delay (in seconds) between each polling attempt. The waiting condition is
    # set by passing a block to {#wait_until}:
    #
    #     # poll for ~25 seconds
    #     resource.wait_until(max_attempts:5,delay:5) {|resource|...}
    #
    # ## Callbacks
    #
    # You can be notified before each polling attempt and before each
    # delay. If you throw `:success` or `:failure` from these callbacks,
    # it will terminate the waiter.
    #
    #     started_at = Time.now
    #     # poll for 1 hour, instead of a number of attempts
    #     proc = Proc.new do |attempts, response|
    #       throw :failure if Time.now - started_at > 3600
    #     end
    #
    #       # disable max attempts
    #     instance.wait_until(before_wait:proc, max_attempts:nil) {...}
    #
    # ## Handling Errors
    #
    # When a waiter is successful, it returns the Resource. When a waiter
    # fails, it raises an error.
    #
    #     begin
    #       resource.wait_until(...)
    #     rescue Aws::Waiters::Errors::WaiterFailed
    #       # resource did not enter the desired state in time
    #     end
    #
    # @yieldparam [Resource] resource to be used in the waiting condition.
    #
    # @raise [Aws::Waiters::Errors::FailureStateError] Raised when the waiter
    #   terminates because the waiter has entered a state that it will not
    #   transition out of, preventing success.
    #
    #   yet successful.
    #
    # @raise [Aws::Waiters::Errors::UnexpectedError] Raised when an error is
    #   encountered while polling for a resource that is not expected.
    #
    # @raise [NotImplementedError] Raised when the resource does not
    #
    # @option options [Integer] :max_attempts (10) Maximum number of
    # attempts
    # @option options [Integer] :delay (10) Delay between each
    # attempt in seconds
    # @option options [Proc] :before_attempt (nil) Callback
    # invoked before each attempt
    # @option options [Proc] :before_wait (nil) Callback
    # invoked before each wait
    # @return [Resource] if the waiter was successful
    def wait_until(options = {}, &block)
      self_copy = self.dup
      attempts = 0
      options[:max_attempts] = 10 unless options.key?(:max_attempts)
      options[:delay] ||= 10
      options[:poller] = Proc.new do
        attempts += 1
        if block.call(self_copy)
          [:success, self_copy]
        else
          self_copy.reload unless attempts == options[:max_attempts]
          :retry
        end
      end
      Aws::Plugins::UserAgent.metric('RESOURCE_MODEL') do
        Aws::Waiters::Waiter.new(options).wait({})
      end
    end

    # @!group Actions

    # @example Request syntax with placeholder values
    #
    #   key_pair_info.delete({
    #     key_pair_id: "KeyPairId",
    #     dry_run: false,
    #   })
    # @param [Hash] options ({})
    # @option options [String] :key_pair_id
    #   The ID of the key pair.
    # @option options [Boolean] :dry_run
    #   Checks whether you have the required permissions for the action,
    #   without actually making the request, and provides an error response.
    #   If you have the required permissions, the error response is
    #   `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    # @return [Types::DeleteKeyPairResult]
    def delete(options = {})
      options = options.merge(key_name: @name)
      resp = Aws::Plugins::UserAgent.metric('RESOURCE_MODEL') do
        @client.delete_key_pair(options)
      end
      resp.data
    end

    # @deprecated
    # @api private
    def identifiers
      { name: @name }
    end
    deprecated(:identifiers)

    private

    def extract_name(args, options)
      value = args[0] || options.delete(:name)
      case value
      when String then value
      when nil then raise ArgumentError, "missing required option :name"
      else
        msg = "expected :name to be a String, got #{value.class}"
        raise ArgumentError, msg
      end
    end

    class Collection < Aws::Resources::Collection; end
  end
end
