module Rkildare    
  module CheatCheck
    

    def self.main
      model = Sketchup.active_model
      ss = model.selection
      if ss.length() != 2
        UI.messagebox("Please only select two items.")
      elsif ss[0].is_a?(Sketchup::Group) or ss[0].is_a?(Sketchup::ComponentInstance)
        if ss[1].is_a?(Sketchup::Group) or ss[1].is_a?(Sketchup::ComponentInstance)
          if ss[0].equals?(ss[1])
            UI.messagebox("They are the same")
          else
            UI.messagebox("They are not the same")
          end
        else
          UI.messagebox("Please select groups and/or components.") 
        end
      else
        UI.messagebox("Please select groups and/or components.")
      end
    end
    
    #UI below
    if not file_loaded?("Cheat_Check.rb")
      toolbar = UI::Toolbar.new "Ind_Xray"
      cmd = UI::Command.new("Cheat Checker"){self.main}
      cmd.small_icon = 'icon.png'
      cmd.large_icon = 'icon.png'
      cmd.tooltip = "Cheat Checker"
      cmd.status_bar_text = "Checks groups and or components for equal geometry."
      cmd.menu_text = "Cheat Checker"
      cmd.set_validation_proc{
        if Sketchup.active_model.selection.length() != 2
          MF_GRAYED | MF_DISABLED
        else
          MF_ENABLED
        end
      }
      toolbar = toolbar.add_item(cmd)
      toolbar.show()
    end
  end
end