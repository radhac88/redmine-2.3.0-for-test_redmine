class TimeEntryTemp < ActiveRecord::Base
  attr_accessible :activity_id, :comments, :hours, :issue_id, :project_id, :spent_on, :user_id
  #validates_presence_of :issue_id, :activity_id, :hours, :spent_on
  #validates_numericality_of :hours, :allow_nil => true, :message => :invalid
  #validates_length_of :comments, :maximum => 255, :allow_nil => true
  #validates :spent_on, :date => true
  #before_validation :set_project_if_nil
  
  def set_project_if_nil
    self.project = issue.project if issue && project.nil?
  end
end
