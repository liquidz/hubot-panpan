# Description:
#   supplement utility
#
# Commands:
#   hubot 飲んだ
#   hubot 飲んでない

cron   = require("cron").CronJob
random = require('hubot').Response::random
owner  = process.env.HUBOT_OWNER

SUPPLEMENT_TEXTS = ["サプリ飲む時間だよ", "サプリサプリサプリ", "サプリ飲んだ？", "サプリ飲み忘れてない？"]
SUPPLEMENT_REMINDER_TEXTS = ["もう飲んだ？", "まだ飲んでないの？", "早く飲めよ", "飲め飲め", "さっさと飲みなさい", "何はともあれ飲め"]
SUPPLEMENT_OK_TEXTS = ["よくやった", "よし", "OK", "おっけー"]
SUPPLEMENT_NG_TEXTS = ["おい", '何やってるの！']

module.exports = (robot) ->

    robot.respond /(飲んだ|のんだ|nonda)/, (msg) ->
        msg.reply random(SUPPLEMENT_OK_TEXTS)
        robot.brain.data.supplement_snooze = null

    robot.respond /(飲んでない|のんでない|nondenai)/, (msg) ->
        msg.reply random(SUPPLEMENT_NG_TEXTS)
        robot.brain.data.supplement_snooze = true

    new cron "0 0 21 * * *", () ->
        robot.brain.data.supplement_snooze = true
        robot.send {room: "#general"}, owner + ": " + random(SUPPLEMENT_TEXTS)
    , null, true, "Asia/Tokyo"

    new cron "0 * * * * *", () ->
        if robot.brain.data.supplement_snooze
            robot.send {room: "#general"}, owner + ": " + random(SUPPLEMENT_REMINDER_TEXTS)
    , null, true, "Asia/Tokyo"
