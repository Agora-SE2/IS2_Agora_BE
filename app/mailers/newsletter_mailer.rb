class NewsletterMailer < ApplicationMailer
  default to: -> { User.pluck(:email) }
  default from: 'notificaciones@agora-se2.com'
  def newsletter_email
    mail(subject: 'Mira los ultimos 3 proyectos de ley en Ágora')
  end
end
