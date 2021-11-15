require "shopify_cli"

module ShopifyCLI
  module Commands
    class Introspect < ShopifyCLI::Command
      options do |parser, flags|
        parser.on("--type=TYPE") { |t| flags[:type] = t }
      end

      def self.help
        ShopifyCLI::Context.message("Introspect GraphQL API", ShopifyCLI::TOOL_NAME)
      end

      def call(_args, _name)
        resp = ShopifyCLI::PartnersAPI.query(@ctx, "introspect", type: options.flags[:type])
        
        puts resp
      end
    end
  end
end
