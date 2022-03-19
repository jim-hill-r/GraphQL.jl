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
To run a graphql server with the minimum configuration assuming you have typedefs in a typedefs.graphql file.
```julia
using GraphQL

typedefs = read("./typedefs.graphql",String)
config = ServerConfiguration(
  typedefs = typedefs
)
serve(config)
```

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
