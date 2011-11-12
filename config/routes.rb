Qrcode::Application.routes.draw do
    get "splash/splash"

    devise_for :users
    resources :menus
    resources :menu_items

    root :to => "splash#splash"

    get "pages/home"

    get "pages/adhoc"

    get "pages/report"
  
    get "pages/metric"
end
