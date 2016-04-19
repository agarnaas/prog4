amqp = require('amqplib/callback_api')
connect = ->
  amqp.connect 'amqp://queue',  (err, conn) ->
    conn.createChannel (err, ch) ->
      q = 'hello'
      ch.assertQueue q, durable: false
      put = ->
        ch.sendToQueue q, new Buffer('Hello World!')
        console.log ' [x] Sent \'Hello World!\''
      setInterval put, 1000
setTimeout connect, 2000
console.log ' PUT kobler til om 2 sek'
