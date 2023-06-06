class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
 
  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "El Registro Se a Guardado"
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def update
     @person = Person.find(params[:id])
      if @person.update(person_params)
        redirect_to person_path (@person)
      else
        render :edit
      end
    end
  


  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:identification, :first_name, :second_name, :first_last_name, :second_last_name, :role_id, :document_id)
    end
  end


