WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  #:exe_path => '/usr/local/bin/wkhtmltopdf'
  :exe_path => '#{Rails.root}/bin/wkhtmltopdf'
}
