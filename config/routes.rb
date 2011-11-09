Qrcode::Application.routes.draw do
    get "splash/splash"

    devise_for :users

    root :to => "splash#splash"

    get "pages/home"

    get "pages/adhoc"
end
