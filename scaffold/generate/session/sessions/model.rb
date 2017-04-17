module {{name_as_module}}
  module Sessions
    class Model < ROM::Relation[:memory]
      register_as NAMESPACE
      dataset NAMESPACE
      gateway :default

    end
  end
end
