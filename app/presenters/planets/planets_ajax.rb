class Planet::PlanetsAjaxPresenter < BasePresenter
  def initialize(count, page)
    @count = count
    @page = page
    @planets = Planet.offset((page - 1) * count).limit(count)
    @pages = Planet.count / count + (Planet.count % count == 0 ? 0 : 1)
  end

  def pages
    @pages
  end

  def page
    @page
  end

  def planets
    @planets
  end
end