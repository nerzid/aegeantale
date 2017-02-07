ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "twitterclone123@gmail.com",
    :password             => "eren1234",
    :authentication       => "plain",
    :enable_starttls_auto => true
}