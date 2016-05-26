fs        = require 'fs'
assert    = require 'assert'
WordCount = require '../lib'


helper = (input, expected, done) ->
  pass = false
  counter = new WordCount()

  counter.on 'readable', ->
    return unless result = this.read()
    assert.deepEqual result, expected
    assert !pass, 'Are you sure everything works as expected?'
    pass = true

  counter.on 'end', ->
    if pass then return done()
    done new Error 'Looks like transform fn does not work'

  counter.write input
  counter.end()


describe '10-word-count', ->

  it 'should count a single word', (done) ->
    input = 'test'
    expected = words: 1, lines: 1, chars: 4
    helper input, expected, done

  it 'should count words in a phrase', (done) ->
    input = 'this is a basic test'
    expected = words: 5, lines: 1, chars: 20
    helper input, expected, done

  it 'should count quoted characters as a single word', (done) ->
    input = '"this is one word!"'
    expected = words: 1, lines: 1, chars: 19
    helper input, expected, done

  # !!!!!
  # Make the above tests pass and add more tests!
  # !!!!!

  it 'should count CamelCased words', (done) ->
    input = 'FunPuzzle'
    expected = words: 2, lines: 1, chars: 9
    helper input, expected, done

  it 'should count camelCased words', (done) ->
    input = 'funPuzzle'
    expected = words: 2, lines: 1, chars: 9
    helper input, expected, done

  it 'should count lines', (done) ->
    input = 'fun\nPuzzle'
    expected = words: 2, lines: 2, chars: 10
    helper input, expected, done

  it 'should count lines with phrased words', (done) ->
    input = 'fun\n"fun funPuzzle"'
    expected = words: 2, lines: 2, chars: 19
    helper input, expected, done

  it 'should count lines with camcelCased words', (done) ->
    input = 'fun\nfunPuzzle'
    expected = words: 3, lines: 2, chars: 13
    helper input, expected, done

describe '10-word-count fixtures', ->
  it 'should read 1,9,44.txt', (done) ->
    input = fs.readFileSync "#{__dirname}/fixtures/1,9,44.txt", 'utf8'
    expected = words: 9, lines: 1, chars: 44
    helper input, expected, done

  it 'should read 3,7,46.txt', (done) ->
    input = fs.readFileSync "#{__dirname}/fixtures/3,7,46.txt", 'utf8'
    expected = words: 7, lines: 3, chars: 46
    helper input, expected, done

  it 'should read 5,9,40.txt', (done) ->
    input = fs.readFileSync "#{__dirname}/fixtures/5,9,40.txt", 'utf8'
    expected = words: 9, lines: 5, chars: 40
    helper input, expected, done
