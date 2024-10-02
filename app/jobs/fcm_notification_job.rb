class FcmNotificationJob < ApplicationJob
  # include Sidekiq::Job
  queue_as :default
require 'fcm'
require 'rest-client'
require 'json'


  def perform(event_id, fcm_token)
    @calendar_event = CalendarEvent.find_by(id: event_id)
    scopes = ['https://www.googleapis.com/auth/firebase.messaging']
      
    # Load the credentials
    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('/home/malc0m0willa/Downloads/quality-smiles-firebase-adminsdk-w53uj-aba4a2b4a5.json'),
      scope: scopes
    )
    event_start_time = @calendar_event.start.in_time_zone
    current_time = Time.current.in_time_zone
    
    Rails.logger.info "#{event_start_time}, Current time: #{current_time}"
    
    if event_start_time < current_time
      Rails.logger.info "Event start time has already passed. Skipping notification."
    else
      Rails.logger.info "Event is in the future. Proceeding with notification."
    end
    
    # Fetch access token
    access_token = credentials.fetch_access_token!['access_token']
    
    calendar_settings = MyCalendarSetting.first
    in_minutes = calendar_settings.start_in_minutes
    in_hours = calendar_settings.start_in_hours


    body_message = []

if in_minutes.to_i > 0
  body_message << "The event is starting in #{in_minutes} minutes at 👉" + @calendar_event.start.strftime('%I:%M %p')
end

if in_hours.to_i > 0
  body_message << "The event is starting in #{in_hours} hours at 👉" + @calendar_event.start.strftime('%I:%M %p')
end
    # FcmNotificationJob.perform_now(@calendar_event.id, @fcm_token)
    

    # Define the request payload (sending to a specific device)
    payload = {
      message: {
        token: fcm_token, 
        notification: {
          title:  "Upcoming Event 👉" +  @calendar_event.title,
          body:  body_message, 
        
          
          image: 'https://quality-smiles-bucket.s3.eu-north-1.amazonaws.com/uploads/2024-08-16/image_9ee0c32b-9c8d-4782-bb6e-6d02e81b2512.png',

        },
        android: {
    notification: {
      sound: 'default'
    }
  },
        "webpush": {
       
    "fcm_options": {
      "link": "http://localhost:5173"
    }
  },
        data: {
          story_id: 'story_12345'
        }
      }
    }.to_json

    # Make the API request
    begin
      response = RestClient.post(
        "https://fcm.googleapis.com/v1/projects/quality-smiles/messages:send",
        payload,
        { Authorization: "Bearer #{access_token}", content_type: :json, accept: :json }
      )
      Rails.logger.info "response=>#{response.body}"
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error "FCM request failed: #{e.response}"
      # Log the error and handle as needed
    end
    
    

  

  end
end