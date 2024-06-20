; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51188 () Bool)

(assert start!51188)

(declare-fun res!199805 () Bool)

(declare-fun e!165221 () Bool)

(assert (=> start!51188 (=> (not res!199805) (not e!165221))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12784 0))(
  ( (array!12785 (arr!6604 (Array (_ BitVec 32) (_ BitVec 8))) (size!5617 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12784)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51188 (= res!199805 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5617 charSet!5)) (bvslt ret!59 (size!5617 charSet!5)) (bvslt i!492 (size!5617 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51188 e!165221))

(assert (=> start!51188 true))

(declare-fun array_inv!5358 (array!12784) Bool)

(assert (=> start!51188 (array_inv!5358 charSet!5)))

(declare-fun b!239062 () Bool)

(declare-fun e!165219 () Bool)

(assert (=> b!239062 (= e!165221 e!165219)))

(declare-fun res!199806 () Bool)

(assert (=> b!239062 (=> (not res!199806) (not e!165219))))

(declare-datatypes ((Unit!17482 0))(
  ( (Unit!17483) )
))
(declare-datatypes ((tuple2!20232 0))(
  ( (tuple2!20233 (_1!11035 Unit!17482) (_2!11035 (_ BitVec 32))) )
))
(declare-fun lt!373961 () tuple2!20232)

(assert (=> b!239062 (= res!199806 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5617 charSet!5)) (= (_2!11035 lt!373961) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17484 () Unit!17482)

(declare-fun Unit!17485 () Unit!17482)

(assert (=> b!239062 (= lt!373961 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6604 charSet!5) i!492))) (tuple2!20233 Unit!17484 i!492) (tuple2!20233 Unit!17485 ret!59)))))

(declare-fun b!239063 () Bool)

(declare-datatypes ((tuple3!1554 0))(
  ( (tuple3!1555 (_1!11036 Unit!17482) (_2!11036 (_ BitVec 32)) (_3!919 (_ BitVec 32))) )
))
(declare-fun lt!373962 () tuple3!1554)

(assert (=> b!239063 (= e!165219 (and (bvslt (_2!11036 lt!373962) (size!5617 charSet!5)) (= (_3!919 lt!373962) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12784 (_ BitVec 32) (_ BitVec 32)) tuple3!1554)

(assert (=> b!239063 (= lt!373962 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11035 lt!373961)))))

(assert (= (and start!51188 res!199805) b!239062))

(assert (= (and b!239062 res!199806) b!239063))

(declare-fun m!361071 () Bool)

(assert (=> start!51188 m!361071))

(declare-fun m!361073 () Bool)

(assert (=> b!239062 m!361073))

(declare-fun m!361075 () Bool)

(assert (=> b!239063 m!361075))

(push 1)

(assert (not b!239063))

(assert (not start!51188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80390 () Bool)

(declare-fun lt!373991 () tuple3!1554)

(assert (=> d!80390 (and (bvsge (_2!11036 lt!373991) #b00000000000000000000000000000000) (bvsle (_2!11036 lt!373991) (size!5617 charSet!5)) (bvslt (_3!919 lt!373991) (size!5617 charSet!5)) (bvsge (_3!919 lt!373991) #b00000000000000000000000000000000) (or (bvsge (_2!11036 lt!373991) (size!5617 charSet!5)) (not (= (_3!919 lt!373991) #b00000000000000000000000000000000))))))

(declare-fun e!165245 () tuple3!1554)

(assert (=> d!80390 (= lt!373991 e!165245)))

(declare-fun lt!373990 () tuple2!20232)

(declare-fun c!11401 () Bool)

(declare-fun lt!373992 () (_ BitVec 32))

(assert (=> d!80390 (= c!11401 (and (bvslt lt!373992 (size!5617 charSet!5)) (= (_2!11035 lt!373990) #b00000000000000000000000000000000)))))

(assert (=> d!80390 (= lt!373992 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17497 () Unit!17482)

(declare-fun Unit!17498 () Unit!17482)

(assert (=> d!80390 (= lt!373990 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6604 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20233 Unit!17497 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20233 Unit!17498 (_2!11035 lt!373961))))))

(assert (=> d!80390 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5617 charSet!5)) (bvslt (_2!11035 lt!373961) (size!5617 charSet!5)) (bvsge (_2!11035 lt!373961) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5617 charSet!5)) (= (_2!11035 lt!373961) #b00000000000000000000000000000000))))

(assert (=> d!80390 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11035 lt!373961)) lt!373991)))

(declare-fun b!239086 () Bool)

(assert (=> b!239086 (= e!165245 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373992 (_2!11035 lt!373990)))))

(declare-fun b!239087 () Bool)

(declare-fun Unit!17499 () Unit!17482)

(assert (=> b!239087 (= e!165245 (tuple3!1555 Unit!17499 lt!373992 (_2!11035 lt!373990)))))

(assert (= (and d!80390 c!11401) b!239086))

(assert (= (and d!80390 (not c!11401)) b!239087))

(declare-fun m!361093 () Bool)

(assert (=> d!80390 m!361093))

(declare-fun m!361095 () Bool)

(assert (=> b!239086 m!361095))

(assert (=> b!239063 d!80390))

(declare-fun d!80394 () Bool)

(assert (=> d!80394 (= (array_inv!5358 charSet!5) (bvsge (size!5617 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51188 d!80394))

(push 1)

(assert (not b!239086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

