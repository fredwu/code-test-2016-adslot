module.exports =
  class WordCruncher
    constructor: (chunk) ->
      @chunk      = chunk
      @cleanChunk = @removeTrailingEmptyLine(@chunk)

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

    chars: ->
      @chunk.length

    chunkLines: ->
      @cleanChunk.split(/\n/)

    removeTrailingEmptyLine: (chunk) ->
      chunk.replace(/\s$/gm, '')
