module ApplicationHelper
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}')" )
  end
  
  def currency(val)
    
    formatted_val = number_to_currency(val, {
      :unit => 'R$ ', 
      :separator => ',', 
      :delimiter => ' ', 
      :precision => 2
    })
    
  end
  
  def singular_plural(count, singular, plural )
    
    return plural if (count > 1) 
    return singular
    
  end
  
end
