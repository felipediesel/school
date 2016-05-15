require 'pdfkit'

PDFKit.configure do |config|
  config.default_options = {
    page_size: 'A4',
    margin_top: '1cm',
    margin_right: '1cm',
    margin_bottom: '1cm',
    margin_left: '1cm',
    encoding: "UTF-8"
  }
end
