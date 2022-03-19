# Julia GraphQL
A Julia implementation of GraphQL. This implementation is highly opinionated toward schema first design.

This is a personal hobby project designed to extend my knowledge of Julia and GraphQL internals. The long term mission is to provide production grade GraphQL tools native to the Julia ecosystem. Contributions and sponsorships are highly encouraged.

# Getting Started
## Install
```julia
using Pkg
Pkg.add(url="https://github.com/jim-hill-r/graphql.jl.git")
```

## Server
Start the sample server with one healthcheck endpoint:
```julia
using GraphQL
GraphQLServer()
```

Basic server using custom typedefs file:
```julia
using GraphQL
GraphQLServer(ServerConfiguration(
  typedefs = read("./typedefs.graphql", String)
))
```

Find more configuration options in [Server Docs](./docs/server.md)

## Client
Query the sample server with default ping query:
```julia
using GraphQL
client = GraphQLClient("http://localhost:3968")
query(client,QueryOptions())
```

Query the sample server with custom query:
```julia
using GraphQL
client = GraphQLClient("http://localhost:3968")
queryString = """
query Ping {
  healthcheck {
    ping
  }
}
"""
query(client,QueryOptions(
  query = queryString
))

```

## Schema Tools
Coming soon!

# Roadmap
## Soon
- [ ] Server: Query
- [ ] Client: Query

## Later
- [ ] Server: Mutations
- [ ] Client: Mutations

## Eventually
- [ ] Server: Subscriptions
- [ ] Client: Subscriptions
- [ ] Schema Tools
