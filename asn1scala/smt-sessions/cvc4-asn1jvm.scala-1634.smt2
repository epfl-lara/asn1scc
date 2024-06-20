; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45962 () Bool)

(assert start!45962)

(declare-fun res!186653 () Bool)

(declare-fun e!150798 () Bool)

(assert (=> start!45962 (=> (not res!186653) (not e!150798))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45962 (= res!186653 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111000000000000000000000000000000000000000)))))

(assert (=> start!45962 e!150798))

(assert (=> start!45962 true))

(declare-fun b!222081 () Bool)

(assert (=> b!222081 (= e!150798 false)))

(declare-datatypes ((Unit!15923 0))(
  ( (Unit!15924) )
))
(declare-datatypes ((tuple3!1090 0))(
  ( (tuple3!1091 (_1!10180 Unit!15923) (_2!10180 (_ BitVec 32)) (_3!687 Bool)) )
))
(declare-fun lt!350795 () tuple3!1090)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1090)

(assert (=> b!222081 (= lt!350795 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000100111 true))))

(assert (= (and start!45962 res!186653) b!222081))

(declare-fun m!340463 () Bool)

(assert (=> b!222081 m!340463))

(push 1)

(assert (not b!222081))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

