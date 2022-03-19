using Test, Sockets, HTTP, JSON
using GraphQL

function before()
  server = GraphQLServer()
  return Dict("server" => server)
end

function testPing(server)
  response = HTTP.request("GET", "http://$(server.address)", [], "{ query { healthcheck { ping } } }")
  json = JSON.parse(String(response.body))
  return get(json,"TODO",nothing) === "TODO"
end

function after(server)
  close(server.server)
end

@testset "Server" begin
  @info "Running server tests..."
  fixture = before()
  @test testPing(fixture["server"])
  after(fixture["server"])
end
