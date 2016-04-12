module BootstrapHelper
  def alert(key, body, options = {})
    key = key.to_sym
    options.reverse_merge! close: false
    translate = { alert: :danger, notice: :success }

    key = translate[key] if translate.keys.include? key

    body.prepend close_button if options[:close]

    content_tag :div, body, class: "alert alert-#{key}", role:"alert"
  end

  def close_button
    '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'.html_safe
  end

  def dropdown_menu(text, &block)
    button_options = {
      type: "button",
      class: 'btn btn-secondary btn-sm dropdown-toggle',
      aria: { expanded: "false", haspopup: "true"},
      data: { toggle: "dropdown"}
    }
    content_tag :div, class: 'btn-group' do
      button_tag(text, button_options) +
      content_tag(:div, class: 'dropdown-menu') do
        capture &block
      end
    end
  end
end
