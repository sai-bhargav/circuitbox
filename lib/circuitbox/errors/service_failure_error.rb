# frozen_string_literal: true

class Circuitbox
  class ServiceFailureError < Circuitbox::Error
    attr_reader :service, :original

    def initialize(service, exception)
      super()
      @service = service
      @original = exception
      # We copy over the original exceptions backtrace if there is one
      backtrace = exception.backtrace
      set_backtrace(backtrace) unless backtrace.empty?
    end

    def to_s
      "#{self.class}: Service #{service.inspect} was unavailable (original: #{original})"
    end
  end
end
