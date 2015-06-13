Gem::Specification.new do |s|
  version = File.open('VERSION')
  s.name        = 'hrecord'
  s.version     = version.read.gsub('\n','')
  s.date        = '2014-10-21'
  s.summary     = "a Rails helper to use HBase and to manage file uploads"
  s.description = "A pure ruby module written for Rails to connect with HBase using its REST interface and manage file uploads"
  s.authors     = ["Brant Meier"]
  s.email       = 'youngwebking@gmail.com'
  s.files       = ["VERSION", "lib/rails/hrecord.rb", "lib/hrecord.rb", "lib/hrecord/base.rb", "lib/hrecord/connection.rb", "lib/hrecord/formatter.rb", "lib/hrecord/hbase_file.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hrecord'
  s.license       = 'MIT'
  version.close
end
