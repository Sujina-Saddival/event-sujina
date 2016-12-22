ActiveAdmin.register User, :as => "User" do


  filter :username
  filter :email
  filter :phone 

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :firstname
    column :lastname
    column :image
    column :phone
      actions
    end

    # controller do
    #   def approve
    #     user = User.find(params[:id])
    #     user.update(:approved => true)
    #     redirect_to admin_users_path, :notice => "User successfully approved."
    #   end
    # end

    # form do |f|
    #   f.inputs "User Details" do
    #     f.input :name
    #     f.input :email
    #     f.input :designation
    #     f.input :organization_value
    #     f.input :organization_name
    #     f.input :contact_number
    #     f.input :industry_domain
    #     f.input :state
    #     f.input :city
    #     f.input :created_at
    #   end
    #   f.actions
    # end
  end
