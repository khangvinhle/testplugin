module OpenProject::TestPlugin
  module Patches
    module EnumerationPatch
      def self.included(receiver)
        receiver.class_eval do
          has_many :mapping_rates
          has_many :service_packs, through: :mapping_rates
        end
      end
    end
  end
end

Enumeration.send(:include, OpenProject::TestPlugin::Patches::EnumerationPatch)
