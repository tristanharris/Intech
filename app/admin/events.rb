ActiveAdmin.register Event do
  filter :series
  filter :title
  filter :time

  index do
    column :title
    column :time
    column :details
    column :open
    column :series
    default_actions
  end

end
