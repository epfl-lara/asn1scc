; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15228 () Bool)

(assert start!15228)

(declare-datatypes ((Unit!5149 0))(
  ( (Unit!5150) )
))
(declare-datatypes ((tuple3!230 0))(
  ( (tuple3!231 (_1!3602 Unit!5149) (_2!3602 (_ BitVec 32)) (_3!136 (_ BitVec 32))) )
))
(declare-fun lt!124848 () tuple3!230)

(declare-fun e!51050 () tuple3!230)

(assert (=> start!15228 (= lt!124848 e!51050)))

(declare-fun c!5621 () Bool)

(declare-datatypes ((array!3288 0))(
  ( (array!3289 (arr!2129 (Array (_ BitVec 32) (_ BitVec 8))) (size!1528 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3288)

(assert (=> start!15228 (= c!5621 (bvslt #b00000000000000000000000000000000 (size!1528 charSet!2)))))

(assert (=> start!15228 (and (not (= (size!1528 charSet!2) #b00000000000000000000000000000000)) (or (bvslt (_3!136 lt!124848) #b00000000000000000000000000000000) (bvsge (_3!136 lt!124848) (size!1528 charSet!2))))))

(declare-fun array_inv!1374 (array!3288) Bool)

(assert (=> start!15228 (array_inv!1374 charSet!2)))

(assert (=> start!15228 true))

(declare-fun b!77861 () Bool)

(declare-fun ch!2 () (_ BitVec 8))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!3288 (_ BitVec 32) (_ BitVec 32)) tuple3!230)

(assert (=> b!77861 (= e!51050 (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!77862 () Bool)

(declare-fun Unit!5151 () Unit!5149)

(assert (=> b!77862 (= e!51050 (tuple3!231 Unit!5151 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and start!15228 c!5621) b!77861))

(assert (= (and start!15228 (not c!5621)) b!77862))

(declare-fun m!123487 () Bool)

(assert (=> start!15228 m!123487))

(declare-fun m!123489 () Bool)

(assert (=> b!77861 m!123489))

(push 1)

(assert (not start!15228))

(assert (not b!77861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24540 () Bool)

(assert (=> d!24540 (= (array_inv!1374 charSet!2) (bvsge (size!1528 charSet!2) #b00000000000000000000000000000000))))

(assert (=> start!15228 d!24540))

(declare-fun d!24542 () Bool)

(declare-fun lt!124874 () tuple3!230)

(assert (=> d!24542 (and (bvsge (_2!3602 lt!124874) #b00000000000000000000000000000000) (bvsle (_2!3602 lt!124874) (size!1528 charSet!2)) (bvslt (_3!136 lt!124874) (size!1528 charSet!2)) (bvsge (_3!136 lt!124874) #b00000000000000000000000000000000) (or (bvsge (_2!3602 lt!124874) (size!1528 charSet!2)) (not (= (_3!136 lt!124874) #b00000000000000000000000000000000))))))

(declare-fun e!51060 () tuple3!230)

(assert (=> d!24542 (= lt!124874 e!51060)))

(declare-datatypes ((tuple2!6936 0))(
  ( (tuple2!6937 (_1!3605 Unit!5149) (_2!3605 (_ BitVec 32))) )
))
(declare-fun lt!124873 () tuple2!6936)

(declare-fun lt!124875 () (_ BitVec 32))

(declare-fun c!5630 () Bool)

(assert (=> d!24542 (= c!5630 (and (bvslt lt!124875 (size!1528 charSet!2)) (= (_2!3605 lt!124873) #b00000000000000000000000000000000)))))

(assert (=> d!24542 (= lt!124875 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun Unit!5158 () Unit!5149)

(declare-fun Unit!5159 () Unit!5149)

(assert (=> d!24542 (= lt!124873 (ite (= ((_ sign_extend 24) ch!2) ((_ sign_extend 24) (select (arr!2129 charSet!2) #b00000000000000000000000000000000))) (tuple2!6937 Unit!5158 #b00000000000000000000000000000000) (tuple2!6937 Unit!5159 #b00000000000000000000000000000000)))))

(assert (=> d!24542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!1528 charSet!2)) (bvslt #b00000000000000000000000000000000 (size!1528 charSet!2)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1528 charSet!2)) (= #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!24542 (= (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000) lt!124874)))

(declare-fun b!77879 () Bool)

(assert (=> b!77879 (= e!51060 (GetCharIndexWhile!0 ch!2 charSet!2 lt!124875 (_2!3605 lt!124873)))))

(declare-fun b!77880 () Bool)

(declare-fun Unit!5160 () Unit!5149)

(assert (=> b!77880 (= e!51060 (tuple3!231 Unit!5160 lt!124875 (_2!3605 lt!124873)))))

(assert (= (and d!24542 c!5630) b!77879))

(assert (= (and d!24542 (not c!5630)) b!77880))

(declare-fun m!123499 () Bool)

(assert (=> d!24542 m!123499))

(declare-fun m!123501 () Bool)

(assert (=> b!77879 m!123501))

(assert (=> b!77861 d!24542))

(push 1)

(assert (not b!77879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

