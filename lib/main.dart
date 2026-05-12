import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================= MAIN APP =================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InputPage());
  }
}

// ================= INPUT PAGE =================
class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController namaController = TextEditingController();

  final TextEditingController ttlController = TextEditingController();

  final TextEditingController jkController = TextEditingController();

  final TextEditingController alamatController = TextEditingController();

  final TextEditingController agamaController = TextEditingController();

  final TextEditingController pendidikanController = TextEditingController();

  final TextEditingController hpController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EDF2),

      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        elevation: 0,
        title: Text("Input Data Diri", style: TextStyle(color: Colors.white)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Silakan lengkapi data profil Anda di bawah ini :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              SizedBox(height: 20),

              buildTextField(
                controller: namaController,
                label: "Nama Lengkap",
                icon: Icons.person,
              ),

              buildTextField(
                controller: ttlController,
                label: "Tempat/Tgl Lahir",
                icon: Icons.calendar_month,
              ),

              buildTextField(
                controller: jkController,
                label: "Jenis Kelamin",
                icon: Icons.wc,
              ),

              buildTextField(
                controller: alamatController,
                label: "Alamat",
                icon: Icons.home,
              ),

              buildTextField(
                controller: agamaController,
                label: "Agama",
                icon: Icons.favorite,
              ),

              buildTextField(
                controller: pendidikanController,
                label: "Pendidikan",
                icon: Icons.school,
              ),

              buildTextField(
                controller: hpController,
                label: "No. HP/WA",
                icon: Icons.phone,
              ),

              buildTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF009688),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          nama: namaController.text,
                          ttl: ttlController.text,
                          jk: jkController.text,
                          alamat: alamatController.text,
                          agama: agamaController.text,
                          pendidikan: pendidikanController.text,
                          hp: hpController.text,
                          email: emailController.text,
                        ),
                      ),
                    );
                  },

                  child: Text(
                    "Lihat Profil",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= TEXT FIELD =================
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          labelText: label,

          prefixIcon: Icon(icon, color: Color(0xFF009688)),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

// ================= PROFILE PAGE =================
class ProfilePage extends StatelessWidget {
  final String nama;
  final String ttl;
  final String jk;
  final String alamat;
  final String agama;
  final String pendidikan;
  final String hp;
  final String email;

  ProfilePage({
    required this.nama,
    required this.ttl,
    required this.jk,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.hp,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EDF2),

      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            width: double.infinity,

            padding: EdgeInsets.only(top: 60, bottom: 30),

            decoration: BoxDecoration(
              color: Color(0xFF009688),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),

            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),

                    Text(
                      "Profil Saya",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/priska.jpeg'),
                ),

                SizedBox(height: 20),

                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  pendidikan,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
          ),

          // ================= DETAIL PROFILE =================
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),

                child: Column(
                  children: [
                    buildProfileItem(
                      Icons.calendar_month,
                      "Tempat/Tgl Lahir",
                      ttl,
                    ),

                    buildProfileItem(Icons.wc, "Jenis Kelamin", jk),

                    buildProfileItem(Icons.home, "Alamat", alamat),

                    buildProfileItem(Icons.favorite, "Agama", agama),

                    buildProfileItem(Icons.phone, "No. HP/WA", hp),

                    buildProfileItem(Icons.email, "Email", email),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= PROFILE ITEM =================
  Widget buildProfileItem(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Color(0xFF009688), size: 30),

              SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),

                    SizedBox(height: 5),

                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Divider(height: 30),
        ],
      ),
    );
  }
}