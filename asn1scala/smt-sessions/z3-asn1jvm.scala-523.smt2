; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15226 () Bool)

(assert start!15226)

(declare-datatypes ((Unit!5146 0))(
  ( (Unit!5147) )
))
(declare-datatypes ((tuple3!228 0))(
  ( (tuple3!229 (_1!3601 Unit!5146) (_2!3601 (_ BitVec 32)) (_3!135 (_ BitVec 32))) )
))
(declare-fun lt!124845 () tuple3!228)

(declare-fun e!51044 () tuple3!228)

(assert (=> start!15226 (= lt!124845 e!51044)))

(declare-fun c!5618 () Bool)

(declare-datatypes ((array!3286 0))(
  ( (array!3287 (arr!2128 (Array (_ BitVec 32) (_ BitVec 8))) (size!1527 (_ BitVec 32))) )
))
(declare-fun charSet!2 () array!3286)

(assert (=> start!15226 (= c!5618 (bvslt #b00000000000000000000000000000000 (size!1527 charSet!2)))))

(assert (=> start!15226 (and (not (= (size!1527 charSet!2) #b00000000000000000000000000000000)) (or (bvslt (_3!135 lt!124845) #b00000000000000000000000000000000) (bvsge (_3!135 lt!124845) (size!1527 charSet!2))))))

(declare-fun array_inv!1373 (array!3286) Bool)

(assert (=> start!15226 (array_inv!1373 charSet!2)))

(assert (=> start!15226 true))

(declare-fun b!77855 () Bool)

(declare-fun ch!2 () (_ BitVec 8))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!3286 (_ BitVec 32) (_ BitVec 32)) tuple3!228)

(assert (=> b!77855 (= e!51044 (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!77856 () Bool)

(declare-fun Unit!5148 () Unit!5146)

(assert (=> b!77856 (= e!51044 (tuple3!229 Unit!5148 #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (= (and start!15226 c!5618) b!77855))

(assert (= (and start!15226 (not c!5618)) b!77856))

(declare-fun m!123483 () Bool)

(assert (=> start!15226 m!123483))

(declare-fun m!123485 () Bool)

(assert (=> b!77855 m!123485))

(check-sat (not start!15226) (not b!77855))
(check-sat)
(get-model)

(declare-fun d!24532 () Bool)

(assert (=> d!24532 (= (array_inv!1373 charSet!2) (bvsge (size!1527 charSet!2) #b00000000000000000000000000000000))))

(assert (=> start!15226 d!24532))

(declare-fun d!24534 () Bool)

(declare-fun lt!124855 () tuple3!228)

(assert (=> d!24534 (and (bvsge (_2!3601 lt!124855) #b00000000000000000000000000000000) (bvsle (_2!3601 lt!124855) (size!1527 charSet!2)) (bvslt (_3!135 lt!124855) (size!1527 charSet!2)) (bvsge (_3!135 lt!124855) #b00000000000000000000000000000000) (or (bvsge (_2!3601 lt!124855) (size!1527 charSet!2)) (not (= (_3!135 lt!124855) #b00000000000000000000000000000000))))))

(declare-fun e!51054 () tuple3!228)

(assert (=> d!24534 (= lt!124855 e!51054)))

(declare-fun lt!124857 () (_ BitVec 32))

(declare-datatypes ((tuple2!6932 0))(
  ( (tuple2!6933 (_1!3603 Unit!5146) (_2!3603 (_ BitVec 32))) )
))
(declare-fun lt!124856 () tuple2!6932)

(declare-fun c!5624 () Bool)

(assert (=> d!24534 (= c!5624 (and (bvslt lt!124857 (size!1527 charSet!2)) (= (_2!3603 lt!124856) #b00000000000000000000000000000000)))))

(assert (=> d!24534 (= lt!124857 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun Unit!5152 () Unit!5146)

(declare-fun Unit!5153 () Unit!5146)

(assert (=> d!24534 (= lt!124856 (ite (= ((_ sign_extend 24) ch!2) ((_ sign_extend 24) (select (arr!2128 charSet!2) #b00000000000000000000000000000000))) (tuple2!6933 Unit!5152 #b00000000000000000000000000000000) (tuple2!6933 Unit!5153 #b00000000000000000000000000000000)))))

(assert (=> d!24534 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!1527 charSet!2)) (bvslt #b00000000000000000000000000000000 (size!1527 charSet!2)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1527 charSet!2)) (= #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!24534 (= (GetCharIndexWhile!0 ch!2 charSet!2 #b00000000000000000000000000000000 #b00000000000000000000000000000000) lt!124855)))

(declare-fun b!77867 () Bool)

(assert (=> b!77867 (= e!51054 (GetCharIndexWhile!0 ch!2 charSet!2 lt!124857 (_2!3603 lt!124856)))))

(declare-fun b!77868 () Bool)

(declare-fun Unit!5154 () Unit!5146)

(assert (=> b!77868 (= e!51054 (tuple3!229 Unit!5154 lt!124857 (_2!3603 lt!124856)))))

(assert (= (and d!24534 c!5624) b!77867))

(assert (= (and d!24534 (not c!5624)) b!77868))

(declare-fun m!123491 () Bool)

(assert (=> d!24534 m!123491))

(declare-fun m!123493 () Bool)

(assert (=> b!77867 m!123493))

(assert (=> b!77855 d!24534))

(check-sat (not b!77867))
(check-sat)
