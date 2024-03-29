# Alias Generator for Posts.
#
# Generates redirect pages for posts with aliases set in the YAML Front Matter.
#
# Place the full path of the alias (place to redirect from) inside the
# destination post's YAML Front Matter. One or more aliases may be given.
#
# Example Post Configuration:
#
#   ---
#     layout: post
#     title: "How I Keep Limited Pressing Running"
#     alias: /post/6301645915/how-i-keep-limited-pressing-running/index.html
#   ---
#
# Example Post Configuration:
#
#   ---
#     layout: post
#     title: "How I Keep Limited Pressing Running"
#     alias: [/first-alias/index.html, /second-alias/index.html]
#   ---
#
# Author: Thomas Mango
# Site: http://thomasmango.com
# Plugin Source: http://github.com/tsmango/jekyll_alias_generator
# Site Source: http://github.com/tsmango/thomasmango.com
# PLugin License: MIT

module Jekyll

  class AliasGenerator < Generator

    def generate(site)
      @site = site
      puts "AliasGenerator loading..."

      process_posts
    end

    def process_posts
      puts "Processing #{@site.posts.size.to_s} post(s) for aliases..."

      @site.posts.each do |post|
        generate_aliases(post.url, post.data['alias'])
      end
    end

    def generate_aliases(destination_path, aliases)
      alias_paths ||= Array.new
      alias_paths << aliases
      alias_paths.delete(nil)

      alias_paths.flatten.each do |alias_path|
        path = File.join(@site.dest, alias_path)

        FileUtils.mkdir_p(File.dirname(path))

        File.open(path, 'w') do |file|
          file.write(alias_template(destination_path))
        end

        (alias_path.split('/').size + 1).times do |sections|
          @site.static_files << Jekyll::AliasFile.new(@site, @site.dest, alias_path.split('/')[0, sections].join('/'), nil)
        end
      end
    end

    def alias_template(destination_path)
      <<-EOF
      <!DOCTYPE html>
      <html>
      <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta http-equiv="refresh" content="0;url=#{destination_path}" />
      </head>
      </html>
      EOF
    end
  end

  class AliasFile < StaticFile
    require 'set'

    def destination(dest)
      File.join(dest, @dir)
    end

    def modified?
      return false
    end

    def write(dest)
      return true
    end
  end
end