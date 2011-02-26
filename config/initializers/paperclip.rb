Paperclip.interpolates :imageable_type do |attachment, style|
  attachment.instance.imageable_type
end

Paperclip.interpolates :imageable_id do |attachment, style|
  attachment.instance.imageable_id
end