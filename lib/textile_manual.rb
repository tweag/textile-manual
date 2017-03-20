require "middleman-core"

Middleman::Extensions.register :textile_manual do
  require "textile_manual/extension"
  TextileManual
end
