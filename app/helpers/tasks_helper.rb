module TasksHelper
  def sort_asc(column_to_be_sorted)
    link_to "▲",tasks_path(:column => column_to_be_sorted, :direction => "asc")
  end

  def sort_desc(column_to_be_sorted)
    link_to "▼",tasks_path(:column => column_to_be_sorted, :direction => "desc")
  end
  def sort_column
    Task.column_names.include?(params[:column]) ? params[:column] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end


  def priority(int)
    case int
    when 3
      "高"
    when 2
      "中"
    when 1
      "低"
    end
  end

  def show_tag(task)
    @tags = Taglist.new
    tags = Taglist.where(id: task.taglists)
    tag = tags.map do |t|
      array = []
      array << t.tag_name
    end
    taglist = tag.join(' ')
    return taglist
  end
end
