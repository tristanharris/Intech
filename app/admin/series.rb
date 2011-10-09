ActiveAdmin.register Series do
  menu :priority => 1
  filter :title

  index do
    column :title
    column :details
    column :active
    default_actions
  end

end
