set -e

echo "Checking Rails master key..."
if [ -z "$RAILS_MASTER_KEY" ]; then
  echo " Missing RAILS_MASTER_KEY"
  exit 1
fi

echo "Running DB migrations..."
bundle exec rails db:migrate

echo "Starting Puma..."
bundle exec puma -C config/puma.rb
