module ApplicationHelper
  def selected_navigation_name(level=1)
    @selected_navigation_name ||= SimpleNavigation.active_item_container_for(level).items.select { |i| i.selected? }.first.name rescue nil
  end
end
