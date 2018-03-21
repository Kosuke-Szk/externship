class ApplyMailer < ApplicationMailer
  default from: "from@example.com"

  def apply_email(user, apply)
    @user = user
    @apply = apply
    mail to: user.email, subject: '応募がきました'
  end
end
