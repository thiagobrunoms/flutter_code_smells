class Service {
  Future<void> signUp(String name, String age, String email, String cpf,
      String address, DateTime begin, DateTime end) async {
    print(
        "Name: $name, Age: $age, Email: $email, Cpf: $cpf, Address: $address, Begin: $begin, end: $end,");
  }
}
