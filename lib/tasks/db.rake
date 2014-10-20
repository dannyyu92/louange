namespace :db do
  desc "Create pg roles"
  task :setup_roles => :environment do
    resp = %x(createuser -s -d -r -l --replication #{Rails.application.class.parent_name.downcase}_admin)
  end

  desc "Drop pg roles"
  task :drop_roles => :environment do
    resp = %x(dropuser #{Rails.application.class.parent_name.downcase}_admin)
  end
end