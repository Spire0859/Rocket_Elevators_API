class Changingthedatatypeofleads < ActiveRecord::Migration[5.2]
  def up
    change_column :leads, :file, :blob
  end

  def def down 
    change_column :leads, :file, :blob
  end
end
