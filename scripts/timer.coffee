# Description:
#   Timer utility

cron   = require("cron").CronJob
random = require('hubot').Response::random

SCHEDULES = {
    "0 50 7 * * 0": () -> random ["忘れ物ない？: 社員証/財布/携帯/フィットメータ"]
    "0 25 18 * * 6": () -> random ["青空レストラン始まるよ", "もう少しで青空レストラン"],
    "0 55 18 * * 0": () -> random ["鉄腕ダッシュ始まるよ"]
}

module.exports = (robot) ->
    for t, f of SCHEDULES
        new cron t, () ->
            text = f()
            robot.send {room: "#general"}, text
        , null, true, "Asia/Tokyo"


