lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "splash_payments/version"

Gem::Specification.new do |spec|
  spec.name          = "splash_payments"
  spec.version       = SplashPayments::VERSION
  spec.summary       = %q{Ruby bindings for the SplashPayments API}
  spec.description   = %q{Defines ruby classes for the SplashPayments API}
  spec.homepage      = "https://portal.splashpayments.com/docs/api"
  spec.author        = "SplashPayments"
  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.14.0"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.12.2"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
