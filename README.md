# Kids Board!!

This is an app built a the Typeform Hackathon the 25th of July of 2015 in Barcelona.

The app builts a desktop fro kids where they can choose whatever they want to do
and then get redirected to the parents choice for that aspect.

For example, the parent chooses on cartoon over a few options that we give them.
Then the when the kid chooses on the dashboard to see cartoons, it gets redirected
to the cartoon chosen by their parent.

### Getting Started

1. Git clone
2. Bundle install
3. create database and seed it
4. use [ngrok](https://ngrok.com/)
  - initialize the rails server
  - initialize the ngrok pointing to your port
  - change the personalize_webhook on the UsersController#create with your ngrok link
  - change the personalize_webhook on the DashboardsController with you ngrok link

**You are good to go**

*Built with love by [bbrassart](https://github.com/bbrassart), [kevprice83](https://github.com/kevprice83) and [lmuntaner](https://github.com/lmuntaner)*
