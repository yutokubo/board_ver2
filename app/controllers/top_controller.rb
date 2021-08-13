class TopController < ApplicationController
  skip_before_action :authenticate_user!, :only => "index", :raise => false
  def index
    @posts = Post.all.order(created_at: :desc).distinct #distinct:重複を排除(一意性の制約)
  end
end
