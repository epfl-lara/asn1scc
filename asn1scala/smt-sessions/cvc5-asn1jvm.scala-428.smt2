; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11376 () Bool)

(assert start!11376)

(declare-fun lt!88377 () (_ BitVec 64))

(declare-fun lt!88374 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!37497 () Bool)

(declare-fun b!56344 () Bool)

(assert (=> b!56344 (= e!37497 (or (not (= lt!88374 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!88374 (bvand (bvadd lt!88377 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56344 (= lt!88374 (bvand lt!88377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2605 0))(
  ( (array!2606 (arr!1736 (Array (_ BitVec 32) (_ BitVec 8))) (size!1184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2056 0))(
  ( (BitStream!2057 (buf!1553 array!2605) (currentByte!3147 (_ BitVec 32)) (currentBit!3142 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3895 0))(
  ( (Unit!3896) )
))
(declare-datatypes ((tuple2!5138 0))(
  ( (tuple2!5139 (_1!2680 Unit!3895) (_2!2680 BitStream!2056)) )
))
(declare-fun lt!88376 () tuple2!5138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56344 (= lt!88377 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))))))

(declare-fun lt!88381 () tuple2!5138)

(declare-fun thiss!1379 () BitStream!2056)

(assert (=> b!56344 (= (size!1184 (buf!1553 (_2!2680 lt!88381))) (size!1184 (buf!1553 thiss!1379)))))

(declare-fun b!56345 () Bool)

(declare-fun res!46884 () Bool)

(declare-fun e!37499 () Bool)

(assert (=> b!56345 (=> (not res!46884) (not e!37499))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56345 (= res!46884 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2605)

(declare-datatypes ((tuple2!5140 0))(
  ( (tuple2!5141 (_1!2681 BitStream!2056) (_2!2681 BitStream!2056)) )
))
(declare-fun lt!88379 () tuple2!5140)

(declare-fun e!37492 () Bool)

(declare-fun b!56346 () Bool)

(declare-datatypes ((List!603 0))(
  ( (Nil!600) (Cons!599 (h!718 Bool) (t!1353 List!603)) )
))
(declare-fun head!422 (List!603) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2056 array!2605 (_ BitVec 64) (_ BitVec 64)) List!603)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2056 BitStream!2056 (_ BitVec 64)) List!603)

(assert (=> b!56346 (= e!37492 (= (head!422 (byteArrayBitContentToList!0 (_2!2680 lt!88376) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!422 (bitStreamReadBitsIntoList!0 (_2!2680 lt!88376) (_1!2681 lt!88379) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!46876 () Bool)

(assert (=> start!11376 (=> (not res!46876) (not e!37499))))

(assert (=> start!11376 (= res!46876 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1184 srcBuffer!2))))))))

(assert (=> start!11376 e!37499))

(assert (=> start!11376 true))

(declare-fun array_inv!1087 (array!2605) Bool)

(assert (=> start!11376 (array_inv!1087 srcBuffer!2)))

(declare-fun e!37495 () Bool)

(declare-fun inv!12 (BitStream!2056) Bool)

(assert (=> start!11376 (and (inv!12 thiss!1379) e!37495)))

(declare-fun b!56347 () Bool)

(declare-fun res!46880 () Bool)

(assert (=> b!56347 (=> res!46880 e!37497)))

(declare-fun lt!88380 () (_ BitVec 64))

(assert (=> b!56347 (= res!46880 (not (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88381))) (currentByte!3147 (_2!2680 lt!88381)) (currentBit!3142 (_2!2680 lt!88381))) (bvsub (bvadd lt!88380 to!314) i!635))))))

(declare-fun b!56348 () Bool)

(declare-fun e!37493 () Bool)

(declare-fun e!37498 () Bool)

(assert (=> b!56348 (= e!37493 e!37498)))

(declare-fun res!46883 () Bool)

(assert (=> b!56348 (=> res!46883 e!37498)))

(declare-fun isPrefixOf!0 (BitStream!2056 BitStream!2056) Bool)

(assert (=> b!56348 (= res!46883 (not (isPrefixOf!0 thiss!1379 (_2!2680 lt!88376))))))

(assert (=> b!56348 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88375 () Unit!3895)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2056 BitStream!2056 (_ BitVec 64) (_ BitVec 64)) Unit!3895)

(assert (=> b!56348 (= lt!88375 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2680 lt!88376) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2056 (_ BitVec 8) (_ BitVec 32)) tuple2!5138)

(assert (=> b!56348 (= lt!88376 (appendBitFromByte!0 thiss!1379 (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!56349 () Bool)

(assert (=> b!56349 (= e!37495 (array_inv!1087 (buf!1553 thiss!1379)))))

(declare-fun b!56350 () Bool)

(declare-fun res!46882 () Bool)

(assert (=> b!56350 (=> res!46882 e!37497)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56350 (= res!46882 (not (invariant!0 (currentBit!3142 (_2!2680 lt!88381)) (currentByte!3147 (_2!2680 lt!88381)) (size!1184 (buf!1553 (_2!2680 lt!88381))))))))

(declare-fun b!56351 () Bool)

(assert (=> b!56351 (= e!37499 (not e!37493))))

(declare-fun res!46879 () Bool)

(assert (=> b!56351 (=> res!46879 e!37493)))

(assert (=> b!56351 (= res!46879 (bvsge i!635 to!314))))

(assert (=> b!56351 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88372 () Unit!3895)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2056) Unit!3895)

(assert (=> b!56351 (= lt!88372 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!56351 (= lt!88380 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)))))

(declare-fun b!56352 () Bool)

(declare-fun res!46877 () Bool)

(assert (=> b!56352 (=> res!46877 e!37497)))

(assert (=> b!56352 (= res!46877 (not (= (size!1184 (buf!1553 thiss!1379)) (size!1184 (buf!1553 (_2!2680 lt!88381))))))))

(declare-fun b!56353 () Bool)

(assert (=> b!56353 (= e!37498 e!37497)))

(declare-fun res!46881 () Bool)

(assert (=> b!56353 (=> res!46881 e!37497)))

(assert (=> b!56353 (= res!46881 (not (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!88381))))))

(assert (=> b!56353 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88381))))

(declare-fun lt!88373 () Unit!3895)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2056 BitStream!2056 BitStream!2056) Unit!3895)

(assert (=> b!56353 (= lt!88373 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2680 lt!88376) (_2!2680 lt!88381)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2056 array!2605 (_ BitVec 64) (_ BitVec 64)) tuple2!5138)

