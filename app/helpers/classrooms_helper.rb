module ClassroomsHelper
  def week_day_options
    I18n.t('date.day_names').each_with_index
  end
end
