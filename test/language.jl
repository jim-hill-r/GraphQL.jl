using Test
using GraphQL

function testLexerInitializesStartOfFile()
  lexer = Lexer("")
  @test lexer.currentToken.kind === Symbol("<SOF>")
end

function testLexerDefaultQuery()
  lexer = Lexer(DEFAULT_QUERY)
  @test lexer.currentToken.kind === Symbol("<SOF>")
  advanceLexer(lexer)
  @test_skip lexer.currentToken.kind === Symbol("String") # query
  advanceLexer(lexer)
  @test_skip lexer.currentToken.kind === Symbol("String") # Ping
  advanceLexer(lexer)
  @test_skip lexer.currentToken.kind === Symbol("String") # healthcheck
  advanceLexer(lexer)
  @test_skip lexer.currentToken.kind === Symbol("String") # ping
end

@testset "Language" begin
  @info "Running language tests..."
  testLexerInitializesStartOfFile()
  testLexerDefaultQuery()
end