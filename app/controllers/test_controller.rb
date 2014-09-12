class TestController < ApplicationController
  # def report
  # 	@projects = Project.all
  # 	@issues = Issue.all
  # 	@time_entries = TimeEntry.all
  # end

  # def new
  # 	@time_entry ||= TimeEntry.new(:project => @project, :issue => @issue, :user => User.current, :spent_on => User.current.today)
  # 	if @time_entry.save
  # 	redirect_to "http://google.com" 
  #   else
  #   end
  # end

  # def radha

  #   @time = TimeEntryTemp.new(:issue_id => @issue, 
  #       :hours => @hours, 
  #       #:user => @user,
  #       #:password => @password,
  #       :activity_id => @activity_id, 
  #       :spent_on => @spent_on, 
  #       :comments => @comments)
  #   if @time.save
  #     respond_to do |format|
  #     format.api  { render :action => 'show', :status => :created, :location => time_entry_url(@time_entry) }
  #     end
  #   else
  #     p "****************************"
  #     respond_to do |format|
  #       format.html { render :action => 'new' }
  #       format.api  { render_validation_errors(@time_entry) }
  #     end

  #   end
  # end

  #menu_item :issues

  #before_filter :find_project_for_new_time_entry, :only => [:create]
  #before_filter :find_time_entry, :only => [:show, :edit, :update]
  #before_filter :find_time_entries, :only => [:bulk_edit, :bulk_update, :destroy]
  #before_filter :authorize, :except => [:new, :index, :report]

  #before_filter :find_optional_project, :only => [:index, :report]
  #before_filter :find_optional_project_for_new_time_entry, :only => [:new]
  #before_filter :authorize_global, :only => [:new, :index, :report]

  accept_rss_auth :index
  accept_api_auth :index, :show, :create, :update, :destroy

  #rescue_from Query::StatementInvalid, :with => :query_statement_invalid



  def new
    @time_entry_temp ||= TimeEntryTemp.new(:issue_id => @issue, :user_id => User.current, :spent_on => User.current.today, :activity_id=>@activity, :comments => @comments)
    #@time_entry.safe_attributes = params[:time_entry]
  end

  def create
    @time_entry_temp ||= TimeEntryTemp.new(:issue_id => @issue, :user_id => User.current, :spent_on => User.current.today, :activity_id=>@activity, :comments => @comments)

    #@time_entry.safe_attributes = params[:time_entry]

    #call_hook(:controller_timelog_edit_before_save, { :params => params, :time_entry => @time_entry })

    if @time_entry_temp.save
      respond_to do |format|
        format.html {
          flash[:notice] = l(:notice_successful_create)
        }
        format.api  { render :action => 'show', :status => :created, :location => time_entry_url(@time_entry_temp) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.api  { render_validation_errors(@time_entry_temp) }
      end
    end
  end

  

end
