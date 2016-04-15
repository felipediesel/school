class OptionsController < ApplicationController
  def index
    @options = Option.as_hash
  end

  def update
    @options = options_params
    Option.transaction do
      begin
        @options.each do |name, value|
          if ! Option.set(name, value)
            raise ActiveRecord::Rollback
          end
        end
        redirect_to options_url, notice: t('.notice')
      rescue
        flash.alert = t('.alert')
        render 'index'
      end
    end
  end

  private

    def options_params
      params.require(:options).permit(Option::AVAILABLE)
    end
end
