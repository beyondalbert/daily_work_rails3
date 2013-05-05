class DailynotesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_dailynote, :only => [:edit, :update, :destroy]

	def index
		@dailynotes = Dailynote.find(:all, :conditions => {:user_id => current_user.id})
	end

	def create
		date = params[:date]["date(1i)"] + "-" + params[:date]["date(2i)"] + "-" + params[:date]["date(3i)"]
		@dailynote = Dailynote.new(:date => date, 
			:note => params[:dailynote], 
			:user_id => current_user.id)
		if @dailynote.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		@dailynote.note = params[:dailynote]
		if @dailynote.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def destroy
		@dailynote.destroy
		#用于在js.erb中判断是否是最后一个dailynote记录
		@dailynote_flag = Dailynote.find(:first, :conditions => {:user_id => current_user.id})

		respond_to do |format|
			format.js
		end
	end

	def search
		start_date = params[:start_date]["date(1i)"] + "-" + params[:start_date]["date(2i)"] + "-" + params[:start_date]["date(3i)"]
		end_date = params[:end_date]["date(1i)"] + "-" + params[:end_date]["date(2i)"] + "-" + params[:end_date]["date(3i)"]
		
		@dailynotes = Dailynote.where(:user_id => current_user.id, :date => (start_date.to_date)..(end_date.to_date))
	
		respond_to do |format|
			format.js
		end
	end

	def send_mail_edit
		@dailynotes = Dailynote.where(:user_id => current_user.id, :date => (Time.now.midnight - 7.day)..(Time.now.midnight + 1.day))
	end

	def send_mail
		dailynote_ids = []
		params[:ck_box].each do |d|
			dailynote_ids << d[1].to_i
		end
		@dailynotes = Dailynote.where(:id => dailynote_ids)

		UserMailer.dailynotes(current_user, @dailynotes, params[:plan]).deliver

		redirect_to :back
	end

	private

	def find_dailynote
		@dailynote = Dailynote.find_by_id(params[:id])
	end
end
