# mimemagic/overlay.rb
#
# Compatibility shim for gems (e.g., carrierwave 2.2.0) that do:
#   require "mimemagic/overlay"
#
# In newer mimemagic versions (0.4+), MimeMagic is a class and the overlay file
# is gone. We simply provide minimal methods that older callers expect, without
# redefining the constant.

require "marcel"
require "pathname"

# If the mimemagic gem already defines MimeMagic (it will), don't redefine it.
# Just add missing class methods used by older integrations.
if defined?(MimeMagic)
  class << MimeMagic
    Result = Struct.new(:type) unless const_defined?(:Result)

    def by_magic(io)
      t = Marcel::MimeType.for(io)
      t ? Result.new(t) : nil
    rescue StandardError
      nil
    end

    def by_path(path)
      pathname = path.is_a?(Pathname) ? path : Pathname.new(path.to_s)
      t = Marcel::MimeType.for(pathname, name: File.basename(pathname.to_s))
      t ? Result.new(t) : nil
    rescue StandardError
      nil
    end
  end
else
  # Extremely defensive fallback (shouldn't happen if mimemagic gem is present)
  module MimeMagic
    Result = Struct.new(:type)

    def self.by_magic(io)
      t = Marcel::MimeType.for(io)
      t ? Result.new(t) : nil
    rescue StandardError
      nil
    end

    def self.by_path(path)
      pathname = path.is_a?(Pathname) ? path : Pathname.new(path.to_s)
      t = Marcel::MimeType.for(pathname, name: File.basename(pathname.to_s))
      t ? Result.new(t) : nil
    rescue StandardError
      nil
    end
  end
end