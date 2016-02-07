module ApplicationHelper
  def nav_item(body, url, options = {})
    content_tag :li, class: 'nav-item' do
      link_to body, url, class: "nav-link #{ 'active' if current_page? url }"
    end
  end

  def week_day(number)
    Date::DAYNAMES[number]
  end
end
