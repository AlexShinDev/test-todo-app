require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should return true if all tasks are completed' do
      list = List.create(name: "chores")
      task1 = Task.create(list_id: list.id, complete: false)
      task2 = Task.create(list_id: list.id, complete: false)

      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end

    end
  end

  describe '#snooze_all_tasks!' do
    it 'should increase the deadline of all tasks by 1 hour' do
      list = List.create(name: "chores")
      time = Time.now
      task1 = Task.create(list_id: list.id, deadline: time)
      task2 = Task.create(list_id: list.id, deadline: time)

      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(time + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it 'should give the sum of all the durations' do
      list = List.create(name: "chores")
      task1 = Task.create(list_id: list.id, duration: 3)
      task2 = Task.create(list_id: list.id, duration: 2)
      task3 = Task.create(list_id: list.id, duration: 2)


      expect(list.total_duration).to eq(7)
    end
  end

  describe '#incomplete_tasks' do
    it 'should return an array of incomplete_tasks' do
      list = List.create(name: "chores")
      task1 = Task.create(list_id: list.id, name: "Go home", complete: true)
      task2 = Task.create(list_id: list.id, name: "Eat food", complete: false)
      task3 = Task.create(list_id: list.id, name: "Arrange transportation", complete: false)

      expect(list.incomplete_tasks).to eq([task2, task3])
    end
  end

  describe '#favorite_tasks' do
    it 'should return an array of you favorite tasks' do
      list = List.create(name: "chores")
      task1 = Task.create(list_id: list.id, name: "Go home", favorite: false)
      task2 = Task.create(list_id: list.id, name: "Eat food", favorite: false)
      task3 = Task.create(list_id: list.id, name: "Arrange transportation", favorite: false)

      expect(list.favorite_tasks).to eq([])
    end
  end

end
