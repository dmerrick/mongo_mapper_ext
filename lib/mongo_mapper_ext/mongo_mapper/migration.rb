module MongoMapper::Migration
  class MigrationDefinition
    def upgrade &block

      puts "in MigrationDefinition#up/upgrade"

      if block
        @upgrade = block
      else
        @upgrade
      end
    end
    alias_method :up, :upgrade
    
    def downgrade &block

      puts "in MigrationDefinition#down/downgrade"

      if block
        @downgrade = block
      else
        @downgrade
      end
    end
    alias_method :down, :downgrade
  end
  
  class Logger
    attr_accessor :enabled
    
    def initialize enabled = true
      self.enabled = enabled
    end
    
    def info message
      puts message if enabled
    end
  end
  
  class << self
    def logger= logger
      @logger = logger ? logger : Logger.new(false)
    end
    
    def logger; @logger ||= Logger.new end
    
    def define database_alias, version, &block

      puts "in MigrationDefinition#define"

      database_alias = database_alias.to_s
      
      raise "version should be an Integer! (but you provided '#{version}' instad)!" unless version.is_a? Integer
      definition = MigrationDefinition.new
      block.call definition
      
      definitions[database_alias][version] = definition
    end
            
    def update database_alias, version

      puts "in MigrationDefinition#update"

      database_alias = database_alias.to_s
      db = MongoMapper.databases[database_alias]
      
      if metadata(db)['version'] == version
        logger.info "Database '#{database_alias}' already is of #{version} version, no migration needed."
        return false
      else
        logger.info "Migration for '#{database_alias}' Database:"
      end
      
      increase_db_version database_alias, db while metadata(db)['version'] < version
      decrease_db_version database_alias, db while metadata(db)['version'] > version
      true
    end
        
    def metadata db
      
      puts "in MigrationDefinition#metadata"

      col = db.collection 'db_metadata'
      col.find_one || {'version' => 0}
    end
    
    def definitions

      puts "in MigrationDefinition#definitions"

      pp @definitions
      @definitions ||= Hash.new{|h, k| h[k] = []}
      puts "exiting MigrationDefinition#definitions"
      @definitions
    end
    
    protected
      def increase_db_version database_alias, db
        
        puts "in MigrationDefinition#increase_db_version"

        m = metadata(db)
        migration = definitions[database_alias][m['version'] + 1]        
        raise "No upgrade for version #{m['version'] + 1} of '#{database_alias}' Database!" unless migration and migration.up
        
        migration.up.call db
        
        m['version'] += 1        
        update_metadata db, m
        
        logger.info "Database '#{database_alias}' upgraded to version #{m['version']}."
      end
      
      def decrease_db_version database_alias, db
        
        puts "in MigrationDefinition#decrease_db_version"

        m = metadata(db)
        migration = definitions[database_alias][m['version']]        
        raise "No downgrade for version #{m['version']} of '#{database_alias}' Database!" unless migration and migration.down
        
        migration.down.call db
        
        m['version'] -= 1
        update_metadata db, m
        
        logger.info "Database '#{database_alias}' downgraded to version #{m['version']}."
      end

      
      def update_metadata db, metadata
        
        puts "in MigrationDefinition#update_metadata"

        col = db.collection 'db_metadata'
        col.save metadata.to_hash
      end
  end
end