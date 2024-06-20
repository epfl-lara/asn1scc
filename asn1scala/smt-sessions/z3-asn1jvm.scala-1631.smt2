; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45936 () Bool)

(assert start!45936)

(declare-fun res!186587 () Bool)

(declare-fun e!150687 () Bool)

(assert (=> start!45936 (=> (not res!186587) (not e!150687))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45936 (= res!186587 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> start!45936 e!150687))

(assert (=> start!45936 true))

(declare-fun b!221925 () Bool)

(assert (=> b!221925 (= e!150687 false)))

(declare-datatypes ((Unit!15870 0))(
  ( (Unit!15871) )
))
(declare-datatypes ((tuple3!1076 0))(
  ( (tuple3!1077 (_1!10173 Unit!15870) (_2!10173 (_ BitVec 32)) (_3!680 Bool)) )
))
(declare-fun lt!350513 () tuple3!1076)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1076)

(assert (=> b!221925 (= lt!350513 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000011111 true))))

(assert (= (and start!45936 res!186587) b!221925))

(declare-fun m!340371 () Bool)

(assert (=> b!221925 m!340371))

(check-sat (not b!221925))
