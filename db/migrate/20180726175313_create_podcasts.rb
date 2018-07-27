class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|

      t.timestamps null: false
    end
  end
end
