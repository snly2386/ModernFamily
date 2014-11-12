class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :number
      t.integer :season
      t.string :file

      t.timestamps
    end
  end
end
