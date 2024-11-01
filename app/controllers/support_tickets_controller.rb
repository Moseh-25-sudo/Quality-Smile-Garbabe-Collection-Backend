class SupportTicketsController < ApplicationController
  before_action :set_support_ticket, only: %i[ show edit update destroy ]
  before_action :update_last_activity


  load_and_authorize_resource




  def update_last_activity
    if current_user.instance_of?(Admin)
      current_user.update_column(:last_activity_active, Time.now.strftime('%Y-%m-%d %I:%M:%S %p'))
    end
    
  end


  # GET /support_tickets or /support_tickets.json
  def index
    @support_tickets = SupportTicket.all
    render json: @support_tickets
  end

  
    
  


def get_specific_ticket
  customer_code = Customer.find_by(customer_code: params[:my_customer_code])
end



  # POST /support_tickets or /support_tickets.json
  def create
    @support_ticket = SupportTicket.new(support_ticket_params)
    customer_name = @support_ticket.customer
    customer_by_name = Customer.find_by(name: customer_name)
    customer_email = customer_by_name.email
    customers_code = customer_by_name.customer_code


# Rails.logger.info "support ticket info#{customer_email}"
      if @support_ticket.save
        @prefix_and_digits = PrefixAndDigitsForTicketNumber.first
        if  @prefix_and_digits.present?
          found_prefix = @prefix_and_digits.prefix
          found_digits = @prefix_and_digits.minimum_digits.to_i
        else
          Rails.logger.error "prefix and digit not found"
          render json: { error: "prefix and digit not found
           for the account" }, status: :unprocessable_entity
        return
        end 


 
 
auto_generated_number = @support_ticket.ticket_number =
 "#{found_prefix}#{@support_ticket.sequence_number.to_s.rjust(found_digits, '0')}" if
found_digits && found_prefix 
@support_ticket.update(ticket_number: auto_generated_number,
 date_of_creation: Time.now.strftime('%Y-%m-%d %I:%M:%S %p'))
ticket_created_at = @support_ticket.date_of_creation.strftime('%Y-%m-%d %I:%M:%S %p')

 CustomerTicketMailer.customer_ticket_mailer(@support_ticket.ticket_number,
 ticket_created_at,customer_email, @support_ticket.issue_description, @support_ticket.status,
 @support_ticket.priority, customers_code).deliver_now

#  customer_ticket_mailer( ticket_number, ticket_created_at, 
#  customer_email, issue_description, ticket_status, ticket_priority)

        render  json: @support_ticket, status: :created
      else
         render json: @support_ticket.errors, status: :unprocessable_entity 
      end
    
  end

  def update
      if @support_ticket.update(support_ticket_params)
        @support_ticket.update(date_closed: Time.now.strftime('%Y-%m-%d %I:%M:%S %p'))
         render json: @support_ticket, status: :ok
      else
         render json: @support_ticket.errors, status: :unprocessable_entity 
      end
    
  end

  # DELETE /support_tickets/1 or /support_tickets/1.json
  def destroy
    @support_ticket.destroy!

     head :no_content 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_ticket
      @support_ticket = SupportTicket.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_ticket_params
      params.require(:support_ticket).permit(:issue_description, :status, :priority, :agent, :ticket_number,
       :customer, :name, :email, :phone_number, :date_created, :ticket_category, :date_of_creation, :date_closed,
        :agent_review, :agent_response)
    end
end




# Ticket Number: Test_Ticket_number
# Date Created: Test_Created_at
# Issue Summary: Test_Issue_summary
# Priority Level: Test_Priority_level







# Our support team is currently reviewing your request and will contact you as soon as possible with an update.

# In the meantime, you can track the progress of your ticket by logging into your account at [Support Portal URL].We will keep you informed via email of any updates or changes to your ticket status.

# If you have any further questions or additional information to provide, please feel free to contact us

# Thank you for your patience!
