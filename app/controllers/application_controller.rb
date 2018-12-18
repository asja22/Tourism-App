class ApplicationController < ActionController::Base
 
  private
   # Overwriting the sign_out redirect path method
   def after_sign_out_path_for(resource_or_scope)
     if resource_or_scope == :admin
       admin_home_path
     elsif resource_or_scope == :agent
       agent_home_path
     else
       root_path
     end
   end
   
   def after_sign_in_path_for(resource)
     if current_admin
       admin_home_path
     elsif current_agent
       agent_home_path
     else current_user
       root_path
     end
   end
end
