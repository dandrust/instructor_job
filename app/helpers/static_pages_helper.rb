module StaticPagesHelper

  def section_title(title, role)
    if title.is_a? String
      return title
    else
      return title[role.to_sym]
    end
  end

  def html_attributes_for_application_select(record)
    attributes = {class: 'form-control', onchange: "this.form.submit()"}
    if record.job_applications.empty?
      attributes[:disabled] = ""
    end
    return attributes
  end

end
