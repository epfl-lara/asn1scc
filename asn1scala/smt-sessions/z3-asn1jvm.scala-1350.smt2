; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37564 () Bool)

(assert start!37564)

(declare-fun res!141131 () Bool)

(declare-fun e!118505 () Bool)

(assert (=> start!37564 (=> (not res!141131) (not e!118505))))

(declare-fun vv!44 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!12061 0))(
  ( (Unit!12062) )
))
(declare-datatypes ((ControlFlow!113 0))(
  ( (Return!112 (value!7045 (_ BitVec 32))) (Proceed!112 (value!7046 Unit!12061)) )
))
(declare-fun Unit!12063 () Unit!12061)

(declare-fun Unit!12064 () Unit!12061)

(assert (=> start!37564 (= res!141131 (and (not ((_ is Return!112) (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!112 #b00000000000000000000000001000000) (Proceed!112 Unit!12063)))) (not ((_ is Return!112) (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!112 #b00000000000000000000000000000000) (Proceed!112 Unit!12064))))))))

(assert (=> start!37564 e!118505))

(assert (=> start!37564 true))

(declare-fun b!169864 () Bool)

(declare-datatypes ((tuple3!1004 0))(
  ( (tuple3!1005 (_1!7958 Unit!12061) (_2!7958 (_ BitVec 64)) (_3!628 (_ BitVec 32))) )
))
(declare-fun lt!262366 () tuple3!1004)

(assert (=> b!169864 (= e!118505 (and (bvsge (_3!628 lt!262366) #b00000000000000000000000000000000) (bvsle (_3!628 lt!262366) #b00000000000000000000000001000000) (or (not (= (_3!628 lt!262366) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (_3!628 lt!262366)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (_3!628 lt!262366)) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun e!118506 () tuple3!1004)

(assert (=> b!169864 (= lt!262366 e!118506)))

(declare-fun c!8786 () Bool)

(assert (=> b!169864 (= c!8786 (not (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169865 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!1004)

(assert (=> b!169865 (= e!118506 (GetBitCountUnsignedWhile!0 vv!44 #b00000000000000000000000000000000))))

(declare-fun b!169866 () Bool)

(declare-fun Unit!12065 () Unit!12061)

(assert (=> b!169866 (= e!118506 (tuple3!1005 Unit!12065 vv!44 #b00000000000000000000000000000000))))

(assert (= (and start!37564 res!141131) b!169864))

(assert (= (and b!169864 c!8786) b!169865))

(assert (= (and b!169864 (not c!8786)) b!169866))

(declare-fun m!269591 () Bool)

(assert (=> b!169865 m!269591))

(check-sat (not b!169865))
(check-sat)
