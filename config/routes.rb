DatafestPerfilDiputado::Application.routes.draw do

  root :to => 'home#index'

  #temporal
  match ':controller(/:action(/:id))(.:format)'
end
