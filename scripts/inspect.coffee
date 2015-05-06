# Description:
#   Displays all current environment variables
#
# Commands:
#   hubot brain show storage - Display the contents that are persisted in the brain
#   hubot brain show storage --key=[key] - Display the contents that are persisted with specified key in the brain
#   hubot brain show users - Display all users that hubot knows about

util = require "util"

getArgParams = (arg) ->
    key_capture = /--key=(.*?)( |$)/.exec(arg)
    if key_capture
      key  = key_capture[1]
      keys = key.split('.')
    else
      keys = null

    return { keys: keys }

module.exports = (robot) ->
  robot.respond /brain show storage(.*)$/i, (msg) ->
    arg_params = getArgParams(msg.match[1])

    data = robot.brain.data

    if keys = arg_params.keys
      for key in keys
        data = data[key]

    output = util.inspect(data, false, null)
    msg.send output

  robot.respond /brain show users$/i, (msg) ->
    response = ""

    for own key, user of robot.brain.data.users
      response += "#{user.id} #{user.name}"
      response += " <#{user.email_address}>" if user.email_address
      response += "\n"

    msg.send response
