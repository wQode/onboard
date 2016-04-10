module ApplicationHelper
  def login_nav
    links = ''
    if @current_user.try(:is_admin)
      links += "<li>" + link_to('User Administration', users_path) + "</li>"
    end

    if @current_user.present?
      links += "<li>"
        links += link_to('New note', new_document_path)
        links += link_to('Note Board', notes_path)
        links += "</li>"
    else
      links += "<li>#{ link_to('Sign up', new_user_path) }</<li>"
      # links += "<li>#{ link_to('Login', login_path) }</li>"
    end
  end

  def logout_nav
    links = ''

    if @current_user.present?
      links += "<li>"
        links += link_to('Logout ' + @current_user.username, login_path, :data => {:method => :delete, :confirm => 'Really logout?'})
        links += "<li>"
    end  
  end
end
