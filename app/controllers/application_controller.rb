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
end
