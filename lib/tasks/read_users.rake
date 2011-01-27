namespace :db do
  task :load_users => :environment do
    users = open(File.join(Rails.root, "db", "users")).read
    mail_and_password = users.split("\n").map{|user| [user.split[2],user.split[0].downcase]}
    mail_and_password.each do |user|
      User.create(:email => user[0], :password => user[1])
    end
  end
end
