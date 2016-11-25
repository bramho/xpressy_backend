class ReactionsController < ApplicationController

   def create
      @vacancy = Vacancy.find(params[:vacancy_id])
      @reaction = @vacancy.reactions.create(params[:reaction].permit(:name, :email, :body))

      redirect_to vacancy_path(@vacancy)
   end

   def destroy
      @vacancy = Vacancy.find(params[:vacancy_id])
      @reaction = @vacancy.reactions.find(params[:id])
      @reaction.destroy

      redirect_to vacancy_path(@vacancy)
   end

end