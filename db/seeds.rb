modality = Modality.create name: 'Jiu-Jitsu'
modality.levels.create name: 'Branca', color: '#FFFFFF', position: 0
modality.levels.create name: 'Azul', color: '#3772B6', position: 1
modality.levels.create name: 'Roxa', color: '#8E34D4', position: 2
modality.levels.create name: 'Marrom', color: '#5C3C1B', position: 3
modality.levels.create name: 'Preto', color: '#000000', position: 4

modality = Modality.create name: 'Muay Thai'
modality.levels.create name: 'Branca', color: '#FFFFFF', position: 0
modality.levels.create name: 'Vermelha', color: '#D33E23', position: 1
modality.levels.create name: 'Azul Claro', color: '#1393D7', position: 2
modality.levels.create name: 'Azul Escuro', color: '#1C3479', position: 3
modality.levels.create name: 'Preto', color: '#000000', position: 4

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
modality.levels.create name: 'Preto', color: '#000000', position: 9

Teacher.create name: 'Bruce Lee'
Teacher.create name: 'Miyagi'

Student.create name: 'Daniel San'
Student.create name: 'Dre Parker'
Student.create name: 'John'
Student.create name: 'Paul'
Student.create name: 'George'
Student.create name: 'Ringo'
Student.create name: 'Mick'
Student.create name: 'Keith'
Student.create name: 'Ron'
Student.create name: 'Charlie'

Room.create name: 'Principal', position: 0
Room.create name: 'Segundo Piso', position: 1
Room.create name: 'Externo', position: 2

Classroom.create modality: Modality.first, teacher: Teacher.first, room: Room.first, day_of_week: 1, start_at:20, duration:3600, personal: false
Classroom.create modality: Modality.second, teacher: Teacher.first, room: Room.first, day_of_week: 1, start_at:21, duration:3600, personal: false
Classroom.create modality: Modality.second, teacher: Teacher.second, room: Room.second, day_of_week: 2, start_at:19, duration:3600, personal: false


Student.all.each do |student|
  student.subscriptions classroom: Classroom.offset(rand(Classroom.count)).first
end
