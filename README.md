# hubot-brain-inspect

[![NPM](https://nodei.co/npm/hubot-brain-inspect.png)](https://nodei.co/npm/hubot-brain-inspect/)

Hubot inspect their own brain

## Installation

Add **hubot-brain-inspect** to your `package.json` file:

```
npm install --save hubot-brain-inspect
```

Add **hubot-brain-inspect** to your `external-scripts.json`:

```json
["hubot-brain-inspect"]
```

Run `npm install`

## Commands

```ruby
hubot brain show storage - Display the contents that are persisted in the brain
hubot brain show storage --key=[key] - Display the contents that are persisted with specified key in the brain
hubot brain show users - Display all users that hubot knows about
```

## Examples

```ruby
hubot> hubot brain show storage
{ users:
   { '1': { id: 1, name: 'Shell', room: 'Shell' },
     USLACKBOT:
      { id: 'USLACKBOT',
        name: 'slackbot',
        real_name: 'Slack Bot',
        email_address: null } },
  _private:
   { 'hubot-env':
      { env:
         { HUBOT_AWS_ROLE: 'app',
           HUBOT_AWS_EC2_RUN_CONFIG: 'files/aws/ec2/run/app.cson',
           HUBOT_AWS_AS_LAUNCH_CONF_CONFIG: 'files/aws/autoscaling/create_launch_configuration/app.cson',
           HUBOT_AWS_AS_GROUP_CONFIG: 'files/aws/autoscaling/create_group/app.cson',
           HUBOT_AWS_AS_POLICY_ADD: 'files/aws/autoscaling/put_policy/add/app.cson',
           HUBOT_AWS_AS_POLICY_REMOVE: 'files/aws/autoscaling/put_policy/remove/app.cson',
           HUBOT_AWS_CW_ALARM_ADD: 'files/aws/cloudwatch/put_metric_alarm/add/app.cson',
           HUBOT_AWS_CW_ALARM_REMOVE: 'files/aws/cloudwatch/put_metric_alarm/remove/app.cson',
           HUBOT_AWS_AS_NOTIFICATION: 'files/aws/autoscaling/put_notification/app.cson' } } },
}
```

```ruby
hubot> hubot brain show storage --key=users
{ '1': { id: 1, name: 'Shell', room: 'Shell' },
  USLACKBOT:
   { id: 'USLACKBOT',
     name: 'slackbot',
     real_name: 'Slack Bot',
     email_address: null } }

hubot> hubot brain show storage --key=users.USLACKBOT
{ id: 'USLACKBOT',
  name: 'slackbot',
  real_name: 'Slack Bot',
  email_address: null }
```

```ruby
hubot> hubot brain show users
1 Shell
USLACKBOT slackbot
```
