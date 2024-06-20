; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46010 () Bool)

(assert start!46010)

(declare-fun res!186753 () Bool)

(declare-fun e!150962 () Bool)

(assert (=> start!46010 (=> (not res!186753) (not e!150962))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46010 (= res!186753 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111100000000000000000000000000000000000000000000000) (bvsge v!298 #b1111111110000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46010 e!150962))

(assert (=> start!46010 true))

(declare-fun b!222309 () Bool)

(assert (=> b!222309 (= e!150962 false)))

(declare-datatypes ((Unit!15998 0))(
  ( (Unit!15999) )
))
(declare-datatypes ((tuple3!1114 0))(
  ( (tuple3!1115 (_1!10192 Unit!15998) (_2!10192 (_ BitVec 32)) (_3!699 Bool)) )
))
(declare-fun lt!351197 () tuple3!1114)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1114)

(assert (=> b!222309 (= lt!351197 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000110111 true))))

(assert (= (and start!46010 res!186753) b!222309))

(declare-fun m!340591 () Bool)

(assert (=> b!222309 m!340591))

(push 1)

(assert (not b!222309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

