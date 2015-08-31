OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_AUTH_CLIENT_ID'], ENV['FB_AUTH_CLIENT_SECRET'], scope: 'email, user_about_me, publish_actions, user_birthday, user_hometown, user_friends, read_custom_friendlists, publish_actions'
end


# current_user.facebook.get_object("me?fields=picture")
# @friends = current_user.facebook.get_connections("me", "friends?fields=id,name,picture.type(small)")

# name_of_friend = current_user.facebook.get_connections("me", "friends")[0]["name"]
