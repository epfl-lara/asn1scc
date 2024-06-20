; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45934 () Bool)

(assert start!45934)

(declare-fun res!186584 () Bool)

(declare-fun e!150684 () Bool)

(assert (=> start!45934 (=> (not res!186584) (not e!150684))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45934 (= res!186584 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> start!45934 e!150684))

(assert (=> start!45934 true))

(declare-fun b!221922 () Bool)

(assert (=> b!221922 (= e!150684 false)))

(declare-datatypes ((Unit!15868 0))(
  ( (Unit!15869) )
))
(declare-datatypes ((tuple3!1074 0))(
  ( (tuple3!1075 (_1!10172 Unit!15868) (_2!10172 (_ BitVec 32)) (_3!679 Bool)) )
))
(declare-fun lt!350510 () tuple3!1074)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1074)

(assert (=> b!221922 (= lt!350510 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000011111 true))))

(assert (= (and start!45934 res!186584) b!221922))

(declare-fun m!340369 () Bool)

(assert (=> b!221922 m!340369))

(push 1)

(assert (not b!221922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

