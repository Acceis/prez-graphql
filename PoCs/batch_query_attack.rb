require 'httpx'

data = Array.new(3) {
  { 'query' => 'query { systemUpdate }'}
}

HTTPX
  .plugin(:proxy)
  .with_proxy(uri: 'http://127.0.0.1:8080')
  .with(timeout: { operation_timeout: 120 })
  .post('http://noraj.test:5013/graphql', json: data)