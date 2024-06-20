; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37562 () Bool)

(assert start!37562)

(declare-fun res!141128 () Bool)

(declare-fun e!118499 () Bool)

(assert (=> start!37562 (=> (not res!141128) (not e!118499))))

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12056 0))(
  ( (Unit!12057) )
))
(declare-datatypes ((ControlFlow!112 0))(
  ( (Return!111 (value!7043 (_ BitVec 32))) (Proceed!111 (value!7044 Unit!12056)) )
))
(declare-fun Unit!12058 () Unit!12056)

(declare-fun Unit!12059 () Unit!12056)

(assert (=> start!37562 (= res!141128 (and (not (is-Return!111 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!111 #b00000000000000000000000001000000) (Proceed!111 Unit!12058)))) (not (is-Return!111 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!111 #b00000000000000000000000000000000) (Proceed!111 Unit!12059))))))))

(assert (=> start!37562 e!118499))

(assert (=> start!37562 true))

(declare-fun b!169855 () Bool)

(declare-datatypes ((tuple3!1002 0))(
  ( (tuple3!1003 (_1!7957 Unit!12056) (_2!7957 (_ BitVec 64)) (_3!627 (_ BitVec 32))) )
))
(declare-fun lt!262363 () tuple3!1002)

(assert (=> b!169855 (= e!118499 (and (bvsge (_3!627 lt!262363) #b00000000000000000000000000000000) (bvsle (_3!627 lt!262363) #b00000000000000000000000001000000) (or (not (= (_3!627 lt!262363) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (_3!627 lt!262363)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (_3!627 lt!262363)) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun e!118500 () tuple3!1002)

(assert (=> b!169855 (= lt!262363 e!118500)))

(declare-fun c!8783 () Bool)

(assert (=> b!169855 (= c!8783 (not (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169856 () Bool)

(declare-fun GetBitCountUnsignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple3!1002)

(assert (=> b!169856 (= e!118500 (GetBitCountUnsignedWhile!0 vv!44 #b00000000000000000000000000000000))))

(declare-fun b!169857 () Bool)

(declare-fun Unit!12060 () Unit!12056)

(assert (=> b!169857 (= e!118500 (tuple3!1003 Unit!12060 vv!44 #b00000000000000000000000000000000))))

(assert (= (and start!37562 res!141128) b!169855))

(assert (= (and b!169855 c!8783) b!169856))

(assert (= (and b!169855 (not c!8783)) b!169857))

(declare-fun m!269589 () Bool)

(assert (=> b!169856 m!269589))

(push 1)

(assert (not b!169856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

