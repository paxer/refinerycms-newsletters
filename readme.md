# Refinery CMS Newsletters 

Simple newsletters engine for [Refinery CMS](http://refinerycms.com). It supports campaigns, unsubscribe and simple statistic.
This solution could be useful if you don't have a huge amount of subscribers but only a few tens or so.
If you have hundreds or more subscribers you need consider of using a delayed job instead.

Refinery CMS Newsletters supports Rails 3.0.x 

Options:

## Requirements

Refinery CMS version 0.9.9.1 or above.

## Install

Open up your ``Gemfile`` and add at the bottom this line:

    gem 'refinerycms-newsletters', '1.0', ':git => 'git://github.com/paxer/refinerycms-newsletters.git'

or copy it under your Rails.root/vendor/engines/newsletters then

	gem 'refinerycms-newsletters', '1.0', :path => 'vendor/engines'

Now, run ``bundle install``

Next, to install the newsletters plugin run:

    rails generate refinerycms_newsletters

Finally migrate your database and you're done.

    rake db:migrate

## How to use
In admin panel Users section for each user will be available new checkbox "Newsletter subscription", all users with "checked" will receive newsletters.

To unsubscribe add to you newsletter template next link  http://yousiteurl.com/unsubscribe?email=user@email.com 


Have a fun!