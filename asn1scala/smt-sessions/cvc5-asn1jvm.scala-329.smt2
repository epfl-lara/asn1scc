; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7478 () Bool)

(assert start!7478)

(declare-fun b!36314 () Bool)

(declare-fun res!30926 () Bool)

(declare-fun e!23942 () Bool)

(assert (=> b!36314 (=> res!30926 e!23942)))

(declare-datatypes ((List!441 0))(
  ( (Nil!438) (Cons!437 (h!556 Bool) (t!1191 List!441)) )
))
(declare-fun lt!54589 () List!441)

(declare-fun length!167 (List!441) Int)

(assert (=> b!36314 (= res!30926 (<= (length!167 lt!54589) 0))))

(declare-fun b!36316 () Bool)

(declare-fun res!30915 () Bool)

(declare-fun e!23946 () Bool)

(assert (=> b!36316 (=> res!30915 e!23946)))

(declare-datatypes ((array!1916 0))(
  ( (array!1917 (arr!1343 (Array (_ BitVec 32) (_ BitVec 8))) (size!856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1480 0))(
  ( (BitStream!1481 (buf!1184 array!1916) (currentByte!2578 (_ BitVec 32)) (currentBit!2573 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2663 0))(
  ( (Unit!2664) )
))
(declare-datatypes ((tuple2!3586 0))(
  ( (tuple2!3587 (_1!1880 Unit!2663) (_2!1880 BitStream!1480)) )
))
(declare-fun lt!54599 () tuple2!3586)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36316 (= res!30915 (not (invariant!0 (currentBit!2573 (_2!1880 lt!54599)) (currentByte!2578 (_2!1880 lt!54599)) (size!856 (buf!1184 (_2!1880 lt!54599))))))))

(declare-fun b!36317 () Bool)

(declare-fun e!23937 () Bool)

(declare-fun thiss!1379 () BitStream!1480)

(declare-fun array_inv!793 (array!1916) Bool)

(assert (=> b!36317 (= e!23937 (array_inv!793 (buf!1184 thiss!1379)))))

(declare-fun b!36318 () Bool)

(declare-fun res!30922 () Bool)

(declare-fun e!23948 () Bool)

(assert (=> b!36318 (=> res!30922 e!23948)))

(declare-fun lt!54610 () tuple2!3586)

(assert (=> b!36318 (= res!30922 (not (= (size!856 (buf!1184 thiss!1379)) (size!856 (buf!1184 (_2!1880 lt!54610))))))))

(declare-fun b!36319 () Bool)

(declare-fun e!23940 () Bool)

(declare-fun e!23945 () Bool)

(assert (=> b!36319 (= e!23940 e!23945)))

(declare-fun res!30925 () Bool)

(assert (=> b!36319 (=> res!30925 e!23945)))

(declare-fun isPrefixOf!0 (BitStream!1480 BitStream!1480) Bool)

(assert (=> b!36319 (= res!30925 (not (isPrefixOf!0 (_2!1880 lt!54599) (_2!1880 lt!54610))))))

(assert (=> b!36319 (isPrefixOf!0 thiss!1379 (_2!1880 lt!54610))))

(declare-fun lt!54586 () Unit!2663)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1480 BitStream!1480 BitStream!1480) Unit!2663)

(assert (=> b!36319 (= lt!54586 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1880 lt!54599) (_2!1880 lt!54610)))))

(declare-fun srcBuffer!2 () array!1916)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1480 array!1916 (_ BitVec 64) (_ BitVec 64)) tuple2!3586)

