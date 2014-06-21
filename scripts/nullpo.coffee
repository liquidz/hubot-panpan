# Description:
#   nullpo

module.exports = (robot) ->
    robot.hear /ぬるぽ/, (msg) ->
        msg.send "ガッ"
