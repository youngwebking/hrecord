require File.join(File.dirname(__FILE__), "formatter")

module HRecord
  class Base
  
    class << self; attr_accessor :tablename end
    class << self; attr_accessor :cfnames end
    class << self; attr_accessor :server end
    class << self; attr_accessor :formatter end
    #alias_method :newclass, :new
  
    def initialize
      
    end
    
    def tablename=(tablename)
      @tablename = tablename
    end
    
    def cfnames=(cfnames)
      @cfnames = cfnames
    end
    
    def server=(server)
      @server = server
    end
    
    def formatter=(formatter)
      @formatter = formatter
    end
    
    def self.migrate
      #add checking for table already created or in need of updating
      @server.create('table', @tablename, @cfnames)
    end
    
    def self.drop
      @server.delete(@tablename)
    end
    
    def self.newmod(params={})
      newmod = @formatter.params_to_model(params)
      newmod.tablename = self.tablename
      newmod.cfnames = self.cfnames
      newmod.server = self.server
      newmod.formatter = self.formatter
    end
    
    def self.create(params={})
      created = @formatter.params_to_model(params)
      created.tablename = self.tablename
      created.cfnames = self.cfnames
      created.server = self.server
      created.formatter = self.formatter
      created.save
    end
    
#    def update()
#      set_args(obj)
#      save
#    end
    
    def is_valid?
      if true
        return true
      else
        return false
      end
    end
    
    def save
      if is_valid?
        @server.put(@tablename, [@formatter.model_to_db(self)])
        return true
      else
        return false
      end
    end
    
    def self.all
      rows = @server.scan self.tablename
      objects = []
      rows.each do |row|
        objects += [(@formatter.db_to_model row)]
      end
      objects
    end
    
    def self.find(row_key)
      row = @server.scan(self.tablename, 'startrow='+row_key+'&limit=1')[0]
      @formatter.db_to_model row
    end
    
    def self.where(*args)
      rows = @server.scan self.tablename
      objects = []
      rows.each do |row|
        args.each do |key, val|
          row['Cell'].each do |cell|
            if cell['column'] == key and cell['$'] == val or true
              objects += [(self.db_to_model row)]
            end
          end
        end
      end
      objects
    end
    
    def model_name
      self.class.name
    end
    
    def self.set_tablename
      #fix pluralization algorithm
      @tablename = self.name.downcase.pluralize
      #@tablename = tablename
    end
    
    def self.server_url(url, port=nil)
      @server = HRecord::Connection.new(url) if port.nil?
      @server = HRecord::Connection.new(url, port) if !port.nil?
    end
    
    def self.column_families(*cfnames)
      @cfnames = cfnames
      self.set_tablename
      @formatter = HRecord::Formatter.new(@tablename, @cfnames)
      if !@cfname.nil? and !@server.nil?
        self.migrate
      end
    end
    
  end
  
end