(assert (=> b!36319 (= lt!54610 (appendBitsMSBFirstLoop!0 (_2!1880 lt!54599) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23935 () Bool)

(assert (=> b!36319 e!23935))

(declare-fun res!30924 () Bool)

(assert (=> b!36319 (=> (not res!30924) (not e!23935))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36319 (= res!30924 (validate_offset_bits!1 ((_ sign_extend 32) (size!856 (buf!1184 (_2!1880 lt!54599)))) ((_ sign_extend 32) (currentByte!2578 thiss!1379)) ((_ sign_extend 32) (currentBit!2573 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54600 () Unit!2663)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1480 array!1916 (_ BitVec 64)) Unit!2663)

(assert (=> b!36319 (= lt!54600 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1184 (_2!1880 lt!54599)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3588 0))(
  ( (tuple2!3589 (_1!1881 BitStream!1480) (_2!1881 BitStream!1480)) )
))
(declare-fun lt!54587 () tuple2!3588)

(declare-fun reader!0 (BitStream!1480 BitStream!1480) tuple2!3588)

(assert (=> b!36319 (= lt!54587 (reader!0 thiss!1379 (_2!1880 lt!54599)))))

(declare-fun b!36320 () Bool)

(declare-fun e!23949 () Bool)

(declare-fun e!23943 () Bool)

(assert (=> b!36320 (= e!23949 e!23943)))

(declare-fun res!30930 () Bool)

(assert (=> b!36320 (=> (not res!30930) (not e!23943))))

(declare-fun lt!54591 () (_ BitVec 64))

(assert (=> b!36320 (= res!30930 (bvsle to!314 lt!54591))))

(assert (=> b!36320 (= lt!54591 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!856 srcBuffer!2))))))

(declare-fun b!36321 () Bool)

(declare-fun lt!54597 () Bool)

(declare-fun lt!54596 () Bool)

(declare-fun e!23947 () Bool)

(assert (=> b!36321 (= e!23947 (or (not (= lt!54596 lt!54597)) (bvslt i!635 lt!54591)))))

(declare-fun lt!54605 () Bool)

(assert (=> b!36321 (= lt!54605 lt!54596)))

(declare-fun lt!54594 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1916 (_ BitVec 64)) Bool)

(assert (=> b!36321 (= lt!54596 (bitAt!0 (buf!1184 (_2!1880 lt!54610)) lt!54594))))

(declare-fun lt!54593 () (_ BitVec 64))

(declare-fun lt!54602 () Unit!2663)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1916 array!1916 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2663)

(assert (=> b!36321 (= lt!54602 (arrayBitRangesEqImpliesEq!0 (buf!1184 (_2!1880 lt!54599)) (buf!1184 (_2!1880 lt!54610)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54594 lt!54593))))

(declare-fun b!36322 () Bool)

(declare-fun e!23936 () Bool)

(assert (=> b!36322 (= e!23942 e!23936)))

(declare-fun res!30921 () Bool)

(assert (=> b!36322 (=> res!30921 e!23936)))

(declare-fun lt!54588 () List!441)

(declare-fun lt!54595 () List!441)

(assert (=> b!36322 (= res!30921 (not (= lt!54588 lt!54595)))))

(assert (=> b!36322 (= lt!54595 lt!54588)))

(declare-fun tail!158 (List!441) List!441)

(assert (=> b!36322 (= lt!54588 (tail!158 lt!54589))))

(declare-fun lt!54590 () tuple2!3588)

(declare-fun lt!54606 () tuple2!3588)

(declare-fun lt!54607 () Unit!2663)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1480 BitStream!1480 BitStream!1480 BitStream!1480 (_ BitVec 64) List!441) Unit!2663)

(assert (=> b!36322 (= lt!54607 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1880 lt!54610) (_2!1880 lt!54610) (_1!1881 lt!54590) (_1!1881 lt!54606) (bvsub to!314 i!635) lt!54589))))

(declare-fun b!36323 () Bool)

(declare-fun e!23950 () Bool)

(assert (=> b!36323 (= e!23943 (not e!23950))))

(declare-fun res!30914 () Bool)

(assert (=> b!36323 (=> res!30914 e!23950)))

(assert (=> b!36323 (= res!30914 (bvsge i!635 to!314))))

(assert (=> b!36323 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54592 () Unit!2663)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1480) Unit!2663)

(assert (=> b!36323 (= lt!54592 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36323 (= lt!54594 (bitIndex!0 (size!856 (buf!1184 thiss!1379)) (currentByte!2578 thiss!1379) (currentBit!2573 thiss!1379)))))

(declare-fun b!36324 () Bool)

(declare-fun e!23939 () Bool)

(declare-fun e!23941 () Bool)

(assert (=> b!36324 (= e!23939 e!23941)))

(declare-fun res!30929 () Bool)

(assert (=> b!36324 (=> res!30929 e!23941)))

(declare-fun head!278 (List!441) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1480 array!1916 (_ BitVec 64) (_ BitVec 64)) List!441)

