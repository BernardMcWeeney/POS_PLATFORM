class DeviseMailer < Devise::Mailer
    def confirmation_instructions(record, token, opts={})
        @first_name = record.first_name
        super
    end
end