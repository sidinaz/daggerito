class A1 {}

class A2 {}

class B1 {
  B1(C2 model1) {
    assert(model1 != null);
  }
}

class B2 {}

class C1 {
  C1(A2 model1) {
    assert(model1 != null);
  }
}

class C2 {}

class D1 {}

class D2 {}

class E1 {
  E1(A1 model1, D1 model2) {
    assert(model1 != null);
    assert(model2 != null);
  }
}

class E2 {}

class F1 {
  final String description;

  F1({this.description});
}

class G1 {}

class G2 {}

class H1 {
  H1(A2 model1, B1 model2, D1 model3, F1 model4, F1 model5, H2 model6,
      I2 model7) {
    assert(model1 != null);
    assert(model2 != null);
    assert(model3 != null);
    assert(model4 != null);
    assert(model5 != null);
    assert(model6 != null);
    assert(model7 != null);
    assert(model4.description != model5.description);
  }
}

class H2 {}

class I1 {}

class I2 {
  I2(G1 model1) {
    assert(model1 != null);
  }
}
