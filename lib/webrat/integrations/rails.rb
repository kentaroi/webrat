require 'action_dispatch/testing/integration'

module ActionDispatch #:nodoc:
  IntegrationTest.class_eval do
    include Webrat::Methods
    include Webrat::Matchers

    # The Rails version of within supports passing in a model and Webrat
    # will apply a scope based on Rails' dom_id for that model.
    #
    # Example:
    #   within User.last do
    #     click_link "Delete"
    #   end
    def within(selector_or_object, &block)
      if selector_or_object.is_a?(String)
        super
      else
        super('#' + RecordIdentifier.dom_id(selector_or_object), &block)
      end
    end

  end
end
