class TestController < ApplicationController
  def report
  	@projects = Project.all
  	@issues = Issue.all
  	@time_entries = TimeEntry.all
  end

  def new
  	@time_entry ||= TimeEntry.new(:project => @project, :issue => @issue, :user => User.current, :spent_on => User.current.today)
  	if @time_entry.save
  	redirect_to "http://google.com" 
  else
  end
  
  end
end
