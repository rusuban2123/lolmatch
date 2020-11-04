class Weekday < ActiveHash::Base
  self.data = [
    { id: 1, name: '土日祝日' }, { id: 2, name: '平日' },{ id: 3, name: '毎日' } 
    

  ]
end