
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby/api/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby-api"
  spec.version       = Ruby::Api::VERSION
  spec.authors       = ["Claudia Tavares"]
  spec.email         = ["claudia.tavares@fabernovel.com"]

  spec.summary       = %q{A sinatra server}
  spec.description   = %q{
                        This gem describes a sinatra server to expose an API in JSON and XML 
                        (parameter to be assigned) and return the results of a Google search action
                      }
  spec.homepage      = "https://github.com/tavaresc/ruby-api"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"

  #spec.add_dependency "google-api-client", "~> 0.29"
  spec.add_dependency "nokogiri", "~> 1.10"
  spec.add_dependency "sinatra", "~> 2.0"

end
