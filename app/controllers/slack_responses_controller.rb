require 'slack-notifier'
class SlackResponsesController < ApplicationController
  def index
    # Notify
    notifier = Slack::Notifier.new Rails.application.secrets.slack_incomingwebhook_url, channel: "#gamez",
                                                  username: "notifier"
    notifier.ping "SlackResponsesGet"
  end

  def create
    # byebug
    render json: {"text": "Hello"}
  end
end
