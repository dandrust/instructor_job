module StaticPagesHelper

  def section_title(title, role)
    if title.is_a? String
      return title
    else
      return title[role.to_sym]
    end
  end

end
