# Description:
#   Timer utility

cron = require("cron").CronJob

SCHEDULES = {
    "0 15 11 * * *": (say) -> say "PANDA!"
}

module.exports = (robot) ->
    say = (msg) ->
        robot.send {room: "#general"}, msg

    for t, f of SCHEDULES
        new cron t, () ->
            f say
        , null, true, "Asia/Tokyo"


