module Phase8
  class Flash
    def initialize(req)
      req.cookies.each do |cookie|
        @cookie_val = JSON.parse(cookie.value) if cookie.name == "_rails_lite_app_flash"
      end
      @cookie_val = {} unless @cookie_val
    end

    def [](key)
      @cookie_val[key]
    end

    def []=(key, val)
      @cookie_val[key] = val
    end

    def store_flash(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app_flash', @cookie_val.to_json)
    end
  end
end
