class FullTextSearchController < ApplicationController
  no_login_required

  def index
    @search = EstSearch.new(params[:phrase], params[:offset], params[:per_page])
    if @search.error
      flash[:error] = @search.error
    end
  end
end
