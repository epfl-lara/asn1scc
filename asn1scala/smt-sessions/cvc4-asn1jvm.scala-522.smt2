; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15222 () Bool)

(assert start!15222)

(declare-datatypes ((array!3282 0))(
  ( (array!3283 (arr!2126 (Array (_ BitVec 32) (_ BitVec 8))) (size!1525 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3282)

(assert (=> start!15222 (and (bvslt #b00000000000000000000000000000000 (size!1525 charSet!2)) (bvsgt #b00000000000000000000000000000000 (size!1525 charSet!2)))))

(declare-fun array_inv!1371 (array!3282) Bool)

(assert (=> start!15222 (array_inv!1371 charSet!2)))

(declare-fun bs!5955 () Bool)

(assert (= bs!5955 start!15222))

(declare-fun m!123477 () Bool)

(assert (=> bs!5955 m!123477))

(push 1)

(assert (not start!15222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

