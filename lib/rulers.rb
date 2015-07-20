require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"
require "uri"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == '/favicon.ico'
        return [404, {"Content-Type" => "text/html"}, []]
      end
      if env["PATH_INFO"] == "/"
        response = Rack::Response.new
        response.status = 302
        response.redirect("http://www.baidu.com")
        return response
      end
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      if controller.get_response
        st, hd, rs = controller.get_response.to_a
        [st, hd, [rs.body].flatten]
      else
        [200, {"Content-Type" => "text/html"}, [text]]
      end
    end
  end
end
