through2     = require 'through2'
WordCruncher = require './wordCruncher'


module.exports = ->
  words = 0
  lines = 0
  chars = 0

  transform = (chunk, encoding, cb) ->
    wordCruncher = new WordCruncher(chunk)
    words = wordCruncher.words()
    lines = wordCruncher.lines()
    chars = wordCruncher.chars()
    cb()

  flush = (cb) ->
    this.push { words, lines, chars }
    this.push null
    cb()

  through2.obj transform, flush
