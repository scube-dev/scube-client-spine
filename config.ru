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
    @content ||= @file.read
  end

  def call(env)
    [200, headers, [body]]
  end
end

map '/' do
  file = File.new 'public/index.html'
  run MemoryFile.new file
end

map '/app' do
  env = Sprockets::Environment.new
  env.append_path 'app'
  env.append_path 'vendor/assets'
  run env
end
