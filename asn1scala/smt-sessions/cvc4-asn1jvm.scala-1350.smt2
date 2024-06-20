; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37566 () Bool)

(assert start!37566)

(declare-fun res!141134 () Bool)

(declare-fun e!118512 () Bool)

(assert (=> start!37566 (=> (not res!141134) (not e!118512))))

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12066 0))(
  ( (Unit!12067) )
))
(declare-datatypes ((ControlFlow!114 0))(
  ( (Return!113 (value!7047 (_ BitVec 32))) (Proceed!113 (value!7048 Unit!12066)) )
))
(declare-fun Unit!12068 () Unit!12066)

(declare-fun Unit!12069 () Unit!12066)

(assert (=> start!37566 (= res!141134 (and (not (is-Return!113 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!113 #b00000000000000000000000001000000) (Proceed!113 Unit!12068)))) (not (is-Return!113 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!113 #b00000000000000000000000000000000) (Proceed!113 Unit!12069))))))))

(assert (=> start!37566 e!118512))

(assert (=> start!37566 true))

(declare-fun b!169873 () Bool)

(declare-datatypes ((tuple3!1006 0))(
  ( (tuple3!1007 (_1!7959 Unit!12066) (_2!7959 (_ BitVec 64)) (_3!629 (_ BitVec 32))) )
))
(declare-fun lt!262369 () tuple3!1006)

(assert (=> b!169873 (= e!118512 (and (bvsge (_3!629 lt!262369) #b00000000000000000000000000000000) (bvsle (_3!629 lt!262369) #b00000000000000000000000001000000) (or (not (= (_3!629 lt!262369) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (_3!629 lt!262369)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (_3!629 lt!262369)) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun e!118511 () tuple3!1006)

(assert (=> b!169873 (= lt!262369 e!118511)))

(declare-fun c!8789 () Bool)

(assert (=> b!169873 (= c!8789 (not (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169874 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!1006)

(assert (=> b!169874 (= e!118511 (GetBitCountUnsignedWhile!0 vv!44 #b00000000000000000000000000000000))))

(declare-fun b!169875 () Bool)

(declare-fun Unit!12070 () Unit!12066)

(assert (=> b!169875 (= e!118511 (tuple3!1007 Unit!12070 vv!44 #b00000000000000000000000000000000))))

(assert (= (and start!37566 res!141134) b!169873))

(assert (= (and b!169873 c!8789) b!169874))

(assert (= (and b!169873 (not c!8789)) b!169875))

(declare-fun m!269593 () Bool)

(assert (=> b!169874 m!269593))

(push 1)

(assert (not b!169874))

(check-sat)

