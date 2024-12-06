class AttemptsController < ApplicationController
  def index
    matching_attempts = Attempt.all

    @list_of_attempts = matching_attempts.order({ :created_at => :desc })

    render({ :template => "attempts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_attempts = Attempt.where({ :id => the_id })

    @the_attempt = matching_attempts.at(0)

    render({ :template => "attempts/show" })
  end

  def create
    the_attempt = Attempt.new
    the_attempt.input_id = params.fetch("query_input_id")
    the_attempt.agent_id = params.fetch("query_agent_id")
    the_attempt.status = params.fetch("query_status")

    if the_attempt.valid?
      the_attempt.save
      redirect_to("/attempts", { :notice => "Attempt created successfully." })
    else
      redirect_to("/attempts", { :alert => the_attempt.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attempt = Attempt.where({ :id => the_id }).at(0)

    the_attempt.input_id = params.fetch("query_input_id")
    the_attempt.agent_id = params.fetch("query_agent_id")
    the_attempt.status = params.fetch("query_status")

    if the_attempt.valid?
      the_attempt.save
      redirect_to("/attempts/#{the_attempt.id}", { :notice => "Attempt updated successfully."} )
    else
      redirect_to("/attempts/#{the_attempt.id}", { :alert => the_attempt.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attempt = Attempt.where({ :id => the_id }).at(0)

    the_attempt.destroy

    redirect_to("/attempts", { :notice => "Attempt deleted successfully."} )
  end
end
