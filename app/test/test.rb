# CURL way
#
# curl --header "Content-Type:application/octet-stream" -d "<h1>this is body</h1>" "http://localhost:5000/pdf" > foo.pdf"
#
# Ruby way
require 'net/http'
require 'uri'

weasyrpint_host = ENV['WEASYRPINT_HOST'] || 'http://localhost:5000'

html = File.read(File.expand_path('./test.html', File.dirname(__FILE__)))

uri = URI("#{weasyrpint_host}/pdf")

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.path)

request.body = html
request.content_type = "application/octet-stream"
response = http.request(request)

File.open(File.expand_path('./test.pdf', File.dirname(__FILE__)), 'w') do |f|
  f.write(response.read_body)
end

# assert that test.pdf was created
# assert that it's equal to some base pdf
