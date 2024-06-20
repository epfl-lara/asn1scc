; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45986 () Bool)

(assert start!45986)

(declare-fun res!186708 () Bool)

(declare-fun e!150890 () Bool)

(assert (=> start!45986 (=> (not res!186708) (not e!150890))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45986 (= res!186708 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111100000000000000000000000000000000000000000000000)))))

(assert (=> start!45986 e!150890))

(assert (=> start!45986 true))

(declare-fun b!222210 () Bool)

(assert (=> b!222210 (= e!150890 false)))

(declare-datatypes ((Unit!15965 0))(
  ( (Unit!15966) )
))
(declare-datatypes ((tuple3!1102 0))(
  ( (tuple3!1103 (_1!10186 Unit!15965) (_2!10186 (_ BitVec 32)) (_3!693 Bool)) )
))
(declare-fun lt!351026 () tuple3!1102)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1102)

(assert (=> b!222210 (= lt!351026 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000101111 true))))

(assert (= (and start!45986 res!186708) b!222210))

(declare-fun m!340537 () Bool)

(assert (=> b!222210 m!340537))

(push 1)

(assert (not b!222210))

(check-sat)

