class ProductAssignment < ApplicationRecord
    belongs_to :product
    belongs_to :location
    belongs_to :group, optional: true
  
    validates :assignment_type, inclusion: { in: ['Mandatory', 'Recommended'] }, if: -> { group.present? }
  end
  