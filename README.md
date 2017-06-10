# Rabbit Post Office!

We are going to send a ton of messages and break stuff.

### Setup

  * `cd message_consumer && bundle && rake db:migrate`
  * `cd message_sender && bundle && rake db:migrate`

### Demo

need multiple windows open

 * `dc up`
 * `bundle exec rake multiple_man:worker`
 * `cd message_consumer && bundle exec rails c`
 * `cd message_sender && bundle exec rails c`

In sender console: ` Post.rain_for(120, 4)`, messages for 120s at 4/s
In another window: `./rolling_restart.sh`, restart rmq docker containers
In consumer console: `Post.total`, see the total afterwards
