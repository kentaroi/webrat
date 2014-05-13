require "logger"

module Webrat
  module Logging #:nodoc:

    def debug_log(message) # :nodoc:
      return unless logger
      logger.debug message
    end

    def logger # :nodoc:
      case Webrat.configuration.mode
      when :rails
        ::Rails.logger
      when :merb
        ::Merb.logger
      else
        @logger ||= ::Logger.new("webrat.log")
      end
    end

  end
end
