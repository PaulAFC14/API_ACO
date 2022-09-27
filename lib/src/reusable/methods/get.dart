class Get {
  List<String> userData(String data) {
    List<String> userData = [];
    int a = 0;

    //Name
    String name = '';
    int nameC = 0;
    int nameData = data.lastIndexOf('"name"');
    a = nameData + 8;

    do {
      if (data[a] != '"') {
        name += data[a];
        a++;
      } else {
        nameC = 1;
      }
    } while (nameC == 0);
    userData.add(name);

    //Lastname
    String lastname = '';
    int lastnameC = 0;
    int lastnameData = data.lastIndexOf('"lastname"');
    a = lastnameData + 12;

    do {
      if (data[a] != '"') {
        lastname += data[a];
        a++;
      } else {
        lastnameC = 1;
      }
    } while (lastnameC == 0);
    userData.add(lastname);

    //Email
    String email = '';
    int emailC = 0;
    int emailData = data.lastIndexOf('"email"');
    a = emailData + 9;

    do {
      if (data[a] != '"') {
        email += data[a];
        a++;
      } else {
        emailC = 1;
      }
    } while (emailC == 0);
    userData.add(email);

    //Phone
    String phone = '';
    int phoneC = 0;
    int phoneData = data.lastIndexOf('"phone_number":"');
    a = phoneData + 16;

    do {
      if (data[a] != '"') {
        phone += data[a];
        a++;
      } else {
        phoneC = 1;
      }
    } while (phoneC == 0);
    userData.add(phone);

    //Token
    String token = '';
    int tokenC = 0;
    int tokenData = data.lastIndexOf('"token":"');
    a = tokenData + 9;

    do {
      if (data[a] != '"') {
        token += data[a];
        a++;
      } else {
        tokenC = 1;
      }
    } while (tokenC == 0);
    userData.add(token);

    return userData;
  }
}
