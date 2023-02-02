module Visible
    # Adding status validation to the concern (removing duplication of logic from article and comment models)
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    # Adding class_methods in concerns to count number of articles
    class_methods do
        def public_count
            where(status: 'public').count
        end
    end

    def archived?
        status == 'archived'
    end
end