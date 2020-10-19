# rest-mailer
a simple Sinatra app to send mail via a GET request


required params
`name`, `subject`, `sender`, `recipient`, `message`

## Running the app

run `bundle install` to install required gems
run `bundle exec rackup -p 3000` to start the process


## Example Usage
`localhost:3000?name=Moulson&subject=ExampleSubject&sender=dan@danmoulson.com&recipient=myemail@example.com&message=My%20Message`
