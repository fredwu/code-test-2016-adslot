through2     = require 'through2'
WordCruncher = require './wordCruncher'


module.exports = ->
  words = 0
  lines = 1

  transform = (chunk, encoding, cb) ->
    wordCruncher = new WordCruncher(chunk)
    words = wordCruncher.words()
    lines = wordCruncher.lines()
    cb()

  flush = (cb) ->
    this.push { words, lines }
    this.push null
    cb()

  through2.obj transform, flush
