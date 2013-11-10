module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def trade_pages
    current_page?(trades_path) or current_page?(trade_path(:id)) or current_page?(new_trade_path) or current_page?(my_trades_path)
  end

  def format_datetime date_time
    date_time.localtime.strftime("%a, %-d %b %Y %H:%M:%S")
  end

end
