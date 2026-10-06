import '../../core/theme/google_colors.dart';
import '../../domain/models/contact.dart';
import '../../domain/models/user.dart';

class ContactRepository {
  static const UserModel defaultUser = UserModel(
    name: 'Alex Rivera',
    email: 'alex.rivera@gmail.com',
    phone: '+1 (555) 789-0123',
    role: 'Software Developer',
  );

  static const List<Contact> famousContacts = [
    Contact(
      name: 'Ada Lovelace',
      phone: '+1 (555) 181-5184',
      email: 'ada.lovelace@gmail.com',
      role: 'World’s First Computer Programmer',
      avatarColor: GoogleColors.blue,
    ),
    Contact(
      name: 'Alan Turing',
      phone: '+1 (555) 191-2195',
      email: 'alan.turing@gmail.com',
      role: 'Father of Modern Computer Science',
      avatarColor: GoogleColors.red,
    ),
    Contact(
      name: 'Grace Hopper',
      phone: '+1 (555) 190-6199',
      email: 'grace.hopper@gmail.com',
      role: 'Pioneer of Compilers & COBOL',
      avatarColor: GoogleColors.yellowDark,
    ),
    Contact(
      name: 'Linus Torvalds',
      phone: '+1 (555) 196-9202',
      email: 'linus.torvalds@gmail.com',
      role: 'Creator of the Linux Kernel & Git',
      avatarColor: GoogleColors.green,
    ),
    Contact(
      name: 'Marie Curie',
      phone: '+1 (555) 186-7193',
      email: 'marie.curie@gmail.com',
      role: 'Pioneering Physicist & Nobel Laureate',
      avatarColor: GoogleColors.blue,
    ),
    Contact(
      name: 'Nikola Tesla',
      phone: '+1 (555) 185-6194',
      email: 'nikola.tesla@gmail.com',
      role: 'Electrical Innovator & AC Pioneer',
      avatarColor: GoogleColors.red,
    ),
    Contact(
      name: 'Katherine Johnson',
      phone: '+1 (555) 191-8202',
      email: 'katherine.johnson@gmail.com',
      role: 'NASA Mathematician & Orbital Pioneer',
      avatarColor: GoogleColors.yellowDark,
    ),
    Contact(
      name: 'Steve Wozniak',
      phone: '+1 (555) 195-0202',
      email: 'steve.woz@gmail.com',
      role: 'Apple Co-founder & Hardware Wizard',
      avatarColor: GoogleColors.green,
    ),
  ];
}
