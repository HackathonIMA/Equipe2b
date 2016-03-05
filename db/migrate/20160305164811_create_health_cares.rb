class CreateHealthCares < ActiveRecord::Migration
  def change
    create_table :health_cares do |t|
      t.string :origin_id, index: true
      t.references :locale, index: true, foreign_key: true
      t.date :data_atendimento
      t.string :codigo_tipo_atendimento
      t.string :descricao_tipo_atendimento
      t.string :codigo_grupo_gtendimento_sus
      t.string :descricao_grupo_atendimento
      t.integer :ocupacao_profissional
      t.string :descricao_tipo_vinculo_sms
      t.string :codigo_procedimento_sus, index: true
      t.string :descricao_procedimento, index: true
      t.string :codigo_atividade_profissional_sus
      t.string :descricao_atividade_profissional
      t.string :sexo
      t.string :idade
      t.string :hora
      t.string :periodo
      t.string :data_nascimento
      t.integer :quantidade_realizada
      t.datetime :hora_atendimento
      t.datetime :hora_saida_local
      t.timestamps null: false
    end
  end
end
