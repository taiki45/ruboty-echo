require 'ruboty'
require 'ruboty/echo/version'

module Ruboty
  module Handlers
    class Echo < Base
      on(
        /echo\s+(.*)/m,
        name: 'echo',
        description: 'repeat your commnad'
      )

      def echo(message)
        message.reply(message.match_data[1])
      end
    end
  end
end
