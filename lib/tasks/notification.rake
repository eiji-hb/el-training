namespace :task do
  desc "notification/一日に一回動かす。"
  task :notification => :environment do
    today = Date.today
    tasks = Task.all
    n = tasks.count
    today = Date.today
    tasks.each do |task|
      user = task.user
      if today + 1 == task.deadline.to_date
        Notification.create(task_id: task.id, user_id: user.id, action: "warning")
      end
      if task.notification.nil? && today > task.deadline.to_date
        Notification.create(task_id: task.id, user_id: user.id, action: "expired")
      elsif task.notification.present? && today > task.deadline.to_date
        task.notification.update(action: "expired")
      end
      n -= 1
      puts "残り#{n}/#{tasks.count}"
    end
  end
end
