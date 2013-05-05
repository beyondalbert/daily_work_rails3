# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DailyWorkReport3::Application.initialize!

#receivers表的type字段定义
TO = 1
CC = 2

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "smtp.163.com",
	:port => 25,
	:domain         => "www.163.com",
    :authentication => :login,
    :user_name      => "dailynotes_rails@163.com",
    :password       => "qwert12345"
}