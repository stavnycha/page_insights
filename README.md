# README For Page Insights

Application proxying to Google Page Insights and returning necessary output via API.

* Ruby version

ruby-2.5.1

* API call

```
/api/v1/tests?url=(url)&...
```

Query params:
```
{
  "url": "https://react-storefront-boilerplate.moovweb.cloud",
  "max_ttfb": 200,
  "max_tti": 5000,
  "max_speed_index": 3000,
  "max_ttfp": 1500
}

```

## Mailer

- For simplicity emails sending is synchonous. No dependency for background workers is required.
- It is possible to preview email using following link: `http://localhost:3000/rails/mailers/user_mailer/notify_failed_test` (after at least 1 test has been run)
- In edvelopment mode all sent emails are opened up in a browser

## Scheduled rerun

Configured cron job daily (config/scheduler.rb), which invoked rake task: `rake page_insights:rerun`. Reruns all previous tests. In case of exception gracefully proceeds.

## Tests

TBD