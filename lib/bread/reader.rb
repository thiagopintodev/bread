module Bread
  class Reader

    def initialize(controller)
      @controller = controller
    end

    def read
      crumb_scope.read
    end

    private

    attr_reader :controller
    alias :c :controller

    def crumb_scope
      cs = Configuration::Scopes::Crumb.new(controller)
      cs.eval_multiple(crumb_blocks_for_current_action)
      cs
    end

    def crumb_blocks_for_current_action
      controller_scope = Bread.configuration.read_controller(c.controller_path)
      action_scope     = controller_scope.read_action(c.action_name)
      keys             = action_scope.keys
      Bread.configuration.crumbs_for_keys(keys)
    end

  end
end
