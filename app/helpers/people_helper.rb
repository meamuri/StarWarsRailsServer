module PeopleHelper
  def show_format_birth_year(birth_year)
    return 'unknown' if birth_year.blank?
    if birth_year < 0
      birth_year = -1 * (birth_year + 1)
      birth_year.to_s + 'BBY'
    else
      birth_year.to_s + 'ABY'
    end

  end
end
