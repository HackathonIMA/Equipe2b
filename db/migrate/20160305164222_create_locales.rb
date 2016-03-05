class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :distrito_vinculo
      t.string :local_atendimento
      t.string :distrito_atendimento
      t.float :lat
      t.float :lng
      t.timestamps null: false
    end
  end
end
