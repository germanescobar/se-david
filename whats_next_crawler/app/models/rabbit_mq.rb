class RabbitMq < ApplicationRecord
  def self.connection
     STDOUT.sync = true

     conn = Bunny.new
              (
                host:  'localhost',
                port:  '5672',
                vhost: '/',
                user:  'guest',
                pass:  'guest'
              )

     conn.start

     ch = conn.create_channel
     q  = ch.queue("bunny.examples.hello_world", :auto_delete => true)
     x  = ch.default_exchange

     q.subscribe do |delivery_info, metadata, payload|
       puts "Received #{payload}"
     end

     {connection: conn, q: q, x: x, ch: ch}
  end

#Define a structure for the bunny object
# ch, q, x
# Probably not necessary when configured properly in rails config files.

  def self.send_message(queue:, msg:)
    x.publish(msg, :routing_key => queue[:q].name)
  end

  def self.extract_message(queue:)
    delivery_info, properties, msg = queue[:q].pop

    msg
  end

  def self.close_connection(queue:)
    queue[:connection].close
  end
end
