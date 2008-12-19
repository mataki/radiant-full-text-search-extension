class Admin::FullTextSearchController < ApplicationController
  def index
    @setting = FtsSetting.first_or_initialize
  end

  def update
    @setting = FtsSetting.first_or_initialize
    @setting.attributes = params[:fts_setting]
    if @setting.save
      flash[:notice] = "FullTextSearh Setting is updated"
      redirect_to :action => :index
    else
      render :action => :index
    end
  end
end
