module TimeFormatter
  extend ActiveSupport::Concern

  module ClassMethods
    def time_format(*columns)
      mattr_accessor :time_format_columns
      self.time_format_columns = columns

      build_time_format_columns
    end

    private

    def build_time_format_columns
      time_format_columns.each do |column_name|
        define_method :"#{column_name}_formatted" do
          column = send(column_name).to_f.abs
          seconds = BigDecimal(column.to_s, 2).frac # frac does not work with float, only BigDecimal
          "#{column.floor}:#{(seconds * 60).to_i.to_s.rjust(2, '0')}"
        end

        define_method :"#{column_name}_formatted=" do |value|
          value = value.delete(" ")
          value = "0h#{value}" if value.include? "m" and ! value.include? "h"
          value = value.gsub('h', ':').delete "m"

          hours, minutes = value.split(':')
          self.send("#{column_name}=", hours.to_f + (minutes.to_f / 60))
        end
      end
    end
  end
end
