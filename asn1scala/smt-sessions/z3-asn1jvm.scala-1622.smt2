; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45864 () Bool)

(assert start!45864)

(declare-fun res!186335 () Bool)

(declare-fun e!150237 () Bool)

(assert (=> start!45864 (=> (not res!186335) (not e!150237))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45864 (= res!186335 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111111111110000000)))))

(assert (=> start!45864 e!150237))

(assert (=> start!45864 true))

(declare-fun b!221277 () Bool)

(assert (=> b!221277 (= e!150237 false)))

(declare-datatypes ((Unit!15654 0))(
  ( (Unit!15655) )
))
(declare-datatypes ((tuple3!1040 0))(
  ( (tuple3!1041 (_1!10155 Unit!15654) (_2!10155 (_ BitVec 32)) (_3!662 Bool)) )
))
(declare-fun lt!349298 () tuple3!1040)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1040)

(assert (=> b!221277 (= lt!349298 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000000111 true))))

(assert (= (and start!45864 res!186335) b!221277))

(declare-fun m!339975 () Bool)

(assert (=> b!221277 m!339975))

(check-sat (not b!221277))
