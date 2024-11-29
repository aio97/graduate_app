class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(to: contact.email,
         bcc: ENV["TOMAIL"],
         subject: "お問い合わせを受け付けました")
  end
end
