module Server
export serve

import Base.LibuvServer
using HTTP, Sockets, JSON
using ..Types, ..Execute

struct ServerData
  socket::LibuvServer
  address::String
end

function parsePayload(payload)
  return ExecutionArgs("TODO")
end

function serve(port)
  server = Sockets.listen(Sockets.InetAddr(Sockets.localhost, port))
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
 return ServerData(server,"$(Sockets.localhost):$port")
end

end
