module DecimalFormatter
  extend ActiveSupport::Concern

  module DecimalFormatterParser
    def self.parse(value)
      (value.gsub(delimiter, '').gsub(separator, '.')).to_f
    end

    def self.format(value)
      ActionController::Base.helpers.number_with_precision value, precision: 2
    end

    def self.delimiter
      I18n.t :delimiter, scope: [ :number, :format ]
    end

    def self.separator
      I18n.t :separator, scope: [ :number, :format ]
    end
  end

  module ClassMethods
    def decimal_format(*columns)
      mattr_accessor :decimal_format_columns
      self.decimal_format_columns = columns

      build_decimal_format_columns
    end

    private

    def build_decimal_format_columns
      decimal_format_columns.each do |column_name|
        define_method :"#{column_name}_formatted" do
          DecimalFormatterParser.format send(column_name)
        end

        define_method :"#{column_name}_formatted=" do |value|
          self.send "#{column_name}=", DecimalFormatterParser.parse(value)
        end
      end
    end
  end
end
