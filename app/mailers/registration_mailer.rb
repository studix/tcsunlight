# encoding: utf-8
class RegistrationMailer < ActionMailer::Base
  default from: "clubmeisterschaften@tcsunlight.ch"

  def confirmation_email(registration)
    @registration = registration
    mail(:to => registration.Email, :subject => 'Anmeldungsbestätigung ' + registration.tournament.title)
  end
end
