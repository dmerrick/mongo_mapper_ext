# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongo_mapper_ext}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Dana Merrick}]
  s.date = %q{2011-08-09}
  s.email = %q{dmerrick@brightcove.com}
  s.extra_rdoc_files = [%q{readme.md}]
  s.files = [%q{icon_plane.jpg}, %q{Rakefile}, %q{readme.md}, %q{spec/carrier_wave}, %q{spec/carrier_wave/carrier_wave_spec}, %q{spec/carrier_wave/carrier_wave_spec/plane.jpg}, %q{spec/carrier_wave/carrier_wave_spec.rb}, %q{spec/carrier_wave/spec_helper.rb}, %q{spec/mongo_db}, %q{spec/mongo_db/spec_helper.rb}, %q{spec/mongo_db/upsert_spec.rb}, %q{spec/mongo_mapper}, %q{spec/mongo_mapper/attribute_convertors_spec.rb}, %q{spec/mongo_mapper/belongs_to_with_counter_cache_spec.rb}, %q{spec/mongo_mapper/custom_scope_spec.rb}, %q{spec/mongo_mapper/micelaneous_plugin_spec.rb}, %q{spec/mongo_mapper/micelaneous_spec.rb}, %q{spec/mongo_mapper/migration_spec.rb}, %q{spec/mongo_mapper/mongo_mapper_spec.rb}, %q{spec/mongo_mapper/spec_helper.rb}, %q{lib/mongo_mapper_ext}, %q{lib/mongo_mapper_ext/carrier_wave}, %q{lib/mongo_mapper_ext/carrier_wave/fixes.rb}, %q{lib/mongo_mapper_ext/carrier_wave/micelaneous.rb}, %q{lib/mongo_mapper_ext/carrier_wave/mongo_mapper}, %q{lib/mongo_mapper_ext/carrier_wave/mongo_mapper/plugins}, %q{lib/mongo_mapper_ext/carrier_wave/mongo_mapper/plugins/mount_uploader.rb}, %q{lib/mongo_mapper_ext/carrier_wave/mongo_mapper/plugins/mount_uploaders.rb}, %q{lib/mongo_mapper_ext/carrier_wave.rb}, %q{lib/mongo_mapper_ext/gems.rb}, %q{lib/mongo_mapper_ext/mongo_db}, %q{lib/mongo_mapper_ext/mongo_db/upsert.rb}, %q{lib/mongo_mapper_ext/mongo_db.rb}, %q{lib/mongo_mapper_ext/mongo_mapper}, %q{lib/mongo_mapper_ext/mongo_mapper/fixes.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/hacks.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/migration.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/attribute_cache.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/attribute_convertors.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/belongs_to_with_counter_cache.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/custom_scope.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/db_config.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/plugins/micelaneous.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/spec.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/support.rb}, %q{lib/mongo_mapper_ext/mongo_mapper/view_helpers.rb}, %q{lib/mongo_mapper_ext/mongo_mapper.rb}, %q{lib/mongo_mapper_ext/tasks.rb}]
  s.homepage = %q{http://brightcove.com}
  s.rdoc_options = [%q{--main}, %q{readme.md}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{BC fork of mongo_mapper_ext}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
