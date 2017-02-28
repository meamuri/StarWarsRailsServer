namespace :new_db_dict do
  desc 'We should connect old datatable elements to new dictionary of classes'
  task make_new_model_table: :environment do
    require 'set'
    names = Set.new
    Starship.all.each do |s|
        names.add? s.sclass.downcase
    end
    names.each do |name|
      puts name.capitalize
    end

    # names.each do |name|
    #   Starship.create(class: name)
    # end
    # Starship.all.each do |s|
    #   StarshipClass.find_by_class(s.starship_class).starships << s
    # end

  end
end
