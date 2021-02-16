Rails.application.routes.draw do
  get 'points/create'
 get '/' => "posts#index"
 get "posts/search"=>"posts#search"
 get "posts/write" =>"posts#write"
 get "posts/write_form" => "posts#write_form"
 post "posts/create" =>"posts#create"
 get "posts/:id" =>"posts#show"
 get "posts/:id/edit" =>"posts#edit"
 post "posts/:id/update" =>"posts#update"
 delete "posts/:id" => "posts#destroy"
 get "posts/:id/destroycheck" =>"posts#destroycheck"


 get "users/login" =>"users#login_form"
 post "users/login" =>"users#login"
 post "users/create" =>"users#create"
 get "users/signup"=>"users#new"
 post "logout" =>"users#logout"
 get "users/:id" =>"users#show"
 get "users:/:id/likes" =>"users#likes"
 get "users/:id/garally" =>"users#garally"
 get "users/:id/concern" =>"users#concern"
 post "users/:id/update" =>"users#update"
 get "users/:id/edit" =>"users#edit"
 get "users/:id/mypage" =>"users#mypage"


 get "/battles/entry" => "battles#entry"
 get "/battles/edit" => "battles#edit"
 post "/battles/create" => "battles#create"
 get "/battles/choice" => "battles#choice"
 get "battles/index" => "battles#index"
 get "/battles/:id" => "battles#show"
 get "/battles/:id/choicecheck" => "battles#choicecheck"
 get "/battles/:id/p1body"=> "battles#p1body"
 get "/battles/:id/p2body" => "battles#p2body"


 post "/points/:id/create" => "points#create"


 post "comments/:post_id/create" => "comments#create"
end
