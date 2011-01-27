namespace :db do
  task :assign_entries => :environment do
    count = KimuraEntry.count
    each_gets = count / User.count
    pbar = ProgressBar.new("Assigning entries", 30 * 50 * User.count)
    cur = 1
    User.all.each do |user|
      (cur..(cur + (30 * 50))).each do |entry_id|
        user.kimura_entries << KimuraEntry.find(entry_id)
        pbar.inc
      end
      user.save 
      cur += (30 * 50)
    end
    pbar.finish
  end
end
