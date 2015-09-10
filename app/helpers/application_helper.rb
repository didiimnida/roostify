module ApplicationHelper
  def nav_bar
    if current_user && user_signed_in?
      'layouts/logged_in_user'
    else
      'layouts/guest_user'
    end
  end
end
