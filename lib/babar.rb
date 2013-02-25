load 'tasks/babar.rake' if defined? Rake

require 'babar/action'
require 'babar/manifest'

module Babar
  def self.run
    manifest = Manifest.new changed
    manifest.perform
    manifest.notify
  end

  def self.changed offset=0
    commits = `git reflog -n #{offset + 2}`.lines.map { |l| l.split.first }
    changed = `git diff --name-only #{commits.first} #{commits.last}`.lines.map &:strip
  end

  def self.hookfile
    ['Hookfile', File.expand_path('../../Hookfile', __FILE__)].find do |path|
      File.exists? path
    end
  end
end