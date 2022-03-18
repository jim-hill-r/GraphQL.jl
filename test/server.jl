using Test, Sockets, HTTP, JSON
using GraphQL

function before()
  return GraphQL.serve(8080)
end

function testPing(server)
  response = HTTP.request("GET", "http://$(server.address)", [], "{ query { healthcheck { ping } } }")
  json = JSON.parse(String(response.body))
  return get(json,"TODO",nothing) === "TODO"
end

function after(server)
  close(server.socket)
end

@testset "Server" begin
  @info "Running server tests..."
  server = before()
  @test testPing(server)
  after(server)
end
