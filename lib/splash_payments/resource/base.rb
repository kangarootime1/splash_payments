module SplashPayments
  module Resource
    class Base
      attr_reader :resource_name

      def initialize(params, attrs)
        @attrs = attrs
        @request_options = SplashPayments::Http::RequestParams.new

        set(params)
      end

      def request_options
        @request_options
      end

      def request_options=(params = {})
        @request_options.sort = params['sort'] unless params['sort'].nil?
        @request_options.expand = params['expand'] unless params['expand'].nil?
        @request_options.totals = params['totals'] unless params['totals'].nil?
        @request_options.page = params['page'] unless params['page'].nil?
      end

      def set(params)
        if params.is_a?(Hash) && !params.empty?
           params.each do |k, v|
             if @attrs.include? k
               public_send("#{k}=", v) if respond_to? "#{k}="
             else
               self.class.send(:attr_accessor, k)
               self.instance_variable_set("@#{k}", v);
             end
           end
         end
      end

      def to_json(nested = false)
        excludes = ['request_options', 'resource_name', 'response', 'attrs']

        instance_variables.inject({}) do |hash, var|
          key = var.to_s.delete('@')
          val = instance_variable_get(var)

          if !excludes.include? key
            if val.is_a? Base
              hash[key] = val.to_json(true) if nested
            else
              hash[key] = val
            end
          end

          hash
        end
      end

      def status
        @response.nil? ? false : @response.status
      end

      def has_errors?
        @response.nil? ? false : @response.has_errors?
      end

      def response
        @response.nil? ? [] : @response.response
      end

      def details
        @response.nil? ? [] : @response.details
      end

      def totals
        @response.nil? ? [] : @response.totals
      end

      def has_more?
        @response.nil? ? true : @response.has_more?
      end

      def retrieve(params = {})
        set(params)

        headers = build_headers

        search = build_search(to_json)
        search += "&#{request_options.sort}" if request_options
        headers['SEARCH'] = search

        headers['Content-Type'] = "application/json"
        query_params = []
        if request_options
          query_params << request_options.expand if request_options.expand
          query_params << request_options.page if request_options.page
          if request_options.totals
            headers['TOTALS'] = request_options.totals
          end
        end

        method = 'get'
        url = SplashPayments.configuration.url
        endpoint = "#{@resource_name}?#{query_params.join('&')}"
        data = {}

        body, status = SplashPayments::Http::Request.instance.send_http(method, url, endpoint, data, headers)
        @response = SplashPayments::Http::Response.new(body, status, self.class)

        success = validate_response
        request_options.go_next_page if success

        success
      end

      def create(params = {})
        set(params)
        
        headers = build_headers
        headers['Content-Type'] = "application/json"
        method = 'post'
        url = SplashPayments.configuration.url
        endpoint = "#{@resource_name}"
        data = to_json

        body, status = SplashPayments::Http::Request.instance.send_http(method, url, endpoint, data, headers)
        @response = SplashPayments::Http::Response.new(body, status, self.class)

        validate_response
      end

      def update(params = {})
        set(params)

        if !id 
          if SplashPayments.configuration.exception_enabled
            raise SplashPayments::Exceptions::InvalidRequest.new('ID is required for this action')
          else
            return false
          end
        end
        
        headers = build_headers
        headers['Content-Type'] = "application/json"
        method = 'put'
        url = SplashPayments.configuration.url
        endpoint = "#{@resource_name}/#{id}"
        data = to_json

        body, status = SplashPayments::Http::Request.instance.send_http(method, url, endpoint, data, headers)
        @response = SplashPayments::Http::Response.new(body, status, self.class)

        validate_response
      end

      def delete(params = {})
        set(params)

        if !id 
          if SplashPayments.configuration.exception_enabled
            raise SplashPayments::Exceptions::InvalidRequest.new('ID is required for this delete')
          else
            return false
          end
        end

        headers = build_headers
        headers['Content-Type'] = "application/json"
        method = 'delete'
        url = SplashPayments.configuration.url
        endpoint = "#{@resource_name}/#{id}"
        data = {}

        body, status = SplashPayments::Http::Request.instance.send_http(method, url, endpoint, data, headers)
        @response = SplashPayments::Http::Response.new(body, status, self.class)

        validate_response
      end

    protected
      def build_headers()
        config = SplashPayments.configuration

        if !config.url
          raise SplashPayments::Exceptions::InvalidRequest.new('Invalid URL')
        end

        headers = {}

        if config.api_key
          headers['APIKEY'] = config.api_key
        elsif config.session_key
          headers['SESSIONKEY'] = config.session_key
        end

        headers
      end
      
      def build_search(values = {})
        values
          .delete_if { |k, v| v.nil? || v.empty? }
          .map { |k, v| "#{k}[equals]=#{v}" }
          .join('&')
      end

      def validate_response
        if @response.has_errors?
          if SplashPayments.configuration.exception_enabled
            raise SplashPayments::Exceptions::ApiError.new("There are errors in the response - #{@response.errors}")
          end

          false
        else
          true
        end
      end

      def errors
        @response.nil? ? [] : @response.errors
      end
    end
  end
end
