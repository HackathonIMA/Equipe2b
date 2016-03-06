namespace :dump_api do
 desc 'Load health cares'
 task health_care: :environment do

    options = {offset: 1, limit: 100 }

    while  API::HealthCare.extract(options)
      puts options
      options[:offset] = options[:offset] + 100
    end
  end

  task update_locale: :environment do
    CSV.foreach("#{Rails.root}/lib/tasks/files/locales.csv") do |row|
      id = row[0]
      lat = row[1].gsub(',','.').to_f
      lng = row[2].gsub(',','.').to_f
      puts "id: #{id}, lat: #{lat}, lng: #{lng}"
      Locale.update id, lat: lat, lng: lng
    end

    Locale.where('lat is not null').each do |locale|
      hist_count = locale.histories.count
      hist_sum = locale.histories.sum(:total)
      locale.update capacidade_atendimento: (hist_sum/hist_count)
    end
  end
end
