module Ceruversion
  APP_NAME = %x{basename `git rev-parse --show-toplevel`}.strip
  VERSION = `git rev-list master --count`.to_f / 100.to_f
end
