#encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "beyongyuqifeng@163.com"
  def dailynotes(user, dailynotes, dailynote_plan)
  	@user = user
  	@dailynotes = dailynotes
  	@dailynote_plan = dailynote_plan
  	mail(:from => "dailynotes_rails@163.com",
  		:cc => user.cc, 
  		:to => user.to, 
  		:subject => Time.now.midnight.strftime("%y_%m_%d") + "_工作小结")
  end
end
