class UserMailer < ActionMailer::Base
  default :from => "loja@annak.com.br"
  
  def welcome(user)
      @user = user
      @url  = "http://example.com/login"
      mail(:to => user.email,
           :subject => "Welcome to My Awesome Site")
    end
  
end
