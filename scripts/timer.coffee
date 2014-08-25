# Description:
#   Timer utility

cron   = require("cron").CronJob
random = require('hubot').Response::random

module.exports = (robot) ->
    new cron "0 50 7 * * 2-6", () ->
        text = random ["忘れ物ない？: 社員証/財布/携帯/フィットメータ"]
        robot.send {room: "#general"}, text
    , null, true, "Asia/Tokyo"

    new cron "0 25 18 * * 0", () ->
        text = random ["青空レストラン始まるよ", "もう少しで青空レストラン"]
        robot.send {room: "#general"}, text
    , null, true, "Asia/Tokyo"

    new cron "0 55 18 * * 1", () ->
        text = random ["鉄腕ダッシュ始まるよ"]
        robot.send {room: "#general"}, text
    , null, true, "Asia/Tokyo"


