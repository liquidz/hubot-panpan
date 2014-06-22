# Description:
#   Search keyword with weblio
#
# Commands:
#   hubot dic <text> - Searches <text> with weblio.

module.exports = (robot) ->
    del_comment = (html) ->
        html.replace(/<!--[\s\S]*-->/mg, '').trim()

    robot.respond /dic (.+)$/, (msg) ->
        text = encodeURIComponent(msg.match[1])
        robot.http("http://ejje.weblio.jp/content/" + text).get() (err, res, body) ->
            $ = require('cheerio').load(body)
            cont = $('#main .kijiWrp').first().text()
            msg.send del_comment(cont).split(/[\r\n]+/)[1..2].join("\n\n")

