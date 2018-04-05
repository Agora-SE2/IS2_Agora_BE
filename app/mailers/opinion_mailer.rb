class OpinionMailer < ApplicationMailer
default from: 'notificaciones@agora-se2.com'
  def opinion_email(opinion)
    @opinion = opinion
    mail(to: "kaherreras@unal.edu.co", subject: 'Han opinado sobre un proyecto de ley')
  end
end
