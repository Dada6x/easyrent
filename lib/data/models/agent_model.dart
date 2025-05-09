class Agent {
  final String name;
  final String role;
  final String avatar;

  const Agent(this.name, this.role, this.avatar);

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(json['name'], json['role'], json['avatar']);
  }
}
