modality = Modality.create name: 'Jiu-Jitsu'
modality.levels.create name: 'Branca', color: '#FFFFFF', position: 0
modality.levels.create name: 'Azul', color: '#3772B6', position: 1
modality.levels.create name: 'Roxa', color: '#8E34D4', position: 2
modality.levels.create name: 'Marrom', color: '#5C3C1B', position: 3
modality.levels.create name: 'Preta', color: '#000000', position: 4

modality = Modality.create name: 'Muay Thai'
modality.levels.create name: 'Branca', color: '#FFFFFF', position: 0
modality.levels.create name: 'Vermelha', color: '#D33E23', position: 1
modality.levels.create name: 'Azul Claro', color: '#1393D7', position: 2
modality.levels.create name: 'Azul Escuro', color: '#1C3479', position: 3
modality.levels.create name: 'Preta', color: '#000000', position: 4

modality = Modality.create name: 'Tae Kwon Do'
modality.levels.create name: 'Branca', color: '#FFFFFF', position: 0
modality.levels.create name: 'Cinza', color: '#BBB9BC', position: 1
modality.levels.create name: 'Amarela', color: '#F1CF46', position: 2
modality.levels.create name: 'Laranja', color: '#F1CF46', position: 3
modality.levels.create name: 'Verde', color: '#439543', position: 4
modality.levels.create name: 'Roxa', color: '#9532BF', position: 5
modality.levels.create name: 'Azul', color: '#0E30EF', position: 6
modality.levels.create name: 'Marrom', color: '#5F3731', position: 7
modality.levels.create name: 'Vermelha', color: '#E33624', position: 8
modality.levels.create name: 'Preta', color: '#000000', position: 9

Teacher.create code: '1', name: 'Bruce Lee'
Teacher.create code: '2', name: 'Miyagi'

t = Teacher.create code: '3', name: 'Daniel San'
t.student = true
t.save

Student.create code: '4', name: 'Dre Parker'
Student.create code: '5', name: 'John'
Student.create code: '6', name: 'Paul'
Student.create code: '7', name: 'George'
Student.create code: '8', name: 'Ringo'
Student.create code: '9', name: 'Mick'
Student.create code: '10', name: 'Keith'
Student.create code: '11', name: 'Ron'
Student.create code: '12', name: 'Charlie'

Room.create name: 'Principal', position: 0
Room.create name: 'Segundo Piso', position: 1
Room.create name: 'Externo', position: 2

Classroom.create name: 'Jiu-Jitsu Men', modality: Modality.first, teacher: Teacher.first, room: Room.first, day_of_week: 1, start_at:20, duration:3600, personal: false
Classroom.create name: 'Muay Thai Women', modality: Modality.second, teacher: Teacher.first, room: Room.first, day_of_week: 1, start_at:21, duration:3600, personal: false
Classroom.create name: 'Muay Thai Men', modality: Modality.second, teacher: Teacher.second, room: Room.second, day_of_week: 2, start_at:19, duration:3600, personal: false

Student.all.each do |student|
  student.subscriptions.create classroom: Classroom.offset(rand(Classroom.count)).first
  student.subscriptions.create classroom: Classroom.offset(rand(Classroom.count)).first
end

Student.all.each do |student|
  student.subscriptions.each do |subscription|
    modality = subscription.classroom.modality
    level1 = modality.levels.first
    level2 = modality.levels.offset(rand(1..modality.levels.count)).first

    student.levels.create modality: modality, level: level1, date: rand(365).days.ago
    student.levels.create modality: modality, level: level2, date: rand(365).days.ago
  end
end

User.create name: 'Felipe', email: 'felipediesel@gmail.com', password: '12345678'
