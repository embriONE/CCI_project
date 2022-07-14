module AccountsHelper
  def profile_picture account, width = 200
    # image_path = account.image.present? ? account.image.derivation_url(:thumbnail, 50, 50) : 'placeholder.webp'
    image_path = account.image.present? ? account.image.url : 'placeholder.webp'
    image_tag(image_path, width: width, class: 'img-circle')
  end

  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end
end
