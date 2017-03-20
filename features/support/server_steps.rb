Given /^the textile Server is running$/ do
  root_dir = File.expand_path(expand_path("."))

  ENV['MM_SOURCE'] = '../../../source'
  ENV['MM_DATA_DIR'] = '../../../data'

  ENV['MM_ROOT'] = root_dir

  initialize_commands = @initialize_commands || []
  activation_commands = @activation_commands || []

  @server_inst = ::Middleman::Application.new do
    config[:watcher_disable] = true
    config[:show_exceptions] = false

    initialize_commands.each do |p|
      instance_exec(&p)
    end

    app.after_configuration_eval do
      activation_commands.each do |p|
        config_context.instance_exec(&p)
      end
    end
  end

  Capybara.app = ::Middleman::Rack.new(@server_inst).to_app
end

Given /^the textile Server is running at "([^\"]*)"$/ do |app_path|
  step %Q{a fixture app "#{app_path}"}
  step %Q{the textile Server is running}
end