(assert (=> b!56353 (= lt!88381 (appendBitsMSBFirstLoop!0 (_2!2680 lt!88376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!56353 e!37492))

(declare-fun res!46878 () Bool)

(assert (=> b!56353 (=> (not res!46878) (not e!37492))))

(assert (=> b!56353 (= res!46878 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88378 () Unit!3895)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2056 array!2605 (_ BitVec 64)) Unit!3895)

(assert (=> b!56353 (= lt!88378 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1553 (_2!2680 lt!88376)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2056 BitStream!2056) tuple2!5140)

(assert (=> b!56353 (= lt!88379 (reader!0 thiss!1379 (_2!2680 lt!88376)))))

(assert (= (and start!11376 res!46876) b!56345))

(assert (= (and b!56345 res!46884) b!56351))

(assert (= (and b!56351 (not res!46879)) b!56348))

(assert (= (and b!56348 (not res!46883)) b!56353))

(assert (= (and b!56353 res!46878) b!56346))

(assert (= (and b!56353 (not res!46881)) b!56347))

(assert (= (and b!56347 (not res!46880)) b!56350))

(assert (= (and b!56350 (not res!46882)) b!56352))

(assert (= (and b!56352 (not res!46877)) b!56344))

(assert (= start!11376 b!56349))

(declare-fun m!88801 () Bool)

(assert (=> start!11376 m!88801))

(declare-fun m!88803 () Bool)

(assert (=> start!11376 m!88803))

(declare-fun m!88805 () Bool)

(assert (=> b!56348 m!88805))

(declare-fun m!88807 () Bool)

(assert (=> b!56348 m!88807))

(declare-fun m!88809 () Bool)

(assert (=> b!56348 m!88809))

(declare-fun m!88811 () Bool)

(assert (=> b!56348 m!88811))

(assert (=> b!56348 m!88809))

(declare-fun m!88813 () Bool)

(assert (=> b!56348 m!88813))

(declare-fun m!88815 () Bool)

(assert (=> b!56346 m!88815))

(assert (=> b!56346 m!88815))

(declare-fun m!88817 () Bool)

(assert (=> b!56346 m!88817))

(declare-fun m!88819 () Bool)

(assert (=> b!56346 m!88819))

(assert (=> b!56346 m!88819))

(declare-fun m!88821 () Bool)

(assert (=> b!56346 m!88821))

(declare-fun m!88823 () Bool)

(assert (=> b!56347 m!88823))

(declare-fun m!88825 () Bool)

(assert (=> b!56350 m!88825))

(declare-fun m!88827 () Bool)

(assert (=> b!56349 m!88827))

(declare-fun m!88829 () Bool)

(assert (=> b!56351 m!88829))

(declare-fun m!88831 () Bool)

(assert (=> b!56351 m!88831))

(declare-fun m!88833 () Bool)

(assert (=> b!56351 m!88833))

(declare-fun m!88835 () Bool)

(assert (=> b!56344 m!88835))

(declare-fun m!88837 () Bool)

(assert (=> b!56345 m!88837))

(declare-fun m!88839 () Bool)

(assert (=> b!56353 m!88839))

(declare-fun m!88841 () Bool)

(assert (=> b!56353 m!88841))

(declare-fun m!88843 () Bool)

(assert (=> b!56353 m!88843))

(declare-fun m!88845 () Bool)

(assert (=> b!56353 m!88845))

(declare-fun m!88847 () Bool)

(assert (=> b!56353 m!88847))

(declare-fun m!88849 () Bool)

(assert (=> b!56353 m!88849))

(declare-fun m!88851 () Bool)

(assert (=> b!56353 m!88851))

(push 1)

(assert (not b!56350))

(assert (not b!56353))

(assert (not b!56349))

(assert (not b!56348))

(assert (not b!56345))

(assert (not b!56346))

(assert (not b!56351))

(assert (not b!56344))

(assert (not b!56347))

(assert (not start!11376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17968 () Bool)

(declare-fun res!46963 () Bool)

(declare-fun e!37574 () Bool)

(assert (=> d!17968 (=> (not res!46963) (not e!37574))))

(assert (=> d!17968 (= res!46963 (= (size!1184 (buf!1553 thiss!1379)) (size!1184 (buf!1553 (_2!2680 lt!88376)))))))

(assert (=> d!17968 (= (isPrefixOf!0 thiss!1379 (_2!2680 lt!88376)) e!37574)))

(declare-fun b!56456 () Bool)

(declare-fun res!46965 () Bool)

(assert (=> b!56456 (=> (not res!46965) (not e!37574))))

(assert (=> b!56456 (= res!46965 (bvsle (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)) (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376)))))))

(declare-fun b!56457 () Bool)

(declare-fun e!37573 () Bool)

(assert (=> b!56457 (= e!37574 e!37573)))

(declare-fun res!46964 () Bool)

(assert (=> b!56457 (=> res!46964 e!37573)))

(assert (=> b!56457 (= res!46964 (= (size!1184 (buf!1553 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56458 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2605 array!2605 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56458 (= e!37573 (arrayBitRangesEq!0 (buf!1553 thiss!1379) (buf!1553 (_2!2680 lt!88376)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379))))))

(assert (= (and d!17968 res!46963) b!56456))

(assert (= (and b!56456 res!46965) b!56457))

(assert (= (and b!56457 (not res!46964)) b!56458))

(assert (=> b!56456 m!88833))

(assert (=> b!56456 m!88835))

(assert (=> b!56458 m!88833))

(assert (=> b!56458 m!88833))

(declare-fun m!88981 () Bool)

(assert (=> b!56458 m!88981))

(assert (=> b!56348 d!17968))

(declare-fun d!17970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17970 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4500 () Bool)

(assert (= bs!4500 d!17970))

(declare-fun m!88983 () Bool)

(assert (=> bs!4500 m!88983))

(assert (=> b!56348 d!17970))

(declare-fun d!17972 () Bool)

(declare-fun e!37577 () Bool)

(assert (=> d!17972 e!37577))

(declare-fun res!46968 () Bool)

(assert (=> d!17972 (=> (not res!46968) (not e!37577))))

(assert (=> d!17972 (= res!46968 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!88474 () Unit!3895)

(declare-fun choose!27 (BitStream!2056 BitStream!2056 (_ BitVec 64) (_ BitVec 64)) Unit!3895)

(assert (=> d!17972 (= lt!88474 (choose!27 thiss!1379 (_2!2680 lt!88376) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17972 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2680 lt!88376) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88474)))

(declare-fun b!56461 () Bool)

(assert (=> b!56461 (= e!37577 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17972 res!46968) b!56461))

(declare-fun m!88985 () Bool)

(assert (=> d!17972 m!88985))

(assert (=> b!56461 m!88811))

(assert (=> b!56348 d!17972))

(declare-fun b!56556 () Bool)

(declare-fun e!37624 () Bool)

(declare-datatypes ((tuple2!5158 0))(
  ( (tuple2!5159 (_1!2690 BitStream!2056) (_2!2690 Bool)) )
))
(declare-fun lt!88681 () tuple2!5158)

(declare-fun lt!88679 () tuple2!5138)

(assert (=> b!56556 (= e!37624 (= (bitIndex!0 (size!1184 (buf!1553 (_1!2690 lt!88681))) (currentByte!3147 (_1!2690 lt!88681)) (currentBit!3142 (_1!2690 lt!88681))) (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88679))) (currentByte!3147 (_2!2680 lt!88679)) (currentBit!3142 (_2!2680 lt!88679)))))))

(declare-fun b!56558 () Bool)

(declare-fun res!47051 () Bool)

(declare-fun e!37625 () Bool)

(assert (=> b!56558 (=> (not res!47051) (not e!37625))))

(declare-fun lt!88687 () tuple2!5138)

(assert (=> b!56558 (= res!47051 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88687)))))

(declare-fun b!56559 () Bool)

(declare-fun e!37626 () Bool)

(assert (=> b!56559 (= e!37626 e!37624)))

(declare-fun res!47053 () Bool)

(assert (=> b!56559 (=> (not res!47053) (not e!37624))))

(declare-fun lt!88689 () Bool)

(assert (=> b!56559 (= res!47053 (and (= (_2!2690 lt!88681) lt!88689) (= (_1!2690 lt!88681) (_2!2680 lt!88679))))))

(declare-fun readBitPure!0 (BitStream!2056) tuple2!5158)

(declare-fun readerFrom!0 (BitStream!2056 (_ BitVec 32) (_ BitVec 32)) BitStream!2056)

(assert (=> b!56559 (= lt!88681 (readBitPure!0 (readerFrom!0 (_2!2680 lt!88679) (currentBit!3142 thiss!1379) (currentByte!3147 thiss!1379))))))

(declare-fun b!56560 () Bool)

(declare-fun e!37627 () Bool)

(assert (=> b!56560 (= e!37625 e!37627)))

(declare-fun res!47056 () Bool)

(assert (=> b!56560 (=> (not res!47056) (not e!37627))))

(declare-fun lt!88680 () tuple2!5158)

(declare-fun lt!88688 () (_ BitVec 8))

(assert (=> b!56560 (= res!47056 (and (= (_2!2690 lt!88680) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!88688)) #b00000000000000000000000000000000))) (= (_1!2690 lt!88680) (_2!2680 lt!88687))))))

(declare-datatypes ((tuple2!5160 0))(
  ( (tuple2!5161 (_1!2691 array!2605) (_2!2691 BitStream!2056)) )
))
(declare-fun lt!88682 () tuple2!5160)

(declare-fun lt!88686 () BitStream!2056)

(declare-fun readBits!0 (BitStream!2056 (_ BitVec 64)) tuple2!5160)

(assert (=> b!56560 (= lt!88682 (readBits!0 lt!88686 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!56560 (= lt!88680 (readBitPure!0 lt!88686))))

(assert (=> b!56560 (= lt!88686 (readerFrom!0 (_2!2680 lt!88687) (currentBit!3142 thiss!1379) (currentByte!3147 thiss!1379)))))

(declare-fun b!56561 () Bool)

(declare-fun res!47055 () Bool)

(assert (=> b!56561 (=> (not res!47055) (not e!37626))))

(assert (=> b!56561 (= res!47055 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88679)))))

(declare-fun b!56557 () Bool)

(assert (=> b!56557 (= e!37627 (= (bitIndex!0 (size!1184 (buf!1553 (_1!2690 lt!88680))) (currentByte!3147 (_1!2690 lt!88680)) (currentBit!3142 (_1!2690 lt!88680))) (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88687))) (currentByte!3147 (_2!2680 lt!88687)) (currentBit!3142 (_2!2680 lt!88687)))))))

(declare-fun d!17974 () Bool)

(assert (=> d!17974 e!37625))

(declare-fun res!47052 () Bool)

(assert (=> d!17974 (=> (not res!47052) (not e!37625))))

(assert (=> d!17974 (= res!47052 (= (size!1184 (buf!1553 (_2!2680 lt!88687))) (size!1184 (buf!1553 thiss!1379))))))

(declare-fun lt!88683 () array!2605)

(assert (=> d!17974 (= lt!88688 (select (arr!1736 lt!88683) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17974 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1184 lt!88683)))))

(assert (=> d!17974 (= lt!88683 (array!2606 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!88690 () tuple2!5138)

(assert (=> d!17974 (= lt!88687 (tuple2!5139 (_1!2680 lt!88690) (_2!2680 lt!88690)))))

(assert (=> d!17974 (= lt!88690 lt!88679)))

(assert (=> d!17974 e!37626))

(declare-fun res!47049 () Bool)

(assert (=> d!17974 (=> (not res!47049) (not e!37626))))

(assert (=> d!17974 (= res!47049 (= (size!1184 (buf!1553 thiss!1379)) (size!1184 (buf!1553 (_2!2680 lt!88679)))))))

(declare-fun appendBit!0 (BitStream!2056 Bool) tuple2!5138)

(assert (=> d!17974 (= lt!88679 (appendBit!0 thiss!1379 lt!88689))))

(assert (=> d!17974 (= lt!88689 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17974 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17974 (= (appendBitFromByte!0 thiss!1379 (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!88687)))

(declare-fun b!56562 () Bool)

(declare-fun res!47050 () Bool)

(assert (=> b!56562 (=> (not res!47050) (not e!37625))))

(declare-fun lt!88684 () (_ BitVec 64))

(declare-fun lt!88685 () (_ BitVec 64))

(assert (=> b!56562 (= res!47050 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88687))) (currentByte!3147 (_2!2680 lt!88687)) (currentBit!3142 (_2!2680 lt!88687))) (bvadd lt!88685 lt!88684)))))

(assert (=> b!56562 (or (not (= (bvand lt!88685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88684 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88685 lt!88684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56562 (= lt!88684 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56562 (= lt!88685 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)))))

(declare-fun b!56563 () Bool)

(declare-fun res!47054 () Bool)

(assert (=> b!56563 (=> (not res!47054) (not e!37626))))

(assert (=> b!56563 (= res!47054 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88679))) (currentByte!3147 (_2!2680 lt!88679)) (currentBit!3142 (_2!2680 lt!88679))) (bvadd (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17974 res!47049) b!56563))

(assert (= (and b!56563 res!47054) b!56561))

(assert (= (and b!56561 res!47055) b!56559))

(assert (= (and b!56559 res!47053) b!56556))

(assert (= (and d!17974 res!47052) b!56562))

(assert (= (and b!56562 res!47050) b!56558))

(assert (= (and b!56558 res!47051) b!56560))

(assert (= (and b!56560 res!47056) b!56557))

(declare-fun m!89085 () Bool)

(assert (=> b!56559 m!89085))

(assert (=> b!56559 m!89085))

(declare-fun m!89087 () Bool)

(assert (=> b!56559 m!89087))

(declare-fun m!89089 () Bool)

(assert (=> d!17974 m!89089))

(declare-fun m!89091 () Bool)

(assert (=> d!17974 m!89091))

(declare-fun m!89093 () Bool)

(assert (=> d!17974 m!89093))

(declare-fun m!89095 () Bool)

(assert (=> b!56562 m!89095))

(assert (=> b!56562 m!88833))

(declare-fun m!89097 () Bool)

(assert (=> b!56557 m!89097))

(assert (=> b!56557 m!89095))

(declare-fun m!89099 () Bool)

(assert (=> b!56558 m!89099))

(declare-fun m!89101 () Bool)

(assert (=> b!56556 m!89101))

(declare-fun m!89103 () Bool)

(assert (=> b!56556 m!89103))

(assert (=> b!56563 m!89103))

(assert (=> b!56563 m!88833))

(declare-fun m!89105 () Bool)

(assert (=> b!56561 m!89105))

(declare-fun m!89107 () Bool)

(assert (=> b!56560 m!89107))

(declare-fun m!89109 () Bool)

(assert (=> b!56560 m!89109))

(declare-fun m!89111 () Bool)

(assert (=> b!56560 m!89111))

(assert (=> b!56348 d!17974))

(declare-fun b!56574 () Bool)

(declare-fun res!47063 () Bool)

(declare-fun e!37633 () Bool)

(assert (=> b!56574 (=> (not res!47063) (not e!37633))))

(declare-fun lt!88733 () tuple2!5140)

(assert (=> b!56574 (= res!47063 (isPrefixOf!0 (_2!2681 lt!88733) (_2!2680 lt!88376)))))

(declare-fun b!56575 () Bool)

(declare-fun res!47065 () Bool)

(assert (=> b!56575 (=> (not res!47065) (not e!37633))))

(assert (=> b!56575 (= res!47065 (isPrefixOf!0 (_1!2681 lt!88733) thiss!1379))))

(declare-fun b!56577 () Bool)

(declare-fun e!37632 () Unit!3895)

(declare-fun lt!88742 () Unit!3895)

(assert (=> b!56577 (= e!37632 lt!88742)))

(declare-fun lt!88736 () (_ BitVec 64))

(assert (=> b!56577 (= lt!88736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88737 () (_ BitVec 64))

(assert (=> b!56577 (= lt!88737 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2605 array!2605 (_ BitVec 64) (_ BitVec 64)) Unit!3895)

(assert (=> b!56577 (= lt!88742 (arrayBitRangesEqSymmetric!0 (buf!1553 thiss!1379) (buf!1553 (_2!2680 lt!88376)) lt!88736 lt!88737))))

(assert (=> b!56577 (arrayBitRangesEq!0 (buf!1553 (_2!2680 lt!88376)) (buf!1553 thiss!1379) lt!88736 lt!88737)))

(declare-fun b!56578 () Bool)

(declare-fun Unit!3905 () Unit!3895)

(assert (=> b!56578 (= e!37632 Unit!3905)))

(declare-fun d!18010 () Bool)

(assert (=> d!18010 e!37633))

(declare-fun res!47064 () Bool)

(assert (=> d!18010 (=> (not res!47064) (not e!37633))))

(assert (=> d!18010 (= res!47064 (isPrefixOf!0 (_1!2681 lt!88733) (_2!2681 lt!88733)))))

(declare-fun lt!88740 () BitStream!2056)

(assert (=> d!18010 (= lt!88733 (tuple2!5141 lt!88740 (_2!2680 lt!88376)))))

(declare-fun lt!88731 () Unit!3895)

(declare-fun lt!88748 () Unit!3895)

(assert (=> d!18010 (= lt!88731 lt!88748)))

(assert (=> d!18010 (isPrefixOf!0 lt!88740 (_2!2680 lt!88376))))

(assert (=> d!18010 (= lt!88748 (lemmaIsPrefixTransitive!0 lt!88740 (_2!2680 lt!88376) (_2!2680 lt!88376)))))

(declare-fun lt!88744 () Unit!3895)

(declare-fun lt!88749 () Unit!3895)

(assert (=> d!18010 (= lt!88744 lt!88749)))

(assert (=> d!18010 (isPrefixOf!0 lt!88740 (_2!2680 lt!88376))))

(assert (=> d!18010 (= lt!88749 (lemmaIsPrefixTransitive!0 lt!88740 thiss!1379 (_2!2680 lt!88376)))))

(declare-fun lt!88747 () Unit!3895)

(assert (=> d!18010 (= lt!88747 e!37632)))

(declare-fun c!4065 () Bool)

(assert (=> d!18010 (= c!4065 (not (= (size!1184 (buf!1553 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!88746 () Unit!3895)

(declare-fun lt!88735 () Unit!3895)

(assert (=> d!18010 (= lt!88746 lt!88735)))

(assert (=> d!18010 (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!88376))))

(assert (=> d!18010 (= lt!88735 (lemmaIsPrefixRefl!0 (_2!2680 lt!88376)))))

(declare-fun lt!88738 () Unit!3895)

(declare-fun lt!88750 () Unit!3895)

(assert (=> d!18010 (= lt!88738 lt!88750)))

(assert (=> d!18010 (= lt!88750 (lemmaIsPrefixRefl!0 (_2!2680 lt!88376)))))

(declare-fun lt!88745 () Unit!3895)

(declare-fun lt!88732 () Unit!3895)

(assert (=> d!18010 (= lt!88745 lt!88732)))

(assert (=> d!18010 (isPrefixOf!0 lt!88740 lt!88740)))

(assert (=> d!18010 (= lt!88732 (lemmaIsPrefixRefl!0 lt!88740))))

(declare-fun lt!88739 () Unit!3895)

(declare-fun lt!88741 () Unit!3895)

(assert (=> d!18010 (= lt!88739 lt!88741)))

(assert (=> d!18010 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18010 (= lt!88741 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18010 (= lt!88740 (BitStream!2057 (buf!1553 (_2!2680 lt!88376)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)))))

(assert (=> d!18010 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88376))))

(assert (=> d!18010 (= (reader!0 thiss!1379 (_2!2680 lt!88376)) lt!88733)))

(declare-fun lt!88734 () (_ BitVec 64))

(declare-fun lt!88743 () (_ BitVec 64))

(declare-fun b!56576 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2056 (_ BitVec 64)) BitStream!2056)

(assert (=> b!56576 (= e!37633 (= (_1!2681 lt!88733) (withMovedBitIndex!0 (_2!2681 lt!88733) (bvsub lt!88734 lt!88743))))))

(assert (=> b!56576 (or (= (bvand lt!88734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88743 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88734 lt!88743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56576 (= lt!88743 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))))))

(assert (=> b!56576 (= lt!88734 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)))))

(assert (= (and d!18010 c!4065) b!56577))

(assert (= (and d!18010 (not c!4065)) b!56578))

(assert (= (and d!18010 res!47064) b!56575))

(assert (= (and b!56575 res!47065) b!56574))

(assert (= (and b!56574 res!47063) b!56576))

(declare-fun m!89113 () Bool)

(assert (=> b!56575 m!89113))

(declare-fun m!89115 () Bool)

(assert (=> d!18010 m!89115))

(declare-fun m!89117 () Bool)

(assert (=> d!18010 m!89117))

(declare-fun m!89119 () Bool)

(assert (=> d!18010 m!89119))

(declare-fun m!89121 () Bool)

(assert (=> d!18010 m!89121))

(declare-fun m!89123 () Bool)

(assert (=> d!18010 m!89123))

(declare-fun m!89125 () Bool)

(assert (=> d!18010 m!89125))

(assert (=> d!18010 m!88831))

(assert (=> d!18010 m!88807))

(declare-fun m!89127 () Bool)

(assert (=> d!18010 m!89127))

(declare-fun m!89129 () Bool)

(assert (=> d!18010 m!89129))

(assert (=> d!18010 m!88829))

(assert (=> b!56577 m!88833))

(declare-fun m!89131 () Bool)

(assert (=> b!56577 m!89131))

(declare-fun m!89133 () Bool)

(assert (=> b!56577 m!89133))

(declare-fun m!89135 () Bool)

(assert (=> b!56576 m!89135))

(assert (=> b!56576 m!88835))

(assert (=> b!56576 m!88833))

(declare-fun m!89137 () Bool)

(assert (=> b!56574 m!89137))

(assert (=> b!56353 d!18010))

(declare-fun b!56678 () Bool)

(declare-fun e!37680 () Bool)

(declare-fun lt!89184 () (_ BitVec 64))

(assert (=> b!56678 (= e!37680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) lt!89184))))

(declare-fun lt!89180 () tuple2!5140)

(declare-fun b!56679 () Bool)

(declare-fun lt!89173 () tuple2!5138)

(declare-fun e!37679 () Bool)

(assert (=> b!56679 (= e!37679 (= (bitStreamReadBitsIntoList!0 (_2!2680 lt!89173) (_1!2681 lt!89180) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2680 lt!89173) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89170 () Unit!3895)

(declare-fun lt!89181 () Unit!3895)

(assert (=> b!56679 (= lt!89170 lt!89181)))

(assert (=> b!56679 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!89173)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) lt!89184)))

(assert (=> b!56679 (= lt!89181 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2680 lt!88376) (buf!1553 (_2!2680 lt!89173)) lt!89184))))

(assert (=> b!56679 e!37680))

(declare-fun res!47134 () Bool)

(assert (=> b!56679 (=> (not res!47134) (not e!37680))))

(assert (=> b!56679 (= res!47134 (and (= (size!1184 (buf!1553 (_2!2680 lt!88376))) (size!1184 (buf!1553 (_2!2680 lt!89173)))) (bvsge lt!89184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56679 (= lt!89184 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56679 (= lt!89180 (reader!0 (_2!2680 lt!88376) (_2!2680 lt!89173)))))

(declare-fun b!56681 () Bool)

(declare-fun res!47136 () Bool)

(assert (=> b!56681 (=> (not res!47136) (not e!37679))))

(assert (=> b!56681 (= res!47136 (= (size!1184 (buf!1553 (_2!2680 lt!89173))) (size!1184 (buf!1553 (_2!2680 lt!88376)))))))

(declare-fun b!56682 () Bool)

(declare-fun e!37678 () tuple2!5138)

(declare-fun lt!89163 () tuple2!5138)

(declare-fun Unit!3912 () Unit!3895)

(assert (=> b!56682 (= e!37678 (tuple2!5139 Unit!3912 (_2!2680 lt!89163)))))

(declare-fun lt!89150 () tuple2!5138)

(assert (=> b!56682 (= lt!89150 (appendBitFromByte!0 (_2!2680 lt!88376) (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!89143 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89143 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89153 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89153 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89168 () Unit!3895)

(assert (=> b!56682 (= lt!89168 (validateOffsetBitsIneqLemma!0 (_2!2680 lt!88376) (_2!2680 lt!89150) lt!89143 lt!89153))))

(assert (=> b!56682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!89150)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!89150))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!89150))) (bvsub lt!89143 lt!89153))))

(declare-fun lt!89162 () Unit!3895)

(assert (=> b!56682 (= lt!89162 lt!89168)))

(declare-fun lt!89167 () tuple2!5140)

(assert (=> b!56682 (= lt!89167 (reader!0 (_2!2680 lt!88376) (_2!2680 lt!89150)))))

(declare-fun lt!89158 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89158 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89151 () Unit!3895)

(assert (=> b!56682 (= lt!89151 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2680 lt!88376) (buf!1553 (_2!2680 lt!89150)) lt!89158))))

(assert (=> b!56682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!89150)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) lt!89158)))

