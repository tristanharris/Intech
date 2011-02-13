require 'spec_helper'

describe Lecture do
  subject { Lecture.new :time => Time.parse('25/10/2010 18:30') }

  its(:date) { should == Date.parse('25/10/2010') }

end
