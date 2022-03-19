module Types

export GraphQLSchema
export ExecutionArgs
export AbstractGraphQLServer, GraphQLServer, ServerConfiguration
export AbstractGraphQLClient, GraphQLClient, QueryOptions

import Base.LibuvServer

#######
# Language Types
#######
struct GraphQLSchema
  noop::String
end

struct ExecutionArgs
  noop::String
end

#######
# Server Types
#######
DEFAULT_TYPEDEFS = """
type HealthCheck {
  ping: boolean
  status: string
}
type query {
  healthcheck: HealthCheck
}
"""
DEFAULT_PORT = 3968

Base.@kwdef struct ServerConfiguration
  typedefs::String = DEFAULT_TYPEDEFS
  port::Int64 = DEFAULT_PORT
end

abstract type AbstractGraphQLServer end
struct GraphQLServer <: AbstractGraphQLServer
  server::LibuvServer
  address::String
  config::ServerConfiguration
end

#######
# Client Types
#######
DEFAULT_QUERY = """
query Ping {
  healthcheck {
    ping
  }
}
"""

abstract type AbstractGraphQLClient end
Base.@kwdef struct GraphQLClient <: AbstractGraphQLClient
  url::String = "http://localhost:$DEFAULT_PORT"
end

Base.@kwdef struct QueryOptions
  query::String = DEFAULT_QUERY
  variables::Dict{String,Any} = Dict()
end

end
