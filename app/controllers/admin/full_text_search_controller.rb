class Admin::FullTextSearchController < ApplicationController
  def index
    @setting = FtsSetting.first || FtsSetting.new
  end

  def update
    @setting = FtsSetting.first || FtsSetting.new
    @setting.attributes = params[:fts_setting]
    if @setting.save
      flash[:notice] = "FullTextSearh Setting is updated"
      redirect_to :action => :index
    else
      render :action => :index
    end
  end
end
