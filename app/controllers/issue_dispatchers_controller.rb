class IssueDispatchersController < ApplicationController
  def index
      dispatcher = Dispatcher.find(params[:id])
      render json: dispatcher.issues
  end

  def show
  end

  def create
    join = IssueDispatcher.new(issue_dispatcher_params)
    if join.save!
        issues = Issue.all
        issues_json = issues.as_json
        issues_json.each_with_index do |issue, index|
            issue[:users] = issues[index].users
        end
        issues_json.each_with_index do |issue, index|
            issue[:dispatchers] = issues[index].dispatchers
        end
        render json: issues_json
    end
  end

  def update
  end

  def destroy
  end

  private

  def issue_dispatcher_params
      params.require(:issue_dispatcher).permit(:dispatcher_id, :issue_id)
  end

end