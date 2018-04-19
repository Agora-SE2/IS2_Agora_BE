class SaveOpinionMailer < ApplicationMailer
default from: 'notificaciones@agora-se2.com'
  def save_opinion_email(useremail)
    mail(to: useremail, subject: 'Se ha guardado tu opinión')
  end
end
