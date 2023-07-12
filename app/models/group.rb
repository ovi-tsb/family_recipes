class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  def to_s
    name
  end

  def translated_name
    I18n.t(name, :scope => 'group')
  end

end
