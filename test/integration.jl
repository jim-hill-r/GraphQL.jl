using Test, Sockets, HTTP, JSON
using GraphQL

function before()
  server = GraphQLServer()
  client = GraphQLClient("http://$(server.address)")
  return Dict("server"=>server, "client"=>client)
end

function testPing(client)
  data = query(client)
  @test get(data,"TODO",nothing) === "TODO"
end

function after(server)
  close(server.server)
end

@testset "Server" begin
  @info "Running server tests..."
  fixture = before()
  testPing(fixture["client"])
  after(fixture["server"])
end
