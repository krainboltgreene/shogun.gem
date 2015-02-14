module {{namespace_module}}
  module Sessions
    class Model < ActiveRecord::Base
      include BCrypt
      include Sessions

      self.table_name = NAMESPACE

      belongs_to :account, class_name: "{{namespace_module}}::Accounts::Model", foreign_key: "account_id"

      def self.create!
        ActiveRecord::Migration.create_table table_name, force: true, id: :uuid do |table|
          table.string :account_id, null: false
          table.index :account_id

          table.datetime :created_at
          table.index :created_at

          table.datetime :destroyed_at
          table.index :destroyed_at
        end
      end
    end
  end
end
