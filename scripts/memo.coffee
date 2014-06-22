# Description:
#   Memo utility
#
# Commands:
#   memo del    - Forget remembered text
#   memo <text> - Remember <text>

cron   = require("cron").CronJob
random = require('hubot').Response::random

REMEMBER_TEXTS  = ["覚えたよ"]
FORGET_TEXTS    = ["deleted"]
REMINDER_TEXTS  = ["remind"]
REMIND_SCHEDULE = "0 30 7,12,20 * * *"

module.exports = (robot) ->
    randtext = (arr, text) ->
        random(arr) + ": " + text

    robot.hear /memo (.+)$/, (msg) ->
        text = msg.match[1]
        switch text
            when "del"
                text = robot.brain.data.memo
                robot.brain.data.memo = null
                robot.brain.save
                msg.send randtext(FORGET_TEXTS, text)
            else
                robot.brain.data.memo = text
                robot.brain.save
                msg.send randtext(REMEMBER_TEXTS, text)

    new cron REMIND_SCHEDULE, () ->
        text = robot.brain.data.memo
        robot.send {room: "#general"}, randtext(REMINDER_TEXTS, text) if text
    , null, true, "Asia/Tokyo"
