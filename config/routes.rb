Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "application", :action => "home" })
  get("/forex", { :controller => "forex", :action => "symbols" })
  get("/forex/:original_currency/", { :controller => "forex", :action => "exchange" })
  get("/forex/:original_currency/:new_currency", { :controller => "forex", :action => "conversion"})
end
