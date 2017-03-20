# Require core library
require 'middleman-core'

# Extension namespace
class TextileManual < ::Middleman::Extension
  option :path, '/', 'Path where you want to mount the textile reference manual'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
    add_extension_dirs

    @sitemap = app.sitemap

    @base_path = options.path
  end

  def textile_data
    app.data.textile
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    new_resources = textile_data.map do |slug, contents|
      build_proxy_resource(link(slug), contents)
    end

    new_resources << root_resource

    resources + new_resources
  end

  def add_extension_dirs
    app.files.watch :source, path: File.join(File.dirname(__FILE__), '../../source'), priority: 1
    app.files.watch :data, path: File.join(File.dirname(__FILE__), '../../data'), priority: 1
  end

  helpers do
    def textile_manual_link(path)
      base = app.extensions[:textile_manual].options.path
      File.join([base, path].compact)
    end
  end

  private

  def link(slug=nil)
    Middleman::Util::normalize_path(File.join([@base_path, slug, 'index.html'].compact))
  end

  def root_resource
    build_proxy_resource(link, {}, 'textile_manual/index.html')
  end

  def build_proxy_resource(path, locals, template='textile_manual/chapter')
    ::Middleman::Sitemap::ProxyResource.new(@sitemap, path, template).tap do |p|
      p.add_metadata locals: locals
    end
  end
end
