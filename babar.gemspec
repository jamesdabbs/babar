Gem::Specification.new do |spec|
  spec.name          = 'babar'
  spec.version       = '0.0.1'
  spec.date          = '2013-02-25'
  spec.description   = 'Project-oriented management of git merge hooks'
  spec.summary       = spec.description
  spec.authors       = ['James Dabbs']
  spec.email         = 'jdabbs@emcien.com'
  spec.files         = %w(babar.gemspec Hookfile)
  spec.files        += Dir.glob('*.md') + Dir.glob('lib/**/*.rb') + Dir.glob('bin/*')
  spec.bindir        = 'bin'
  spec.executables   = 'babar'
  spec.require_paths = ['lib']

  spec.add_dependency 'rake'

  spec.post_install_message = "\e[33mPlease run `babar install` to set up git hooks\e[0m"
end