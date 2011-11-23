Qrcode::Application.routes.draw do

    get "splash/splash"

    devise_for :users

    match "/menus/:id/edit_metric", :controller => 'menus', :action => 'edit_metric'
    match "/menus/:id/report", :controller => 'menus', :action => 'report'
    match "/menus/view/:id", :controller => 'splash', :action => 'show', :as => 'view_menu'
    resources :menus

    root :to => "splash#splash"
end
