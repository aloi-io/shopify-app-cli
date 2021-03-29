require "shopify_cli"
require "json"

module ShopifyCli
  module Commands
    class AppList < ShopifyCli::Command
      def self.help
        ShopifyCli::Context.message("core.app:list.help", ShopifyCli::TOOL_NAME)
      end

      def call(_args, _name)
        resp = ShopifyCli::PartnersAPI.query(@ctx, "apps_list")

        apps = resp['data']['apps']['edges'].map { |app|
          app['node']
        }

        puts apps.to_json
      end
    end
  end
end
