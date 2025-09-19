class HelloJob < ApplicationJob
  queue_as :default

  after_perform :log_message

  def perform(*args)
    @message = "Finalizado!"

    sleep 4

    puts @message
  end

  private

  def log_message
    Turbo::StreamsChannel.broadcast_replace_to(
      "hello",
      target: "hello_job",
      partial: "home/hello_job",
      formats: :turbo_stream,
      locals: { message: @message }
    )
  end
end
