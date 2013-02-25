## Babar

Babar is a simple gem to help remember post-merge actions and manage git hooks
on a per-project basis. It alerts you to changes to specific files, and can 
automatically take actions when those files are changed.

By default, Babar will remind you to `rake db:migrate` and `bundle` whenever you
merge in changes to `db/schema.rb` or `Gemfile` respectively.

Just want a simple git hook? See [this gist](https://gist.github.com/jamesdabbs/5017797) 
for the genesis of this project.

### Usage

    gem install babar  # Or add to Gemfile and bundle
    babar install      # To configure your .git/hooks/

Once installed, you will be notified whenever you merge (or pull) in changes
to a watched file.

### Customizing

Babar looks for a Hookfile in your root directory. The default Hookfile is:

    action 'Gemfile'      => 'bundle',          :auto => false
    action 'db/schema.rb' => 'rake db:migrate', :auto => false

Adding `:auto => true` will cause an action to be automatically executed whenever
a matching file changes.

#### TODO

* Add generator to create default Hookfile in project