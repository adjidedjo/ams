module ApplicationHelper

    def dynamic_menu
      Department.all
    end

    def placeholder
        "Type here ...."
    end

    def apply_label(category_submission)
      if category_submission.read_attribute_before_type_cast(:status) > 1
        "Approve"
      else
        "Apply"
      end
    end
end
