# Description:
#   Memo utility
#
# Commands:
#   メモ 削除   - Forget remembered text
#   メモ 教えて - Remind remembered text
#   メモ <text> - Remember <text>

cron   = require("cron").CronJob
random = require('hubot').Response::random

REMEMBER_TEXTS  = ["おっけー", "覚えておくね", "覚えたよ", "あとで教えるね", "仕方ないから覚えてあげる"]
FORGET_TEXTS    = ["消したよ", "忘れた。。", "忘れたよ", "なんだっけ？", "。。。"]
REMINDER_TEXTS  = ["思い出して", "覚えてる？", "忘れてない？", "そういえば", "これどうするの？"]
REMIND_SCHEDULE = "0 30 7,12,20 * * *"

module.exports = (robot) ->
    randtext = (arr, text) ->
        random(arr) + ": " + text

    robot.hear /メモ (.+)$/, (msg) ->
        text = msg.match[1]
        switch text
            when "削除"
                text = robot.brain.data.memo
                robot.brain.data.memo = null
                robot.brain.save
                msg.send randtext(FORGET_TEXTS, text)
            when "教えて"
                msg.send randtext(REMINDER_TEXTS, robot.brain.data.memo)
            else
                robot.brain.data.memo = text
                robot.brain.save
                msg.send randtext(REMEMBER_TEXTS, text)

    new cron REMIND_SCHEDULE, () ->
        text = robot.brain.data.memo
        robot.send {room: "#general"}, randtext(REMINDER_TEXTS, text) if text
    , null, true, "Asia/Tokyo"
