# Description:
#   Weather utility

cron   = require("cron").CronJob

WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp"

module.exports = (robot) ->
    conv = (temp) ->
        Math.floor(temp - 273.15)
    send = (text) ->
        robot.send {room: "#general"}, text
    print_weather = () ->
        robot.http(WEATHER_URL).get() (err, res, body) ->
            w = JSON.parse(body)
            send "http://openweathermap.org/img/w/" + w.weather[0].icon + ".png"
            send "最高気温: " + conv(w.main.temp_max)
            send "最低気温: " + conv(w.main.temp_min)

    robot.respond /(tenki|天気)/, (msg) ->
        print_weather()

    new cron "0 2 21 * * *", () ->
        print_weather()
    , null, true, "Asia/Tokyo"
