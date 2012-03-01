require 'rtf'
module Rtf
  module Rails

    module RtfHelper
      def rtf_document(opts={})
        download = opts.delete(:force_download)
        filename = opts.delete(:filename)
        rtf = RTF::Document.new(RTF::Font.new(RTF::Font::ROMAN, 'Times New Roman'))
        yield rtf if block_given?

        disposition(download, filename) if (download || filename)

        rtf.to_rtf
      end

      def disposition(download, filename)
        download = true if (filename && download == nil)
        disposition = download ? "attachment;" : "inline;"
        disposition += " filename=\"#{filename}\"" if filename
        headers["Content-Disposition"] = disposition
      end
    end

    class TemplateHandler
      class_attribute :default_format
      self.default_format = :rtf

      def self.call(template)
        "#{template.source.strip}"
      end
    end
    
  end
end

Mime::Type.register_alias("application/rtf", :rtf) unless Mime::Type.lookup_by_extension(:rtf)
ActionView::Template.register_template_handler(:rtf_rb, Rtf::Rails::TemplateHandler)
ActionView::Base.send(:include, Rtf::Rails::RtfHelper)