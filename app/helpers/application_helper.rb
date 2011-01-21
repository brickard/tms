module ApplicationHelper
  def selected_navigation_name(level=1)
    @selected_navigation_name ||= SimpleNavigation.active_item_container_for(level).items.select { |i| i.selected? }.first.name rescue nil
  end
  
  def yes_or_no(attribute)
    attribute ? 'Yes' : 'No'
  end

  def humanize_date(attribute)
    begin
      attribute = Date.parse(attribute) if attribute.kind_of?(String) 
      attribute = attribute.to_date if attribute.respond_to?(:to_date)
      attribute.to_s(:long) rescue ''
    rescue
      return ''
    end
  end

end
