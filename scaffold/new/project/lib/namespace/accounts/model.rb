module {{namespace_module}}
  module Accounts
    class Model < ActiveRecord::Base
      include BCrypt
      include Accounts

      self.table_name = NAMESPACE

      has_many :sessions, class_name: "{{namespace_module}}::Sessions::Model", foreign_key: "account_id", dependent: :destroy

      def self.create!
        ActiveRecord::Migration.create_table table_name, force: true, id: :uuid do |table|
          table.string :name, null: false
          table.index :name, unique: true

          table.string :username, null: false
          table.index :username, unique: true

          table.string :email, null: false
          table.index :email, unique: true

          table.string :signature, null: false
          table.index :signature, unique: true

          table.text :bio, default: "", null: false

          table.string :password, null: false

          table.datetime :created_at, null: false
          table.index :created_at

          table.datetime :destroyed_at
          table.index :destroyed_at

          table.datetime :updated_at
          table.index :updated_at
        end
      end

      def password
        Password.new(super)
      end

      def password=(value)
        super(Password.create(value))
      end
    end
  end
end
