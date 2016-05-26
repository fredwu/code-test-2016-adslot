module.exports =
  class WordCruncher
    constructor: (chunk) ->
      @chunk      = chunk
      @cleanChunk = @cleanse(@chunk)

    words: ->
      tokens = []

      for chunkLine in @chunkLines()
        tokens = [tokens..., chunkLine.split(/\s|\w[A-Z]/)...]

      tokens.length

    lines: ->
      @chunkLines().length

    chars: ->
      @chunk.length

    chunkLines: ->
      @cleanChunk.split(/\n/)

    cleanse: (chunk) ->
      chunk = @removeTrailingEmptyLine(chunk)
      @replaceQuotedPhrases(chunk)

    replaceQuotedPhrases: (chunk) ->
      chunk.replace /"\S[^"]+"/g, 'quoted'

    removeTrailingEmptyLine: (chunk) ->
      chunk.replace(/\s$/gm, '')
