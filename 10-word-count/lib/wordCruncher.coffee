module.exports =
  class WordCruncher
    constructor: (chunk) ->
      console.log 'chunk',chunk
      @chunk = chunk

    words: ->
      tokens = if @chunk.indexOf('"') >= 0
        [@chunk]
      else
        @chunk.split(/\s|\w[A-Z]/)

      tokens.length

    lines: ->
      @chunk.split(/\n/).length