(assert (=> b!36324 (= res!30929 (not (= (head!278 (byteArrayBitContentToList!0 (_2!1880 lt!54610) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54597)))))

(assert (=> b!36324 (= lt!54597 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun res!30919 () Bool)

(assert (=> start!7478 (=> (not res!30919) (not e!23949))))

(assert (=> start!7478 (= res!30919 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!7478 e!23949))

(assert (=> start!7478 true))

(declare-fun inv!12 (BitStream!1480) Bool)

(assert (=> start!7478 (and (inv!12 thiss!1379) e!23937)))

(assert (=> start!7478 (array_inv!793 srcBuffer!2)))

(declare-fun b!36315 () Bool)

(assert (=> b!36315 (= e!23950 e!23940)))

(declare-fun res!30927 () Bool)

(assert (=> b!36315 (=> res!30927 e!23940)))

(assert (=> b!36315 (= res!30927 (not (isPrefixOf!0 thiss!1379 (_2!1880 lt!54599))))))

(declare-fun lt!54608 () (_ BitVec 64))

(assert (=> b!36315 (validate_offset_bits!1 ((_ sign_extend 32) (size!856 (buf!1184 (_2!1880 lt!54599)))) ((_ sign_extend 32) (currentByte!2578 (_2!1880 lt!54599))) ((_ sign_extend 32) (currentBit!2573 (_2!1880 lt!54599))) lt!54608)))

(assert (=> b!36315 (= lt!54608 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54601 () Unit!2663)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1480 BitStream!1480 (_ BitVec 64) (_ BitVec 64)) Unit!2663)

(assert (=> b!36315 (= lt!54601 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1880 lt!54599) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1480 (_ BitVec 8) (_ BitVec 32)) tuple2!3586)

(assert (=> b!36315 (= lt!54599 (appendBitFromByte!0 thiss!1379 (select (arr!1343 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36325 () Bool)

(assert (=> b!36325 (= e!23946 e!23942)))

(declare-fun res!30920 () Bool)

(assert (=> b!36325 (=> res!30920 e!23942)))

(assert (=> b!36325 (= res!30920 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1480 BitStream!1480 (_ BitVec 64)) List!441)

(assert (=> b!36325 (= lt!54595 (bitStreamReadBitsIntoList!0 (_2!1880 lt!54610) (_1!1881 lt!54606) lt!54608))))

(assert (=> b!36325 (= lt!54589 (bitStreamReadBitsIntoList!0 (_2!1880 lt!54610) (_1!1881 lt!54590) (bvsub to!314 i!635)))))

(assert (=> b!36325 (validate_offset_bits!1 ((_ sign_extend 32) (size!856 (buf!1184 (_2!1880 lt!54610)))) ((_ sign_extend 32) (currentByte!2578 (_2!1880 lt!54599))) ((_ sign_extend 32) (currentBit!2573 (_2!1880 lt!54599))) lt!54608)))

(declare-fun lt!54604 () Unit!2663)

(assert (=> b!36325 (= lt!54604 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1880 lt!54599) (buf!1184 (_2!1880 lt!54610)) lt!54608))))

(assert (=> b!36325 (= lt!54606 (reader!0 (_2!1880 lt!54599) (_2!1880 lt!54610)))))

(assert (=> b!36325 (validate_offset_bits!1 ((_ sign_extend 32) (size!856 (buf!1184 (_2!1880 lt!54610)))) ((_ sign_extend 32) (currentByte!2578 thiss!1379)) ((_ sign_extend 32) (currentBit!2573 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54598 () Unit!2663)

(assert (=> b!36325 (= lt!54598 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1184 (_2!1880 lt!54610)) (bvsub to!314 i!635)))))

(assert (=> b!36325 (= lt!54590 (reader!0 thiss!1379 (_2!1880 lt!54610)))))

(declare-fun b!36326 () Bool)

(assert (=> b!36326 (= e!23945 e!23948)))

(declare-fun res!30932 () Bool)

(assert (=> b!36326 (=> res!30932 e!23948)))

(declare-fun lt!54609 () (_ BitVec 64))

(assert (=> b!36326 (= res!30932 (not (= lt!54609 (bvsub (bvadd lt!54594 to!314) i!635))))))

(assert (=> b!36326 (= lt!54609 (bitIndex!0 (size!856 (buf!1184 (_2!1880 lt!54610))) (currentByte!2578 (_2!1880 lt!54610)) (currentBit!2573 (_2!1880 lt!54610))))))

(declare-fun b!36327 () Bool)

(assert (=> b!36327 (= e!23935 (= (head!278 (byteArrayBitContentToList!0 (_2!1880 lt!54599) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!278 (bitStreamReadBitsIntoList!0 (_2!1880 lt!54599) (_1!1881 lt!54587) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36328 () Bool)

(assert (=> b!36328 (= e!23948 e!23946)))

(declare-fun res!30916 () Bool)

(assert (=> b!36328 (=> res!30916 e!23946)))

(assert (=> b!36328 (= res!30916 (not (= (size!856 (buf!1184 (_2!1880 lt!54599))) (size!856 (buf!1184 (_2!1880 lt!54610))))))))

(assert (=> b!36328 (= lt!54609 (bvsub (bvsub (bvadd lt!54593 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36328 (= lt!54593 (bitIndex!0 (size!856 (buf!1184 (_2!1880 lt!54599))) (currentByte!2578 (_2!1880 lt!54599)) (currentBit!2573 (_2!1880 lt!54599))))))

(assert (=> b!36328 (= (size!856 (buf!1184 (_2!1880 lt!54610))) (size!856 (buf!1184 thiss!1379)))))

(declare-fun b!36329 () Bool)

(declare-fun res!30931 () Bool)

(assert (=> b!36329 (=> (not res!30931) (not e!23943))))

(assert (=> b!36329 (= res!30931 (validate_offset_bits!1 ((_ sign_extend 32) (size!856 (buf!1184 thiss!1379))) ((_ sign_extend 32) (currentByte!2578 thiss!1379)) ((_ sign_extend 32) (currentBit!2573 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36330 () Bool)

(assert (=> b!36330 (= e!23941 e!23947)))

(declare-fun res!30917 () Bool)

(assert (=> b!36330 (=> res!30917 e!23947)))

(assert (=> b!36330 (= res!30917 (not (= lt!54605 lt!54597)))))

(assert (=> b!36330 (= lt!54605 (bitAt!0 (buf!1184 (_2!1880 lt!54599)) lt!54594))))

(declare-fun b!36331 () Bool)

(assert (=> b!36331 (= e!23936 e!23939)))

(declare-fun res!30933 () Bool)

(assert (=> b!36331 (=> res!30933 e!23939)))

(declare-fun lt!54603 () Bool)

(assert (=> b!36331 (= res!30933 (not (= lt!54603 (bitAt!0 (buf!1184 (_1!1881 lt!54606)) lt!54594))))))

(assert (=> b!36331 (= lt!54603 (bitAt!0 (buf!1184 (_1!1881 lt!54590)) lt!54594))))

(declare-fun b!36332 () Bool)

(declare-fun res!30923 () Bool)

(assert (=> b!36332 (=> res!30923 e!23939)))

(assert (=> b!36332 (= res!30923 (not (= (head!278 lt!54589) lt!54603)))))

(declare-fun b!36333 () Bool)

(declare-fun res!30918 () Bool)

(assert (=> b!36333 (=> res!30918 e!23946)))

(assert (=> b!36333 (= res!30918 (not (invariant!0 (currentBit!2573 (_2!1880 lt!54599)) (currentByte!2578 (_2!1880 lt!54599)) (size!856 (buf!1184 (_2!1880 lt!54610))))))))

(declare-fun b!36334 () Bool)

(declare-fun res!30928 () Bool)

(assert (=> b!36334 (=> res!30928 e!23948)))

(assert (=> b!36334 (= res!30928 (not (invariant!0 (currentBit!2573 (_2!1880 lt!54610)) (currentByte!2578 (_2!1880 lt!54610)) (size!856 (buf!1184 (_2!1880 lt!54610))))))))

(assert (= (and start!7478 res!30919) b!36320))

(assert (= (and b!36320 res!30930) b!36329))

(assert (= (and b!36329 res!30931) b!36323))

(assert (= (and b!36323 (not res!30914)) b!36315))

(assert (= (and b!36315 (not res!30927)) b!36319))

(assert (= (and b!36319 res!30924) b!36327))

(assert (= (and b!36319 (not res!30925)) b!36326))

(assert (= (and b!36326 (not res!30932)) b!36334))

(assert (= (and b!36334 (not res!30928)) b!36318))

(assert (= (and b!36318 (not res!30922)) b!36328))

(assert (= (and b!36328 (not res!30916)) b!36316))

(assert (= (and b!36316 (not res!30915)) b!36333))

(assert (= (and b!36333 (not res!30918)) b!36325))

(assert (= (and b!36325 (not res!30920)) b!36314))

(assert (= (and b!36314 (not res!30926)) b!36322))

(assert (= (and b!36322 (not res!30921)) b!36331))

(assert (= (and b!36331 (not res!30933)) b!36332))

(assert (= (and b!36332 (not res!30923)) b!36324))

(assert (= (and b!36324 (not res!30929)) b!36330))

(assert (= (and b!36330 (not res!30917)) b!36321))

(assert (= start!7478 b!36317))

(declare-fun m!54801 () Bool)

(assert (=> b!36319 m!54801))

(declare-fun m!54803 () Bool)

(assert (=> b!36319 m!54803))

(declare-fun m!54805 () Bool)

(assert (=> b!36319 m!54805))

(declare-fun m!54807 () Bool)

(assert (=> b!36319 m!54807))

(declare-fun m!54809 () Bool)

(assert (=> b!36319 m!54809))

(declare-fun m!54811 () Bool)

(assert (=> b!36319 m!54811))

(declare-fun m!54813 () Bool)

(assert (=> b!36319 m!54813))

(declare-fun m!54815 () Bool)

(assert (=> b!36329 m!54815))

(declare-fun m!54817 () Bool)

(assert (=> b!36322 m!54817))

(declare-fun m!54819 () Bool)

(assert (=> b!36322 m!54819))

(declare-fun m!54821 () Bool)

(assert (=> b!36317 m!54821))

(declare-fun m!54823 () Bool)

(assert (=> b!36325 m!54823))

(declare-fun m!54825 () Bool)

(assert (=> b!36325 m!54825))

(declare-fun m!54827 () Bool)

(assert (=> b!36325 m!54827))

(declare-fun m!54829 () Bool)

(assert (=> b!36325 m!54829))

(declare-fun m!54831 () Bool)

(assert (=> b!36325 m!54831))

(declare-fun m!54833 () Bool)

(assert (=> b!36325 m!54833))

(declare-fun m!54835 () Bool)

(assert (=> b!36325 m!54835))

(declare-fun m!54837 () Bool)

(assert (=> b!36325 m!54837))

(declare-fun m!54839 () Bool)

(assert (=> b!36324 m!54839))

(assert (=> b!36324 m!54839))

(declare-fun m!54841 () Bool)

(assert (=> b!36324 m!54841))

(declare-fun m!54843 () Bool)

(assert (=> b!36324 m!54843))

(declare-fun m!54845 () Bool)

(assert (=> b!36323 m!54845))

(declare-fun m!54847 () Bool)

(assert (=> b!36323 m!54847))

(declare-fun m!54849 () Bool)

(assert (=> b!36323 m!54849))

(declare-fun m!54851 () Bool)

(assert (=> b!36332 m!54851))

(declare-fun m!54853 () Bool)

(assert (=> b!36316 m!54853))

(declare-fun m!54855 () Bool)

(assert (=> start!7478 m!54855))

(declare-fun m!54857 () Bool)

(assert (=> start!7478 m!54857))

(declare-fun m!54859 () Bool)

(assert (=> b!36315 m!54859))

(declare-fun m!54861 () Bool)

(assert (=> b!36315 m!54861))

(declare-fun m!54863 () Bool)

(assert (=> b!36315 m!54863))

(assert (=> b!36315 m!54859))

(declare-fun m!54865 () Bool)

(assert (=> b!36315 m!54865))

(declare-fun m!54867 () Bool)

(assert (=> b!36315 m!54867))

(declare-fun m!54869 () Bool)

(assert (=> b!36334 m!54869))

(declare-fun m!54871 () Bool)

(assert (=> b!36330 m!54871))

(declare-fun m!54873 () Bool)

(assert (=> b!36326 m!54873))

(declare-fun m!54875 () Bool)

(assert (=> b!36333 m!54875))

(declare-fun m!54877 () Bool)

(assert (=> b!36328 m!54877))

(declare-fun m!54879 () Bool)

(assert (=> b!36314 m!54879))

(declare-fun m!54881 () Bool)

(assert (=> b!36331 m!54881))

(declare-fun m!54883 () Bool)

(assert (=> b!36331 m!54883))

(declare-fun m!54885 () Bool)

(assert (=> b!36327 m!54885))

(assert (=> b!36327 m!54885))

(declare-fun m!54887 () Bool)

(assert (=> b!36327 m!54887))

(declare-fun m!54889 () Bool)

(assert (=> b!36327 m!54889))

(assert (=> b!36327 m!54889))

(declare-fun m!54891 () Bool)

(assert (=> b!36327 m!54891))

(declare-fun m!54893 () Bool)

(assert (=> b!36321 m!54893))

(declare-fun m!54895 () Bool)

(assert (=> b!36321 m!54895))

(push 1)

(assert (not b!36329))

(assert (not b!36323))

(assert (not b!36324))

(assert (not b!36334))

(assert (not b!36325))

(assert (not b!36328))

(assert (not b!36314))

(assert (not b!36326))

(assert (not b!36333))

(assert (not b!36317))

(assert (not b!36321))

(assert (not b!36316))

(assert (not b!36327))

(assert (not b!36330))

(assert (not b!36319))

(assert (not b!36315))

(assert (not b!36332))

(assert (not b!36322))

(assert (not b!36331))

(assert (not start!7478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

