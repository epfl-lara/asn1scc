; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45912 () Bool)

(assert start!45912)

(declare-fun res!186514 () Bool)

(declare-fun e!150559 () Bool)

(assert (=> start!45912 (=> (not res!186514) (not e!150559))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45912 (= res!186514 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111100000000000000000000000)))))

(assert (=> start!45912 e!150559))

(assert (=> start!45912 true))

(declare-fun b!221742 () Bool)

(assert (=> b!221742 (= e!150559 false)))

(declare-datatypes ((Unit!15809 0))(
  ( (Unit!15810) )
))
(declare-datatypes ((tuple3!1064 0))(
  ( (tuple3!1065 (_1!10167 Unit!15809) (_2!10167 (_ BitVec 32)) (_3!674 Bool)) )
))
(declare-fun lt!350174 () tuple3!1064)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1064)

(assert (=> b!221742 (= lt!350174 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000010111 true))))

(assert (= (and start!45912 res!186514) b!221742))

(declare-fun m!340261 () Bool)

(assert (=> b!221742 m!340261))

(check-sat (not b!221742))
