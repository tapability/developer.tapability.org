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
        429 => '429 Too Many Requests',
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
    COORDINATES = [32.7993, -117.16]

    KEY = {
      "description" => "Dwight's iPhone",
      "token"       => "Mk3W4dTvpdUNar7AB3RD4PBoT8Py9wFNZ7WakvQP",
      "created_at"  => CREATED_AT
    }

    LOCATION = {
      "city"        => "San Diego",
      "state"       => "California",
      "coordinates" => COORDINATES
    }

    EMPLOYER = {
      "id"          => "38075a53-a470-4654-a4e6-4d67c2207b35",
      "name"        => "Dunder Miflin",
      "api_url"     => "https://tapability.org/api/v1/employers/38075a53-a470-4654-a4e6-4d67c2207b35",
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
      "first_name"   => "Dwight",
      "last_name"    => "Schrute",
      "email"        => "dwight@tapability.org",
      "archived_at"  => nil
    })

    CANDIDATE_FULL_ARCHIVED = CANDIDATE_FULL.merge({
      "archived"     => true,
      "archived_at"  => FUTURE_AT
    })

    CANDIDATE_AUTHENTICATED = CANDIDATE_FULL.merge({})

    COUNSELOR = {
      "id"          => "ac300f35-61a0-49e4-85c2-5b283d876b31",
      "first_name"  => "Jim",
      "last_name"   => "Halpert",
      "email"       => "jim@tapability.org",
      "title"       => "Vocational Rehab Counselor",
      "api_url"     => "https://tapability.org/api/v1/counselors/ac300f35-61a0-49e4-85c2-5b283d876b31",
      "created_at"  => CREATED_AT,
      "updated_at"  => CREATED_AT
    }

    COUNSELOR_FULL = COUNSELOR.merge({})

    COUNSELOR_AUTHENTICATED = COUNSELOR_FULL.merge({})

    JOB = {
      "id"            => "a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "title"         => "Assistant Regional Manager",
      "category_name" => "Sales",
      "description"   => "Actually, it's Assistant TO the Regional Manager",
      "city"          => "Scranton",
      "state"         => "Pennsylvania",
      "api_url"       => "https://tapability.org/api/v1/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "html_url"      => "https://tapability.org/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355",
      "created_at"    => CREATED_AT,
      "updated_at"    => CREATED_AT,
      "expires_at"    => "2013-02-09T17:58:26Z",
      "expired"       => false,
      "employer"      => EMPLOYER,
      "coordinates"   => COORDINATES
    }

    JOB_FULL = JOB.merge({
      "street1"       => nil,
      "street2"       => nil,
      "zip"           => nil,
      "contact_name"  => nil,
      "contact_email" => nil,
      "contact_phone" => nil
    })

    JOB_AUTHENTICATED = JOB_FULL.merge({
      "code"         => "MIFLIN0001",
      "deleted"      => false,
      "deleted_at"   => nil
    })

    JOB_AUTHENTICATED_EXPIRED = JOB_AUTHENTICATED.merge({
      "expired"      => true,
      "expires_at"   => FUTURE_AT
    })

    RESUME_WORK_EXPERIENCE = {
      "id"            => "8d0ec106-2ea1-4905-bcc6-86317085607b",
      "title"         => "Assistant to the Regional Manager",
      "employer_name" => "Dunder Miflin",
      "city"          => "Scranton",
      "state"         => "Pennsylvania",
      "start_date"    => "2010-01-01",
      "end_date"      => "2012-12-01",
      "duties"        => "Helping out the world's greatest boss."
    }

    RESUME_EDUCATION = {
      "id"            => "4f87f608-7872-4c37-a845-cbe08d880489",
      "institution"   => "University of California at Santa Barbara",
      "city"          => "Santa Barbara",
      "state"         => "California",
      "degree"        => "Bachelor of Science",
      "concentration" => "Computer Science",
      "start_date"    => "2002-09-01",
      "end_date"      => "2006-06-01",
      "graduated"     => true
    }

    RESUME_AWARD = {
      "id"            => "2894c358-f2d0-4a3f-952f-5afdb8dd81aa",
      "description"   => "Emmy - Best Actor",
      "source"        => "Academy of Television Arts and Sciences",
      "date"          => "2012-09-23"
    }

    RESUME_CERTIFICATION = {
      "id"            => "aa0438f0-e2fa-4bbc-b932-2be87186c751",
      "description"   => "Cisco Certified Network Administrator (CCNA)",
      "source"        => "Cisco",
      "start_date"    => "2011-01-01",
      "end_date"      => "2013-12-31"
    }

    RESUME_CLEARANCE = {
      "id"            => "f2478635-dec5-4ebf-ada4-454ade6a6d3b",
      "description"   => "Top Secret",
      "source"        => "National Security Agency",
      "start_date"    => "2011-01-01",
      "end_date"      => "2013-12-31"
    }

    RESUME_LANGUAGE = {
      "id"      => "f8c78d5c-f206-41bc-aca3-bd1b4882b4df",
      "name"    => "Spanish",
      "fluency" => "Conversational",
      "read"    => true,
      "write"   => false,
      "speak"   => false
    }

    RESUME_MEMBERSHIP = {
      "id"            => "698c9bfb-29d9-4df1-9425-e93c948965d1",
      "description"   => "American Society for Training and Development (ASTD)",
      "source"        => "ATSD",
      "start_date"    => "2011-01-01",
      "end_date"      => "2013-12-31"
    }

    RESUME_PUBLICATION = {
      "id"            => "33dbc578-d2cf-4892-bece-f6e7b5c2c477",
      "description"   => "Office Relationships at Dunder Miflin",
      "source"        => "The New York Times",
      "date"          => "2013-01-01"
    }

    RESUME_TRAINING = {
      "id"            => "7c44e640-d3fc-4b07-bc38-3e1c4bdf9d0e",
      "description"   => "Microsoft Office Specialist",
      "source"        => "Microsoft",
      "date"          => "2013-01-01"
    }

    RESUME_LOCATION = {
      "id"            => "8a58f89e-d8fe-4477-aeaf-fe37f7c86e8c",
      "distance"      => 10
    }.merge(LOCATION)

    RESUME = {
      "street1"        => "1234 Penny Lane",
      "street2"        => nil,
      "city"           => "Scranton",
      "state"          => "Pennsylvania",
      "zip"            => "18501",
      "coordinates"    => COORDINATES,
      "phone"          => "8585551212",
      "objective"      => "Get a job in Scranton, PA",
      "qualifications" => "* Stapling\n* Paperclipping\n",
      "published"      => false,
      "published_at"   => nil,
      "updated_at"     => CREATED_AT
    }

    RESUME_FULL = RESUME.merge({
      "locations"        => [RESUME_LOCATION],
      "work_experiences" => [RESUME_WORK_EXPERIENCE],
      "educations"       => [RESUME_EDUCATION],
      "awards"           => [RESUME_AWARD],
      "certifications"   => [RESUME_CERTIFICATION],
      "memberships"      => [RESUME_MEMBERSHIP],
      "publications"     => [RESUME_PUBLICATION],
      "trainings"        => [RESUME_TRAINING],
      "languages"        => [RESUME_LANGUAGE],
      "clearances"       => [RESUME_CLEARANCE]
    })

    RESUME_AUTHENTICATED = RESUME_FULL.merge({})

    CATEGORY = {
      "name" => "Sales"
    }

    CATEGORIES = [
      {"name" => "Accounting"},
      {"name" => "Manufacturing"},
      {"name" => "Sales"}
    ]

    RESUME_CATEGORY = {
      "id"   => "5f7ba741-e6e0-403e-9247-00e6138c313b"
    }.merge(CATEGORY)

    STATES = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Virgin Islands", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

  end
end

include Tapability::Resources::Helpers
