module Types

export ServerConfiguration, GraphQLSchema, ExecutionArgs

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

struct GraphQLSchema
  noop::String
end

Base.@kwdef struct ServerConfiguration
  typedefs::String = DEFAULT_TYPEDEFS
  port::Int64 = DEFAULT_PORT
end

struct ExecutionArgs
  noop::String
end

end
