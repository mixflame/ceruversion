module Ceruversion
  VERSION = "v#{(`git rev-list master --count`.to_f) / 100.to_f}"
end
