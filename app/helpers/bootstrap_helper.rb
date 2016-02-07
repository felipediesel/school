module BootstrapHelper
  def alert(key, body)
    key = key.to_sym
    translate = { alert: :danger, notice: :success }

    key = translate[key] if translate.keys.include? key

    content_tag :div, body, class: "alert alert-#{key}", role:"alert"
  end
end