namespace :create_new_architecture do
  desc 'migrate old fields of people model to correct int field with special -1 value for unknown rows'
  task people_fields_migration: :environment do
    Person.all.each do |p|
      p.tmp_mass =
          p.mass == 'unknown' ? -1 : p.mass.to_i
      p.tmp_height =
          p.height == 'unknown' ? -1 : p.height.to_i
      p.save
    end
  end

end
