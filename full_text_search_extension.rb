# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FullTextSearchExtension < Radiant::Extension
  version "0.1"
  description "HyperEstraier webfront"
  url "http://www.openskip.org/"

  define_routes do |map|
    map.with_options(:controller => "admin/full_text_search") do |fts|
      fts.admin_full_text_search_index "admin/full_text_search", :action => "index"
      fts.admin_full_text_search_update "admin/full_text_search/update", :action => "update"
    end
    map.full_text_search "full_text_search", :controller => "full_text_search", :action => "index"
  end

  def activate
    admin.tabs.add "Full Text Search", "/admin/full_text_search", :after => "Layouts", :visibility => [:all]
  end

  def deactivate
    # admin.tabs.remove "Full Text Search"
  end

end
