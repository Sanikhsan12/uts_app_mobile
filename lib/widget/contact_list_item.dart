import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactListItem extends StatelessWidget {
  final ContactModel contact;
  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade300,
          child: Text(
            contact.initials,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        title: Text(contact.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        subtitle: Text(contact.phoneNumber),
        trailing: IconButton(
          icon: const Icon(Icons.call_outlined),
          onPressed: () {},
        ));
  }
}
