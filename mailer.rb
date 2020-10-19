require 'sinatra'
require 'pony'

get '/' do
    unless params[:name] == '' || params[:subject] == '' || params[:sender] == '' || params[:recipient] == '' || params[:message] == ''
        Pony.options = {
            subject: "AndreiMail: #{params[:subject]}",
            body: "#{params[:message]}, From: #{params[:name]} <#{params[:sender]}>",
            via: :smtp,
            via_options: {
                openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
                address: ENV['SMTP_ADDRESS'],
                ssl: true,
                arguments: '-t',
                port: ENV['SMTP_PORT'],
                enable_starttls_auto: false,
                user_name: ENV['SMTP_USERNAME'],
                password: ENV['SMTP_PASSWORD'],
                authentication: :plain,
                domain: ENV['DOMAIN']
            }
        }
        Pony.mail(to: params[:recipient])
        "Sent!"
    end
end