module ApplicationHelper
  def az_connect
    Amazon::Ecs.options = {
       :associate_tag => ENV["ASSOCIATE_TAG"],
       :AWS_access_key_id => ENV["KEY_ID"],
       :AWS_secret_key => ENV["SECRET_KEY"]
     }
  end
end
