Qrcode::Application.routes.draw do

    get "splash/splash"

    devise_for :users

    match "/menus/:id/edit_metric", :controller => 'menus', :action => 'edit_metric'
    match "/menus/:id/report", :controller => 'menus', :action => 'report'
    resources :menus

    root :to => "splash#splash"
end
