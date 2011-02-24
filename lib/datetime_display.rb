module DateDisplay

  def pretty
    strftime('%a %e %b')
  end

end

module TimeDisplay

  def pretty
    strftime('%d/%m/%Y %H:%M')
  end

end

Date.class_eval do
  include DateDisplay
end

Time.class_eval do
  include TimeDisplay
end
