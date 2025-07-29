module TasksHelper
  def formatted_due_date(task)
    return "No due date" unless task.due_date.present?
    today=Date.today
    due_date=task.due_date
    if due_date == today
      "today"
    elsif due_date == today + 1
      "tomorrow"
    elsif due_date == today - 1
      "yesterday"
    elsif due_date > today
     "#{task.due_date.strftime { "%b %d, %Y" }}"
    else
      "#{distance_of_time_in_words(due_date, today)} ago"
    end
  end
end
