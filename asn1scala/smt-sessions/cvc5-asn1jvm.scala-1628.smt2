; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45910 () Bool)

(assert start!45910)

(declare-fun res!186511 () Bool)

(declare-fun e!150556 () Bool)

(assert (=> start!45910 (=> (not res!186511) (not e!150556))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45910 (= res!186511 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111100000000000000000000000)))))

(assert (=> start!45910 e!150556))

(assert (=> start!45910 true))

(declare-fun b!221739 () Bool)

(assert (=> b!221739 (= e!150556 false)))

(declare-datatypes ((Unit!15807 0))(
  ( (Unit!15808) )
))
(declare-datatypes ((tuple3!1062 0))(
  ( (tuple3!1063 (_1!10166 Unit!15807) (_2!10166 (_ BitVec 32)) (_3!673 Bool)) )
))
(declare-fun lt!350171 () tuple3!1062)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1062)

(assert (=> b!221739 (= lt!350171 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000010111 true))))

(assert (= (and start!45910 res!186511) b!221739))

(declare-fun m!340259 () Bool)

(assert (=> b!221739 m!340259))

(push 1)

(assert (not b!221739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

