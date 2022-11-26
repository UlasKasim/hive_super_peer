abstract class LivingThings {}

class Human extends LivingThings with EatBananaMixin {}

abstract class Animal extends LivingThings {}

class Monkey extends Animal with EatBananaMixin {}

mixin EatBananaMixin {
  void eatBanana() {}
}

void testFunc() {
  Human human = Human();
  human.eatBanana();

  Monkey monkey = Monkey();
  monkey.eatBanana();
}
