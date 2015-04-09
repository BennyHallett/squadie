Rails.application.config.middleware.use OmniAuth::Builder do
  Dotenv::Railtie.load

  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], {
    secure_image_url: true,
    image_size: 'mini'
  }
  provider :facebook, "FACEBOOK_KEY", "FACEBOOK_SECRET", {
  }
  provider :google_oauth2, "GOOGLE_KEY", "GOOGLE_SECRET", {
  }
end
