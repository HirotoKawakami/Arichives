class LikesController < ApplicationController
  after_action :create_notification, only: [:create]
  after_action :destroy_notification, only: [:destroy]
  def create
    @article = Article.find_by(id: params[:article_id])
    if @article.likes.create(guest_id: @guest.id)
      respond_to do |format|
        format.html { redirect_to request.referrer || @article }
        format.js
      end
    end
  end

  def destroy
    @article = Article.find_by(id: params[:article_id])
    if @article.likes.find_by(guest_id: @guest.id).destroy
      respond_to do |format|
        format.html { redirect_to request.referrer || @article }
        format.js
      end
    else
      redirect_to @article
    end
  end

  private

    def create_notification
     @notification = Notification.create(user_id: @article.user.id,
                          notified_by_id: @guest.id,
                          article_id: @article.id,
                          notified_type: "いいね！")
    end

    def destroy_notification
      @notification = @article.notifications.find_by(notified_by_id: @guest.id)
      @notification.destroy
    end
  

end
