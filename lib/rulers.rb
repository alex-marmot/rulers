require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, {'COntent-Type' => 'text/html'},
      [[1, 2, 3].sum.to_s]]
    end
  end
end
