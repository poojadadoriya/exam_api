class SeqJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user: user).deliver_later
  end
end