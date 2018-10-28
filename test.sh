
rails g model user name:string email:string password_digest:string
rails g controller users

rails g model post content:string user:references
rails g controller posts

rails g controller sessions

rails g model comment content:string post:references
rails g controller comments

#rails g model message content:text from:references to:references room_id:string
#rails g channel chat speak
#rails g job MessageBroadcast

rails g model user_follow
rails g controller user_follows

rails g model user_favorite
rails g controller user_favorites

#rails g model user_join
#rails g controller user_joins




