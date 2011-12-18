# -*- coding: utf-8 -*-

# Faculties
Faculty.delete_all
FAUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Arquitectura da Universidade do Porto',
  :acronym => 'FAUP',
  :faculty_type => '0',
  :url => 'http://www.fa.up.pt')
FBAUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Belas Artes da Universidade do Porto',
  :acronym => 'FBAUP',
  :faculty_type => '0',
  :url => 'http://www.fba.up.pt')
FCUP = Faculty.create!(:faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Ciências da Universidade do Porto',
  :acronym => 'FCUP',
  :faculty_type => '0',
  :url => 'http://www.fc.up.pt')
FCNAUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Ciências da Nutrição e Alimentação da Universidade do Porto',
  :acronym => 'FCNAUP',
  :faculty_type => '0',
  :url => 'http://www.fcna.up.pt')
FADEUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Desporto da Universidade do Porto',
  :acronym => 'FADEUP',
  :faculty_type => '0',
  :url => 'http://www.fade.up.pt')
FDUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Direito da Universidade do Porto',
  :acronym => 'FDUP',
  :faculty_type => '0',
  :url => 'http://www.fd.up.pt')
FEP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Economia da Universidade do Porto',
  :acronym => 'FEP',
  :faculty_type => '0',
  :url => 'http://www.fep.up.pt')
FEUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Engenharia da Universidade do Porto',
  :acronym => 'FEUP',
  :faculty_type => '0',
  :url => 'http://www.fe.up.pt')
FFUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Farmácia da Universidade do Porto',
  :acronym => 'FFUP',
  :faculty_type => '0',
  :url => 'http://www.ff.up.pt')
FLUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Letras da Universidade do Porto',
  :acronym => 'FLUP',
  :faculty_type => '0',
  :url => 'http://www.fl.up.pt')
FMUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Medicina da Universidade do Porto',
  :acronym => 'FMUP',
  :faculty_type => '0',
  :url => 'http://www.med.up.pt')
FMDUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Medicina Dentária da Universidade do Porto',
  :acronym => 'FMDUP',
  :faculty_type => '0',
  :url => 'http://www.fmd.up.pt')
FPCEUP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Faculdade de Psicologia e de Ciências da Educação da Universidade do Porto',
  :acronym => 'FPCEUP',
  :faculty_type => '0',
  :url => 'http://www.fpce.up.pt')
ICBAS = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Instituto de Ciências Biomédicas Abel Salazar',
  :acronym => 'ICBAS',
  :faculty_type => '0',
  :url => 'http://www.icbas.up.pt')
EGP = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Escola de Negócios da Universidade do Porto',
  :acronym => 'EGP',
  :faculty_type => '0',
  :url => 'http://www.egp.up.pt/')
REIT = Faculty.create!(
  :faculty_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => 'Reitoria da Universidade do Porto',
  :acronym => 'REIT',
  :faculty_type => '0',
  :url => 'http://www.reit.up.pt')

# Courses
Course.delete_all
MIB = Course.create!(
  :course_id => UUIDTools::UUID.timestamp_create().to_s,
  :faculty_id => FEUP.faculty_id,
  :name => 'Mestrado Integrado em Bioengenharia',
  :acronym => 'MIB',
  :degree => 2, 
  :begin => '2006/2007')
MIEC = Course.create!(
  :course_id => UUIDTools::UUID.timestamp_create().to_s,
  :faculty_id => FEUP.faculty_id,
  :name => 'Mestrado Integrado em Engenharia Civil',
  :acronym => 'MIEC',
  :degree => 2, 
  :begin => '2006/2007')
MIEIC = Course.create!(
  :course_id => UUIDTools::UUID.timestamp_create().to_s,
  :faculty_id => FEUP.faculty_id,
  :name => 'Mestrado Integrado em Engenharia Informática e Computação',
  :acronym => 'MIEIC',
  :degree => 2, 
  :begin => '2006/2007')

# Disciplnes
Discipline.delete_all
LDSO = Discipline.create!(
  :discipline_id => UUIDTools::UUID.timestamp_create().to_s,
  :code => 'EIC0086',
  :name => 'Laboratório de Desenvolvimento de Software',
  :acronym => 'LDSO',
  :course_id => MIEIC.course_id,
  :semester => 1,
  :year => 4)
MFES = Discipline.create!(
  :discipline_id => UUIDTools::UUID.timestamp_create().to_s,
  :code => 'EIC0039',
  :name => 'Métodos Formais em Engenharia de Software',
  :acronym => 'MFES',
  :course_id => MIEIC.course_id,
  :semester => 1,
  :year => 4)

# Users
User.delete_all
ADMIN = User.create!(
  :email => "admin@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 1)
USER1 = User.create!(
  :email => "user1@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 0)
USER2 = User.create!(
  :email => "user2@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 0)
USER3 = User.create!(
  :email => "user3@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 0)
USER4 = User.create!(
  :email => "user4@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 0)
USER5 = User.create!(
  :email => "user5@studyspots.com",
  :password => "123456",
  :password_confirmation => "123456",
  :confirmed_at => DateTime.now,
  :confirmation_sent_at => DateTime.now,
  :admin => 0)

# UserDisciplines
UserDisciplines.delete_all
ADMINDISC1 = UserDisciplines.create!(
  :user_disciplines_id => UUIDTools::UUID.timestamp_create().to_s,
  :discipline_id => LDSO.discipline_id,
  :user_id => ADMIN.id)

# Spots
Spot.delete_all
SPOT1 = Spot.create!(
  :spot_id => UUIDTools::UUID.timestamp_create().to_s,
  :name => "Biblioteca",
  :local => "FEUP",
  :discipline_id => LDSO.discipline_id,
  :user_id => ADMIN.id
)

# WallDisciplines
WallDisciplines.delete_all
WDCOM1 = WallDisciplines.create!(
  :wall_disciplines_id => UUIDTools::UUID.timestamp_create().to_s,
  :discipline_id => LDSO.discipline_id,
  :user_id => ADMIN.id,
  :comment => "Está disciplina é mesmo fácil!"
)
WDCOM2 = WallDisciplines.create!(
  :wall_disciplines_id => UUIDTools::UUID.timestamp_create().to_s,
  :discipline_id => LDSO.discipline_id,
  :user_id => ADMIN.id,
  :comment => "Mas dá muito trabalho!"
)