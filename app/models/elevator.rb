require 'twilio-ruby'
require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    # SLACK #
    after_update do
        elevator = self.status_changed?
        notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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', channel: "#elevator_operations", username: "calexis_slack_api"
        notifier.ping 'The Elevator = ' + self.model + ' w Serial Number = ' + self.serial_number + ' was : ' + self.status + ' and now : ' + self.status                                                                              
    end
    # /SLACK #
    
    # TWILIO # 
    after_update :send_sms

     def send_sms        
        
            if self.status == 'Inactive'
                account_sid = 'ACa60c0679e85c76d473a3e72d0638ed79'
                auth_token = '7d57e4b3a2dfb07e4debbcb0d12a6b03'
                @client = Twilio::REST::Client.new(account_sid, auth_token)
                puts @client
                from = '+19854018996',
                to = '+15148230596'
                message = @client.messages.create(
                    body: 'Elevator needs Attention!',
                    from: from,
                    to: to
                )
            end
    end
end

 # /TWILIO #



