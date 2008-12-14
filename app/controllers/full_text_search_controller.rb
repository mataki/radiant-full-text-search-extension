class FullTextSearchController < ApplicationController
  no_login_required

  def index
    @search = EstSearch.new(params[:phrase], params[:offset], params[:per_page])
    unless @search.flash.blank?
      @search.flash.each {|key, val| flash.now[key] = val }
    end
  end
end
