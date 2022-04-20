module Language
export Lexer, advanceLexer

# Each kind of token
const SOF = Symbol("<SOF>")
const EOF = Symbol("<EOF>")
const BANG = Symbol("!")
const DOLLAR = Symbol("\$")
const PAREN_L = Symbol("(")
const PAREN_R = Symbol(")")
const SPREAD = Symbol("...")
const COLON = Symbol(":")
const EQUALS = Symbol("=")
const AT = Symbol("@")
const BRACKET_L = Symbol("[")
const BRACKET_R = Symbol("]")
const BRACE_L = Symbol("{")
const PIPE = Symbol("|")
const BRACE_R = Symbol("}")
const NAME = Symbol("Name")
const INT = Symbol("Int")
const FLOAT = Symbol("Float")
const STRING = Symbol("String")
const COMMENT = Symbol("Comment")

struct Token
  kind::Symbol
  startPosition::Int64
  endPosition::Int64
  line::Int64
  column::Int64
  prev::Union{Symbol,Nothing}
  value::Union{String,Nothing}
end

mutable struct Lexer
  body::String
  lastToken::Token
  currentToken::Token
  line::Int64
  column::Int64

  Lexer(body::String) = new(body,Token(SOF,0,0,0,0,nothing,nothing),Token(SOF,0,0,0,0,nothing,nothing),0,0)
end

function advanceLexer(lexer::Lexer)

end

end