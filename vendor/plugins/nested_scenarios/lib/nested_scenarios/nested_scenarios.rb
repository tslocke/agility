class NestedScenarios
  cattr_accessor :record_name_fields, :skip_tables
  @@record_name_fields = %w( name username title )
  @@skip_tables        = %w( schema_migrations )

  def self.delete_tables(table_names = self.tables)
    connection = ActiveRecord::Base.connection
    ActiveRecord::Base.silence do
      connection.disable_referential_integrity do
        (table_names - @@skip_tables).each do |table_name|
          connection.delete "DELETE FROM #{table_name}", 'Fixture Delete'
        end
      end
    end
  end

  def self.tables
    ActiveRecord::Base.connection.tables - @@skip_tables
  end

  def self.load_root_fixtures=(value)
    Test::Unit::TestCase.load_root_fixtures = value
  end

  def self.load_root_fixtures
    Test::Unit::TestCase.load_root_fixtures
  end
end
