; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15224 () Bool)

(assert start!15224)

(declare-datatypes ((Unit!5143 0))(
  ( (Unit!5144) )
))
(declare-datatypes ((tuple3!226 0))(
  ( (tuple3!227 (_1!3600 Unit!5143) (_2!3600 (_ BitVec 32)) (_3!134 (_ BitVec 32))) )
))
(declare-fun lt!124842 () tuple3!226)

(declare-fun e!51038 () tuple3!226)

(assert (=> start!15224 (= lt!124842 e!51038)))

(declare-fun c!5615 () Bool)

(declare-datatypes ((array!3284 0))(
  ( (array!3285 (arr!2127 (Array (_ BitVec 32) (_ BitVec 8))) (size!1526 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3284)

(assert (=> start!15224 (= c!5615 (bvslt #b00000000000000000000000000000000 (size!1526 charSet!2)))))

(assert (=> start!15224 (and (not (= (size!1526 charSet!2) #b00000000000000000000000000000000)) (or (bvslt (_3!134 lt!124842) #b00000000000000000000000000000000) (bvsge (_3!134 lt!124842) (size!1526 charSet!2))))))

(declare-fun array_inv!1372 (array!3284) Bool)

(assert (=> start!15224 (array_inv!1372 charSet!2)))

(assert (=> start!15224 true))

(declare-fun b!77849 () Bool)

(declare-fun ch!2 () (_ BitVec 8))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!3284 (_ BitVec 32) (_ BitVec 32)) tuple3!226)

(assert (=> b!77849 (= e!51038 (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!77850 () Bool)

(declare-fun Unit!5145 () Unit!5143)

(assert (=> b!77850 (= e!51038 (tuple3!227 Unit!5145 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and start!15224 c!5615) b!77849))

(assert (= (and start!15224 (not c!5615)) b!77850))

(declare-fun m!123479 () Bool)

(assert (=> start!15224 m!123479))

(declare-fun m!123481 () Bool)

(assert (=> b!77849 m!123481))

(push 1)

(assert (not start!15224))

(assert (not b!77849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24536 () Bool)

(assert (=> d!24536 (= (array_inv!1372 charSet!2) (bvsge (size!1526 charSet!2) #b00000000000000000000000000000000))))

(assert (=> start!15224 d!24536))

(declare-fun d!24538 () Bool)

(declare-fun lt!124864 () tuple3!226)

(assert (=> d!24538 (and (bvsge (_2!3600 lt!124864) #b00000000000000000000000000000000) (bvsle (_2!3600 lt!124864) (size!1526 charSet!2)) (bvslt (_3!134 lt!124864) (size!1526 charSet!2)) (bvsge (_3!134 lt!124864) #b00000000000000000000000000000000) (or (bvsge (_2!3600 lt!124864) (size!1526 charSet!2)) (not (= (_3!134 lt!124864) #b00000000000000000000000000000000))))))

(declare-fun e!51057 () tuple3!226)

(assert (=> d!24538 (= lt!124864 e!51057)))

(declare-fun c!5627 () Bool)

(declare-datatypes ((tuple2!6934 0))(
  ( (tuple2!6935 (_1!3604 Unit!5143) (_2!3604 (_ BitVec 32))) )
))
(declare-fun lt!124866 () tuple2!6934)

(declare-fun lt!124865 () (_ BitVec 32))

(assert (=> d!24538 (= c!5627 (and (bvslt lt!124865 (size!1526 charSet!2)) (= (_2!3604 lt!124866) #b00000000000000000000000000000000)))))

(assert (=> d!24538 (= lt!124865 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun Unit!5155 () Unit!5143)

(declare-fun Unit!5156 () Unit!5143)

(assert (=> d!24538 (= lt!124866 (ite (= ((_ sign_extend 24) ch!2) ((_ sign_extend 24) (select (arr!2127 charSet!2) #b00000000000000000000000000000000))) (tuple2!6935 Unit!5155 #b00000000000000000000000000000000) (tuple2!6935 Unit!5156 #b00000000000000000000000000000000)))))

(assert (=> d!24538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!1526 charSet!2)) (bvslt #b00000000000000000000000000000000 (size!1526 charSet!2)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1526 charSet!2)) (= #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!24538 (= (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000) lt!124864)))

(declare-fun b!77873 () Bool)

(assert (=> b!77873 (= e!51057 (GetCharIndexWhile!0 ch!2 charSet!2 lt!124865 (_2!3604 lt!124866)))))

(declare-fun b!77874 () Bool)

(declare-fun Unit!5157 () Unit!5143)

(assert (=> b!77874 (= e!51057 (tuple3!227 Unit!5157 lt!124865 (_2!3604 lt!124866)))))

(assert (= (and d!24538 c!5627) b!77873))

(assert (= (and d!24538 (not c!5627)) b!77874))

(declare-fun m!123495 () Bool)

(assert (=> d!24538 m!123495))

(declare-fun m!123497 () Bool)

(assert (=> b!77873 m!123497))

(assert (=> b!77849 d!24538))

(push 1)

(assert (not b!77873))

(check-sat)

(pop 1)

(push 1)

(check-sat)

