# Description:
#   PanPan persona

module.exports = (robot) ->
    robot.hear /ぬるぽ/, (msg) ->
        msg.send "ガッ"
    robot.hear /(パンダ|ぱんだ)/, (msg) ->
        msg.send msg.random(["呼んだ？", "なぁに？", "ん？", "はーい、え？違う？", "こっち見んな", "？", "僕のこと？", "うるさいぞ"])
    robot.hear /(竹|笹|筍|たけのこ|タケノコ|竹の子)/, (msg) ->
        text = msg.match[1]
        msg.send msg.random(["ガタッ", "じゅる", "えっ？", text + "？", text + "、美味しそう", "お腹空いた。。", text + "！", text + "どこ？", text + "くれるの？", text + "よこせ"])

    robot.respond /何.*食べ.*？/, (msg) ->
        msg.reply msg.random(["牛丼", "パスタ", "カレー", "寿司", "蕎麦", "うどん", "定食", "ファミレス", "ラーメン", "チャーハン", "餃子", "ハンバーグ", "竹", "笹", "タケノコ", "豆腐", "オムライス"])

    robot.respond /おはよう/, (msg) ->
        msg.reply msg.random(["おはよ", "おはよう", ".zZ", "あと5分。。", "むにゃむにゃ"])
    robot.respond /おやすみ/, (msg) ->
        msg.reply msg.random(["おやすみ", "おやちゅみ？"])
    robot.hear /(眠い|ねむい)/, (msg) ->
        msg.reply msg.random(["寝ろ", "もう寝よう"])
