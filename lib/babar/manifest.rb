module Babar
  class Manifest
    def initialize files
      @files = files
      @actions = []
      instance_eval File.read Babar.hookfile
    end

    def perform
      applicable.select { |a| a.auto? }.map &:perform
    end

    def notify
      return unless applicable.any?
      puts "\n\e[0;33mThis merge altered your environment!"

      taken, pending = applicable.partition &:auto?

      if taken.any?
        puts "\e[0;33mThe following actions were automatically taken:"
        taken.each &:notify
      end

      if pending.any?
        puts "\e[0;33mYou should probably:"
        pending.each &:notify
      end

      puts "\e[0m"
    end

    private # ----------

    def action opts
      target, action = opts.shift
      @actions << Action.new(target, action, opts)
    end

    def applicable
      @applicable ||= @actions.select { |a| @files.any? { |f| a.applies?(f) } }
    end
  end
end