class ReceiversController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_receivers, :only => [:index]
  before_filter :find_receiver, :only => [:edit, :destroy, :update]

  	def index

  	end

    def create
      @receiver = Receiver.new(:nickname => params[:name], 
        :email => params[:email_address], 
        :contact_type => params[:contact_type].to_i,
        :user_id => current_user.id)
      if @receiver.save
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
      @receiver.nickname = params[:name]
      @receiver.email = params[:email_address]
      @receiver.contact_type = params[:contact_type].to_i

      if @receiver.save
        respond_to do |format|
          format.js
        end
      else
      end
    end

    def destroy      
      @receiver.destroy

      @receiver_flag = Receiver.find(:first, :conditions => {:user_id => current_user.id})

      respond_to do |format|
        format.js
      end
    end

  	private
    def find_receiver
      @receiver = Receiver.find(params[:id])
    end

  	def find_receivers
    	@receivers = Receiver.find(:all, :conditions => {:user_id => current_user.id})
    end
end
