# frozen_string_literal: true

require_relative 'lib/natural_sort_jp/version'

Gem::Specification.new do |spec|
  spec.name = 'natural_sort_jp'
  spec.version = NaturalSortJp::VERSION
  spec.authors = ['thehighhigh']
  spec.email = ['Yuto.ld.1017@gmail.com']

  spec.summary = 'Natural Sort for Japanese.'
  spec.description = 'You can use natural sort in japanese.'
  spec.homepage = 'https://github.com/thehighhigh/natural_sort_jp'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/thehighhigh/natural_sort_jp'
  spec.metadata['changelog_uri'] = 'https://github.com/thehighhigh/natural_sort_jp/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency 'bundler', '~> 2.4.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.47.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
