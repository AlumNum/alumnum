class AnswersController < ApplicationController
	#get /answers/new
	def new
		@answer = Answer.new
		#@answer.profile_id = current_user.profile_id
	end

	#post /answers/new

	def create
		@answer = Answer.new(answer_params)
		@answer.profile_id = current_user.profile.id

		respond_to do |format|
	      if @question.save
	        format.html { redirect_to "/", notice: 'Answer was successfully created.' }
	       # format.json { render :show, status: :created, location: @answer }
	      else
	         format.html { render :new }
	        # format.json { render json: @answer.errors, status: :unprocessable_entity }
	      end
		end
	end
	

	private

	def answer_params
		params.require(:answer).permit(:question, :response)
	end

end
