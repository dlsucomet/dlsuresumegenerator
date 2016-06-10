from weasyprint import HTML, CSS
HTML(filename='blankresume.html').write_pdf('output.pdf',
  stylesheets=[CSS(filename='../../static/resumegenerator/css/blank-resume.css')])
