require 'twilio-ruby'
require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    after_update do
        elevator = self.status_changed?
        notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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', channel: "#elevator_operations", username: "calexis_slack_api"
        notifier.ping 'The Elevator = ' + self.model + ' w Serial Number = ' + self.serial_number + ' was : ' + self.status + ' and now : ' + self.status                                                                              
    end
#     ignore_small_changes :before_update
## ::dirty
    
#     account_sid = ['ACa60c0679e85c76d473a3e72d0638ed79']
#     auth_token = ['7d57e4b3a2dfb07e4debbcb0d12a6b03']
#     @client = Twilio::REST::Client.new(account_sid, auth_token)
    
#     elevator = Elevator.first
#     elevator.update(status: "new status")
#     elevator.status_changed? #returns true if user address has changed
    
#     elevator.status_change #returns array [old, new val] or [nil] if no changes
    
#     def ignore_small_changes
#         unless status_change[0].nil?
#             old_status = status_change['Active'].status
#             new_status = status_change['Inactive'].status
    
#             self.status = status_change['Active']
#             if status_change['Inactive'] 
#                 message = @client.messages
#                 .create(
#                     body: 'Service is on Maintenance',
#                     from: '+19854018996',
#                     to: '+15148230596'
#                 )
#                 puts message.sid
#         end
#     end
    # private  
  
    # def send_slack_notifications
    #     # elevator = Elevator.find(1)
    #     elevator = self.status_changed?
    #     # elevator.status_was
    #     # elevator.status_change
    #     # model, serial_number, status)
    #     #Elevator.find()
    #     #Elevator.find()
    #     notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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', channel: "#elevator_operations", username: "calexis_slack_api"
        
    #     notifier.ping 'The Elevator = ' + self.model + ' w Serial Number = ' + self.serial_number + ' was : ' + self.status + ' and now : ' + self.status                                                                              
    # end     
    
end




