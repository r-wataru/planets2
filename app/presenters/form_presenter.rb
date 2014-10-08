class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context
  delegate :label, :text_field, :password_field, :check_box, :radio_button,
    :text_area, :object, to: :form_builder

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
  end

  def password_field_block(name, label_text, options = {})
    markup(:div, class: 'form-group') do |m|
      m << decorated_label(name, label_text, options)
      m.div(class: 'col-sm-10') do |m|
        m << password_field(name, { class: "form-control #{options[:class]}", placeholder: label_text })
#        if object.errors.full_messages_for(name).present?
#          m.span(class: "glyphicon glyphicon-remove form-control-feedback")
#        end
        m << error_messages_for(name)
      end
    end
  end

  def error_messages_for(name)
    markup do |m|
      object.errors.full_messages_for(name).each do |message|
        m.ul(class: 'error-message') do |m|
          m.li do |m|
            m.text message
          end
        end
      end
    end
  end

  private
  def decorated_label(name, label_text, options = {})
    label(name, label_text, class: "col-sm-2 control-label #{options[:required] ? 'required' : nil}" )
  end
end