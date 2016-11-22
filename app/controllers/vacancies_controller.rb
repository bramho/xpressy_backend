class VacanciesController < ApplicationController

   def index
      @vacancies = Vacancy.all.order('created_at DESC')
   end

   def new
      @vacancy = Vacancy.new
   end

   def create
      @vacancy = Vacancy.new(vacancy_params)

      if @vacancy.save
         redirect_to @vacancy
      else
         render 'new'
      end
   end

   def show
      @vacancy = Vacancy.find(params[:id])
   end

   private
      def vacancy_params
         params.require(:vacancy).permit(:title, :description, :demands, :branche, :education_level, :experience)
      end

end
