#!/bin/sh

update_managed_region() {
  file="$1"
  comment="$2"

  content_file=$(mktemp)
  cat > "$content_file"

  start="$comment MANAGED BY wuguishifu/dotfiles START"
  end="$comment MANAGED BY wuguishifu/dotfiles END"

  tmp=$(mktemp)

  awk -v start="$start" \
    -v end="$end" \
    -v content_file="$content_file" '
  BEGIN {
    found = 0

    while ((getline line < content_file) > 0) {
      content[++n] = line
    }
    close(content_file)
  }

  $0 == start {
    print
    for (i = 1; i <= n; i++) {
      print content[i]
    }
    found = 1
    skip = 1
    next
  }

  $0 == end {
    skip = 0
    print
    next
  }

  !skip { print }

  END {
    if (!found) {
      print ""
      print start
      for (i = 1; i <= n; i++) {
        print content[i]
      }
      print end
    }
  }
  ' "$file" > "$tmp" &&
    mv "$tmp" "$file"

  rm -f "$content_file"
}
