# Description:
#   PanPan persona

module.exports = (robot) ->
    robot.hear /ぬるぽ/, (msg) ->
        msg.send "ガッ"
    robot.hear /パンダ/, (msg) ->
        msg.send msg.random(["呼んだ？", "なぁに？", "ん？", "はーい、え？違う？", "こっち見んな", "？"])
    robot.hear /(竹|笹|筍|たけのこ|タケノコ|竹の子)/, (msg) ->
        msg.send msg.random(["ガタッ", "じゅる", "えっ？", "美味しそう", "お腹空いた。。"])
