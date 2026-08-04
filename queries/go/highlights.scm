; extends

((comment) @comment.multiline
  (#lua-match? @comment.multiline "^/%*")
  (#set! priority 110))
