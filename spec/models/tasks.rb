require 'rails_helper'

describe Task do
  it 'requires a description' do
    task = Task.new
    expect(task).to_not be_valid
    expect(task).to have(1).error_on(:description)
  end
end