module PagesHelper
  
  def product_url(p)
    
    root_path + "produto/" + p.id.to_s + "/" + p.name
    
  end
  
  def variations_to_js(product)
    
    js = "  Variations: {\n"
    product.sizes.each do |size|
      js += "   '" + size.size + "': {"
      product.colors.each do |color|
        qtd = 0
        product.variations.each do |v|
          qtd = v.stock if (v.size_id == size.id && v.color_id == color.id)
        end
        js += "     '" +  color.id.to_s + "': " + qtd.to_s + ","
      end
      js = js[0,js.size-1]
      js += " },\n"
    end
    js = js[0,js.size-2]
    js += "\n }"

    
    
  end
  
end