(declare-fun lt!89179 () Unit!3895)

(assert (=> b!56682 (= lt!89179 lt!89151)))

(assert (=> b!56682 (= (head!422 (byteArrayBitContentToList!0 (_2!2680 lt!89150) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!422 (bitStreamReadBitsIntoList!0 (_2!2680 lt!89150) (_1!2681 lt!89167) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89182 () Unit!3895)

(declare-fun Unit!3914 () Unit!3895)

(assert (=> b!56682 (= lt!89182 Unit!3914)))

(assert (=> b!56682 (= lt!89163 (appendBitsMSBFirstLoop!0 (_2!2680 lt!89150) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!89149 () Unit!3895)

(assert (=> b!56682 (= lt!89149 (lemmaIsPrefixTransitive!0 (_2!2680 lt!88376) (_2!2680 lt!89150) (_2!2680 lt!89163)))))

(assert (=> b!56682 (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!89163))))

(declare-fun lt!89176 () Unit!3895)

(assert (=> b!56682 (= lt!89176 lt!89149)))

(assert (=> b!56682 (= (size!1184 (buf!1553 (_2!2680 lt!89163))) (size!1184 (buf!1553 (_2!2680 lt!88376))))))

(declare-fun lt!89161 () Unit!3895)

(declare-fun Unit!3916 () Unit!3895)

(assert (=> b!56682 (= lt!89161 Unit!3916)))

(assert (=> b!56682 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!89163))) (currentByte!3147 (_2!2680 lt!89163)) (currentBit!3142 (_2!2680 lt!89163))) (bvsub (bvadd (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89159 () Unit!3895)

(declare-fun Unit!3918 () Unit!3895)

(assert (=> b!56682 (= lt!89159 Unit!3918)))

(assert (=> b!56682 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!89163))) (currentByte!3147 (_2!2680 lt!89163)) (currentBit!3142 (_2!2680 lt!89163))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!89150))) (currentByte!3147 (_2!2680 lt!89150)) (currentBit!3142 (_2!2680 lt!89150))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89174 () Unit!3895)

(declare-fun Unit!3919 () Unit!3895)

(assert (=> b!56682 (= lt!89174 Unit!3919)))

(declare-fun lt!89146 () tuple2!5140)

(declare-fun call!736 () tuple2!5140)

(assert (=> b!56682 (= lt!89146 call!736)))

(declare-fun lt!89171 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89171 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89169 () Unit!3895)

(assert (=> b!56682 (= lt!89169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2680 lt!88376) (buf!1553 (_2!2680 lt!89163)) lt!89171))))

