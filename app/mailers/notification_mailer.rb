class NotificationMailer < ApplicationMailer
  
  default from: 'notificaciones@agora-se2.com'
  def notification_email(law_project)
    @law_project = law_project
    mail(to: "kaherreras@unal.edu.co", subject: 'Se ha registrado un nuevo proyecto de Ley')
  end
end
