require File.dirname(__FILE__) + '/../spec_helper'

describe FtsSetting do
  before(:each) do
    @fts_setting = FtsSetting.new
  end

  it "should be valid" do
    @fts_setting.should be_valid
  end
end
