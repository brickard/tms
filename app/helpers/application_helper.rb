module ApplicationHelper
  def selected_navigation_name(level=1)
    @selected_navigation_name ||= SimpleNavigation.active_item_container_for(level).items.select { |i| i.selected? }.first.name rescue nil
  end
  
  def yes_or_no(attribute)
    attribute ? 'Yes' : 'No'
  end

  def humanize_date(attribute)
    attribute = Date.parse(attribute) if attribute.kind_of?(String)
    attribute.to_s(:long) rescue ''
  end

end
