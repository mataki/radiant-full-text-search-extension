module FullTextSearchTags
  include Radiant::Taggable

  tag 'full_text_search' do |tag|
    %{
    <form method="get" action="#{full_text_search_path}">
      <p>
        <input type="text" name="phrase" id="phrase"/>
        <input type="submit" value="Search" name="commit"/>
      </p>
    </form>
    }
  end
end
