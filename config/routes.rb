Rails.application.routes.draw do
  devise_for :users
  root to: "inputs#index"
  
  # Routes for the Attempt resource:

  # CREATE
  post("/insert_attempt", { :controller => "attempts", :action => "create" })
          
  # READ
  get("/attempts", { :controller => "attempts", :action => "index" })
  
  get("/attempts/:path_id", { :controller => "attempts", :action => "show" })
  
  # UPDATE
  
  post("/modify_attempt/:path_id", { :controller => "attempts", :action => "update" })
  
  # DELETE
  get("/delete_attempt/:path_id", { :controller => "attempts", :action => "destroy" })

  #------------------------------

  # Routes for the Agent resource:

  # CREATE
  post("/insert_agent", { :controller => "agents", :action => "create" })
          
  # READ
  get("/agents", { :controller => "agents", :action => "index" })
  
  get("/agents/:path_id", { :controller => "agents", :action => "show" })
  
  # UPDATE
  
  post("/modify_agent/:path_id", { :controller => "agents", :action => "update" })
  
  # DELETE
  get("/delete_agent/:path_id", { :controller => "agents", :action => "destroy" })

  #------------------------------

  # Routes for the Input resource:

  # CREATE
  post("/insert_input", { :controller => "inputs", :action => "create" })
          
  # READ
  get("/inputs", { :controller => "inputs", :action => "index" })
  
  get("/inputs/:path_id", { :controller => "inputs", :action => "show" })
  
  # UPDATE
  
  post("/modify_input/:path_id", { :controller => "inputs", :action => "update" })
  
  # DELETE
  get("/delete_input/:path_id", { :controller => "inputs", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
