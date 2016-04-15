module OptionsHelper
  def option_label_for(name)
    t(name, scope: 'activerecord.attributes.option.available')
  end

  def navbar_background_options
    t(:navbar_background_options, scope: 'activerecord.attributes.option.available').collect do |key, value|
      [value, key]
    end
  end
end
