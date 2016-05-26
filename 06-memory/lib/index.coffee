fs       = require 'fs'
readline = require 'readline'


exports.countryCounter = (countryCode, cb) ->
  return cb() unless countryCode

  counter = 0

  stream = fs.createReadStream "#{__dirname}/../data/geo.txt"

  rl = readline.createInterface input: stream

  rl.on 'line', (line) ->
    line = line.split '\t'

    if line[3] == countryCode then counter++

  rl.on 'close', (line) ->
    cb null, counter
