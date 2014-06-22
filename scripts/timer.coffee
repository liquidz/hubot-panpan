# Description:
#   Timer utility

cron = require("cron").CronJob

SCHEDULES = {
    "0 25 18 * * 6": () -> "aozora",
    "0 55 18 * * 0": () -> "dash"
}

module.exports = (robot) ->
    for t, f of SCHEDULES
        new cron t, () ->
            text = f()
            robot.send {room: "#general"}, text
        , null, true, "Asia/Tokyo"