(assert (=> b!56682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!89163)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376))) lt!89171)))

(declare-fun lt!89145 () Unit!3895)

(assert (=> b!56682 (= lt!89145 lt!89169)))

(declare-fun lt!89144 () tuple2!5140)

(assert (=> b!56682 (= lt!89144 (reader!0 (_2!2680 lt!89150) (_2!2680 lt!89163)))))

(declare-fun lt!89160 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89160 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89166 () Unit!3895)

(assert (=> b!56682 (= lt!89166 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2680 lt!89150) (buf!1553 (_2!2680 lt!89163)) lt!89160))))

(assert (=> b!56682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!89163)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!89150))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!89150))) lt!89160)))

(declare-fun lt!89178 () Unit!3895)

(assert (=> b!56682 (= lt!89178 lt!89166)))

(declare-fun lt!89148 () List!603)

(assert (=> b!56682 (= lt!89148 (byteArrayBitContentToList!0 (_2!2680 lt!89163) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89183 () List!603)

(assert (=> b!56682 (= lt!89183 (byteArrayBitContentToList!0 (_2!2680 lt!89163) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89155 () List!603)

(assert (=> b!56682 (= lt!89155 (bitStreamReadBitsIntoList!0 (_2!2680 lt!89163) (_1!2681 lt!89146) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89164 () List!603)

(assert (=> b!56682 (= lt!89164 (bitStreamReadBitsIntoList!0 (_2!2680 lt!89163) (_1!2681 lt!89144) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89177 () (_ BitVec 64))

(assert (=> b!56682 (= lt!89177 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89157 () Unit!3895)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2056 BitStream!2056 BitStream!2056 BitStream!2056 (_ BitVec 64) List!603) Unit!3895)

(assert (=> b!56682 (= lt!89157 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2680 lt!89163) (_2!2680 lt!89163) (_1!2681 lt!89146) (_1!2681 lt!89144) lt!89177 lt!89155))))

(declare-fun tail!271 (List!603) List!603)

(assert (=> b!56682 (= (bitStreamReadBitsIntoList!0 (_2!2680 lt!89163) (_1!2681 lt!89144) (bvsub lt!89177 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!271 lt!89155))))

(declare-fun lt!89147 () Unit!3895)

(assert (=> b!56682 (= lt!89147 lt!89157)))

(declare-fun lt!89152 () (_ BitVec 64))

(declare-fun lt!89175 () Unit!3895)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2605 array!2605 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3895)

(assert (=> b!56682 (= lt!89175 (arrayBitRangesEqImpliesEq!0 (buf!1553 (_2!2680 lt!89150)) (buf!1553 (_2!2680 lt!89163)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!89152 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!89150))) (currentByte!3147 (_2!2680 lt!89150)) (currentBit!3142 (_2!2680 lt!89150)))))))

(declare-fun bitAt!0 (array!2605 (_ BitVec 64)) Bool)

(assert (=> b!56682 (= (bitAt!0 (buf!1553 (_2!2680 lt!89150)) lt!89152) (bitAt!0 (buf!1553 (_2!2680 lt!89163)) lt!89152))))

(declare-fun lt!89185 () Unit!3895)

(assert (=> b!56682 (= lt!89185 lt!89175)))

(declare-fun b!56683 () Bool)

(declare-fun res!47135 () Bool)

(assert (=> b!56683 (=> (not res!47135) (not e!37679))))

(assert (=> b!56683 (= res!47135 (invariant!0 (currentBit!3142 (_2!2680 lt!89173)) (currentByte!3147 (_2!2680 lt!89173)) (size!1184 (buf!1553 (_2!2680 lt!89173)))))))

(declare-fun b!56684 () Bool)

(declare-fun res!47132 () Bool)

(assert (=> b!56684 (=> (not res!47132) (not e!37679))))

(assert (=> b!56684 (= res!47132 (= (size!1184 (buf!1553 (_2!2680 lt!88376))) (size!1184 (buf!1553 (_2!2680 lt!89173)))))))

(declare-fun b!56685 () Bool)

(declare-fun Unit!3921 () Unit!3895)

(assert (=> b!56685 (= e!37678 (tuple2!5139 Unit!3921 (_2!2680 lt!88376)))))

(assert (=> b!56685 (= (size!1184 (buf!1553 (_2!2680 lt!88376))) (size!1184 (buf!1553 (_2!2680 lt!88376))))))

(declare-fun lt!89154 () Unit!3895)

(declare-fun Unit!3922 () Unit!3895)

(assert (=> b!56685 (= lt!89154 Unit!3922)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2056 array!2605 array!2605 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56685 (checkByteArrayBitContent!0 (_2!2680 lt!88376) srcBuffer!2 (_1!2691 (readBits!0 (_1!2681 call!736) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!733 () Bool)

(declare-fun c!4083 () Bool)

(assert (=> bm!733 (= call!736 (reader!0 (_2!2680 lt!88376) (ite c!4083 (_2!2680 lt!89163) (_2!2680 lt!88376))))))

(declare-fun b!56680 () Bool)

(declare-fun res!47133 () Bool)

(assert (=> b!56680 (=> (not res!47133) (not e!37679))))

(assert (=> b!56680 (= res!47133 (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!89173)))))

(declare-fun d!18012 () Bool)

(assert (=> d!18012 e!37679))

(declare-fun res!47131 () Bool)

(assert (=> d!18012 (=> (not res!47131) (not e!37679))))

(declare-fun lt!89142 () (_ BitVec 64))

(assert (=> d!18012 (= res!47131 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!89173))) (currentByte!3147 (_2!2680 lt!89173)) (currentBit!3142 (_2!2680 lt!89173))) (bvsub lt!89142 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18012 (or (= (bvand lt!89142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89142 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89165 () (_ BitVec 64))

(assert (=> d!18012 (= lt!89142 (bvadd lt!89165 to!314))))

(assert (=> d!18012 (or (not (= (bvand lt!89165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89165 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18012 (= lt!89165 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))))))

(assert (=> d!18012 (= lt!89173 e!37678)))

(assert (=> d!18012 (= c!4083 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!89172 () Unit!3895)

(declare-fun lt!89156 () Unit!3895)

(assert (=> d!18012 (= lt!89172 lt!89156)))

(assert (=> d!18012 (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!88376))))

(assert (=> d!18012 (= lt!89156 (lemmaIsPrefixRefl!0 (_2!2680 lt!88376)))))

(assert (=> d!18012 (= lt!89152 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))))))

(assert (=> d!18012 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18012 (= (appendBitsMSBFirstLoop!0 (_2!2680 lt!88376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!89173)))

(assert (= (and d!18012 c!4083) b!56682))

(assert (= (and d!18012 (not c!4083)) b!56685))

(assert (= (or b!56682 b!56685) bm!733))

(assert (= (and d!18012 res!47131) b!56683))

(assert (= (and b!56683 res!47135) b!56684))

(assert (= (and b!56684 res!47132) b!56680))

(assert (= (and b!56680 res!47133) b!56681))

(assert (= (and b!56681 res!47136) b!56679))

(assert (= (and b!56679 res!47134) b!56678))

(declare-fun m!89343 () Bool)

(assert (=> b!56683 m!89343))

(declare-fun m!89345 () Bool)

(assert (=> b!56682 m!89345))

(declare-fun m!89347 () Bool)

(assert (=> b!56682 m!89347))

(declare-fun m!89349 () Bool)

(assert (=> b!56682 m!89349))

(assert (=> b!56682 m!88835))

(declare-fun m!89351 () Bool)

(assert (=> b!56682 m!89351))

(declare-fun m!89353 () Bool)

(assert (=> b!56682 m!89353))

(declare-fun m!89355 () Bool)

(assert (=> b!56682 m!89355))

(declare-fun m!89357 () Bool)

(assert (=> b!56682 m!89357))

(declare-fun m!89359 () Bool)

(assert (=> b!56682 m!89359))

(declare-fun m!89361 () Bool)

(assert (=> b!56682 m!89361))

(declare-fun m!89363 () Bool)

(assert (=> b!56682 m!89363))

(declare-fun m!89365 () Bool)

(assert (=> b!56682 m!89365))

(declare-fun m!89367 () Bool)

(assert (=> b!56682 m!89367))

(declare-fun m!89369 () Bool)

(assert (=> b!56682 m!89369))

(declare-fun m!89371 () Bool)

(assert (=> b!56682 m!89371))

(declare-fun m!89373 () Bool)

(assert (=> b!56682 m!89373))

(declare-fun m!89375 () Bool)

(assert (=> b!56682 m!89375))

(declare-fun m!89377 () Bool)

(assert (=> b!56682 m!89377))

(declare-fun m!89379 () Bool)

(assert (=> b!56682 m!89379))

(assert (=> b!56682 m!89363))

(declare-fun m!89381 () Bool)

(assert (=> b!56682 m!89381))

(assert (=> b!56682 m!89359))

(assert (=> b!56682 m!89375))

(declare-fun m!89383 () Bool)

(assert (=> b!56682 m!89383))

(assert (=> b!56682 m!89347))

(declare-fun m!89385 () Bool)

(assert (=> b!56682 m!89385))

(declare-fun m!89387 () Bool)

(assert (=> b!56682 m!89387))

(declare-fun m!89389 () Bool)

(assert (=> b!56682 m!89389))

(declare-fun m!89391 () Bool)

(assert (=> b!56682 m!89391))

(declare-fun m!89393 () Bool)

(assert (=> b!56682 m!89393))

(declare-fun m!89395 () Bool)

(assert (=> b!56682 m!89395))

(declare-fun m!89397 () Bool)

(assert (=> b!56682 m!89397))

(declare-fun m!89399 () Bool)

(assert (=> b!56682 m!89399))

(declare-fun m!89401 () Bool)

(assert (=> b!56682 m!89401))

(declare-fun m!89403 () Bool)

(assert (=> b!56682 m!89403))

(declare-fun m!89405 () Bool)

(assert (=> b!56682 m!89405))

(declare-fun m!89407 () Bool)

(assert (=> b!56678 m!89407))

(declare-fun m!89409 () Bool)

(assert (=> d!18012 m!89409))

(assert (=> d!18012 m!88835))

(assert (=> d!18012 m!89115))

(assert (=> d!18012 m!89117))

(declare-fun m!89411 () Bool)

(assert (=> b!56685 m!89411))

(declare-fun m!89413 () Bool)

(assert (=> b!56685 m!89413))

(declare-fun m!89415 () Bool)

(assert (=> b!56680 m!89415))

(declare-fun m!89417 () Bool)

(assert (=> b!56679 m!89417))

(declare-fun m!89419 () Bool)

(assert (=> b!56679 m!89419))

(declare-fun m!89421 () Bool)

(assert (=> b!56679 m!89421))

(declare-fun m!89423 () Bool)

(assert (=> b!56679 m!89423))

(declare-fun m!89425 () Bool)

(assert (=> b!56679 m!89425))

(declare-fun m!89427 () Bool)

(assert (=> bm!733 m!89427))

(assert (=> b!56353 d!18012))

(declare-fun d!18050 () Bool)

(declare-fun res!47137 () Bool)

(declare-fun e!37682 () Bool)

(assert (=> d!18050 (=> (not res!47137) (not e!37682))))

(assert (=> d!18050 (= res!47137 (= (size!1184 (buf!1553 (_2!2680 lt!88376))) (size!1184 (buf!1553 (_2!2680 lt!88381)))))))

(assert (=> d!18050 (= (isPrefixOf!0 (_2!2680 lt!88376) (_2!2680 lt!88381)) e!37682)))

(declare-fun b!56686 () Bool)

(declare-fun res!47139 () Bool)

(assert (=> b!56686 (=> (not res!47139) (not e!37682))))

(assert (=> b!56686 (= res!47139 (bvsle (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))) (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88381))) (currentByte!3147 (_2!2680 lt!88381)) (currentBit!3142 (_2!2680 lt!88381)))))))

(declare-fun b!56687 () Bool)

(declare-fun e!37681 () Bool)

(assert (=> b!56687 (= e!37682 e!37681)))

(declare-fun res!47138 () Bool)

(assert (=> b!56687 (=> res!47138 e!37681)))

(assert (=> b!56687 (= res!47138 (= (size!1184 (buf!1553 (_2!2680 lt!88376))) #b00000000000000000000000000000000))))

(declare-fun b!56688 () Bool)

(assert (=> b!56688 (= e!37681 (arrayBitRangesEq!0 (buf!1553 (_2!2680 lt!88376)) (buf!1553 (_2!2680 lt!88381)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376)))))))

(assert (= (and d!18050 res!47137) b!56686))

(assert (= (and b!56686 res!47139) b!56687))

(assert (= (and b!56687 (not res!47138)) b!56688))

(assert (=> b!56686 m!88835))

(assert (=> b!56686 m!88823))

(assert (=> b!56688 m!88835))

(assert (=> b!56688 m!88835))

(declare-fun m!89429 () Bool)

(assert (=> b!56688 m!89429))

(assert (=> b!56353 d!18050))

(declare-fun d!18052 () Bool)

(assert (=> d!18052 (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89188 () Unit!3895)

(declare-fun choose!9 (BitStream!2056 array!2605 (_ BitVec 64) BitStream!2056) Unit!3895)

(assert (=> d!18052 (= lt!89188 (choose!9 thiss!1379 (buf!1553 (_2!2680 lt!88376)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2057 (buf!1553 (_2!2680 lt!88376)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379))))))

(assert (=> d!18052 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1553 (_2!2680 lt!88376)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89188)))

(declare-fun bs!4512 () Bool)

(assert (= bs!4512 d!18052))

(assert (=> bs!4512 m!88839))

(declare-fun m!89431 () Bool)

(assert (=> bs!4512 m!89431))

(assert (=> b!56353 d!18052))

(declare-fun d!18054 () Bool)

(assert (=> d!18054 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4513 () Bool)

(assert (= bs!4513 d!18054))

(declare-fun m!89433 () Bool)

(assert (=> bs!4513 m!89433))

(assert (=> b!56353 d!18054))

(declare-fun d!18056 () Bool)

(declare-fun res!47140 () Bool)

(declare-fun e!37684 () Bool)

(assert (=> d!18056 (=> (not res!47140) (not e!37684))))

(assert (=> d!18056 (= res!47140 (= (size!1184 (buf!1553 thiss!1379)) (size!1184 (buf!1553 (_2!2680 lt!88381)))))))

(assert (=> d!18056 (= (isPrefixOf!0 thiss!1379 (_2!2680 lt!88381)) e!37684)))

(declare-fun b!56689 () Bool)

(declare-fun res!47142 () Bool)

(assert (=> b!56689 (=> (not res!47142) (not e!37684))))

(assert (=> b!56689 (= res!47142 (bvsle (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)) (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88381))) (currentByte!3147 (_2!2680 lt!88381)) (currentBit!3142 (_2!2680 lt!88381)))))))

(declare-fun b!56690 () Bool)

(declare-fun e!37683 () Bool)

(assert (=> b!56690 (= e!37684 e!37683)))

(declare-fun res!47141 () Bool)

(assert (=> b!56690 (=> res!47141 e!37683)))

(assert (=> b!56690 (= res!47141 (= (size!1184 (buf!1553 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56691 () Bool)

(assert (=> b!56691 (= e!37683 (arrayBitRangesEq!0 (buf!1553 thiss!1379) (buf!1553 (_2!2680 lt!88381)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379))))))

(assert (= (and d!18056 res!47140) b!56689))

(assert (= (and b!56689 res!47142) b!56690))

(assert (= (and b!56690 (not res!47141)) b!56691))

(assert (=> b!56689 m!88833))

(assert (=> b!56689 m!88823))

(assert (=> b!56691 m!88833))

(assert (=> b!56691 m!88833))

(declare-fun m!89435 () Bool)

(assert (=> b!56691 m!89435))

(assert (=> b!56353 d!18056))

(declare-fun d!18058 () Bool)

(assert (=> d!18058 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88381))))

(declare-fun lt!89191 () Unit!3895)

(declare-fun choose!30 (BitStream!2056 BitStream!2056 BitStream!2056) Unit!3895)

(assert (=> d!18058 (= lt!89191 (choose!30 thiss!1379 (_2!2680 lt!88376) (_2!2680 lt!88381)))))

(assert (=> d!18058 (isPrefixOf!0 thiss!1379 (_2!2680 lt!88376))))

(assert (=> d!18058 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2680 lt!88376) (_2!2680 lt!88381)) lt!89191)))

(declare-fun bs!4514 () Bool)

(assert (= bs!4514 d!18058))

(assert (=> bs!4514 m!88847))

(declare-fun m!89437 () Bool)

(assert (=> bs!4514 m!89437))

(assert (=> bs!4514 m!88807))

(assert (=> b!56353 d!18058))

(declare-fun d!18060 () Bool)

(assert (=> d!18060 (= (array_inv!1087 srcBuffer!2) (bvsge (size!1184 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11376 d!18060))

(declare-fun d!18062 () Bool)

(assert (=> d!18062 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3142 thiss!1379) (currentByte!3147 thiss!1379) (size!1184 (buf!1553 thiss!1379))))))

(declare-fun bs!4515 () Bool)

(assert (= bs!4515 d!18062))

(declare-fun m!89439 () Bool)

(assert (=> bs!4515 m!89439))

(assert (=> start!11376 d!18062))

(declare-fun d!18064 () Bool)

(declare-fun e!37687 () Bool)

(assert (=> d!18064 e!37687))

(declare-fun res!47147 () Bool)

(assert (=> d!18064 (=> (not res!47147) (not e!37687))))

(declare-fun lt!89204 () (_ BitVec 64))

(declare-fun lt!89208 () (_ BitVec 64))

(declare-fun lt!89207 () (_ BitVec 64))

(assert (=> d!18064 (= res!47147 (= lt!89207 (bvsub lt!89208 lt!89204)))))

(assert (=> d!18064 (or (= (bvand lt!89208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89204 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89208 lt!89204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18064 (= lt!89204 (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88381)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88381))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88381)))))))

(declare-fun lt!89206 () (_ BitVec 64))

(declare-fun lt!89205 () (_ BitVec 64))

(assert (=> d!18064 (= lt!89208 (bvmul lt!89206 lt!89205))))

(assert (=> d!18064 (or (= lt!89206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89205 (bvsdiv (bvmul lt!89206 lt!89205) lt!89206)))))

(assert (=> d!18064 (= lt!89205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18064 (= lt!89206 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88381)))))))

(assert (=> d!18064 (= lt!89207 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88381))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88381)))))))

