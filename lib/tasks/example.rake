namespace :db do
  task :calculate_compare_field => :environment do
    KimuraEntry.all.each do |entry|
      entry.save
    end
  end
end
