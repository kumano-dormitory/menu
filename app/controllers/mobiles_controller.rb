class MobilesController < ApplicationController
  def index
    @menus = Menu.where("day >= :start AND day <= :end",
                        {start: (Date.today + 2).beginning_of_week, end: (Date.today + 2).end_of_week}
                       ).order("day ASC, id DESC").group(:day)
  end
end
