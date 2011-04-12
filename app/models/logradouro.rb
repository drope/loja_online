class Logradouro < ActiveRecord::Base
  
  belongs_to :bairro
  
  def shipping_rates 
    
    case self.bairro.cidade.uf.sigla
      
    when "SP"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "RJ"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "MG"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "ES"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    
    when "PR"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "SC"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "RS"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    
    when "MT"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "MS"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "DF"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "GO"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    
    when "AL"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "BA"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "CE"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "MA"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "PR"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "PE"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "PI"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "RN"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "SE"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    
    when "AC"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "AP"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "AM"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "PA"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "RO"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "RR"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    when "TO"
      data = [
        { :type => "pac", :val => 11.50, :days => 6},
        { :type => "sedex", :val => 13.50, :days => 3}
      ]
    end
    return data
    
  end
  
end
