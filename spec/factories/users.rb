FactoryBot.define do
  factory :user do
    teamname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    toprank_id            { 1 }
    jgrank_id             { 2 }
    midrank_id            { 3 }
    suprank_id            { 4 }
    botrank_id            { 5 }
    power_id              { 39 }
    weekday_id            { 2 }
    stime_id              { 1 }
    detail                { 'こんにちは' }
  end
end
