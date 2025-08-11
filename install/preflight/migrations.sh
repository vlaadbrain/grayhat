#!/bin/bash

grayhat_migrations_state_path=~/.local/state/grayhat/migrations
mkdir -p $grayhat_migrations_state_path

for file in ~/.local/share/grayhat/migrations/*.sh; do
  touch "$grayhat_migrations_state_path/$(basename "$file")"
done
