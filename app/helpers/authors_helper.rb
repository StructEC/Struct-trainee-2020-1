module AuthorsHelper

  def format_name(name)
    names = name.split
    if names.length > 1
      "#{names.last}, #{names.first}"
    else
      names.first
    end
  end

end
