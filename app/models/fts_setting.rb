class FtsSetting < ActiveRecord::Base
  validates_presence_of :node
  validates_presence_of :layout
end
