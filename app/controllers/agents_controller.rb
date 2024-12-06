class AgentsController < ApplicationController
  def index
    matching_agents = Agent.all

    @list_of_agents = matching_agents.order({ :created_at => :desc })

    render({ :template => "agents/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_agents = Agent.where({ :id => the_id })

    @the_agent = matching_agents.at(0)

    render({ :template => "agents/show" })
  end

  def create
    the_agent = Agent.new
    the_agent.user_id = params.fetch("query_user_id")
    the_agent.name = params.fetch("query_name")
    the_agent.directive = params.fetch("query_directive")
    the_agent.attempts_count = params.fetch("query_attempts_count")

    if the_agent.valid?
      the_agent.save
      redirect_to("/agents", { :notice => "Agent created successfully." })
    else
      redirect_to("/agents", { :alert => the_agent.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_agent = Agent.where({ :id => the_id }).at(0)

    the_agent.user_id = params.fetch("query_user_id")
    the_agent.name = params.fetch("query_name")
    the_agent.directive = params.fetch("query_directive")
    the_agent.attempts_count = params.fetch("query_attempts_count")

    if the_agent.valid?
      the_agent.save
      redirect_to("/agents/#{the_agent.id}", { :notice => "Agent updated successfully."} )
    else
      redirect_to("/agents/#{the_agent.id}", { :alert => the_agent.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_agent = Agent.where({ :id => the_id }).at(0)

    the_agent.destroy

    redirect_to("/agents", { :notice => "Agent deleted successfully."} )
  end
end
