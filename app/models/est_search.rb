require "estraierpure"
class EstSearch
  include EstraierPure
  attr_reader :count
  attr_reader :offset
  attr_reader :per_page
  attr_reader :error

  def initialize(phrase, offset, per_page)
    if phrase.blank?
      @error = "input search phrase"
      return
    end
    node = get_node
    cond = Condition.new
    cond.set_options Condition::SIMPLE
    cond.set_phrase(phrase)

    @nres = node.search(cond, 1)
    if @nres
      @count = @nres.hint('HIT').to_i
      @offset = offset ? offset.to_i : 0
      @per_page = per_page ? per_page.to_i : 10
    else
      @error = "i cannnot get search result"
    end
  end

  def current_page
    (offset/per_page) + 1
  end

  def start_count
    offset + 1
  end

  def end_count
    offset + per_page > count ? count : offset + per_page
  end

  def prev
    offset > 0 ? "true" : ""
  end

  def next
    offset + per_page < count ? "true" : ""
  end

  def items
    return [] if @nres.blank? or count <= 0
    (offset..(@nres.doc_num < offset + per_page ? @nres.doc_num - 1 : offset + per_page)).map do |i|
      doc = @nres.get_doc(i)
      { :title => doc.attr("@title"), :uri => doc.uri, :snippet => doc.snippet }
    end
  end

  private
  def node_url
    return @node_url if @node_url
    setting = FtsSetting.first
    @node_url = setting.node
    return @node_url
  end

  def get_node
    return @node if @node
    @node = Node.new
    @node.set_url(node_url)
    return @node
  end
end
