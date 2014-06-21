# Description:
#   We love panda
#
# Commands:
#   hubot panda

tumblr = require "tumblrbot"

SOURCES = [
    "peco-panda.tumblr.com"
]

getPanda = (blog, msg) ->
    tumblr.photos(blog).random (post) ->
        msg.send post.photos[0].original_size.url

module.exports = (robot) ->
    robot.respond /panda\s?(me)?/i, (msg) ->
        blog = msg.random SOURCES
        getPanda blog, msg
