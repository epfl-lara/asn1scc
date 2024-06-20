; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!566 () Bool)

(assert start!566)

(declare-fun lt!1247 () (_ BitVec 32))

(declare-fun v!295 () (_ BitVec 64))

(declare-fun GetBitCountUnsigned!0 ((_ BitVec 64)) (_ BitVec 32))

(assert (=> start!566 (= lt!1247 (GetBitCountUnsigned!0 v!295))))

(assert (=> start!566 false))

(assert (=> start!566 true))

(declare-fun bs!472 () Bool)

(assert (= bs!472 start!566))

(declare-fun m!1207 () Bool)

(assert (=> bs!472 m!1207))

(check-sat (not start!566))
(check-sat)
