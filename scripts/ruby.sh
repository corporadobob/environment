# Install Rbenv plugins
function  install_rbenv_plugins () {
  rbenv_plugins=~/.rbenv/plugins
  if [[ ! -d $rbenv_plugins ]]; then
    mkdir $rbenv_plugins
  fi

  git clone https://github.com/sstephenson/rbenv-default-gems.git $rbenv_plugins/rbenv-default-gems
  git clone https://github.com/rkh/rbenv-update.git $rbenv_plugins/rbenv-update
  git clone https://github.com/ianheggie/rbenv-binstubs.git $rbenv_plugins/rbenv-binstubs
}

function install_gems () {
  echo "Installing useful gems..."
  gem update --system

  # TODO use parse function instead of this super long hard-coded array
  declare -a gems=(rails mysql2 pg nokogiri pry pry-debugger pry-nav pry-rails pry-remote pray-stack_explorer rails-erd annotate better_errors binding_of_caller meta_request redis rspec rspec-rails ruby-graphviz sass sass-rails selenium-webdriver simplecov shoulda-matchers awesome_print pg pry rspec rspec-rails database_cleaner sinatra sinatra-contrib rainbow bourbon neat capybara capybara-webkit launchy mongo_mapper coveralls cucumber cucumber-rails dotenv dotenv-rails faker handlebars_assets guard guard-cucumber httparty guard-rails guard-rspec guard-livereload terminal-notifier-guard)

  for i in "${gems[@]}"
  do
    :
    echo "Installing $i gem..."
    # gem install $i
  done
}

install_rbenv_plugins

# Install Ruby version and set as global
echo "Installing Rubies..."
rbenv install $RUBY_DEFAULT

echo "Setting Ruby ${RUBY_DEFAULT} as the global version..."
rbenv global $RUBY_DEFAULT

# No longer bundle exec
gem regenerate_binstubs

install_gems

# Reload bash
source ~/.bash_profile
