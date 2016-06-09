module BootstrapHelper
  def alert(key, body, options = {})
    key = key.to_sym
    options.reverse_merge! close: false
    translate = { alert: :danger, notice: :success }

    key = translate[key] if translate.keys.include? key

    body.prepend close_button if options[:close]

    content_tag :div, body, class: "alert alert-#{key}", role:"alert"
  end

  def modal_header(title_content = nil, options = {})
    title_content ||= title
    options.reverse_merge! close: true

    content_tag :div, class: 'modal-header' do
      html = []
      html << modal_close_button if options.delete(:close)
      html << content_tag(:h4, title_content, class: 'modal-title')

      safe_join html
    end
  end

  def modal_close_button
    close_button 'modal'
  end

  def close_button(dismiss = 'alert')
    button_tag type: 'button', class: 'close', 'data-dismiss' => dismiss, 'aria-label' => t('text.close') do
      content_tag :span, '&times;'.html_safe, 'aria-hidden' => "true"
    end
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
        capture &block if block_given?
      end
    end
  end
end
