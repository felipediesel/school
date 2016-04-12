module PeopleHelper
  def person_blood_types_options
    %w(A B AB O).collect do |abo|
      %w(+ -).collect do |rh|
        "#{abo}#{rh}"
      end
    end.flatten
  end

  def person_status_options_for_select
    Person::STATUSES.collect do |status|
      [Person::human_status(status), status]
    end
  end

  def person_status_label(person)
    label = { 'active' => 'success', 'suspended' => 'warning', 'inactive' => 'default' }[person.status]

    content_tag :span, person.human_status, class: "label label-#{label}"
  end

  def person_filter_dropdown
    dropdown_menu t('text.filter') do
      Student::STATUSES.collect do |status|
        link_to Student.human_status(status, count: 2), polymorphic_url(controller_name, status: status), class: 'dropdown-item'
      end.join.html_safe
    end
  end
end
