class AddIndexOnDataAtentimentoToHealthCare < ActiveRecord::Migration
  def change
    add_index :health_cares, :data_atendimento
  end
end
