module {{namespace_module}}
  module {{resource_module}}
    class Model < ActiveRecord::Base
      include {{resource_module}}

      self.table_name = NAMESPACE

      # has_many :relationship, class_name: "{{namespace_module}}::Relationship::Model", foreign_key: "{{resource_singular}}_id", dependent: :destroy

      def self.create!
        ActiveRecord::Migration.create_table table_name, force: true, id: :uuid do |table|
          table.string :name, null: false, default: "", index: { unique: true }

          table.datetime :created_at, null: false, index: true
          table.datetime :updated_at, null: false, index: true
          table.datetime :destroyed_at, index: true
        end
      end
    end
  end
end
