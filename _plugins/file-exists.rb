module Jekyll
  class FileExistsTag < Liquid::Tag
    def initialize(tag_name, path, tokens)
      super
      @path = path
    end

    def render(context)
      # Pipe parameter through Liquid to make additional replacements possible
      url = Liquid::Template.parse(@path).render context

      # Adds the site source, so that it also works with a custom one
      site_source = context.registers[:site].config['source']
      file_path = site_source + '/' + url

      # Check if file exists (returns true or false)
      # Use non-destructive `strip` to avoid returning nil when no whitespace is
      # removed. Calling `strip!` can return `nil`, which would cause
      # `File.exist?` to raise a TypeError when given `nil`.
      "#{File.exist?(file_path.strip)}"
    end
  end
end

Liquid::Template.register_tag('file_exists', Jekyll::FileExistsTag)