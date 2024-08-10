class Discovery < ApplicationRecord
  belongs_to :activity, optional: true
end
