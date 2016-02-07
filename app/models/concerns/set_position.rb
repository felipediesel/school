module SetPosition
  extend ActiveSupport::Concern

  included do
    before_save :set_position
  end

  private

  def set_position
    if position.blank?
      max = self.class.maximum(:position)
      self.position = max.present? ? max.succ : 0
    end
  end
end
