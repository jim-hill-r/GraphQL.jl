using GraphQL, Test

@info "Help is needed to improve code coverage! Contributions are welcome!"

@testset "GraphQL" begin
  include("./language.jl")
  include("./client.jl")
  include("./server.jl")
  include("./integration.jl")
end
