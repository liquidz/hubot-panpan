module.exports = (robot) ->
    robot.hear /nullpo/, (msg) ->
        msg.send "GA!"
