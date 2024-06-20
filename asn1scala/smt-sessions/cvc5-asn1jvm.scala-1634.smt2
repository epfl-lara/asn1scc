; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45958 () Bool)

(assert start!45958)

(declare-fun res!186647 () Bool)

(declare-fun e!150792 () Bool)

(assert (=> start!45958 (=> (not res!186647) (not e!150792))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45958 (= res!186647 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111000000000000000000000000000000000000000)))))

(assert (=> start!45958 e!150792))

(assert (=> start!45958 true))

(declare-fun b!222075 () Bool)

(assert (=> b!222075 (= e!150792 false)))

(declare-datatypes ((Unit!15919 0))(
  ( (Unit!15920) )
))
(declare-datatypes ((tuple3!1086 0))(
  ( (tuple3!1087 (_1!10178 Unit!15919) (_2!10178 (_ BitVec 32)) (_3!685 Bool)) )
))
(declare-fun lt!350789 () tuple3!1086)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1086)

(assert (=> b!222075 (= lt!350789 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000100111 true))))

(assert (= (and start!45958 res!186647) b!222075))

(declare-fun m!340459 () Bool)

(assert (=> b!222075 m!340459))

(push 1)

(assert (not b!222075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

