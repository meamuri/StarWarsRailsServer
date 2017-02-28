namespace :new_db_dict do
  desc 'We should connect old datatable elements to new dictionary of classes'
  task make_new_model_table: :environment do
    require 'set'
    names = Set.new
    Starship.all.each do |s|
        names.add? s.sclass.split.map(&:capitalize).join(' ')
    end
    names.each do |name|
      StarshipClass.create(name: name.camelize)
    end
    Starship.all.each do |s|
      StarshipClass.find_by_name(s.sclass.split.map(&:capitalize).join(' ')).starships << s
    end
  end
end
