require 'libvirt'

module Virtop
  VERSION = '0.1.0'
end

$:.unshift File.dirname(__FILE__)

Dir.glob($:.first + '/*/*.rb').sort.each do |file|
  require file
end
