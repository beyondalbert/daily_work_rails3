class TodosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_todo, :only => [:destroy, :done]

  def index
  	@to_dos = Todo.find(:all, :conditions => {:user_id => current_user.id})
  	@dones = Todo.find(:all, :conditions => {:user_id => current_user.id, :status => true})
  end

  def create
    date = params[:date]["date(1i)"] + "-" + params[:date]["date(2i)"] + "-" + params[:date]["date(3i)"]
    @to_do = Todo.new(:date => date, :content => params[:to_do_content], :user_id => current_user.id, :status => false)

    if @to_do.save
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def update
  end

  def destroy
    @to_do.destroy
    
    respond_to do |format|
      format.js
    end
  end

  def done
    @to_do.status = true

    if @to_do.save
      respond_to do |format|
        format.js
      end
    else
    end
  end

  private
  def find_todo
    @to_do = Todo.find(params[:id])
  end

end
