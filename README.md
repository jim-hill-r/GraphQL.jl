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
GraphQL.serve()
```

Basic server using predefined typedefs:
```julia
using GraphQL
GraphQL.serve(ServerConfiguration(
  typedefs = read("./typedefs.graphql", String)
))
```

Find more configuration options in [Server Docs](./docs/server.md)

## Client
Coming soon!

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
