namespace :db do
  task :count_words => :environment do
    User.all.each do |user|
      user.wordcount = user.kimura_entries.map(&:comment).compact.map{|c| c.chars.to_a.size}.inject(0){|r,v| r + v}
      user.save
    end
  end
end
