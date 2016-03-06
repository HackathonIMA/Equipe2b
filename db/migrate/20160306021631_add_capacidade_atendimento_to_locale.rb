class AddCapacidadeAtendimentoToLocale < ActiveRecord::Migration
  def change
    add_column :locales, :capacidade_atendimento, :integer
  end
end
