; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15218 () Bool)

(assert start!15218)

(declare-datatypes ((array!3278 0))(
  ( (array!3279 (arr!2124 (Array (_ BitVec 32) (_ BitVec 8))) (size!1523 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3278)

(assert (=> start!15218 (and (bvslt #b00000000000000000000000000000000 (size!1523 charSet!2)) (bvsgt #b00000000000000000000000000000000 (size!1523 charSet!2)))))

(declare-fun array_inv!1369 (array!3278) Bool)

(assert (=> start!15218 (array_inv!1369 charSet!2)))

(declare-fun bs!5953 () Bool)

(assert (= bs!5953 start!15218))

(declare-fun m!123473 () Bool)

(assert (=> bs!5953 m!123473))

(push 1)

(assert (not start!15218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

