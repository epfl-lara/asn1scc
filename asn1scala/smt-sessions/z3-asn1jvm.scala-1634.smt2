; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45960 () Bool)

(assert start!45960)

(declare-fun res!186650 () Bool)

(declare-fun e!150795 () Bool)

(assert (=> start!45960 (=> (not res!186650) (not e!150795))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45960 (= res!186650 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111000000000000000000000000000000000000000)))))

(assert (=> start!45960 e!150795))

(assert (=> start!45960 true))

(declare-fun b!222078 () Bool)

(assert (=> b!222078 (= e!150795 false)))

(declare-datatypes ((Unit!15921 0))(
  ( (Unit!15922) )
))
(declare-datatypes ((tuple3!1088 0))(
  ( (tuple3!1089 (_1!10179 Unit!15921) (_2!10179 (_ BitVec 32)) (_3!686 Bool)) )
))
(declare-fun lt!350792 () tuple3!1088)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1088)

(assert (=> b!222078 (= lt!350792 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000100111 true))))

(assert (= (and start!45960 res!186650) b!222078))

(declare-fun m!340461 () Bool)

(assert (=> b!222078 m!340461))

(check-sat (not b!222078))
