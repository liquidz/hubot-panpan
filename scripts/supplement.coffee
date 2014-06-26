# Description:
#   supplement utility
#
# Commands:
#   hubot nonda
#   hubot nondenai

cron   = require("cron").CronJob
random = require('hubot').Response::random
owner  = process.env.HUBOT_OWNER

SUPPLEMENT_TEXTS = ["drink supplement!"]
SUPPLEMENT_REMINDER_TEXTS = ["nonda?", "nomeyo"]
SUPPLEMENT_OK_TEXTS = ["ok"]
SUPPLEMENT_NG_TEXTS = ["oi"]

module.exports = (robot) ->

    robot.respond /nonda/, (msg) ->
        msg.reply random(SUPPLEMENT_OK_TEXTS)
        robot.brain.data.supplement_snooze = null

    robot.respond /nondenai/, (msg) ->
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
