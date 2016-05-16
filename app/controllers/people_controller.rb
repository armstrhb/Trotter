class PeopleController < ApplicationController
  def index
    @people = Person.all.order(:last_name, :first_name)
  end
end
