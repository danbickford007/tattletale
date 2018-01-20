class Payload
  def initialize(exception)
    @exception = exception
  end

  def parse
    { error: 
      {
        backtrace: @exception.backtrace,
        exception: @exception.message
      }
    }
  end
end
