module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'devise/shared/error_messages', locals: { resource: object })
  end

  def login_logout
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, method: :delete
    else
      link_to 'Login', new_user_session_path
    end
  end

  def home_signup
    if user_signed_in?
      link_to current_user.name.upcase, root_path
    else
      link_to 'Sign Up', new_user_registration_path
    end
  end

  def message(type, color)
    "<div class='#{type} chip #{color} lighten-4'>#{type}</div>".html_safe if type.present?
  end
end
