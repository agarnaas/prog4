# rabbitmq amqplib
amqp = require('amqplib/callback_api')
c = ->
  amqp.connect 'amqp://queue', (err, conn) ->
    conn.createChannel (err, ch) ->
      q = 'hello'
      ch.assertQueue q, durable: false
      console.log ' [*] Waiting for messages in %s. To exit press CTRL+C', q
      ch.consume q, ((msg) ->
        console.log ' [x] Received', msg.content.toString()
        #TODO add new document into Mongo in DB x collection y
        #TODO send json msg deserealise (put), serealise (get)

      ), noAck: true
setTimeout c, 2000
console.log ' GET kobler til om 2 sek'
