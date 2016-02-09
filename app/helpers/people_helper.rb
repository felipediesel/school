module PeopleHelper
  def blood_types_options
    %w(A B AB O).collect do |abo|
      %w(- +).collect do |rh|
        "#{abo}#{rh}"
      end
    end.flatten
  end
end
