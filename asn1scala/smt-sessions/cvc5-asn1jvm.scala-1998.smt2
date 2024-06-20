; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51170 () Bool)

(assert start!51170)

(declare-fun res!199788 () Bool)

(declare-fun e!165185 () Bool)

(assert (=> start!51170 (=> (not res!199788) (not e!165185))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12775 0))(
  ( (array!12776 (arr!6601 (Array (_ BitVec 32) (_ BitVec 8))) (size!5614 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12775)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51170 (= res!199788 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5614 charSet!5)) (bvslt ret!59 (size!5614 charSet!5)) (bvslt i!492 (size!5614 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51170 e!165185))

(assert (=> start!51170 true))

(declare-fun array_inv!5355 (array!12775) Bool)

(assert (=> start!51170 (array_inv!5355 charSet!5)))

(declare-fun b!239026 () Bool)

(declare-fun e!165184 () Bool)

(assert (=> b!239026 (= e!165185 e!165184)))

(declare-fun res!199787 () Bool)

(assert (=> b!239026 (=> (not res!199787) (not e!165184))))

(declare-datatypes ((Unit!17461 0))(
  ( (Unit!17462) )
))
(declare-datatypes ((tuple2!20226 0))(
  ( (tuple2!20227 (_1!11029 Unit!17461) (_2!11029 (_ BitVec 32))) )
))
(declare-fun lt!373917 () tuple2!20226)

(assert (=> b!239026 (= res!199787 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5614 charSet!5)) (= (_2!11029 lt!373917) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17463 () Unit!17461)

(declare-fun Unit!17464 () Unit!17461)

(assert (=> b!239026 (= lt!373917 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6601 charSet!5) i!492))) (tuple2!20227 Unit!17463 i!492) (tuple2!20227 Unit!17464 ret!59)))))

(declare-fun b!239027 () Bool)

(declare-datatypes ((tuple3!1548 0))(
  ( (tuple3!1549 (_1!11030 Unit!17461) (_2!11030 (_ BitVec 32)) (_3!916 (_ BitVec 32))) )
))
(declare-fun lt!373916 () tuple3!1548)

(assert (=> b!239027 (= e!165184 (or (bvslt (_2!11030 lt!373916) #b00000000000000000000000000000000) (bvsgt (_2!11030 lt!373916) (size!5614 charSet!5)) (bvsge (_3!916 lt!373916) (size!5614 charSet!5)) (bvslt (_3!916 lt!373916) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12775 (_ BitVec 32) (_ BitVec 32)) tuple3!1548)

(assert (=> b!239027 (= lt!373916 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11029 lt!373917)))))

(assert (= (and start!51170 res!199788) b!239026))

(assert (= (and b!239026 res!199787) b!239027))

(declare-fun m!361041 () Bool)

(assert (=> start!51170 m!361041))

(declare-fun m!361043 () Bool)

(assert (=> b!239026 m!361043))

(declare-fun m!361045 () Bool)

(assert (=> b!239027 m!361045))

(push 1)

(assert (not b!239027))

(assert (not start!51170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80376 () Bool)

(declare-fun lt!373945 () tuple3!1548)

(assert (=> d!80376 (and (bvsge (_2!11030 lt!373945) #b00000000000000000000000000000000) (bvsle (_2!11030 lt!373945) (size!5614 charSet!5)) (bvslt (_3!916 lt!373945) (size!5614 charSet!5)) (bvsge (_3!916 lt!373945) #b00000000000000000000000000000000) (or (bvsge (_2!11030 lt!373945) (size!5614 charSet!5)) (not (= (_3!916 lt!373945) #b00000000000000000000000000000000))))))

(declare-fun e!165209 () tuple3!1548)

(assert (=> d!80376 (= lt!373945 e!165209)))

(declare-fun lt!373946 () tuple2!20226)

(declare-fun lt!373947 () (_ BitVec 32))

(declare-fun c!11392 () Bool)

(assert (=> d!80376 (= c!11392 (and (bvslt lt!373947 (size!5614 charSet!5)) (= (_2!11029 lt!373946) #b00000000000000000000000000000000)))))

(assert (=> d!80376 (= lt!373947 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17476 () Unit!17461)

(declare-fun Unit!17477 () Unit!17461)

(assert (=> d!80376 (= lt!373946 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6601 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20227 Unit!17476 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20227 Unit!17477 (_2!11029 lt!373917))))))

(assert (=> d!80376 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5614 charSet!5)) (bvslt (_2!11029 lt!373917) (size!5614 charSet!5)) (bvsge (_2!11029 lt!373917) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5614 charSet!5)) (= (_2!11029 lt!373917) #b00000000000000000000000000000000))))

(assert (=> d!80376 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11029 lt!373917)) lt!373945)))

(declare-fun b!239050 () Bool)

(assert (=> b!239050 (= e!165209 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373947 (_2!11029 lt!373946)))))

(declare-fun b!239051 () Bool)

(declare-fun Unit!17478 () Unit!17461)

(assert (=> b!239051 (= e!165209 (tuple3!1549 Unit!17478 lt!373947 (_2!11029 lt!373946)))))

(assert (= (and d!80376 c!11392) b!239050))

(assert (= (and d!80376 (not c!11392)) b!239051))

(declare-fun m!361063 () Bool)

(assert (=> d!80376 m!361063))

(declare-fun m!361065 () Bool)

(assert (=> b!239050 m!361065))

(assert (=> b!239027 d!80376))

(declare-fun d!80380 () Bool)

(assert (=> d!80380 (= (array_inv!5355 charSet!5) (bvsge (size!5614 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51170 d!80380))

(push 1)

(assert (not b!239050))

(check-sat)

