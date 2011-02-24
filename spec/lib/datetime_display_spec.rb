require 'spec_helper'

describe Date do
  subject { Date.parse('13/02/2011') }

  its(:pretty) { should == 'Sun 13 Feb' }

end

describe Time do
  subject { Time.parse('13/02/2011 18:32') }

  its(:pretty) { should == '13/02/2011 18:32' }

end
