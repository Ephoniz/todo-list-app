#require 'rspec'
#require 'task_filter'

#describe 'task_filter.rb' do
# params = { search: {user: 1,
#                      deadline: '30-11-2021',
#                      importance: 1,
#                      status: 'to_do'} }
#
#  subject { TaskFilter.new(params) }

#  describe 'filter_by_deadline' do
#    it 'should return all tasks before a specific deadline' do
#      expect(subject.filter!.size).to eq 3
#   end
#  end
#end