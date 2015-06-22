module {{namespace_module}}
  module Accounts
    class Model < ROM::Relation[:memory]
      register_as NAMESPACE
      dataset NAMESPACE
      gateway :default

    end
  end
end
