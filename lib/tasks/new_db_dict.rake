namespace :new_db_dict do
  desc "TODO"
  task make_new_model_table: :environment do

    names_of_classes = Set.new
    Starship.all.each do |starship|
      names_of_classes << starship.starship_class.downcase
    end
    names_of_classes.each do |name|
      Starship.create()
    end

  end
end
