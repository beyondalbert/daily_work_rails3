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

	private

	def find_dailynote
		@dailynote = Dailynote.find_by_id(params[:id])
	end
end
