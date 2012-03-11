require 'bundler/setup'
require 'sprockets'
require 'coffee-script'
require 'eco'
require 'sass'

class MemoryFile
  def initialize(file)
    @file = file
  end

  def headers
    {
      'Content-Type'    => 'text/html',
      'Content-Length'  => body.length.to_s
    }
  end

  def body
    @content ||= File.read @file
  end

  def call(env)
    [200, headers, [body]]
  end
end

map '/' do
  run MemoryFile.new 'public/index.html'
end

map '/app' do
  env = Sprockets::Environment.new
  env.append_path 'app'
  env.append_path 'vendor/assets'
  run env
end
