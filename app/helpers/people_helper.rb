module PeopleHelper
  def person_blood_types_options
    %w(A B AB O).collect do |abo|
      %w(+ -).collect do |rh|
        "#{abo}#{rh}"
      end
    end.flatten
  end

  def person_status_options_for_select
    t('activerecord.attributes.person.statuses').collect do |key, value|
      [value, key]
    end
  end

  def person_status_label(person)
    label = { 'active' => 'success', 'suspended' => 'warning', 'inactive' => 'default' }[person.status]

    content_tag :span, person.human_status, class: "label label-#{label}"
  end
end
