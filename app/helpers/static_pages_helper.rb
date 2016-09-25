module StaticPagesHelper

  # Returns section title based on provided title and role
  def section_title(title, role)
    if title.is_a? String
      return title
    else
      return title[role.to_sym]
    end
  end

  # Returns tag for disabled select box if empty
  # Options:
  #   k = bootstrap screen size [xs, sm, md, lg, xl]
  #   v = [visible, hidden]
  def html_attributes_for_application_select(record, options = {})
    attributes = {class: 'form-control', onchange: "this.form.submit()"}
    if record.job_applications.empty?
      attributes[:disabled] = ""
    end
    options.each do |k, v|
      attributes[:class] << " #{v}-#{k}"
    end
    return attributes
  end

  # Return correct heading for job panel based on section title
  def heading_info_for(title, record)
    case title
    when "Available Jobs"
      "#{number_to_currency(record.rate, unit: "£")}, #{record.location}"
    else "Awarded Jobs"
      # Return abbreviated month, day of month ex. Jan 17
      record.updated_at.strftime("%b %d")
    end
  end
end
