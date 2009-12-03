# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_static_maps_helper}
  s.version = "1.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thorbjørn Hermansen"]
  s.date = %q{2009-12-03}
  s.description = %q{This gem provides a simple interface to the Google Static Maps V2 API.}
  s.email = %q{thhermansen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "changelog.txt",
     "google_static_maps_helper.gemspec",
     "lib/google_static_maps_helper.rb",
     "lib/google_static_maps_helper/gmap_polyline_encoder.rb",
     "lib/google_static_maps_helper/location.rb",
     "lib/google_static_maps_helper/map.rb",
     "lib/google_static_maps_helper/marker.rb",
     "lib/google_static_maps_helper/path.rb",
     "spec/google_static_maps_helper_spec.rb",
     "spec/location_spec.rb",
     "spec/map_spec.rb",
     "spec/marker_spec.rb",
     "spec/path_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/thhermansen/google_static_maps_helper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{This gem provides a simple interface to the Google Static Maps V2 API}
  s.test_files = [
    "spec/marker_spec.rb",
     "spec/map_spec.rb",
     "spec/spec_helper.rb",
     "spec/location_spec.rb",
     "spec/path_spec.rb",
     "spec/google_static_maps_helper_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

