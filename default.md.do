redo-ifchange $2.lhs

pandoc -f markdown+lhs -t markdown < $2.lhs | \
  sed "s/^~~~~ {\..*/\`\`\`haskell/g" | \
  sed "s/^~~~~$/\`\`\`/g" > $3
