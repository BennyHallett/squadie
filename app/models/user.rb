class User < ActiveRecord::Base

  def self.find_or_create(auth_hash)
    do_find(auth_hash) || do_create(auth_hash)
  end

  private
  def self.do_find(auth_hash)
    User.find_by(oauth_provider: auth_hash[:provider], oauth_uid: auth_hash[:uid])
  end

  def self.do_create(auth_hash)
    a = auth_hash.slice(:provider, :uid, :name, :image)
    self.create(oauth_provider: a[:provider], oauth_uid: a[:uid], name: a[:name], avatar_url: a[:image])
  end

end
