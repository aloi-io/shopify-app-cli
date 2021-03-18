module Extension
  module Tasks
    class FetchSpecifications
      include ShopifyCli::MethodObject

      def call
        [
          product_subscription_specification,
          checkout_post_purchase_specification,
          theme_extension_specification,
        ]
      end

      private

      def product_subscription_specification
        {
          identifier: "product_subscription",
          features: {
            argo: {
              surface_area: "admin",
            },
          },
        }
      end

      def checkout_post_purchase_specification
        {
          identifier: "checkout_post_purchase",
          features: {
            argo: {
              surface_area: "checkout",
            },
          },
        }
      end

      def theme_extension_specification
        {
          identifier: "online_store_theme_extension",
          features: {
          },
        }
      end
    end
  end
end
