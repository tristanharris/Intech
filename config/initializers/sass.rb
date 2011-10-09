Sass::Plugin.options.merge!(
  :template_location => "./app/stylesheets",
  :css_location => './tmp/stylesheets'
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/stylesheets'],
    :root => "#{Rails.root}/tmp")

  template_paths = [
    "#{Gem.loaded_specs['activeadmin'].full_gem_path}/app/assets/stylesheets", # Rails 3.1.x (asset pipeline)
    "#{Gem.loaded_specs['activeadmin'].full_gem_path}/lib/active_admin/sass" # Rails 3.0.x
  ]

  old_compile_path = "#{Rails.root}/public/stylesheets"
  new_compile_path = "#{Rails.root}/tmp/stylesheets"

  template_paths.each do |template_path|
    Sass::Plugin::remove_template_location( template_path, old_compile_path )
    Sass::Plugin::add_template_location( template_path, new_compile_path )
  end

