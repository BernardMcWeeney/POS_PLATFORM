class SetDefaultOnboardingCompleted < ActiveRecord::Migration[7.0]
  def up
    User.where(onboarding_completed: nil).update_all(onboarding_completed: false)
  end
end
