rails g controller rooms show
rails g model message content:text user:references
rails db:migrate

rails g channel room speak
rails g job MessageBroadcast
