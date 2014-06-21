cron = require("cron").CronJob

SCHEDULES = {
    "* 5 0 * * *": (say) -> say "PANDA!"
}

module.exports = (robot) ->
    say = (msg) ->
        robot.send {room: "#general"}, msg

    for t, f of SCHEDULES
        new cron t, () ->
            f say
        , null, true

