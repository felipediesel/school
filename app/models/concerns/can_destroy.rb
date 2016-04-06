module CanDestroy
  extend ActiveSupport::Concern

  included do
    before_destroy :check_if_can_be_destroyed

    cattr_accessor :can_destroy_associations
  end

  def can_destroy?
    self.can_destroy_associations ||= self.class.reflect_on_all_associations(:has_many).map(&:name)

    ! can_destroy_associations.map do |association|
      send(association).empty?
    end.include? false
  end

  private

    def check_if_can_be_destroyed
      throw(:abort) if !can_destroy?
    end

end
