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
end
