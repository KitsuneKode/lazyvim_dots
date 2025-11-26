#!/usr/bin/env zsh

# 1) Re-import latest from tmux if needed
if [[ -n "$TMUX" ]]; then
  eval "$(tmux show-environment -s KITTY_LISTEN_ON)"
  eval "$(tmux show-environment -s KITTY_WINDOW_ID)"
fi

# 2) Only do padding logic if we now have a valid Kitty socket
if [[ -n "$KITTY_LISTEN_ON" ]]; then
  sock_path="${KITTY_LISTEN_ON#unix:}"
  sock_basename="$(basename "$sock_path")"
  count_file="/tmp/kitty_padding_count_${sock_basename}"
  lock_file="${count_file}.lock"

  kitty_reachable() {
    [[ -S "$sock_path" ]] && kitty @ --to "$KITTY_LISTEN_ON" ls >/dev/null 2>&1
  }

  increase_padding() {
    exec 9>"$lock_file"
    flock 9
    local count=0
    [[ -f "$count_file" ]] && read -r count <"$count_file"
    if ((count == 0)) && kitty_reachable; then
      kitty @ --to "$KITTY_LISTEN_ON" set-spacing padding=0
      kitty @ --to "$KITTY_LISTEN_ON" set-font-size 13
      kitty @ --to "$KITTY_LISTEN_ON" set-background-opacity 0.65
    fi
    ((count++))
    echo "$count" >"$count_file"
    flock -u 9
  }

  decrease_padding() {
    exec 9>"$lock_file"
    flock 9
    local count=1
    [[ -f "$count_file" ]] && read -r count <"$count_file"
    ((count--))
    echo "$count" >"$count_file"
    if ((count == 0)) && kitty_reachable; then
      kitty @ --to "$KITTY_LISTEN_ON" set-spacing padding=default
      kitty @ --to "$KITTY_LISTEN_ON" set-font-size 12
      kitty @ --to "$KITTY_LISTEN_ON" set-background-opacity 0.75
      echo -ne '\e[5 q'
    fi
    flock -u 9
  }

  if kitty_reachable; then
    increase_padding
    trap 'decrease_padding' EXIT
  fi
fi

# 3) Launch Neovim (no exec!)
nvim "$@"
