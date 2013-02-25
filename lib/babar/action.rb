module Babar
  class Action
    def initialize target, action, opts={}
      @target = Regexp.new target
      @action = action
      @auto   = opts[:auto]
    end

    def auto?
      @auto
    end

    def applies? file
      file =~ @target
    end

    def perform
      puts `#{@action}`
    end

    def notify
      puts "\e[0m* \e[1;33m#{@action}"
    end
  end
end