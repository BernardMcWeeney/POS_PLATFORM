class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  validates :name, presence: true, uniqueness: true

  # Define any additional methods or validations as needed

  # Optional: If you want to use a resource-based authorization approach,
  # you can associate roles with other resources (e.g., models).
  # For example, if you have a `Project` model, you can use:
  # resourcify

  # Optional: If you want to define roles specific to a resource,
  # you can use the following syntax:
  # resourcify :project, role_cname: 'ProjectRole'

  # Optional: If you want to define custom role names for resources,
  # you can use the following syntax:
  # resourcify role_cname: 'ResourceRole'

  # Optional: If you want to specify the available roles explicitly,
  # you can use the following syntax:
  # ROLES = %i[admin manager employee]

  # Optional: If you want to use a different name for the roles association,
  # you can customize it using the `roles_association_name` method.
  # def self.roles_association_name
  #   :custom_roles
  # end
end
