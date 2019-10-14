class ImageMailer < ApplicationMailer
  def send_when_post(image)
    @image = image
    mail to: @image.user.email,
    subject: '記事投稿の確認メール'
  end
end