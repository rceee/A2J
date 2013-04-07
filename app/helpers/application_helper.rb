module ApplicationHelper

  def items_as_json(items)
    items.collect do |item|
      {
        :name => item.name,
        :album => album.name,
        :salesrank => item.salesrank,
        :release => item.release
      }
    end.to_json
  end
end
