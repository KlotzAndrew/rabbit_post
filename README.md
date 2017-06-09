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

In sender console: ` Post.rain(100)`
In another window: `docker restart rabbitpost_rabbit-1_1`
In another window: `docker restart rabbitpost_rabbit-2_1`
In another window: `docker restart rabbitpost_rabbit-3_1`
In consumer console: `Post.wash`
