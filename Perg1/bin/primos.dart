bool isPrime(n) {
  for (var i = 2; i <= n / i; ++i) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  var primos = [];
  int soma = 0;
  for (var i = 100; i <= 200; i++) {
    if (isPrime(i)) {
      primos.add(i);
      soma = soma + i;
    } else {}
  }
  print('A soma dos primos é $soma,a média é ${soma / primos.length}');
}
