module ApplicationHelper
  # ページごとのタイトルを設定する
  def full_title(page_title = '')
    base_title = "FRIDGEM"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end