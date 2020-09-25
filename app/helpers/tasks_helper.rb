module TasksHelper
  def display_urgent_label(urgent)
    urgent ? 'Urgent' : 'Not Urgent'
  end

  def display_important_label(important)
    important ? 'Important' : 'Not Important'
  end

  def task_action(task)
    if task.open?
      link_to('Start', task_path(task, status: 'start'), remote: true, method: :put)
    elsif task.in_progress?
      link_to('Done', task_path(task, status: 'done'), remote: true, method: :put)
    end
  end

  def display_closed_tasks_params(all_param)
    all_param.present? ? nil : true
  end
end
