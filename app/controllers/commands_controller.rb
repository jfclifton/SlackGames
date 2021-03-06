class CommandsController < ApplicationController
  def create
    return render json: {}, status: 403 unless valid_slack_token?


  end

  private
    def valid_slack_token?
      params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
    end

    # Only allow a trusted parameter "white list" through
    def command_params
      params.permit(:text, :token, :user_id, :response_url)
    end
end
