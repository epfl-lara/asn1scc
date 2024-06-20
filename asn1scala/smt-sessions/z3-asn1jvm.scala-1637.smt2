; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45984 () Bool)

(assert start!45984)

(declare-fun res!186705 () Bool)

(declare-fun e!150887 () Bool)

(assert (=> start!45984 (=> (not res!186705) (not e!150887))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45984 (= res!186705 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111100000000000000000000000000000000000000000000000)))))

(assert (=> start!45984 e!150887))

(assert (=> start!45984 true))

(declare-fun b!222207 () Bool)

(assert (=> b!222207 (= e!150887 false)))

(declare-datatypes ((Unit!15963 0))(
  ( (Unit!15964) )
))
(declare-datatypes ((tuple3!1100 0))(
  ( (tuple3!1101 (_1!10185 Unit!15963) (_2!10185 (_ BitVec 32)) (_3!692 Bool)) )
))
(declare-fun lt!351023 () tuple3!1100)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1100)

(assert (=> b!222207 (= lt!351023 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000101111 true))))

(assert (= (and start!45984 res!186705) b!222207))

(declare-fun m!340535 () Bool)

(assert (=> b!222207 m!340535))

(check-sat (not b!222207))
