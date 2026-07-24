ActiveAdmin.register Item do
  config.filters = false

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :franchise, :price, :stock, :avatar
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :franchise, :price, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :franchise
    column :avatar do |item|
     image_tag url_for(item.avatar), size: "50x50" if item.avatar.attached?
   end
    column :price
    column :stock
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :franchise
      f.input :price
      f.input :stock
      f.input :avatar, as: :file

      if f.object.avatar.attached?
        f.input :avatar,
                as: :file,
                hint: image_tag(url_for(f.object.avatar), width: 150)
      end
    end

    f.actions
  end



end
