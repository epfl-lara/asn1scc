; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5636 () Bool)

(assert start!5636)

(declare-fun e!15526 () Bool)

(declare-fun b!22993 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!1559 0))(
  ( (array!1560 (arr!1121 (Array (_ BitVec 32) (_ BitVec 8))) (size!665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1162 0))(
  ( (BitStream!1163 (buf!986 array!1559) (currentByte!2299 (_ BitVec 32)) (currentBit!2294 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1973 0))(
  ( (Unit!1974) )
))
(declare-datatypes ((tuple2!2642 0))(
  ( (tuple2!2643 (_1!1408 Unit!1973) (_2!1408 BitStream!1162)) )
))
(declare-fun lt!33658 () tuple2!2642)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!33656 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22993 (= e!15526 (= lt!33656 (bvsub (bvsub (bvadd (bitIndex!0 (size!665 (buf!986 (_2!1408 lt!33658))) (currentByte!2299 (_2!1408 lt!33658)) (currentBit!2294 (_2!1408 lt!33658))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun srcBuffer!2 () array!1559)

(declare-fun b!22994 () Bool)

(declare-fun e!15520 () Bool)

(declare-datatypes ((tuple2!2644 0))(
  ( (tuple2!2645 (_1!1409 BitStream!1162) (_2!1409 BitStream!1162)) )
))
(declare-fun lt!33654 () tuple2!2644)

(declare-datatypes ((List!282 0))(
  ( (Nil!279) (Cons!278 (h!397 Bool) (t!1032 List!282)) )
))
(declare-fun head!119 (List!282) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1162 array!1559 (_ BitVec 64) (_ BitVec 64)) List!282)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1162 BitStream!1162 (_ BitVec 64)) List!282)

(assert (=> b!22994 (= e!15520 (= (head!119 (byteArrayBitContentToList!0 (_2!1408 lt!33658) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!119 (bitStreamReadBitsIntoList!0 (_2!1408 lt!33658) (_1!1409 lt!33654) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22995 () Bool)

(declare-fun e!15519 () Bool)

(declare-fun e!15523 () Bool)

(assert (=> b!22995 (= e!15519 e!15523)))

(declare-fun res!19748 () Bool)

(assert (=> b!22995 (=> res!19748 e!15523)))

(declare-fun thiss!1379 () BitStream!1162)

(declare-fun isPrefixOf!0 (BitStream!1162 BitStream!1162) Bool)

(assert (=> b!22995 (= res!19748 (not (isPrefixOf!0 thiss!1379 (_2!1408 lt!33658))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22995 (validate_offset_bits!1 ((_ sign_extend 32) (size!665 (buf!986 (_2!1408 lt!33658)))) ((_ sign_extend 32) (currentByte!2299 (_2!1408 lt!33658))) ((_ sign_extend 32) (currentBit!2294 (_2!1408 lt!33658))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33655 () Unit!1973)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1162 BitStream!1162 (_ BitVec 64) (_ BitVec 64)) Unit!1973)

(assert (=> b!22995 (= lt!33655 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1408 lt!33658) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1162 (_ BitVec 8) (_ BitVec 32)) tuple2!2642)

(assert (=> b!22995 (= lt!33658 (appendBitFromByte!0 thiss!1379 (select (arr!1121 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22996 () Bool)

(declare-fun res!19746 () Bool)

(declare-fun e!15522 () Bool)

(assert (=> b!22996 (=> res!19746 e!15522)))

(declare-fun lt!33653 () tuple2!2642)

(assert (=> b!22996 (= res!19746 (not (= (size!665 (buf!986 thiss!1379)) (size!665 (buf!986 (_2!1408 lt!33653))))))))

(declare-fun b!22997 () Bool)

(declare-fun e!15517 () Bool)

(assert (=> b!22997 (= e!15517 e!15522)))

(declare-fun res!19755 () Bool)

(assert (=> b!22997 (=> res!19755 e!15522)))

(declare-fun lt!33657 () (_ BitVec 64))

(assert (=> b!22997 (= res!19755 (not (= lt!33656 (bvsub (bvadd lt!33657 to!314) i!635))))))

(assert (=> b!22997 (= lt!33656 (bitIndex!0 (size!665 (buf!986 (_2!1408 lt!33653))) (currentByte!2299 (_2!1408 lt!33653)) (currentBit!2294 (_2!1408 lt!33653))))))

(declare-fun b!22998 () Bool)

(declare-fun e!15521 () Bool)

(assert (=> b!22998 (= e!15521 true)))

(declare-fun lt!33651 () tuple2!2644)

(declare-fun reader!0 (BitStream!1162 BitStream!1162) tuple2!2644)

(assert (=> b!22998 (= lt!33651 (reader!0 thiss!1379 (_2!1408 lt!33653)))))

(declare-fun b!22999 () Bool)

(assert (=> b!22999 (= e!15523 e!15517)))

(declare-fun res!19751 () Bool)

(assert (=> b!22999 (=> res!19751 e!15517)))

(assert (=> b!22999 (= res!19751 (not (isPrefixOf!0 (_2!1408 lt!33658) (_2!1408 lt!33653))))))

(assert (=> b!22999 (isPrefixOf!0 thiss!1379 (_2!1408 lt!33653))))

(declare-fun lt!33650 () Unit!1973)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1162 BitStream!1162 BitStream!1162) Unit!1973)

(assert (=> b!22999 (= lt!33650 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1408 lt!33658) (_2!1408 lt!33653)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1162 array!1559 (_ BitVec 64) (_ BitVec 64)) tuple2!2642)

(assert (=> b!22999 (= lt!33653 (appendBitsMSBFirstLoop!0 (_2!1408 lt!33658) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22999 e!15520))

(declare-fun res!19752 () Bool)

(assert (=> b!22999 (=> (not res!19752) (not e!15520))))

(assert (=> b!22999 (= res!19752 (validate_offset_bits!1 ((_ sign_extend 32) (size!665 (buf!986 (_2!1408 lt!33658)))) ((_ sign_extend 32) (currentByte!2299 thiss!1379)) ((_ sign_extend 32) (currentBit!2294 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33652 () Unit!1973)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1162 array!1559 (_ BitVec 64)) Unit!1973)

(assert (=> b!22999 (= lt!33652 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!986 (_2!1408 lt!33658)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!22999 (= lt!33654 (reader!0 thiss!1379 (_2!1408 lt!33658)))))

(declare-fun b!23000 () Bool)

(declare-fun e!15525 () Bool)

(declare-fun array_inv!634 (array!1559) Bool)

(assert (=> b!23000 (= e!15525 (array_inv!634 (buf!986 thiss!1379)))))

(declare-fun b!23001 () Bool)

(declare-fun res!19756 () Bool)

(declare-fun e!15518 () Bool)

(assert (=> b!23001 (=> (not res!19756) (not e!15518))))

(assert (=> b!23001 (= res!19756 (validate_offset_bits!1 ((_ sign_extend 32) (size!665 (buf!986 thiss!1379))) ((_ sign_extend 32) (currentByte!2299 thiss!1379)) ((_ sign_extend 32) (currentBit!2294 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23002 () Bool)

(declare-fun res!19754 () Bool)

(assert (=> b!23002 (=> res!19754 e!15522)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23002 (= res!19754 (not (invariant!0 (currentBit!2294 (_2!1408 lt!33653)) (currentByte!2299 (_2!1408 lt!33653)) (size!665 (buf!986 (_2!1408 lt!33653))))))))

(declare-fun b!23003 () Bool)

(assert (=> b!23003 (= e!15518 (not e!15519))))

(declare-fun res!19757 () Bool)

(assert (=> b!23003 (=> res!19757 e!15519)))

(assert (=> b!23003 (= res!19757 (bvsge i!635 to!314))))

(assert (=> b!23003 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33649 () Unit!1973)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1162) Unit!1973)

(assert (=> b!23003 (= lt!33649 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23003 (= lt!33657 (bitIndex!0 (size!665 (buf!986 thiss!1379)) (currentByte!2299 thiss!1379) (currentBit!2294 thiss!1379)))))

(declare-fun res!19750 () Bool)

(assert (=> start!5636 (=> (not res!19750) (not e!15518))))

(assert (=> start!5636 (= res!19750 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!665 srcBuffer!2))))))))

(assert (=> start!5636 e!15518))

(assert (=> start!5636 true))

(assert (=> start!5636 (array_inv!634 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1162) Bool)

(assert (=> start!5636 (and (inv!12 thiss!1379) e!15525)))

(declare-fun b!22992 () Bool)

(assert (=> b!22992 (= e!15522 e!15521)))

(declare-fun res!19753 () Bool)

(assert (=> b!22992 (=> res!19753 e!15521)))

(assert (=> b!22992 (= res!19753 (not (= (size!665 (buf!986 (_2!1408 lt!33658))) (size!665 (buf!986 (_2!1408 lt!33653))))))))

(assert (=> b!22992 e!15526))

(declare-fun res!19749 () Bool)

(assert (=> b!22992 (=> (not res!19749) (not e!15526))))

(assert (=> b!22992 (= res!19749 (= (size!665 (buf!986 (_2!1408 lt!33653))) (size!665 (buf!986 thiss!1379))))))

(declare-fun b!23004 () Bool)

(declare-fun res!19758 () Bool)

(assert (=> b!23004 (=> res!19758 e!15521)))

(assert (=> b!23004 (= res!19758 (not (invariant!0 (currentBit!2294 (_2!1408 lt!33658)) (currentByte!2299 (_2!1408 lt!33658)) (size!665 (buf!986 (_2!1408 lt!33658))))))))

(declare-fun b!23005 () Bool)

(declare-fun res!19747 () Bool)

(assert (=> b!23005 (=> res!19747 e!15521)))

(assert (=> b!23005 (= res!19747 (not (invariant!0 (currentBit!2294 (_2!1408 lt!33658)) (currentByte!2299 (_2!1408 lt!33658)) (size!665 (buf!986 (_2!1408 lt!33653))))))))

(assert (= (and start!5636 res!19750) b!23001))

(assert (= (and b!23001 res!19756) b!23003))

(assert (= (and b!23003 (not res!19757)) b!22995))

(assert (= (and b!22995 (not res!19748)) b!22999))

(assert (= (and b!22999 res!19752) b!22994))

(assert (= (and b!22999 (not res!19751)) b!22997))

(assert (= (and b!22997 (not res!19755)) b!23002))

(assert (= (and b!23002 (not res!19754)) b!22996))

(assert (= (and b!22996 (not res!19746)) b!22992))

(assert (= (and b!22992 res!19749) b!22993))

(assert (= (and b!22992 (not res!19753)) b!23004))

(assert (= (and b!23004 (not res!19758)) b!23005))

(assert (= (and b!23005 (not res!19747)) b!22998))

(assert (= start!5636 b!23000))

(declare-fun m!32313 () Bool)

(assert (=> start!5636 m!32313))

(declare-fun m!32315 () Bool)

(assert (=> start!5636 m!32315))

(declare-fun m!32317 () Bool)

(assert (=> b!22999 m!32317))

(declare-fun m!32319 () Bool)

(assert (=> b!22999 m!32319))

(declare-fun m!32321 () Bool)

(assert (=> b!22999 m!32321))

(declare-fun m!32323 () Bool)

(assert (=> b!22999 m!32323))

(declare-fun m!32325 () Bool)

(assert (=> b!22999 m!32325))

(declare-fun m!32327 () Bool)

(assert (=> b!22999 m!32327))

(declare-fun m!32329 () Bool)

(assert (=> b!22999 m!32329))

(declare-fun m!32331 () Bool)

(assert (=> b!23000 m!32331))

(declare-fun m!32333 () Bool)

(assert (=> b!22993 m!32333))

(declare-fun m!32335 () Bool)

(assert (=> b!23004 m!32335))

(declare-fun m!32337 () Bool)

(assert (=> b!23003 m!32337))

(declare-fun m!32339 () Bool)

(assert (=> b!23003 m!32339))

(declare-fun m!32341 () Bool)

(assert (=> b!23003 m!32341))

(declare-fun m!32343 () Bool)

(assert (=> b!23005 m!32343))

(declare-fun m!32345 () Bool)

(assert (=> b!22998 m!32345))

(declare-fun m!32347 () Bool)

(assert (=> b!22997 m!32347))

(declare-fun m!32349 () Bool)

(assert (=> b!22994 m!32349))

(assert (=> b!22994 m!32349))

(declare-fun m!32351 () Bool)

(assert (=> b!22994 m!32351))

(declare-fun m!32353 () Bool)

(assert (=> b!22994 m!32353))

(assert (=> b!22994 m!32353))

(declare-fun m!32355 () Bool)

(assert (=> b!22994 m!32355))

(declare-fun m!32357 () Bool)

(assert (=> b!23002 m!32357))

(declare-fun m!32359 () Bool)

(assert (=> b!23001 m!32359))

(declare-fun m!32361 () Bool)

(assert (=> b!22995 m!32361))

(declare-fun m!32363 () Bool)

(assert (=> b!22995 m!32363))

(declare-fun m!32365 () Bool)

(assert (=> b!22995 m!32365))

(assert (=> b!22995 m!32361))

(declare-fun m!32367 () Bool)

(assert (=> b!22995 m!32367))

(declare-fun m!32369 () Bool)

(assert (=> b!22995 m!32369))

(push 1)

