require "shopify_cli"
require "json"

module ShopifyCLI
  module Commands
    class AppList < ShopifyCLI::Command
      def self.help
        ShopifyCLI::Context.message("List apps", ShopifyCLI::TOOL_NAME)
      end

      def call(_args, _name)
        resp = ShopifyCLI::PartnersAPI.query(@ctx, "apps_list")

        apps = resp['data']['apps']['edges'].map { |app|
          app['node']
        }

        puts apps.to_json
      end
    end
  end
end
