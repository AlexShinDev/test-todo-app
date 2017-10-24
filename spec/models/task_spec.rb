require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete' do
    it 'should switch complete to false if it began as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite' do
    it 'should switch favorite from true to false' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it 'should switch favorite from false to true' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return true if Time.now if greater than the deadline' do
      task = Task.create(deadline: Time.now.yesterday)
      expect(task.overdue?).to eq(true)
    end
    it 'should return false if Time.now if less than the deadline' do
      task = Task.create(deadline: Time.now.tomorrow)
      expect(task.overdue?).to eq(false)
    end
  end

    describe '#increment_priority!' do
      it 'should return priority plus 1' do
        task = Task.create(priority: 10)
        task.increment_priority!
        expect(task.priority).to eq(10)
      end
    end

    describe '#decrement_priority!' do
      it 'should return priority minus 1' do
        task = Task.create(priority: 5)
        task.decrement_priority!
        expect(task.priority).to eq(4)
      end
    end

    describe '#snooze_hour!' do
      it 'should update the deadline by 1 hour' do
        time = Time.now
        task = Task.create(deadline: time)
        task.snooze_hour!
        expect(task.deadline).to eq(time + 1.hour)
      end
    end

end
