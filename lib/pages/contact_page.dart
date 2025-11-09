import "package:flutter/material.dart";

// ! model dan widget
import '../models/contact_model.dart';
import '../widget/contact_list_item.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final List<ContactModel> contacts = [
    ContactModel(
        name: "John Doe", phoneNumber: "0812-3456-7890", initials: "JD"),
    ContactModel(
        name: "Jane Smith", phoneNumber: "0823-4567-8901", initials: "JS"),
    ContactModel(
        name: "Ahmad Subarjo", phoneNumber: "0834-5678-9012", initials: "AS"),
    ContactModel(
        name: "Siti Nurbaya", phoneNumber: "0845-6789-0123", initials: "SN"),
    ContactModel(
        name: "Michael Lee", phoneNumber: "0856-7890-1234", initials: "ML"),
    ContactModel(
        name: "David Kim", phoneNumber: "0876-5432-1098", initials: "DK"),
    ContactModel(
        name: "Budi Santoso", phoneNumber: "0887-6543-2109", initials: "BS"),
    ContactModel(
        name: "Maria Garcia", phoneNumber: "0890-1234-5678", initials: "MG"),
    ContactModel(
        name: "Kevin Wang", phoneNumber: "0811-2233-4455", initials: "KW"),
    ContactModel(
        name: "Putri Lestari", phoneNumber: "0822-3344-5566", initials: "PL"),
    ContactModel(
        name: "Andi Pratama", phoneNumber: "0833-4455-6677", initials: "AP"),
    ContactModel(
        name: "Lisa Wong", phoneNumber: "0844-5566-7788", initials: "LW"),
    ContactModel(
        name: "Rina Sari", phoneNumber: "0855-6677-8899", initials: "RS"),
    ContactModel(
        name: "Tommy Nguyen", phoneNumber: "0866-7788-9900", initials: "TN"),
    ContactModel(
        name: "Dewi Anggraini", phoneNumber: "0877-8899-0011", initials: "DA"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ! Judul Halaman
            const Text(
              "Daftar Kontak",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // ! List Kontak
            Expanded(
              child: Container(
                // ! Style Container List
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // ! List Kontak builder
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: ListView.separated(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return ContactListItem(contact: contacts[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
