class CreateViewHealthCareHistory < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE MATERIALIZED VIEW vw_health_care_histories AS
      select count(*) as total,
             locale_id,
             extract( YEAR from date_trunc( 'year', data_atendimento ) ) as year ,
             extract( MONTH from  date_trunc( 'month', data_atendimento ) ) as month

        FROM health_cares
      group by locale_id, date_trunc( 'year', data_atendimento ) , date_trunc( 'month', data_atendimento )
      order by year, month
    SQL
  end

  def down
    execute <<-SQL
     DROP MATERIALIZED VIEW  IF EXISTS  vw_health_care_histories
    SQL
  end
end
