class LoggerFormatter < ActiveSupport::Logger::SimpleFormatter
  def call(serverity, time, program_name, message)
    formatted_severity = sprintf('%-5s', serverity.to_s)
    formatted_time = time.strftime('%Y-%m-%d %H:%M:%S')
    "[#{formatted_severity} #{formatted_time}] : #{program_name} #{message}\n"
  end
end