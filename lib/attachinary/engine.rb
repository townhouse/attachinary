require 'attachinary/view_helpers'
require 'attachinary/form_builder'

module Attachinary
  class Engine < ::Rails::Engine
    isolate_namespace Attachinary

    initializer "attachinary.include_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
        include ViewHelpers
      end
    end

    initializer "attachinary.include_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
        ActionView::Helpers::FormBuilder.send(:include, Attachinary::FormBuilder)
      end
    end

    initializer "attachinary.enable_simple_form" do |app|
      require "attachinary/simple_form" if defined?(::SimpleForm::Inputs::Base)
    end
    
    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

  end
end
