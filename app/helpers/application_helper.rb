module ApplicationHelper
  def edit_and_destroy_buttons(item)
    return if current_user.nil?

    edit = link_to('Edit', url_for([:edit, item]), class: "btn btn-primary")
    if current_user.admin
      del = link_to('Destroy', item, method: :delete,
                                     form: { data: { turbo_confirm: "Are you sure ?" } },
                                     class: "btn btn-danger")
      raw("#{edit} #{del}")
    else
      raw("#{edit}")
    end
  end

  def round(number)
    number_with_precision(number, precision: 1)
  end

  def change_account_status(id)
    return unless current_user.admin

    change_status = link_to('Change account status', toggle_account_status_user_path(id),
                            data: { turbo_method: "post" }, class: "btn btn-danger")
    raw("#{change_status}")
  end
end
