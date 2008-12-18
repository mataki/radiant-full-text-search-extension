class FullTextSearchController < ApplicationController
  session :off
  skip_before_filter :verify_authenticity_token
  no_login_required

  radiant_layout {|controller| FtsSetting.first.layout }
  def index
    @search = EstSearch.new(params[:phrase], params[:offset], params[:per_page])
    unless @search.flash.blank?
      @search.flash.each {|key, val| flash.now[key] = val }
    end
  end
end
