; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51172 () Bool)

(assert start!51172)

(declare-fun res!199793 () Bool)

(declare-fun e!165192 () Bool)

(assert (=> start!51172 (=> (not res!199793) (not e!165192))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12777 0))(
  ( (array!12778 (arr!6602 (Array (_ BitVec 32) (_ BitVec 8))) (size!5615 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12777)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51172 (= res!199793 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5615 charSet!5)) (bvslt ret!59 (size!5615 charSet!5)) (bvslt i!492 (size!5615 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51172 e!165192))

(assert (=> start!51172 true))

(declare-fun array_inv!5356 (array!12777) Bool)

(assert (=> start!51172 (array_inv!5356 charSet!5)))

(declare-fun b!239032 () Bool)

(declare-fun e!165193 () Bool)

(assert (=> b!239032 (= e!165192 e!165193)))

(declare-fun res!199794 () Bool)

(assert (=> b!239032 (=> (not res!199794) (not e!165193))))

(declare-datatypes ((Unit!17465 0))(
  ( (Unit!17466) )
))
(declare-datatypes ((tuple2!20228 0))(
  ( (tuple2!20229 (_1!11031 Unit!17465) (_2!11031 (_ BitVec 32))) )
))
(declare-fun lt!373923 () tuple2!20228)

(assert (=> b!239032 (= res!199794 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5615 charSet!5)) (= (_2!11031 lt!373923) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17467 () Unit!17465)

(declare-fun Unit!17468 () Unit!17465)

(assert (=> b!239032 (= lt!373923 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6602 charSet!5) i!492))) (tuple2!20229 Unit!17467 i!492) (tuple2!20229 Unit!17468 ret!59)))))

(declare-fun b!239033 () Bool)

(declare-datatypes ((tuple3!1550 0))(
  ( (tuple3!1551 (_1!11032 Unit!17465) (_2!11032 (_ BitVec 32)) (_3!917 (_ BitVec 32))) )
))
(declare-fun lt!373922 () tuple3!1550)

(assert (=> b!239033 (= e!165193 (or (bvslt (_2!11032 lt!373922) #b00000000000000000000000000000000) (bvsgt (_2!11032 lt!373922) (size!5615 charSet!5)) (bvsge (_3!917 lt!373922) (size!5615 charSet!5)) (bvslt (_3!917 lt!373922) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12777 (_ BitVec 32) (_ BitVec 32)) tuple3!1550)

(assert (=> b!239033 (= lt!373922 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11031 lt!373923)))))

(assert (= (and start!51172 res!199793) b!239032))

(assert (= (and b!239032 res!199794) b!239033))

(declare-fun m!361047 () Bool)

(assert (=> start!51172 m!361047))

(declare-fun m!361049 () Bool)

(assert (=> b!239032 m!361049))

(declare-fun m!361051 () Bool)

(assert (=> b!239033 m!361051))

(check-sat (not b!239033) (not start!51172))
(check-sat)
(get-model)

(declare-fun d!80374 () Bool)

(declare-fun lt!373936 () tuple3!1550)

(assert (=> d!80374 (and (bvsge (_2!11032 lt!373936) #b00000000000000000000000000000000) (bvsle (_2!11032 lt!373936) (size!5615 charSet!5)) (bvslt (_3!917 lt!373936) (size!5615 charSet!5)) (bvsge (_3!917 lt!373936) #b00000000000000000000000000000000) (or (bvsge (_2!11032 lt!373936) (size!5615 charSet!5)) (not (= (_3!917 lt!373936) #b00000000000000000000000000000000))))))

(declare-fun e!165206 () tuple3!1550)

(assert (=> d!80374 (= lt!373936 e!165206)))

(declare-fun c!11389 () Bool)

(declare-fun lt!373937 () (_ BitVec 32))

(declare-fun lt!373938 () tuple2!20228)

(assert (=> d!80374 (= c!11389 (and (bvslt lt!373937 (size!5615 charSet!5)) (= (_2!11031 lt!373938) #b00000000000000000000000000000000)))))

(assert (=> d!80374 (= lt!373937 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17473 () Unit!17465)

(declare-fun Unit!17474 () Unit!17465)

(assert (=> d!80374 (= lt!373938 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6602 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20229 Unit!17473 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20229 Unit!17474 (_2!11031 lt!373923))))))

(assert (=> d!80374 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5615 charSet!5)) (bvslt (_2!11031 lt!373923) (size!5615 charSet!5)) (bvsge (_2!11031 lt!373923) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5615 charSet!5)) (= (_2!11031 lt!373923) #b00000000000000000000000000000000))))

(assert (=> d!80374 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11031 lt!373923)) lt!373936)))

(declare-fun b!239044 () Bool)

(assert (=> b!239044 (= e!165206 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373937 (_2!11031 lt!373938)))))

(declare-fun b!239045 () Bool)

(declare-fun Unit!17475 () Unit!17465)

(assert (=> b!239045 (= e!165206 (tuple3!1551 Unit!17475 lt!373937 (_2!11031 lt!373938)))))

(assert (= (and d!80374 c!11389) b!239044))

(assert (= (and d!80374 (not c!11389)) b!239045))

(declare-fun m!361059 () Bool)

(assert (=> d!80374 m!361059))

(declare-fun m!361061 () Bool)

(assert (=> b!239044 m!361061))

(assert (=> b!239033 d!80374))

(declare-fun d!80378 () Bool)

(assert (=> d!80378 (= (array_inv!5356 charSet!5) (bvsge (size!5615 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51172 d!80378))

(check-sat (not b!239044))
