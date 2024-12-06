class InputsController < ApplicationController
  def index
    matching_inputs = Input.all

    @list_of_inputs = matching_inputs.order({ :created_at => :desc })

    render({ :template => "inputs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_inputs = Input.where({ :id => the_id })

    @the_input = matching_inputs.at(0)

    render({ :template => "inputs/show" })
  end

  def create
    the_input = Input.new
    the_input.user_id = params.fetch("query_user_id")
    the_input.body = params.fetch("query_body")
    the_input.status = params.fetch("query_status")
    the_input.subject = params.fetch("query_subject")
    the_input.attempts_count = params.fetch("query_attempts_count")

    if the_input.valid?
      the_input.save
      redirect_to("/inputs", { :notice => "Input created successfully." })
    else
      redirect_to("/inputs", { :alert => the_input.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_input = Input.where({ :id => the_id }).at(0)

    the_input.user_id = params.fetch("query_user_id")
    the_input.body = params.fetch("query_body")
    the_input.status = params.fetch("query_status")
    the_input.subject = params.fetch("query_subject")
    the_input.attempts_count = params.fetch("query_attempts_count")

    if the_input.valid?
      the_input.save
      redirect_to("/inputs/#{the_input.id}", { :notice => "Input updated successfully."} )
    else
      redirect_to("/inputs/#{the_input.id}", { :alert => the_input.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_input = Input.where({ :id => the_id }).at(0)

    the_input.destroy

    redirect_to("/inputs", { :notice => "Input deleted successfully."} )
  end
end
