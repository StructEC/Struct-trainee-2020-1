module AuthorsHelper

  def format_name(name)
    names = name.split
    if names.length > 1
      "#{names.last}, #{names.first}"
    else
      names.first
    end
  end

  def check_cookie
    if cookies.encrypted[:test].nil?
      flash[:notice] = "Você não pode cadastrar novo autor"
      redirect_to root_path
    end
  end

end
