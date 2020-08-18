module ApplicationHelper
  def date_ru(date)
    date = date.to_s.split("-")[2] + "." + date.to_s.split("-")[1] + "." + date.to_s.split("-")[0]
    return date
  end

  def add_btn_to(path)
    attributes = { class: 'btn btn-primary btn-sm', title: t('views.buttons.add') }
    link_to(path, attributes) do
      content_tag(:span, nil, class: 'icon icon-plus')
    end
  end
  
end
