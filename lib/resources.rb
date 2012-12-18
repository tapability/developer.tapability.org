require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'
require 'securerandom'

module Tapability
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        205 => '205 Reset Content',
        301 => '301 Moved Permanently',
        302 => '302 Found',
        307 => '307 Temporary Redirect',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        405 => '405 Method not allowed',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      DefaultTimeFormat = "%B %-d, %Y".freeze

      def post_date(item)
        strftime item[:created_at]
      end

      def strftime(time, format = DefaultTimeFormat)
        attribute_to_time(time).strftime(format)
      end

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://tapability.org/api/v1/resource?page=2>; rel="next",'
              lines << '      <https://tapability.org/api/v1/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        lines << "X-RateLimit-Limit: 5000"
        lines << "X-RateLimit-Remaining: 4999"

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end

    end

    CREATED_AT = "2012-12-09T17:58:26Z"
    FUTURE_AT = "2012-12-18T21:41:30Z"

    KEY = {
      "description" => "Dwight's iPhone",
      "token"       => "Mk3W4dTvpdUNar7AB3RD4PBoT8Py9wFNZ7WakvQP",
      "created_at"  => CREATED_AT
    }

    EMPLOYER = {
      "id"          => "38075a53-a470-4654-a4e6-4d67c2207b35",
      "name"        => "Dunder Miflin",
      "website_url" => "http://www.dundermiflin.com"
    }

    EMPLOYER_FULL = EMPLOYER.merge({})

    EMPLOYER_AUTHENTICATED = EMPLOYER_FULL.merge({})

    CANDIDATE = {
      "id"           => "eaf3022f-330e-46db-8665-01e0969ff2f7",
      "api_url"      => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7",
      "archived"     => false,
      "created_at"   => CREATED_AT,
      "updated_at"   => CREATED_AT
    }

    CANDIDATE_FULL = CANDIDATE.merge({
      "name"         => "Dwight Schrute",
      "email"        => "dwight@tapability.org",
      "archived_at"  => nil
    })

    CANDIDATE_FULL_ARCHIVED = CANDIDATE_FULL.merge({
      "archived"     => true,
      "archived_at"  => FUTURE_AT
    })

    CANDIDATE_AUTHENTICATED = CANDIDATE_FULL.merge({})

    COORDINATES = [32.7993, -117.16]

    JOB = {
      "id"           => "a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "name"         => "Assistant Regional Manager",
      "description"  => "",
      "api_url"      => "https://tapability.org/api/v1/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "html_url"     => "https://tapability.org/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "created_at"   => CREATED_AT,
      "updated_at"   => CREATED_AT,
      "expires_at"   => "2013-02-09T17:58:26Z",
      "expired"      => false,
      "employer"     => EMPLOYER,
      "coordinates"  => COORDINATES
    }

    JOB_FULL = JOB.merge({})

    JOB_AUTHENTICATED = JOB_FULL.merge({})

    RESUME = {
      "objective"    => "Get a job in Scranton, PA",
      "updated_at"   => CREATED_AT
    }

    RESUME_FULL = RESUME.merge({})

    RESUME_AUTHENTICATED = RESUME_FULL.merge({})

  end
end

include Tapability::Resources::Helpers
