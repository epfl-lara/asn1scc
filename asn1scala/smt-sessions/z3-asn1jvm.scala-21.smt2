; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!572 () Bool)

(assert start!572)

(declare-fun lt!1256 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!572 (= lt!1256 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!572 false))

(assert (=> start!572 true))

(declare-fun bs!478 () Bool)

(assert (= bs!478 start!572))

(declare-fun m!1213 () Bool)

(assert (=> bs!478 m!1213))

(check-sat (not start!572))
(check-sat)
