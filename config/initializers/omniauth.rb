Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "API_KEY", "API_SECRET", {
  }
  provider :facebook, "FACEBOOK_KEY", "FACEBOOK_SECRET", {
  }
  provider :google_oauth2, "GOOGLE_KEY", "GOOGLE_SECRET", {
  }
end
