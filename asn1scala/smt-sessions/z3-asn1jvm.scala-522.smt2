; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15220 () Bool)

(assert start!15220)

(declare-datatypes ((array!3280 0))(
  ( (array!3281 (arr!2125 (Array (_ BitVec 32) (_ BitVec 8))) (size!1524 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3280)

(assert (=> start!15220 (and (bvslt #b00000000000000000000000000000000 (size!1524 charSet!2)) (bvsgt #b00000000000000000000000000000000 (size!1524 charSet!2)))))

(declare-fun array_inv!1370 (array!3280) Bool)

(assert (=> start!15220 (array_inv!1370 charSet!2)))

(declare-fun bs!5954 () Bool)

(assert (= bs!5954 start!15220))

(declare-fun m!123475 () Bool)

(assert (=> bs!5954 m!123475))

(check-sat (not start!15220))
(check-sat)
