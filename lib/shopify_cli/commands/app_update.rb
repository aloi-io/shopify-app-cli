require "shopify_cli"

module ShopifyCli
  module Commands
    class AppUpdate < ShopifyCli::Command
      options do |parser, flags|
        parser.on("--api-key=KEY") { |t| flags[:api_key] = t }
        parser.on("--name=NAME") { |t| flags[:name] = t }
        parser.on("--app-url=APPURL") { |t| flags[:app_url] = t }
        parser.on("--redirect-url=REDIRECTURL") { |t| flags[:redirect_url] = t }
      end

      def self.help
        ShopifyCli::Context.message("core.app:update.help", ShopifyCli::TOOL_NAME)
      end
      
      def call(_args, _name)        
        # return @ctx.puts(self.class.help) if options.flags[:api_key].nil?

        resp = ShopifyCli::PartnersAPI.query(
          @ctx,
          "apps_update",
          apiKey: options.flags[:api_key],
          title: options.flags[:name],
          applicationUrl: options.flags[:app_url],
          redirectUrlWhitelist: options.flags[:redirect_url] ? options.flags[:redirect_url].split(/\s*,\s*/) : nil
        )
        
        puts resp
      end
    end
  end
end
