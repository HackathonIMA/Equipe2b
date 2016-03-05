# Minitest
class Minitest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

# Minitest::Spec
class Minitest::Spec
  include FactoryGirl::Syntax::Methods
end

# minitest-rails
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
