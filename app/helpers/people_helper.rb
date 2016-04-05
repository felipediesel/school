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
    button_options = {
      type: "button",
      id: 'dropdown-stateses',
      class: 'btn btn-secondary btn-sm dropdown-toggle',
      aria: { expanded: "false", haspopup: "true"},
      data: { toggle: "dropdown"}
    }
    content_tag :div, class: 'btn-group' do
      button_tag(t('text.filter'), button_options) +
      content_tag(:div, class: 'dropdown-menu', "aria-labelledby" => "dropdown-stateses") do
        Student::STATUSES.collect do |status|
          link_to Student.human_status(status, count: 2), polymorphic_url(controller_name, status: status), class: 'dropdown-item'
        end.join.html_safe
      end
    end
  end
end
