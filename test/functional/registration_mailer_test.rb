# encoding: utf-8
require 'test_helper'

class RegistrationMailerTest < ActionMailer::TestCase
  def test_confirmation_email
    registration = registrations(:john_single_draw)
 
    # Send the email, then test that it got queued
    email = RegistrationMailer.confirmation_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal [registration.email], email.to
    assert_equal "Bestätigung Anmeldung Clubmeisterschaften 2013", email.subject
    assert_match(/<h1>Hallo #{registration.Vorname}<\/h1>/, email.encoded)
  end
end
