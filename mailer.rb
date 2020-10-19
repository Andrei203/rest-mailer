require 'sinatra'
require 'pony'

get '/' do
    unless params[:name] == '' || params[:subject] == '' || params[:sender] == '' || params[:recipient] == '' || params[:message] == ''
        Pony.options = {
            subject: "MoulsonMail: #{params[:subject]}",
            body: "#{params[:message]}, From: #{params[:name]} <#{params[:sender]}>",
        }
        Pony.mail(to: params[:recipient])
        "Sent!"
    end
    Process.kill('TERM', Process.pid)
end