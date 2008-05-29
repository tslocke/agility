class ProjectMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
    contributor :boolean, :default => false
  end

  belongs_to :project
  belongs_to :user

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator? || user == project.owner
  end

  def updatable_by?(user, new)
    user.administrator? || user == project.owner
  end

  def deletable_by?(user)
    user.administrator? || user == project.owner
  end

  def viewable_by?(user, field)
    true
  end

end
