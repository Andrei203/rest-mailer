require 'sinatra'
require 'pony'

get '/' do
    unless params[:name] == '' || params[:subject] == '' || params[:sender] == '' || params[:recipient] == '' || params[:message] == ''
        Pony.options = {
            subject: "MoulsonMail: #{params[:subject]}",
            body: "#{params[:message]}, From: #{params[:name]} <#{params[:sender]}>",
            via: :smtp,
            via_options: {
                address: ENV['SMTP_ADDRESS'],
                ssl: true,
                arguments: '-t',
                port: ENV['SMTP_PORT'],
                enable_starttls_auto: true,
                user_name: ENV['SMTP_USERNAME'],
                password: ENV['SMTP_PASSWORD'],
                authentication: :plain,
                domain: 'restmailer.danmoulson.com'
            }
        }
        Pony.mail(to: params[:recipient])
        "Sent!"
    end
end