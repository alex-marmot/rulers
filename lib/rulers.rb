require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, {'COntent-Type' => 'text/html'},
      ["Hello from Ruby On Rulers!"]]
    end
  end
end
