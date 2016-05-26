module.exports =
  class WordCruncher
    constructor: (chunk) ->
      @chunk = chunk

    words: ->
      tokens = []

      for chunkLine in @chunkLines()
        if chunkLine.indexOf('"') >= 0
          tokens = [tokens..., chunkLine]
        else
          tokens = [tokens..., chunkLine.split(/\s|\w[A-Z]/)...]

      tokens.length

    lines: ->
      @chunkLines().length

    chunkLines: ->
      @chunk.split(/\n/)
