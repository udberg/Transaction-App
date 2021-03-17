module ApplicationHelper
  def full_title(title = '')
    base_title = 'Transaction app'
    if title.empty?
      base_title
    else
      title + ' | '.concat(base_title)
    end
  end
end
