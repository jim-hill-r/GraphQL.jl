module Server
export serve

import Base.LibuvServer
using HTTP, Sockets, JSON
using ..Types, ..Execute

struct ServerStatus
  server::LibuvServer
  address::String
  config::ServerConfiguration
end

function parsePayload(payload)
  return ExecutionArgs("TODO")
end

function serve(config=ServerConfiguration())
  server = Sockets.listen(Sockets.InetAddr(Sockets.localhost, config.port))
  @async HTTP.serve(server=server) do request::HTTP.Request    
    try
      payload = String(HTTP.payload(request))
      args = parsePayload(payload)
      result = execute(args)
      return HTTP.Response(json(result))
    catch e
      return HTTP.Response(500, "Something went wrong. Please open an issue to resolve.")
    end
 end
 return ServerStatus(server,"$(Sockets.localhost):$(config.port)",config)
end

end
