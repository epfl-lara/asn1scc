; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45938 () Bool)

(assert start!45938)

(declare-fun res!186590 () Bool)

(declare-fun e!150690 () Bool)

(assert (=> start!45938 (=> (not res!186590) (not e!150690))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45938 (= res!186590 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> start!45938 e!150690))

(assert (=> start!45938 true))

(declare-fun b!221928 () Bool)

(assert (=> b!221928 (= e!150690 false)))

(declare-datatypes ((Unit!15872 0))(
  ( (Unit!15873) )
))
(declare-datatypes ((tuple3!1078 0))(
  ( (tuple3!1079 (_1!10174 Unit!15872) (_2!10174 (_ BitVec 32)) (_3!681 Bool)) )
))
(declare-fun lt!350516 () tuple3!1078)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1078)

(assert (=> b!221928 (= lt!350516 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000011111 true))))

(assert (= (and start!45938 res!186590) b!221928))

(declare-fun m!340373 () Bool)

(assert (=> b!221928 m!340373))

(push 1)

(assert (not b!221928))

(check-sat)

