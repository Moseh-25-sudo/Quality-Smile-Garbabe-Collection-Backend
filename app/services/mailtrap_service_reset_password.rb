# app/services/mailtrap_service.rb
require "mailtrap"

class MailtrapServiceResetPassword
  def initialize(api_key)
    @client = Mailtrap::Client.new(api_key: api_key,   api_host: "send.api.mailtrap.io",
    )
  end

  def send_template_email(to:, template_uuid:, template_variables:, from: { email: "mailtrap@aitechsent.net",
   name: "Aitechs" })
    mail = Mailtrap::Mail::FromTemplate.new(
      from: from,
      to: [ { email: to } ],
      template_uuid: template_uuid,
      template_variables: template_variables
      
    )

    response = @client.send(mail)
    puts response
  end
end
