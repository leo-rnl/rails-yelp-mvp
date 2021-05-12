class ChangePhoneNumberType < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :phone_number, :text
  end
end
