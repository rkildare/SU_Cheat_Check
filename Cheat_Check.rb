require 'sketchup.rb'
require 'extensions.rb'

module Rkildare
  module CheatCheck
    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Cheat Check', 'Cheat_Check/main')
      ex.description = 'Checks groups and or components for equal geometry.'
      ex.version = '0.1'
      ex.creator = 'rkildare'
      Sketchup.register_extension(ex,true)
      file_loaded(__FILE__)
    end
  end
end