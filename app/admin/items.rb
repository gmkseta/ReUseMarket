ActiveAdmin.register Item do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    column :id
    column "미리 보기" do |i|
      img src:i.item_images[0].url(:thumb)
    end
    column :name
    column :user
    column :category
    column :price
    column :status
    column :created_at
    actions
  end

  form do |f|
    fieldset class:"inputs" do
      ol do
        f.input :name
        f.input :category
        f.input :user
        f.input :price
        f.input :status

      end
    end
    f.actions
  end

end
