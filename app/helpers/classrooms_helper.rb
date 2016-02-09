module ClassroomsHelper
  def day_of_week_options
    I18n.t('date.day_names').each_with_index
  end
end
