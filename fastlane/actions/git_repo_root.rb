module Fastlane
  module Actions
    module SharedValues
      GIT_REPO_ROOT_PATH = :GIT_REPO_ROOT_PATH
    end

    class GitRepoRootAction < Action
      def self.run(params)
        repo_path = Actions.sh('git rev-parse --show-toplevel').strip
        Actions.lane_context[SharedValues::GIT_REPO_ROOT_PATH] = repo_path
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "You can get root path of your git repository"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        # [
        #   FastlaneCore::ConfigItem.new(key: :api_token,
        #                                env_name: "FL_GIT_REPO_ROOT_API_TOKEN", # The name of the environment variable
        #                                description: "API Token for GitRepoRootAction", # a short description of this parameter
        #                                verify_block: proc do |value|
        #                                   UI.user_error!("No API token for GitRepoRootAction given, pass using `api_token: 'token'`") unless (value and not value.empty?)
        #                                   # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
        #                                end),
        #   FastlaneCore::ConfigItem.new(key: :development,
        #                                env_name: "FL_GIT_REPO_ROOT_DEVELOPMENT",
        #                                description: "Create a development certificate instead of a distribution one",
        #                                is_string: false, # true: verifies the input is a string, false: every kind of value
        #                                default_value: false) # the default value if the user didn't provide one
        # ]
      end

      def self.output
        # Define the shared values you are going to provide
        [
          ['GIT_REPO_ROOT_PATH', 'A root path of your git repository']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
        'A root path of your git repository'
      end

      def self.authors
        ["griffin-stewie"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
