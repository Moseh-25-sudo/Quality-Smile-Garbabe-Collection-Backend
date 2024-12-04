class EmailTemplateSerializer < ActiveModel::Serializer
  attributes :id, :customer_confirmation_code_header, 
  :customer_confirmation_code_body, :customer_confirmation_code_footer, 
  :service_provider_confirmation_code_header, :service_provider_confirmation_code_body,
   :service_provider_confirmation_code_footer,
    :user_invitation_header, :user_invitation_body, 
    :user_invitation_footer, :customer_otp_confirmation_header, 
    :customer_otp_confirmation_body, :customer_otp_confirmation_footer, 
    :service_provider_otp_confirmation_header, :service_provider_otp_confirmation_body, 
    :service_provider_otp_confirmation_footer, :admin_otp_confirmation_header,
     :admin_otp_confirmation_body, :admin_otp_confirmation_footer, 
     :store_manager_otp_confirmation_header, :store_manager_otp_confirmation_body,
      :store_manager_otp_confirmation_footer, :store_manager_number_header, 
      :store_manager_number_body, :store_manager_number_footer,
       :payment_reminder_header, :payment_reminder_body, :payment_reminder_footer,
       :password_reset_body, :password_reset_footer, :password_reset_header
end
