require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should return true if all tasks are completed' do
      list = List.new(name: "chores")
      task1 = Task.new(list_id: list.id, complete: false)
      task2 = Task.new(list_id: list.id, complete: false)

      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end

    end
  end

  describe '#snooze_all_tasks!' do
    it 'should increase the deadline of all tasks by 1 hour' do
      list = List.new(name: "chores")
      time = Time.now
      task1 = Task.new(list_id: list.id, deadline: time)
      task2 = Task.new(list_id: list.id, deadline: time)

      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(time + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it 'should give the sum of all the durations' do
      list = List.new(name: "chores")
      task1 = Task.new(list_id: list.id, duration: 3)
      task1.duration
      task2 = Task.new(list_id: list.id, duration: 2)
      task2.duration

      expect(list.total_duration).to eq(5)
    end
  end

  describe 'incomplete_tasks' do
    it 'should return an array of incomplete_tasks' do

    end
  end


end
