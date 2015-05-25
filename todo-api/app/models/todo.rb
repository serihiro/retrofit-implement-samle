# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  todo       :string           not null
#  done       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ActiveRecord::Base
  validates :todo, presence: true
  validates :todo, length: { maximum: 30 }
end
