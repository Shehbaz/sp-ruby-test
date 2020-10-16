# sp-ruby-test

## Run script

1. App receives log as an argument
  e.g.: `./parser.rb webserver.log`

2. Returns the following:

    a. list of most viewed web pages, sorted in descending order with count
    ```
    /home 10 visits
    /index 9 visits
    ...
    ```

    b. list of unique viewed web pages, sorted in descending order with count
    ```
    /home 2 unique views
    /index 1 unique views
    ...
    ```

## Run specs

To run specs, install gems and run specs as follow:
```
bundle install
bundle exec rspec spec
```