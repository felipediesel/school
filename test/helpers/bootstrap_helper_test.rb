require 'test_helper'

class BootstrapHelperTest < ActionView::TestCase
  TEMPLATE = {
    alert: %(<div class="alert alert-info" role="alert">Content</div>),
    translated_alert: %(<div class="alert alert-danger" role="alert">Content</div>),
    close_button: %(<button name="button" type="button" class="close" data-dismiss="alert" aria-label="Fechar"><span aria-hidden="true">×</span></button>),
    modal_close_button: %(<button name="button" type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">×</span></button>),
    dropdown_menu_empty: %(<div class="btn-group"><button name="button" type="button" class="btn btn-secondary btn-sm dropdown-toggle" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown">Text</button><div class="dropdown-menu"></div></div>),
    dropdown_menu: %(<div class="btn-group"><button name="button" type="button" class="btn btn-secondary btn-sm dropdown-toggle" aria-expanded="false" aria-haspopup="true" data-toggle="dropdown">Text</button><div class="dropdown-menu"><a href="#" class="dropdown-item">Item 1</a><a href="#" class="dropdown-item">Item 2</a></div></div>)
  }
  TEMPLATE[:modal_header] = %(<div class="modal-header"><h5 class="modal-title">Title</h5>#{TEMPLATE[:modal_close_button]}</div>)

  test "should return the alert" do
    actual = alert(:info, 'Content')
    expected = TEMPLATE[:alert]
    assert_dom_equal expected, actual
  end

  test "should return the alert translating rails default to bootstrap " do
    actual = alert(:alert, 'Content')
    expected = TEMPLATE[:translated_alert]
    assert_dom_equal expected, actual
  end

  test "should return the close button" do
    actual = close_button
    expected = TEMPLATE[:close_button]
    assert_dom_equal expected, actual
  end

  test "should return the close button for modal" do
    actual = modal_close_button
    expected = TEMPLATE[:modal_close_button]
    assert_dom_equal expected, actual
  end

  test "should return the modal header " do
    actual = modal_header 'Title'
    expected = TEMPLATE[:modal_header]
    assert_dom_equal expected, actual
  end

  test "should return the dropdown empty" do
    actual = dropdown_menu('Text')
    expected = TEMPLATE[:dropdown_menu_empty]
    assert_dom_equal expected, actual
  end

  test "should return the dropdown with links" do
    actual = dropdown_menu('Text') do
      link_to('Item 1', '#', class: 'dropdown-item') +
      link_to('Item 2', '#', class: 'dropdown-item')
    end
    expected = TEMPLATE[:dropdown_menu]
    assert_dom_equal expected, actual
  end
end