(assert (=> d!18064 (invariant!0 (currentBit!3142 (_2!2680 lt!88381)) (currentByte!3147 (_2!2680 lt!88381)) (size!1184 (buf!1553 (_2!2680 lt!88381))))))

(assert (=> d!18064 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88381))) (currentByte!3147 (_2!2680 lt!88381)) (currentBit!3142 (_2!2680 lt!88381))) lt!89207)))

(declare-fun b!56696 () Bool)

(declare-fun res!47148 () Bool)

(assert (=> b!56696 (=> (not res!47148) (not e!37687))))

(assert (=> b!56696 (= res!47148 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89207))))

(declare-fun b!56697 () Bool)

(declare-fun lt!89209 () (_ BitVec 64))

(assert (=> b!56697 (= e!37687 (bvsle lt!89207 (bvmul lt!89209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56697 (or (= lt!89209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89209)))))

(assert (=> b!56697 (= lt!89209 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88381)))))))

(assert (= (and d!18064 res!47147) b!56696))

(assert (= (and b!56696 res!47148) b!56697))

(declare-fun m!89441 () Bool)

(assert (=> d!18064 m!89441))

(assert (=> d!18064 m!88825))

(assert (=> b!56347 d!18064))

(declare-fun d!18066 () Bool)

(assert (=> d!18066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4516 () Bool)

(assert (= bs!4516 d!18066))

(declare-fun m!89443 () Bool)

(assert (=> bs!4516 m!89443))

(assert (=> b!56345 d!18066))

(declare-fun d!18068 () Bool)

(assert (=> d!18068 (= (head!422 (byteArrayBitContentToList!0 (_2!2680 lt!88376) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!718 (byteArrayBitContentToList!0 (_2!2680 lt!88376) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56346 d!18068))

(declare-fun d!18070 () Bool)

(declare-fun c!4086 () Bool)

(assert (=> d!18070 (= c!4086 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37690 () List!603)

(assert (=> d!18070 (= (byteArrayBitContentToList!0 (_2!2680 lt!88376) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37690)))

(declare-fun b!56702 () Bool)

(assert (=> b!56702 (= e!37690 Nil!600)))

(declare-fun b!56703 () Bool)

(assert (=> b!56703 (= e!37690 (Cons!599 (not (= (bvand ((_ sign_extend 24) (select (arr!1736 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2680 lt!88376) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18070 c!4086) b!56702))

(assert (= (and d!18070 (not c!4086)) b!56703))

(assert (=> b!56703 m!88809))

(assert (=> b!56703 m!89093))

(declare-fun m!89445 () Bool)

(assert (=> b!56703 m!89445))

(assert (=> b!56346 d!18070))

(declare-fun d!18072 () Bool)

(assert (=> d!18072 (= (head!422 (bitStreamReadBitsIntoList!0 (_2!2680 lt!88376) (_1!2681 lt!88379) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!718 (bitStreamReadBitsIntoList!0 (_2!2680 lt!88376) (_1!2681 lt!88379) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56346 d!18072))

(declare-fun b!56712 () Bool)

(declare-datatypes ((tuple2!5164 0))(
  ( (tuple2!5165 (_1!2693 List!603) (_2!2693 BitStream!2056)) )
))
(declare-fun e!37696 () tuple2!5164)

(assert (=> b!56712 (= e!37696 (tuple2!5165 Nil!600 (_1!2681 lt!88379)))))

(declare-fun b!56715 () Bool)

(declare-fun e!37695 () Bool)

(declare-fun lt!89217 () List!603)

(declare-fun length!283 (List!603) Int)

(assert (=> b!56715 (= e!37695 (> (length!283 lt!89217) 0))))

(declare-fun d!18074 () Bool)

(assert (=> d!18074 e!37695))

(declare-fun c!4092 () Bool)

(assert (=> d!18074 (= c!4092 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18074 (= lt!89217 (_1!2693 e!37696))))

(declare-fun c!4091 () Bool)

(assert (=> d!18074 (= c!4091 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18074 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18074 (= (bitStreamReadBitsIntoList!0 (_2!2680 lt!88376) (_1!2681 lt!88379) #b0000000000000000000000000000000000000000000000000000000000000001) lt!89217)))

(declare-fun b!56714 () Bool)

(declare-fun isEmpty!169 (List!603) Bool)

(assert (=> b!56714 (= e!37695 (isEmpty!169 lt!89217))))

(declare-fun b!56713 () Bool)

(declare-fun lt!89218 () (_ BitVec 64))

(declare-datatypes ((tuple2!5166 0))(
  ( (tuple2!5167 (_1!2694 Bool) (_2!2694 BitStream!2056)) )
))
(declare-fun lt!89216 () tuple2!5166)

(assert (=> b!56713 (= e!37696 (tuple2!5165 (Cons!599 (_1!2694 lt!89216) (bitStreamReadBitsIntoList!0 (_2!2680 lt!88376) (_2!2694 lt!89216) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!89218))) (_2!2694 lt!89216)))))

(declare-fun readBit!0 (BitStream!2056) tuple2!5166)

(assert (=> b!56713 (= lt!89216 (readBit!0 (_1!2681 lt!88379)))))

(assert (=> b!56713 (= lt!89218 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!18074 c!4091) b!56712))

(assert (= (and d!18074 (not c!4091)) b!56713))

(assert (= (and d!18074 c!4092) b!56714))

(assert (= (and d!18074 (not c!4092)) b!56715))

(declare-fun m!89447 () Bool)

(assert (=> b!56715 m!89447))

(declare-fun m!89449 () Bool)

(assert (=> b!56714 m!89449))

(declare-fun m!89451 () Bool)

(assert (=> b!56713 m!89451))

(declare-fun m!89453 () Bool)

(assert (=> b!56713 m!89453))

(assert (=> b!56346 d!18074))

(declare-fun d!18076 () Bool)

(declare-fun res!47149 () Bool)

(declare-fun e!37698 () Bool)

(assert (=> d!18076 (=> (not res!47149) (not e!37698))))

(assert (=> d!18076 (= res!47149 (= (size!1184 (buf!1553 thiss!1379)) (size!1184 (buf!1553 thiss!1379))))))

(assert (=> d!18076 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37698)))

(declare-fun b!56716 () Bool)

(declare-fun res!47151 () Bool)

(assert (=> b!56716 (=> (not res!47151) (not e!37698))))

(assert (=> b!56716 (= res!47151 (bvsle (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)) (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379))))))

(declare-fun b!56717 () Bool)

(declare-fun e!37697 () Bool)

(assert (=> b!56717 (= e!37698 e!37697)))

(declare-fun res!47150 () Bool)

(assert (=> b!56717 (=> res!47150 e!37697)))

(assert (=> b!56717 (= res!47150 (= (size!1184 (buf!1553 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56718 () Bool)

(assert (=> b!56718 (= e!37697 (arrayBitRangesEq!0 (buf!1553 thiss!1379) (buf!1553 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379))))))

(assert (= (and d!18076 res!47149) b!56716))

(assert (= (and b!56716 res!47151) b!56717))

(assert (= (and b!56717 (not res!47150)) b!56718))

(assert (=> b!56716 m!88833))

(assert (=> b!56716 m!88833))

(assert (=> b!56718 m!88833))

(assert (=> b!56718 m!88833))

(declare-fun m!89455 () Bool)

(assert (=> b!56718 m!89455))

(assert (=> b!56351 d!18076))

(declare-fun d!18078 () Bool)

(assert (=> d!18078 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!89221 () Unit!3895)

(declare-fun choose!11 (BitStream!2056) Unit!3895)

(assert (=> d!18078 (= lt!89221 (choose!11 thiss!1379))))

(assert (=> d!18078 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!89221)))

(declare-fun bs!4518 () Bool)

(assert (= bs!4518 d!18078))

(assert (=> bs!4518 m!88829))

(declare-fun m!89457 () Bool)

(assert (=> bs!4518 m!89457))

(assert (=> b!56351 d!18078))

(declare-fun d!18080 () Bool)

(declare-fun e!37699 () Bool)

(assert (=> d!18080 e!37699))

(declare-fun res!47152 () Bool)

(assert (=> d!18080 (=> (not res!47152) (not e!37699))))

(declare-fun lt!89225 () (_ BitVec 64))

(declare-fun lt!89226 () (_ BitVec 64))

(declare-fun lt!89222 () (_ BitVec 64))

(assert (=> d!18080 (= res!47152 (= lt!89225 (bvsub lt!89226 lt!89222)))))

(assert (=> d!18080 (or (= (bvand lt!89226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89226 lt!89222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18080 (= lt!89222 (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))) ((_ sign_extend 32) (currentByte!3147 thiss!1379)) ((_ sign_extend 32) (currentBit!3142 thiss!1379))))))

(declare-fun lt!89224 () (_ BitVec 64))

(declare-fun lt!89223 () (_ BitVec 64))

(assert (=> d!18080 (= lt!89226 (bvmul lt!89224 lt!89223))))

(assert (=> d!18080 (or (= lt!89224 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89223 (bvsdiv (bvmul lt!89224 lt!89223) lt!89224)))))

(assert (=> d!18080 (= lt!89223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18080 (= lt!89224 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))))))

(assert (=> d!18080 (= lt!89225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3147 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3142 thiss!1379))))))

(assert (=> d!18080 (invariant!0 (currentBit!3142 thiss!1379) (currentByte!3147 thiss!1379) (size!1184 (buf!1553 thiss!1379)))))

(assert (=> d!18080 (= (bitIndex!0 (size!1184 (buf!1553 thiss!1379)) (currentByte!3147 thiss!1379) (currentBit!3142 thiss!1379)) lt!89225)))

(declare-fun b!56719 () Bool)

(declare-fun res!47153 () Bool)

(assert (=> b!56719 (=> (not res!47153) (not e!37699))))

(assert (=> b!56719 (= res!47153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89225))))

(declare-fun b!56720 () Bool)

(declare-fun lt!89227 () (_ BitVec 64))

(assert (=> b!56720 (= e!37699 (bvsle lt!89225 (bvmul lt!89227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56720 (or (= lt!89227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89227)))))

(assert (=> b!56720 (= lt!89227 ((_ sign_extend 32) (size!1184 (buf!1553 thiss!1379))))))

(assert (= (and d!18080 res!47152) b!56719))

(assert (= (and b!56719 res!47153) b!56720))

(assert (=> d!18080 m!89443))

(assert (=> d!18080 m!89439))

(assert (=> b!56351 d!18080))

(declare-fun d!18082 () Bool)

(declare-fun e!37700 () Bool)

(assert (=> d!18082 e!37700))

(declare-fun res!47154 () Bool)

(assert (=> d!18082 (=> (not res!47154) (not e!37700))))

(declare-fun lt!89232 () (_ BitVec 64))

(declare-fun lt!89228 () (_ BitVec 64))

(declare-fun lt!89231 () (_ BitVec 64))

(assert (=> d!18082 (= res!47154 (= lt!89231 (bvsub lt!89232 lt!89228)))))

(assert (=> d!18082 (or (= (bvand lt!89232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!89228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89232 lt!89228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18082 (= lt!89228 (remainingBits!0 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))) ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376)))))))

(declare-fun lt!89230 () (_ BitVec 64))

(declare-fun lt!89229 () (_ BitVec 64))

(assert (=> d!18082 (= lt!89232 (bvmul lt!89230 lt!89229))))

(assert (=> d!18082 (or (= lt!89230 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!89229 (bvsdiv (bvmul lt!89230 lt!89229) lt!89230)))))

(assert (=> d!18082 (= lt!89229 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18082 (= lt!89230 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))))))

(assert (=> d!18082 (= lt!89231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3147 (_2!2680 lt!88376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3142 (_2!2680 lt!88376)))))))

(assert (=> d!18082 (invariant!0 (currentBit!3142 (_2!2680 lt!88376)) (currentByte!3147 (_2!2680 lt!88376)) (size!1184 (buf!1553 (_2!2680 lt!88376))))))

(assert (=> d!18082 (= (bitIndex!0 (size!1184 (buf!1553 (_2!2680 lt!88376))) (currentByte!3147 (_2!2680 lt!88376)) (currentBit!3142 (_2!2680 lt!88376))) lt!89231)))

(declare-fun b!56721 () Bool)

(declare-fun res!47155 () Bool)

(assert (=> b!56721 (=> (not res!47155) (not e!37700))))

(assert (=> b!56721 (= res!47155 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!89231))))

(declare-fun b!56722 () Bool)

(declare-fun lt!89233 () (_ BitVec 64))

(assert (=> b!56722 (= e!37700 (bvsle lt!89231 (bvmul lt!89233 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56722 (or (= lt!89233 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!89233 #b0000000000000000000000000000000000000000000000000000000000001000) lt!89233)))))

(assert (=> b!56722 (= lt!89233 ((_ sign_extend 32) (size!1184 (buf!1553 (_2!2680 lt!88376)))))))

(assert (= (and d!18082 res!47154) b!56721))

(assert (= (and b!56721 res!47155) b!56722))

(assert (=> d!18082 m!88983))

(declare-fun m!89459 () Bool)

(assert (=> d!18082 m!89459))

(assert (=> b!56344 d!18082))

(declare-fun d!18084 () Bool)

(assert (=> d!18084 (= (array_inv!1087 (buf!1553 thiss!1379)) (bvsge (size!1184 (buf!1553 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56349 d!18084))

(declare-fun d!18086 () Bool)

(assert (=> d!18086 (= (invariant!0 (currentBit!3142 (_2!2680 lt!88381)) (currentByte!3147 (_2!2680 lt!88381)) (size!1184 (buf!1553 (_2!2680 lt!88381)))) (and (bvsge (currentBit!3142 (_2!2680 lt!88381)) #b00000000000000000000000000000000) (bvslt (currentBit!3142 (_2!2680 lt!88381)) #b00000000000000000000000000001000) (bvsge (currentByte!3147 (_2!2680 lt!88381)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3147 (_2!2680 lt!88381)) (size!1184 (buf!1553 (_2!2680 lt!88381)))) (and (= (currentBit!3142 (_2!2680 lt!88381)) #b00000000000000000000000000000000) (= (currentByte!3147 (_2!2680 lt!88381)) (size!1184 (buf!1553 (_2!2680 lt!88381))))))))))

(assert (=> b!56350 d!18086))

(push 1)

(assert (not b!56714))

(assert (not b!56688))

(assert (not b!56574))

(assert (not d!18012))

(assert (not d!17970))

(assert (not d!18066))

(assert (not b!56689))

(assert (not b!56563))

(assert (not d!18054))

(assert (not bm!733))

(assert (not b!56559))

(assert (not b!56458))

(assert (not d!17972))

(assert (not b!56461))

(assert (not b!56560))

(assert (not d!18058))

(assert (not d!18078))

(assert (not b!56561))

(assert (not b!56682))

(assert (not b!56686))

(assert (not b!56557))

(assert (not b!56680))

(assert (not b!56715))

(assert (not b!56683))

(assert (not b!56679))

(assert (not b!56716))

(assert (not b!56556))

(assert (not b!56558))

(assert (not b!56575))

(assert (not b!56718))

(assert (not b!56685))

(assert (not d!18052))

(assert (not d!17974))

(assert (not b!56713))

(assert (not b!56678))

(assert (not d!18062))

(assert (not d!18082))

(assert (not b!56576))

(assert (not b!56691))

(assert (not b!56703))

(assert (not d!18010))

(assert (not b!56456))

(assert (not b!56562))

(assert (not d!18080))

(assert (not d!18064))

(assert (not b!56577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

