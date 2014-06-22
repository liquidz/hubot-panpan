# Description:
#   PanPan persona

module.exports = (robot) ->
    robot.hear /ぬるぽ/, (msg) ->
        msg.send "ガッ"
    robot.hear /(パンダ|ぱんだ)/, (msg) ->
        msg.send msg.random(["呼んだ？", "なぁに？", "ん？", "はーい、え？違う？", "こっち見んな", "？", "僕のこと？"])
    robot.hear /(竹|笹|筍|たけのこ|タケノコ|竹の子)/, (msg) ->
        text = msg.match[1]
        msg.send msg.random(["ガタッ", "じゅる", "えっ？", text + "？", text + "、美味しそう", "お腹空いた。。", text + "！", text + "どこ？", text + "くれるの？", text + "よこせ"])
