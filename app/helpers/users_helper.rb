module UsersHelper
  def profile_avatar
    if current_user.profile_pic.attached?
      image_tag current_user.profile_pic, class: 'circle responsive-img profile_img'
    else
      image_tag 'blank_profile.png', class: 'circle responsive-img profile_img'
    end
  end
end
