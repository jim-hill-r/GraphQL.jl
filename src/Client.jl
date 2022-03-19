module Client
export query

using JSON, HTTP
using ..Types

function query(client::GraphQLClient, options::QueryOptions = QueryOptions())
  response = HTTP.request("POST", client.url, [], options.query)
  return JSON.parse(String(response.body))
end

end
