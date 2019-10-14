module ImagesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_images_path
    elsif action_name == 'edit'
      image_path
    end
  end
end