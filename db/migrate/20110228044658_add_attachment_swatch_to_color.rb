class AddAttachmentSwatchToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :swatch_file_name, :string
    add_column :colors, :swatch_content_type, :string
    add_column :colors, :swatch_file_size, :integer
    add_column :colors, :swatch_updated_at, :datetime
  end

  def self.down
    remove_column :colors, :swatch_file_name
    remove_column :colors, :swatch_content_type
    remove_column :colors, :swatch_file_size
    remove_column :colors, :swatch_updated_at
  end
end
