namespace :dump_api do
 desc 'Load health cares'
 task health_care: :environment do

    options = {offset: 1, limit: 100 }

    while  API::HealthCare.extract(options)
      puts options
      options[:offset] = options[:offset] + 100
    end

 end
end
