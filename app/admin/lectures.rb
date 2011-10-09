ActiveAdmin.register Lecture do
  filter :event
  filter :title
  filter :time

  index do
    column :title
    column :time
    column :details
    column :max_seats
    column :open
    column :event
    default_actions
  end

end
