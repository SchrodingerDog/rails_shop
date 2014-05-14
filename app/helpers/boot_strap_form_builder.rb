class BootStrapFormBuilder < ActionView::Helpers::FormBuilder
 
  # def text_field(method, options={})
  #   t = @template
  #   t.content_tag(:div, :class => "form-group#{' has-errors' unless @object.errors[method].blank?}") {
  #     t.concat(t.label_tag(method, :class => "col-md-4 control-label"))
  #     t.concat(t.content_tag(:div, :class => "form-control input-md") {
  #       t.concat(super method)
  #       if @object.errors[method].present?
  #         t.concat(t.content_tag(:span, options[:help_text], :class => 'help-inline'))
  #       end
  #     })
  #   }
  # end

  def text_field(method, options={})
    t = @template
    t.content_tag(:div, :class => "form-group#{' has-error' unless @object.errors[method].blank?}") {
      t.concat(t.label_tag(method, method, :class => "col-md-4 control-label"))
      t.concat(t.content_tag(:div, :class => "col-md-4") {

      t.concat(super(method, {:class => "form-control input-md", :name =>method, :id=>method}))
      if @object.errors[method].present?
        t.concat(t.content_tag(:span, StringsHelper::prettify(method)+" "+@object.errors[method].join(","), :class => 'help-inline'))
      end
    })
    }
  end

  def text_area(method, options={})
    t = @template
    t.content_tag(:div, :class => "form-group#{' has-error' unless @object.errors[method].blank?}") {
      t.concat(t.label_tag(method, method, :class => "col-md-4 control-label"))
      t.concat(t.content_tag(:div, :class => "col-md-4") {

      t.concat(super(method, {:class => "form-control input-md", :name =>method, :id=>method}))
      if @object.errors[method].present?
        t.concat(t.content_tag(:span, StringsHelper::prettify(method)+" "+@object.errors[method].join(","), :class => 'help-inline'))
      end
    })
    }
  end

end