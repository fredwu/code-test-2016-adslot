module.exports =
  class WordCruncher
    constructor: (chunk) ->
      console.log 'chunk',chunk
      @chunk = chunk

    words: ->
      tokens = if @chunk.indexOf('"') >= 0
        [@chunk]
      else
        @chunk.split(' ')

      tokens.length

    lines: ->
      1