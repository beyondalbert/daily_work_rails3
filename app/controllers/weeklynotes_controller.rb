class WeeklynotesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_weeklynote, :only => [:edit, :update, :destroy]

	def index
		@weeklynotes = Weeklynote.find(:all, :conditions => {:user_id => current_user.id})
	end

	def create
		start_date = params[:start_date]["date(1i)"] + "-" + params[:start_date]["date(2i)"] + "-" + params[:start_date]["date(3i)"]
		end_date = params[:end_date]["date(1i)"] + "-" + params[:end_date]["date(2i)"] + "-" + params[:end_date]["date(3i)"]
		@weeklynote = Weeklynote.new(:start_date => start_date,
			:end_date => end_date,
			:note => params[:weeklynote], 
			:user_id => current_user.id)
		if @weeklynote.save
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
		@weeklynote.note = params[:weeklynote]
		if @weeklynote.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def destroy
		@weeklynote.destroy
		#用于在js.erb中判断是否是最后一个dailynote记录
		@weeklynote_flag = Weeklynote.find(:first, :conditions => {:user_id => current_user.id})

		respond_to do |format|
			format.js
		end
	end

	private

	def find_weeklynote
		@weeklynote = Weeklynote.find_by_id(params[:id])
	end
end
