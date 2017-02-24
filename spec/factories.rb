FactoryGirl.define do
  factory(:worker) do
    email 'email@email.com'
    password 'password'
  end

  factory(:job) do
    title 'Rebuild death star'
    description 'Damn space wizards destroyed my death star'
  end
end
