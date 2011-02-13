module DateDisplay

  def pretty
    strftime('%a %e %b')
  end

end

Date.class_eval do
  include DateDisplay
end
