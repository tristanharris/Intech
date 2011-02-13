require 'spec_helper'

describe Date do
  subject { Date.parse('13/02/2011') }

  its(:pretty) { should == 'Sun 13 Feb' }

end
