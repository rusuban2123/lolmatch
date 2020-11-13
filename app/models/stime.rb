class Stime < ActiveHash::Base
  self.data = [
    { id: 1, name: '朝' }, { id: 2, name: '昼' }, { id: 3, name: '夕' },
    { id: 4, name: '夜' }, { id: 5, name: '深夜' }
  ]
end
