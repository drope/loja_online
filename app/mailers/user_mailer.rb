class UserMailer < ActionMailer::Base
  default :from => "loja@annak.com.br"
  
  def welcome(user)
      @user = user
      @url  = "http://loja.annak.com.br"
      mail(:to => user.email,
           :subject => "Bem vindo a loja online AnnaK")
    end
  
end
