set -e

if [ -z "$RAILS_MASTER_KEY" ]; then
  echo " Missing RAILS_MASTER_KEY"
  exit 1
fi

bundle exec rails db:migrate

bundle exec rails db:seed 

bundle exec puma -C config/puma.rb
