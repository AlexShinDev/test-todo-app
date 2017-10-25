class List < ApplicationRecord
  has_many :tasks

  def complete_all_tasks!
      tasks.update_all(complete: true)
  end

  def snooze_all_tasks!
    # tasks.each do |task|
    #   task.snooze_hour!
    # end
    tasks.each{ |task| task.snooze_hour!}
  end

  def total_duration
    # total = 0
    # tasks.each{ |task| total += task.duration }
    # return total

    #tasks.sum(:duration) #This is from active record
    tasks.reduce(0) { |sum, task| sum + task.duration}
  end

  def incomplete_tasks
    # tasks.where(complete: false)
    # array_of_tasks = []
    # tasks.each{ |task| array_of_tasks << task if !task.complete}
    # # tasks.each do |task|
    # #   if !task.complete
    # #     array_of_tasks << task
    # #   end
    # # end
    # return array_of_tasks
    # tasks.select {|task| !task.complete}
    tasks.where(complete: false)
  end

  def favorite_tasks
    array_of_tasks = []
    tasks.each{ |task| array_of_tasks << task if task.favorite}
    # tasks.each do |task|
    #   if task.favorite
    #     array_of_tasks << task
    #   end
    # end
    return array_of_tasks
  end
end
