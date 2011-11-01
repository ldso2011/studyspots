# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activeuuid}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nate Murray"]
  s.date = %q{2011-09-14}
  s.description = %q{Add binary (not string) UUIDs to ActiveRecord in MySQL}
  s.email = ["nate@natemurray.com"]
  s.homepage = %q{http://www.xcombinator.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Add binary UUIDs to ActiveRecord in MySQL}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuidtools>, [">= 0"])
    else
      s.add_dependency(%q<uuidtools>, [">= 0"])
    end
  else
    s.add_dependency(%q<uuidtools>, [">= 0"])
  end
end
