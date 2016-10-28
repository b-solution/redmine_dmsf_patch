module DmsfPatch
  module DmsfControllerPatch
    module InstanceMethods

      # Returns a link for adding a new subtask to the given issue
      def save_with_js
        respond_to do |format|
          format.html{
           save_without_js
          }
          format.js{
            @target_folder = DmsfFolder.visible.find(params[:target_folder_id]) unless params[:target_folder_id].blank?
            @folder = DmsfFolder.visible.find(params[:folder_id]) unless params[:folder_id].blank?
            @folder.dmsf_folder_id = @target_folder.id
            if @folder.save
              @json= {success: true}
            else
              @json= {success: false, error_msg: 'Cannot move the folder, Try it by editing the folder?'}
            end
          }
        end

      end
    end


    def self.included(receiver)
      receiver.send :include, InstanceMethods

      receiver.class_eval do
        unloadable
        alias_method_chain :save, :js
      end
    end
  end


end
