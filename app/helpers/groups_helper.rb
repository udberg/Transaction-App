module GroupsHelper
  def group_icon(group)
    if group.icon.attached?
      image_tag group.icon, class: 'travel_item_icon'
    else
      image_tag 'travel_icon.jpg', class: 'travel_item_icon'
    end
  end

  def edit_group_link(group)
    return unless group.user_id == current_user.id

    link_to '<i class="small material-icons teal-text darken-4">mode_edit</i>'.html_safe, edit_group_path(group)
  end

  def delete_group_link(group)
    return unless group.user_id == current_user.id

    link_to '<i class="small material-icons deep-orange-text accent-3">delete</i>'.html_safe, group,
            method: :delete, data: { confirm: 'Are you sure?' }
  end

  def edit_travel_link(travel)
    return unless travel.user_id == current_user.id

    link_to '<i class="small material-icons teal-text darken-4">mode_edit</i>'.html_safe, edit_travel_path(travel)
  end

  def delete_travel_link(travel)
    return unless travel.user_id == current_user.id

    link_to '<i class="small material-icons deep-orange-text accent-3">delete</i>'.html_safe, travel,
            method: :delete, data: { confirm: 'Are you sure?' }
  end
end
