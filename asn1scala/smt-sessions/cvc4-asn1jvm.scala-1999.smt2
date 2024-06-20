; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51192 () Bool)

(assert start!51192)

(declare-fun res!199818 () Bool)

(declare-fun e!165239 () Bool)

(assert (=> start!51192 (=> (not res!199818) (not e!165239))))

(declare-fun ret!59 () (_ BitVec 32))

(declare-datatypes ((array!12788 0))(
  ( (array!12789 (arr!6606 (Array (_ BitVec 32) (_ BitVec 8))) (size!5619 (_ BitVec 32))) )
))
(declare-fun charSet!5 () array!12788)

(declare-fun i!492 () (_ BitVec 32))

(assert (=> start!51192 (= res!199818 (and (bvsge i!492 #b00000000000000000000000000000000) (bvsle i!492 (size!5619 charSet!5)) (bvslt ret!59 (size!5619 charSet!5)) (bvslt i!492 (size!5619 charSet!5)) (= ret!59 #b00000000000000000000000000000000)))))

(assert (=> start!51192 e!165239))

(assert (=> start!51192 true))

(declare-fun array_inv!5360 (array!12788) Bool)

(assert (=> start!51192 (array_inv!5360 charSet!5)))

(declare-fun b!239074 () Bool)

(declare-fun e!165238 () Bool)

(assert (=> b!239074 (= e!165239 e!165238)))

(declare-fun res!199817 () Bool)

(assert (=> b!239074 (=> (not res!199817) (not e!165238))))

(declare-datatypes ((Unit!17490 0))(
  ( (Unit!17491) )
))
(declare-datatypes ((tuple2!20236 0))(
  ( (tuple2!20237 (_1!11039 Unit!17490) (_2!11039 (_ BitVec 32))) )
))
(declare-fun lt!373973 () tuple2!20236)

(assert (=> b!239074 (= res!199817 (and (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5619 charSet!5)) (= (_2!11039 lt!373973) #b00000000000000000000000000000000)))))

(declare-fun ch!5 () (_ BitVec 8))

(declare-fun Unit!17492 () Unit!17490)

(declare-fun Unit!17493 () Unit!17490)

(assert (=> b!239074 (= lt!373973 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6606 charSet!5) i!492))) (tuple2!20237 Unit!17492 i!492) (tuple2!20237 Unit!17493 ret!59)))))

(declare-fun b!239075 () Bool)

(declare-datatypes ((tuple3!1558 0))(
  ( (tuple3!1559 (_1!11040 Unit!17490) (_2!11040 (_ BitVec 32)) (_3!921 (_ BitVec 32))) )
))
(declare-fun lt!373974 () tuple3!1558)

(assert (=> b!239075 (= e!165238 (and (bvslt (_2!11040 lt!373974) (size!5619 charSet!5)) (= (_3!921 lt!373974) #b00000000000000000000000000000000)))))

(declare-fun GetCharIndexWhile!0 ((_ BitVec 8) array!12788 (_ BitVec 32) (_ BitVec 32)) tuple3!1558)

(assert (=> b!239075 (= lt!373974 (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11039 lt!373973)))))

(assert (= (and start!51192 res!199818) b!239074))

(assert (= (and b!239074 res!199817) b!239075))

(declare-fun m!361083 () Bool)

(assert (=> start!51192 m!361083))

(declare-fun m!361085 () Bool)

(assert (=> b!239074 m!361085))

(declare-fun m!361087 () Bool)

(assert (=> b!239075 m!361087))

(push 1)

(assert (not b!239075))

(assert (not start!51192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80396 () Bool)

(declare-fun lt!374000 () tuple3!1558)

(assert (=> d!80396 (and (bvsge (_2!11040 lt!374000) #b00000000000000000000000000000000) (bvsle (_2!11040 lt!374000) (size!5619 charSet!5)) (bvslt (_3!921 lt!374000) (size!5619 charSet!5)) (bvsge (_3!921 lt!374000) #b00000000000000000000000000000000) (or (bvsge (_2!11040 lt!374000) (size!5619 charSet!5)) (not (= (_3!921 lt!374000) #b00000000000000000000000000000000))))))

(declare-fun e!165248 () tuple3!1558)

(assert (=> d!80396 (= lt!374000 e!165248)))

(declare-fun c!11404 () Bool)

(declare-fun lt!374001 () tuple2!20236)

(declare-fun lt!373999 () (_ BitVec 32))

(assert (=> d!80396 (= c!11404 (and (bvslt lt!373999 (size!5619 charSet!5)) (= (_2!11039 lt!374001) #b00000000000000000000000000000000)))))

(assert (=> d!80396 (= lt!373999 (bvadd #b00000000000000000000000000000001 i!492 #b00000000000000000000000000000001))))

(declare-fun Unit!17500 () Unit!17490)

(declare-fun Unit!17501 () Unit!17490)

(assert (=> d!80396 (= lt!374001 (ite (= ((_ sign_extend 24) ch!5) ((_ sign_extend 24) (select (arr!6606 charSet!5) (bvadd #b00000000000000000000000000000001 i!492)))) (tuple2!20237 Unit!17500 (bvadd #b00000000000000000000000000000001 i!492)) (tuple2!20237 Unit!17501 (_2!11039 lt!373973))))))

(assert (=> d!80396 (and (bvsge (bvadd #b00000000000000000000000000000001 i!492) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!492) (size!5619 charSet!5)) (bvslt (_2!11039 lt!373973) (size!5619 charSet!5)) (bvsge (_2!11039 lt!373973) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!492) (size!5619 charSet!5)) (= (_2!11039 lt!373973) #b00000000000000000000000000000000))))

(assert (=> d!80396 (= (GetCharIndexWhile!0 ch!5 charSet!5 (bvadd #b00000000000000000000000000000001 i!492) (_2!11039 lt!373973)) lt!374000)))

(declare-fun b!239092 () Bool)

(assert (=> b!239092 (= e!165248 (GetCharIndexWhile!0 ch!5 charSet!5 lt!373999 (_2!11039 lt!374001)))))

(declare-fun b!239093 () Bool)

(declare-fun Unit!17502 () Unit!17490)

(assert (=> b!239093 (= e!165248 (tuple3!1559 Unit!17502 lt!373999 (_2!11039 lt!374001)))))

(assert (= (and d!80396 c!11404) b!239092))

(assert (= (and d!80396 (not c!11404)) b!239093))

(declare-fun m!361097 () Bool)

(assert (=> d!80396 m!361097))

(declare-fun m!361099 () Bool)

(assert (=> b!239092 m!361099))

(assert (=> b!239075 d!80396))

(declare-fun d!80398 () Bool)

(assert (=> d!80398 (= (array_inv!5360 charSet!5) (bvsge (size!5619 charSet!5) #b00000000000000000000000000000000))))

(assert (=> start!51192 d!80398))

(push 1)

(assert (not b!239092))

(check-sat)

