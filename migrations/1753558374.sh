echo "Update Walker config to include = as the leader key for the calculator"
if ! grep -q 'prefix = "="' ~/.config/walker/config.toml; then
  grayhat-refresh-walker
fi
