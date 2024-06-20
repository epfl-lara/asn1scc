; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51190 () Bool)

(assert start!51190)

(declare-fun res!199812 () Bool)

(declare-fun e!165229 () Bool)

(assert (=> start!51190 (=> (not res!199812) (not e!165229))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12786 0))(
  ( (array!12787 (arr!6605 (Array (_ BitVec 32) (_ BitVec 8))) (size!5618 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12786)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51190 (= res!199812 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5618 charSet!5)) (bvslt ret!59 (size!5618 charSet!5)) (bvslt i!492 (size!5618 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51190 e!165229))

(assert (=> start!51190 true))

(declare-fun array_inv!5359 (array!12786) Bool)

(assert (=> start!51190 (array_inv!5359 charSet!5)))

(declare-fun b!239068 () Bool)

(declare-fun e!165228 () Bool)

(assert (=> b!239068 (= e!165229 e!165228)))

(declare-fun res!199811 () Bool)

(assert (=> b!239068 (=> (not res!199811) (not e!165228))))

(declare-datatypes ((Unit!17486 0))(
  ( (Unit!17487) )
))
(declare-datatypes ((tuple2!20234 0))(
  ( (tuple2!20235 (_1!11037 Unit!17486) (_2!11037 (_ BitVec 32))) )
))
(declare-fun lt!373967 () tuple2!20234)

(assert (=> b!239068 (= res!199811 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5618 charSet!5)) (= (_2!11037 lt!373967) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17488 () Unit!17486)

(declare-fun Unit!17489 () Unit!17486)

(assert (=> b!239068 (= lt!373967 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6605 charSet!5) i!492))) (tuple2!20235 Unit!17488 i!492) (tuple2!20235 Unit!17489 ret!59)))))

(declare-fun b!239069 () Bool)

(declare-datatypes ((tuple3!1556 0))(
  ( (tuple3!1557 (_1!11038 Unit!17486) (_2!11038 (_ BitVec 32)) (_3!920 (_ BitVec 32))) )
))
(declare-fun lt!373968 () tuple3!1556)

(assert (=> b!239069 (= e!165228 (and (bvslt (_2!11038 lt!373968) (size!5618 charSet!5)) (= (_3!920 lt!373968) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12786 (_ BitVec 32) (_ BitVec 32)) tuple3!1556)

(assert (=> b!239069 (= lt!373968 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11037 lt!373967)))))

(assert (= (and start!51190 res!199812) b!239068))

(assert (= (and b!239068 res!199811) b!239069))

(declare-fun m!361077 () Bool)

(assert (=> start!51190 m!361077))

(declare-fun m!361079 () Bool)

(assert (=> b!239068 m!361079))

(declare-fun m!361081 () Bool)

(assert (=> b!239069 m!361081))

(check-sat (not b!239069) (not start!51190))
(check-sat)
(get-model)

(declare-fun d!80388 () Bool)

(declare-fun lt!373981 () tuple3!1556)

(assert (=> d!80388 (and (bvsge (_2!11038 lt!373981) #b00000000000000000000000000000000) (bvsle (_2!11038 lt!373981) (size!5618 charSet!5)) (bvslt (_3!920 lt!373981) (size!5618 charSet!5)) (bvsge (_3!920 lt!373981) #b00000000000000000000000000000000) (or (bvsge (_2!11038 lt!373981) (size!5618 charSet!5)) (not (= (_3!920 lt!373981) #b00000000000000000000000000000000))))))

(declare-fun e!165242 () tuple3!1556)

(assert (=> d!80388 (= lt!373981 e!165242)))

(declare-fun c!11398 () Bool)

(declare-fun lt!373983 () (_ BitVec 32))

(declare-fun lt!373982 () tuple2!20234)

(assert (=> d!80388 (= c!11398 (and (bvslt lt!373983 (size!5618 charSet!5)) (= (_2!11037 lt!373982) #b00000000000000000000000000000000)))))

(assert (=> d!80388 (= lt!373983 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17494 () Unit!17486)

(declare-fun Unit!17495 () Unit!17486)

(assert (=> d!80388 (= lt!373982 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6605 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20235 Unit!17494 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20235 Unit!17495 (_2!11037 lt!373967))))))

(assert (=> d!80388 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5618 charSet!5)) (bvslt (_2!11037 lt!373967) (size!5618 charSet!5)) (bvsge (_2!11037 lt!373967) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5618 charSet!5)) (= (_2!11037 lt!373967) #b00000000000000000000000000000000))))

(assert (=> d!80388 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11037 lt!373967)) lt!373981)))

(declare-fun b!239080 () Bool)

(assert (=> b!239080 (= e!165242 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373983 (_2!11037 lt!373982)))))

(declare-fun b!239081 () Bool)

(declare-fun Unit!17496 () Unit!17486)

(assert (=> b!239081 (= e!165242 (tuple3!1557 Unit!17496 lt!373983 (_2!11037 lt!373982)))))

(assert (= (and d!80388 c!11398) b!239080))

(assert (= (and d!80388 (not c!11398)) b!239081))

(declare-fun m!361089 () Bool)

(assert (=> d!80388 m!361089))

(declare-fun m!361091 () Bool)

(assert (=> b!239080 m!361091))

(assert (=> b!239069 d!80388))

(declare-fun d!80392 () Bool)

(assert (=> d!80392 (= (array_inv!5359 charSet!5) (bvsge (size!5618 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51190 d!80392))

(check-sat (not b!239080))
