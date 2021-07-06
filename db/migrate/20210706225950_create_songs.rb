class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.integer :play_count


      ## file is auto-created via the following shell command:
        ## rails generate migration Create<TableName> <col_name>:<var_type> <col_name>:<var_type>
      ## file can be manually modified to add/drop columns
        ## i.e. TIMESTAMP columns!! (optional reserved keyword column names, see guide linked below):
          ## https://guides.rubyonrails.org/active_record_basics.html
      t.timestamps
    end
  end
end
