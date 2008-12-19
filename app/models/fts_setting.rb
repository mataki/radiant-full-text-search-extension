class FtsSetting < ActiveRecord::Base
  validates_presence_of :node
  validates_presence_of :layout

  def self.node
    first_or_initialize.node
  end

  def self.layout
    first_or_initialize.layout
  end

  def self.first_or_initialize
    self.find(:first) || self.new
  end
end
