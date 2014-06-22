# Description:
#   PanPan persona

module.exports = (robot) ->
    robot.hear /ぬるぽ/, (msg) ->
        msg.send "ガッ"
    robot.hear /panda/, (msg) ->
        msg.send msg.random(["aa", "bb", "cc"])
    robot.hear /(take|sasa|takenoko)/, (msg) ->
        msg.send msg.random(["gata", "eltu"])
