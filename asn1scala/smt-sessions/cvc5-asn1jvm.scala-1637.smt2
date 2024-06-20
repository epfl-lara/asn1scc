; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45982 () Bool)

(assert start!45982)

(declare-fun res!186702 () Bool)

(declare-fun e!150884 () Bool)

(assert (=> start!45982 (=> (not res!186702) (not e!150884))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45982 (= res!186702 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111100000000000000000000000000000000000000000000000)))))

(assert (=> start!45982 e!150884))

(assert (=> start!45982 true))

(declare-fun b!222204 () Bool)

(assert (=> b!222204 (= e!150884 false)))

(declare-datatypes ((Unit!15961 0))(
  ( (Unit!15962) )
))
(declare-datatypes ((tuple3!1098 0))(
  ( (tuple3!1099 (_1!10184 Unit!15961) (_2!10184 (_ BitVec 32)) (_3!691 Bool)) )
))
(declare-fun lt!351020 () tuple3!1098)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1098)

(assert (=> b!222204 (= lt!351020 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000101111 true))))

(assert (= (and start!45982 res!186702) b!222204))

(declare-fun m!340533 () Bool)

(assert (=> b!222204 m!340533))

(push 1)

(assert (not b!222204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

