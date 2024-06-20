; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7070 () Bool)

(assert start!7070)

(declare-fun b!34350 () Bool)

(declare-fun e!22771 () Bool)

(declare-fun e!22770 () Bool)

(assert (=> b!34350 (= e!22771 e!22770)))

(declare-fun res!29401 () Bool)

(assert (=> b!34350 (=> res!29401 e!22770)))

(declare-fun lt!50729 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!50714 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!34350 (= res!29401 (not (= lt!50729 (bvsub (bvadd lt!50714 to!314) i!635))))))

(declare-datatypes ((array!1883 0))(
  ( (array!1884 (arr!1313 (Array (_ BitVec 32) (_ BitVec 8))) (size!835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1456 0))(
  ( (BitStream!1457 (buf!1163 array!1883) (currentByte!2536 (_ BitVec 32)) (currentBit!2531 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2549 0))(
  ( (Unit!2550) )
))
(declare-datatypes ((tuple2!3466 0))(
  ( (tuple2!3467 (_1!1820 Unit!2549) (_2!1820 BitStream!1456)) )
))
(declare-fun lt!50730 () tuple2!3466)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!34350 (= lt!50729 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730))))))

(declare-fun b!34351 () Bool)

(declare-fun e!22777 () Bool)

(assert (=> b!34351 (= e!22770 e!22777)))

(declare-fun res!29406 () Bool)

(assert (=> b!34351 (=> res!29406 e!22777)))

(declare-fun lt!50732 () tuple2!3466)

(assert (=> b!34351 (= res!29406 (not (= (size!835 (buf!1163 (_2!1820 lt!50732))) (size!835 (buf!1163 (_2!1820 lt!50730))))))))

(declare-fun lt!50721 () (_ BitVec 64))

(assert (=> b!34351 (= lt!50729 (bvsub (bvsub (bvadd lt!50721 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34351 (= lt!50721 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(declare-fun thiss!1379 () BitStream!1456)

(assert (=> b!34351 (= (size!835 (buf!1163 (_2!1820 lt!50730))) (size!835 (buf!1163 thiss!1379)))))

(declare-fun b!34352 () Bool)

(declare-fun res!29404 () Bool)

(assert (=> b!34352 (=> res!29404 e!22770)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!34352 (= res!29404 (not (invariant!0 (currentBit!2531 (_2!1820 lt!50730)) (currentByte!2536 (_2!1820 lt!50730)) (size!835 (buf!1163 (_2!1820 lt!50730))))))))

(declare-fun res!29402 () Bool)

(declare-fun e!22767 () Bool)

(assert (=> start!7070 (=> (not res!29402) (not e!22767))))

(declare-fun srcBuffer!2 () array!1883)

(assert (=> start!7070 (= res!29402 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!835 srcBuffer!2))))))))

(assert (=> start!7070 e!22767))

(assert (=> start!7070 true))

(declare-fun array_inv!781 (array!1883) Bool)

(assert (=> start!7070 (array_inv!781 srcBuffer!2)))

(declare-fun e!22766 () Bool)

(declare-fun inv!12 (BitStream!1456) Bool)

(assert (=> start!7070 (and (inv!12 thiss!1379) e!22766)))

(declare-fun b!34353 () Bool)

(declare-fun res!29405 () Bool)

(assert (=> b!34353 (=> res!29405 e!22777)))

(assert (=> b!34353 (= res!29405 (not (invariant!0 (currentBit!2531 (_2!1820 lt!50732)) (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50732))))))))

(declare-fun b!34354 () Bool)

(declare-fun e!22765 () Bool)

(assert (=> b!34354 (= e!22765 e!22771)))

(declare-fun res!29395 () Bool)

(assert (=> b!34354 (=> res!29395 e!22771)))

(declare-fun isPrefixOf!0 (BitStream!1456 BitStream!1456) Bool)

(assert (=> b!34354 (= res!29395 (not (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50730))))))

(assert (=> b!34354 (isPrefixOf!0 thiss!1379 (_2!1820 lt!50730))))

(declare-fun lt!50726 () Unit!2549)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1456 BitStream!1456 BitStream!1456) Unit!2549)

(assert (=> b!34354 (= lt!50726 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1820 lt!50732) (_2!1820 lt!50730)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1456 array!1883 (_ BitVec 64) (_ BitVec 64)) tuple2!3466)

(assert (=> b!34354 (= lt!50730 (appendBitsMSBFirstLoop!0 (_2!1820 lt!50732) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!22763 () Bool)

(assert (=> b!34354 e!22763))

(declare-fun res!29391 () Bool)

(assert (=> b!34354 (=> (not res!29391) (not e!22763))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34354 (= res!29391 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50723 () Unit!2549)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1456 array!1883 (_ BitVec 64)) Unit!2549)

(assert (=> b!34354 (= lt!50723 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1163 (_2!1820 lt!50732)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3468 0))(
  ( (tuple2!3469 (_1!1821 BitStream!1456) (_2!1821 BitStream!1456)) )
))
(declare-fun lt!50717 () tuple2!3468)

(declare-fun reader!0 (BitStream!1456 BitStream!1456) tuple2!3468)

(assert (=> b!34354 (= lt!50717 (reader!0 thiss!1379 (_2!1820 lt!50732)))))

(declare-fun b!34355 () Bool)

(declare-fun res!29398 () Bool)

(declare-fun e!22776 () Bool)

(assert (=> b!34355 (=> res!29398 e!22776)))

(declare-datatypes ((List!429 0))(
  ( (Nil!426) (Cons!425 (h!544 Bool) (t!1179 List!429)) )
))
(declare-fun lt!50724 () List!429)

(declare-fun length!155 (List!429) Int)

(assert (=> b!34355 (= res!29398 (<= (length!155 lt!50724) 0))))

(declare-fun b!34356 () Bool)

(declare-fun res!29399 () Bool)

(declare-fun e!22769 () Bool)

(assert (=> b!34356 (=> res!29399 e!22769)))

(declare-fun lt!50719 () Bool)

(declare-fun head!266 (List!429) Bool)

(assert (=> b!34356 (= res!29399 (not (= (head!266 lt!50724) lt!50719)))))

(declare-fun b!34357 () Bool)

(declare-fun res!29403 () Bool)

(assert (=> b!34357 (=> (not res!29403) (not e!22767))))

(assert (=> b!34357 (= res!29403 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!34358 () Bool)

(declare-fun e!22773 () Bool)

(assert (=> b!34358 (= e!22773 e!22769)))

(declare-fun res!29409 () Bool)

(assert (=> b!34358 (=> res!29409 e!22769)))

(declare-fun lt!50722 () tuple2!3468)

(declare-fun bitAt!0 (array!1883 (_ BitVec 64)) Bool)

(assert (=> b!34358 (= res!29409 (not (= lt!50719 (bitAt!0 (buf!1163 (_1!1821 lt!50722)) lt!50714))))))

(declare-fun lt!50728 () tuple2!3468)

(assert (=> b!34358 (= lt!50719 (bitAt!0 (buf!1163 (_1!1821 lt!50728)) lt!50714))))

(declare-fun b!34359 () Bool)

(declare-fun e!22772 () Bool)

(declare-fun e!22774 () Bool)

(assert (=> b!34359 (= e!22772 e!22774)))

(declare-fun res!29396 () Bool)

(assert (=> b!34359 (=> res!29396 e!22774)))

(declare-fun lt!50718 () Bool)

(declare-fun lt!50734 () Bool)

(assert (=> b!34359 (= res!29396 (not (= lt!50718 lt!50734)))))

(assert (=> b!34359 (= lt!50718 (bitAt!0 (buf!1163 (_2!1820 lt!50732)) lt!50714))))

(declare-fun b!34360 () Bool)

(declare-fun e!22768 () Bool)

(assert (=> b!34360 (= e!22768 e!22765)))

(declare-fun res!29407 () Bool)

(assert (=> b!34360 (=> res!29407 e!22765)))

(assert (=> b!34360 (= res!29407 (not (isPrefixOf!0 thiss!1379 (_2!1820 lt!50732))))))

(declare-fun lt!50725 () (_ BitVec 64))

(assert (=> b!34360 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!50725)))

(assert (=> b!34360 (= lt!50725 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50720 () Unit!2549)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1456 BitStream!1456 (_ BitVec 64) (_ BitVec 64)) Unit!2549)

(assert (=> b!34360 (= lt!50720 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1820 lt!50732) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1456 (_ BitVec 8) (_ BitVec 32)) tuple2!3466)

(assert (=> b!34360 (= lt!50732 (appendBitFromByte!0 thiss!1379 (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!34361 () Bool)

(assert (=> b!34361 (= e!22774 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50714) (bvslt lt!50714 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730))))))))))

(assert (=> b!34361 (= lt!50718 (bitAt!0 (buf!1163 (_2!1820 lt!50730)) lt!50714))))

(declare-fun lt!50715 () Unit!2549)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1883 array!1883 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2549)

(assert (=> b!34361 (= lt!50715 (arrayBitRangesEqImpliesEq!0 (buf!1163 (_2!1820 lt!50732)) (buf!1163 (_2!1820 lt!50730)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50714 lt!50721))))

(declare-fun b!34362 () Bool)

(declare-fun res!29393 () Bool)

(assert (=> b!34362 (=> res!29393 e!22777)))

(assert (=> b!34362 (= res!29393 (not (invariant!0 (currentBit!2531 (_2!1820 lt!50732)) (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50730))))))))

(declare-fun b!34363 () Bool)

(assert (=> b!34363 (= e!22769 e!22772)))

(declare-fun res!29394 () Bool)

(assert (=> b!34363 (=> res!29394 e!22772)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1456 array!1883 (_ BitVec 64) (_ BitVec 64)) List!429)

(assert (=> b!34363 (= res!29394 (not (= (head!266 (byteArrayBitContentToList!0 (_2!1820 lt!50730) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!50734)))))

(assert (=> b!34363 (= lt!50734 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!34364 () Bool)

(assert (=> b!34364 (= e!22766 (array_inv!781 (buf!1163 thiss!1379)))))

(declare-fun b!34365 () Bool)

(assert (=> b!34365 (= e!22777 e!22776)))

(declare-fun res!29392 () Bool)

(assert (=> b!34365 (=> res!29392 e!22776)))

(assert (=> b!34365 (= res!29392 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!50716 () List!429)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1456 BitStream!1456 (_ BitVec 64)) List!429)

(assert (=> b!34365 (= lt!50716 (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_1!1821 lt!50722) lt!50725))))

(assert (=> b!34365 (= lt!50724 (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_1!1821 lt!50728) (bvsub to!314 i!635)))))

(assert (=> b!34365 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!50725)))

(declare-fun lt!50713 () Unit!2549)

(assert (=> b!34365 (= lt!50713 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!50730)) lt!50725))))

(assert (=> b!34365 (= lt!50722 (reader!0 (_2!1820 lt!50732) (_2!1820 lt!50730)))))

(assert (=> b!34365 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50712 () Unit!2549)

(assert (=> b!34365 (= lt!50712 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1163 (_2!1820 lt!50730)) (bvsub to!314 i!635)))))

(assert (=> b!34365 (= lt!50728 (reader!0 thiss!1379 (_2!1820 lt!50730)))))

(declare-fun b!34366 () Bool)

(assert (=> b!34366 (= e!22767 (not e!22768))))

(declare-fun res!29400 () Bool)

(assert (=> b!34366 (=> res!29400 e!22768)))

(assert (=> b!34366 (= res!29400 (bvsge i!635 to!314))))

(assert (=> b!34366 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!50727 () Unit!2549)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1456) Unit!2549)

(assert (=> b!34366 (= lt!50727 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!34366 (= lt!50714 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(declare-fun b!34367 () Bool)

(assert (=> b!34367 (= e!22763 (= (head!266 (byteArrayBitContentToList!0 (_2!1820 lt!50732) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!266 (bitStreamReadBitsIntoList!0 (_2!1820 lt!50732) (_1!1821 lt!50717) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!34368 () Bool)

(declare-fun res!29408 () Bool)

(assert (=> b!34368 (=> res!29408 e!22770)))

(assert (=> b!34368 (= res!29408 (not (= (size!835 (buf!1163 thiss!1379)) (size!835 (buf!1163 (_2!1820 lt!50730))))))))

(declare-fun b!34369 () Bool)

(assert (=> b!34369 (= e!22776 e!22773)))

(declare-fun res!29397 () Bool)

(assert (=> b!34369 (=> res!29397 e!22773)))

(declare-fun lt!50731 () List!429)

(assert (=> b!34369 (= res!29397 (not (= lt!50731 lt!50716)))))

(assert (=> b!34369 (= lt!50716 lt!50731)))

(declare-fun tail!146 (List!429) List!429)

(assert (=> b!34369 (= lt!50731 (tail!146 lt!50724))))

(declare-fun lt!50733 () Unit!2549)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1456 BitStream!1456 BitStream!1456 BitStream!1456 (_ BitVec 64) List!429) Unit!2549)

(assert (=> b!34369 (= lt!50733 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1820 lt!50730) (_2!1820 lt!50730) (_1!1821 lt!50728) (_1!1821 lt!50722) (bvsub to!314 i!635) lt!50724))))

(assert (= (and start!7070 res!29402) b!34357))

(assert (= (and b!34357 res!29403) b!34366))

(assert (= (and b!34366 (not res!29400)) b!34360))

(assert (= (and b!34360 (not res!29407)) b!34354))

(assert (= (and b!34354 res!29391) b!34367))

(assert (= (and b!34354 (not res!29395)) b!34350))

(assert (= (and b!34350 (not res!29401)) b!34352))

(assert (= (and b!34352 (not res!29404)) b!34368))

(assert (= (and b!34368 (not res!29408)) b!34351))

(assert (= (and b!34351 (not res!29406)) b!34353))

(assert (= (and b!34353 (not res!29405)) b!34362))

(assert (= (and b!34362 (not res!29393)) b!34365))

(assert (= (and b!34365 (not res!29392)) b!34355))

(assert (= (and b!34355 (not res!29398)) b!34369))

(assert (= (and b!34369 (not res!29397)) b!34358))

(assert (= (and b!34358 (not res!29409)) b!34356))

(assert (= (and b!34356 (not res!29399)) b!34363))

(assert (= (and b!34363 (not res!29394)) b!34359))

(assert (= (and b!34359 (not res!29396)) b!34361))

(assert (= start!7070 b!34364))

(declare-fun m!51207 () Bool)

(assert (=> b!34365 m!51207))

(declare-fun m!51209 () Bool)

(assert (=> b!34365 m!51209))

(declare-fun m!51211 () Bool)

(assert (=> b!34365 m!51211))

(declare-fun m!51213 () Bool)

(assert (=> b!34365 m!51213))

(declare-fun m!51215 () Bool)

(assert (=> b!34365 m!51215))

(declare-fun m!51217 () Bool)

(assert (=> b!34365 m!51217))

(declare-fun m!51219 () Bool)

(assert (=> b!34365 m!51219))

(declare-fun m!51221 () Bool)

(assert (=> b!34365 m!51221))

(declare-fun m!51223 () Bool)

(assert (=> b!34353 m!51223))

(declare-fun m!51225 () Bool)

(assert (=> b!34352 m!51225))

(declare-fun m!51227 () Bool)

(assert (=> b!34361 m!51227))

(declare-fun m!51229 () Bool)

(assert (=> b!34361 m!51229))

(declare-fun m!51231 () Bool)

(assert (=> b!34354 m!51231))

(declare-fun m!51233 () Bool)

(assert (=> b!34354 m!51233))

(declare-fun m!51235 () Bool)

(assert (=> b!34354 m!51235))

(declare-fun m!51237 () Bool)

(assert (=> b!34354 m!51237))

(declare-fun m!51239 () Bool)

(assert (=> b!34354 m!51239))

(declare-fun m!51241 () Bool)

(assert (=> b!34354 m!51241))

(declare-fun m!51243 () Bool)

(assert (=> b!34354 m!51243))

(declare-fun m!51245 () Bool)

(assert (=> b!34350 m!51245))

(declare-fun m!51247 () Bool)

(assert (=> b!34366 m!51247))

(declare-fun m!51249 () Bool)

(assert (=> b!34366 m!51249))

(declare-fun m!51251 () Bool)

(assert (=> b!34366 m!51251))

(declare-fun m!51253 () Bool)

(assert (=> b!34367 m!51253))

(assert (=> b!34367 m!51253))

(declare-fun m!51255 () Bool)

(assert (=> b!34367 m!51255))

(declare-fun m!51257 () Bool)

(assert (=> b!34367 m!51257))

(assert (=> b!34367 m!51257))

(declare-fun m!51259 () Bool)

(assert (=> b!34367 m!51259))

(declare-fun m!51261 () Bool)

(assert (=> start!7070 m!51261))

(declare-fun m!51263 () Bool)

(assert (=> start!7070 m!51263))

(declare-fun m!51265 () Bool)

(assert (=> b!34355 m!51265))

(declare-fun m!51267 () Bool)

(assert (=> b!34363 m!51267))

(assert (=> b!34363 m!51267))

(declare-fun m!51269 () Bool)

(assert (=> b!34363 m!51269))

(declare-fun m!51271 () Bool)

(assert (=> b!34363 m!51271))

(declare-fun m!51273 () Bool)

(assert (=> b!34369 m!51273))

(declare-fun m!51275 () Bool)

(assert (=> b!34369 m!51275))

(declare-fun m!51277 () Bool)

(assert (=> b!34360 m!51277))

(declare-fun m!51279 () Bool)

(assert (=> b!34360 m!51279))

(declare-fun m!51281 () Bool)

(assert (=> b!34360 m!51281))

(declare-fun m!51283 () Bool)

(assert (=> b!34360 m!51283))

(assert (=> b!34360 m!51281))

(declare-fun m!51285 () Bool)

(assert (=> b!34360 m!51285))

(declare-fun m!51287 () Bool)

(assert (=> b!34357 m!51287))

(declare-fun m!51289 () Bool)

(assert (=> b!34359 m!51289))

(declare-fun m!51291 () Bool)

(assert (=> b!34351 m!51291))

(declare-fun m!51293 () Bool)

(assert (=> b!34358 m!51293))

(declare-fun m!51295 () Bool)

(assert (=> b!34358 m!51295))

(declare-fun m!51297 () Bool)

(assert (=> b!34364 m!51297))

(declare-fun m!51299 () Bool)

(assert (=> b!34356 m!51299))

(declare-fun m!51301 () Bool)

(assert (=> b!34362 m!51301))

(push 1)

(assert (not b!34355))

(assert (not b!34351))

(assert (not b!34365))

(assert (not b!34350))

(assert (not b!34360))

(assert (not b!34356))

(assert (not b!34366))

(assert (not b!34357))

(assert (not b!34354))

(assert (not b!34362))

(assert (not b!34358))

(assert (not b!34364))

(assert (not b!34359))

(assert (not b!34353))

(assert (not b!34352))

(assert (not start!7070))

(assert (not b!34363))

(assert (not b!34361))

(assert (not b!34369))

(assert (not b!34367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9914 () Bool)

(assert (=> d!9914 (= (array_inv!781 (buf!1163 thiss!1379)) (bvsge (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!34364 d!9914))

(declare-fun d!9916 () Bool)

(assert (=> d!9916 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50998 () Unit!2549)

(declare-fun choose!9 (BitStream!1456 array!1883 (_ BitVec 64) BitStream!1456) Unit!2549)

(assert (=> d!9916 (= lt!50998 (choose!9 thiss!1379 (buf!1163 (_2!1820 lt!50732)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1457 (buf!1163 (_2!1820 lt!50732)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(assert (=> d!9916 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1163 (_2!1820 lt!50732)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50998)))

(declare-fun bs!2705 () Bool)

(assert (= bs!2705 d!9916))

(assert (=> bs!2705 m!51231))

(declare-fun m!51571 () Bool)

(assert (=> bs!2705 m!51571))

(assert (=> b!34354 d!9916))

(declare-fun d!9918 () Bool)

(assert (=> d!9918 (isPrefixOf!0 thiss!1379 (_2!1820 lt!50730))))

(declare-fun lt!51001 () Unit!2549)

(declare-fun choose!30 (BitStream!1456 BitStream!1456 BitStream!1456) Unit!2549)

(assert (=> d!9918 (= lt!51001 (choose!30 thiss!1379 (_2!1820 lt!50732) (_2!1820 lt!50730)))))

(assert (=> d!9918 (isPrefixOf!0 thiss!1379 (_2!1820 lt!50732))))

(assert (=> d!9918 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1820 lt!50732) (_2!1820 lt!50730)) lt!51001)))

(declare-fun bs!2707 () Bool)

(assert (= bs!2707 d!9918))

(assert (=> bs!2707 m!51237))

(declare-fun m!51575 () Bool)

(assert (=> bs!2707 m!51575))

(assert (=> bs!2707 m!51279))

(assert (=> b!34354 d!9918))

(declare-fun b!34737 () Bool)

(declare-fun res!29696 () Bool)

(declare-fun e!22992 () Bool)

(assert (=> b!34737 (=> (not res!29696) (not e!22992))))

(declare-fun lt!51478 () tuple2!3466)

(assert (=> b!34737 (= res!29696 (invariant!0 (currentBit!2531 (_2!1820 lt!51478)) (currentByte!2536 (_2!1820 lt!51478)) (size!835 (buf!1163 (_2!1820 lt!51478)))))))

(declare-fun d!9926 () Bool)

(assert (=> d!9926 e!22992))

(declare-fun res!29691 () Bool)

(assert (=> d!9926 (=> (not res!29691) (not e!22992))))

(declare-fun lt!51488 () (_ BitVec 64))

(assert (=> d!9926 (= res!29691 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51478))) (currentByte!2536 (_2!1820 lt!51478)) (currentBit!2531 (_2!1820 lt!51478))) (bvsub lt!51488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9926 (or (= (bvand lt!51488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51506 () (_ BitVec 64))

(assert (=> d!9926 (= lt!51488 (bvadd lt!51506 to!314))))

(assert (=> d!9926 (or (not (= (bvand lt!51506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!51506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!51506 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9926 (= lt!51506 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(declare-fun e!22991 () tuple2!3466)

(assert (=> d!9926 (= lt!51478 e!22991)))

(declare-fun c!2329 () Bool)

(assert (=> d!9926 (= c!2329 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!51490 () Unit!2549)

(declare-fun lt!51516 () Unit!2549)

(assert (=> d!9926 (= lt!51490 lt!51516)))

(assert (=> d!9926 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50732))))

(assert (=> d!9926 (= lt!51516 (lemmaIsPrefixRefl!0 (_2!1820 lt!50732)))))

(declare-fun lt!51521 () (_ BitVec 64))

(assert (=> d!9926 (= lt!51521 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(assert (=> d!9926 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9926 (= (appendBitsMSBFirstLoop!0 (_2!1820 lt!50732) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!51478)))

(declare-fun b!34738 () Bool)

(declare-fun res!29692 () Bool)

(assert (=> b!34738 (=> (not res!29692) (not e!22992))))

(assert (=> b!34738 (= res!29692 (= (size!835 (buf!1163 (_2!1820 lt!50732))) (size!835 (buf!1163 (_2!1820 lt!51478)))))))

(declare-fun b!34739 () Bool)

(declare-fun res!29694 () Bool)

(assert (=> b!34739 (=> (not res!29694) (not e!22992))))

(assert (=> b!34739 (= res!29694 (= (size!835 (buf!1163 (_2!1820 lt!51478))) (size!835 (buf!1163 (_2!1820 lt!50732)))))))

(declare-fun b!34740 () Bool)

(declare-fun lt!51503 () tuple2!3468)

(assert (=> b!34740 (= e!22992 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!51478) (_1!1821 lt!51503) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1820 lt!51478) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34740 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34740 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!51512 () Unit!2549)

(declare-fun lt!51501 () Unit!2549)

(assert (=> b!34740 (= lt!51512 lt!51501)))

(declare-fun lt!51519 () (_ BitVec 64))

(assert (=> b!34740 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!51478)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!51519)))

(assert (=> b!34740 (= lt!51501 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!51478)) lt!51519))))

(declare-fun e!22993 () Bool)

(assert (=> b!34740 e!22993))

(declare-fun res!29695 () Bool)

(assert (=> b!34740 (=> (not res!29695) (not e!22993))))

(assert (=> b!34740 (= res!29695 (and (= (size!835 (buf!1163 (_2!1820 lt!50732))) (size!835 (buf!1163 (_2!1820 lt!51478)))) (bvsge lt!51519 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34740 (= lt!51519 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34740 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34740 (= lt!51503 (reader!0 (_2!1820 lt!50732) (_2!1820 lt!51478)))))

(declare-fun b!34741 () Bool)

(declare-fun Unit!2567 () Unit!2549)

(assert (=> b!34741 (= e!22991 (tuple2!3467 Unit!2567 (_2!1820 lt!50732)))))

(assert (=> b!34741 (= (size!835 (buf!1163 (_2!1820 lt!50732))) (size!835 (buf!1163 (_2!1820 lt!50732))))))

(declare-fun lt!51486 () Unit!2549)

(declare-fun Unit!2568 () Unit!2549)

(assert (=> b!34741 (= lt!51486 Unit!2568)))

(declare-fun call!433 () tuple2!3468)

(declare-fun checkByteArrayBitContent!0 (BitStream!1456 array!1883 array!1883 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3490 0))(
  ( (tuple2!3491 (_1!1832 array!1883) (_2!1832 BitStream!1456)) )
))
(declare-fun readBits!0 (BitStream!1456 (_ BitVec 64)) tuple2!3490)

(assert (=> b!34741 (checkByteArrayBitContent!0 (_2!1820 lt!50732) srcBuffer!2 (_1!1832 (readBits!0 (_1!1821 call!433) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!34742 () Bool)

(assert (=> b!34742 (= e!22993 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!51519))))

(declare-fun b!34743 () Bool)

(declare-fun lt!51485 () tuple2!3466)

(declare-fun Unit!2569 () Unit!2549)

(assert (=> b!34743 (= e!22991 (tuple2!3467 Unit!2569 (_2!1820 lt!51485)))))

(declare-fun lt!51493 () tuple2!3466)

(assert (=> b!34743 (= lt!51493 (appendBitFromByte!0 (_2!1820 lt!50732) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!51495 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51495 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51514 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51514 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51491 () Unit!2549)

(assert (=> b!34743 (= lt!51491 (validateOffsetBitsIneqLemma!0 (_2!1820 lt!50732) (_2!1820 lt!51493) lt!51495 lt!51514))))

(assert (=> b!34743 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!51493)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!51493))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!51493))) (bvsub lt!51495 lt!51514))))

(declare-fun lt!51505 () Unit!2549)

(assert (=> b!34743 (= lt!51505 lt!51491)))

(declare-fun lt!51511 () tuple2!3468)

(assert (=> b!34743 (= lt!51511 (reader!0 (_2!1820 lt!50732) (_2!1820 lt!51493)))))

(declare-fun lt!51484 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51518 () Unit!2549)

(assert (=> b!34743 (= lt!51518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!51493)) lt!51484))))

(assert (=> b!34743 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!51493)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!51484)))

(declare-fun lt!51489 () Unit!2549)

(assert (=> b!34743 (= lt!51489 lt!51518)))

(assert (=> b!34743 (= (head!266 (byteArrayBitContentToList!0 (_2!1820 lt!51493) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!266 (bitStreamReadBitsIntoList!0 (_2!1820 lt!51493) (_1!1821 lt!51511) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51510 () Unit!2549)

(declare-fun Unit!2570 () Unit!2549)

(assert (=> b!34743 (= lt!51510 Unit!2570)))

(assert (=> b!34743 (= lt!51485 (appendBitsMSBFirstLoop!0 (_2!1820 lt!51493) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!51517 () Unit!2549)

(assert (=> b!34743 (= lt!51517 (lemmaIsPrefixTransitive!0 (_2!1820 lt!50732) (_2!1820 lt!51493) (_2!1820 lt!51485)))))

(assert (=> b!34743 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!51485))))

(declare-fun lt!51487 () Unit!2549)

(assert (=> b!34743 (= lt!51487 lt!51517)))

(assert (=> b!34743 (= (size!835 (buf!1163 (_2!1820 lt!51485))) (size!835 (buf!1163 (_2!1820 lt!50732))))))

(declare-fun lt!51492 () Unit!2549)

(declare-fun Unit!2571 () Unit!2549)

(assert (=> b!34743 (= lt!51492 Unit!2571)))

(assert (=> b!34743 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51485))) (currentByte!2536 (_2!1820 lt!51485)) (currentBit!2531 (_2!1820 lt!51485))) (bvsub (bvadd (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51479 () Unit!2549)

(declare-fun Unit!2572 () Unit!2549)

(assert (=> b!34743 (= lt!51479 Unit!2572)))

(assert (=> b!34743 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51485))) (currentByte!2536 (_2!1820 lt!51485)) (currentBit!2531 (_2!1820 lt!51485))) (bvsub (bvsub (bvadd (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51493))) (currentByte!2536 (_2!1820 lt!51493)) (currentBit!2531 (_2!1820 lt!51493))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51507 () Unit!2549)

(declare-fun Unit!2573 () Unit!2549)

(assert (=> b!34743 (= lt!51507 Unit!2573)))

(declare-fun lt!51496 () tuple2!3468)

(assert (=> b!34743 (= lt!51496 (reader!0 (_2!1820 lt!50732) (_2!1820 lt!51485)))))

(declare-fun lt!51498 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51498 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51513 () Unit!2549)

(assert (=> b!34743 (= lt!51513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!51485)) lt!51498))))

(assert (=> b!34743 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!51485)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!51498)))

(declare-fun lt!51497 () Unit!2549)

(assert (=> b!34743 (= lt!51497 lt!51513)))

(declare-fun lt!51480 () tuple2!3468)

(assert (=> b!34743 (= lt!51480 call!433)))

(declare-fun lt!51504 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51504 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51508 () Unit!2549)

(assert (=> b!34743 (= lt!51508 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!51493) (buf!1163 (_2!1820 lt!51485)) lt!51504))))

(assert (=> b!34743 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!51485)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!51493))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!51493))) lt!51504)))

(declare-fun lt!51494 () Unit!2549)

(assert (=> b!34743 (= lt!51494 lt!51508)))

(declare-fun lt!51515 () List!429)

(assert (=> b!34743 (= lt!51515 (byteArrayBitContentToList!0 (_2!1820 lt!51485) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51520 () List!429)

(assert (=> b!34743 (= lt!51520 (byteArrayBitContentToList!0 (_2!1820 lt!51485) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51502 () List!429)

(assert (=> b!34743 (= lt!51502 (bitStreamReadBitsIntoList!0 (_2!1820 lt!51485) (_1!1821 lt!51496) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!51482 () List!429)

(assert (=> b!34743 (= lt!51482 (bitStreamReadBitsIntoList!0 (_2!1820 lt!51485) (_1!1821 lt!51480) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!51499 () (_ BitVec 64))

(assert (=> b!34743 (= lt!51499 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!51481 () Unit!2549)

(assert (=> b!34743 (= lt!51481 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1820 lt!51485) (_2!1820 lt!51485) (_1!1821 lt!51496) (_1!1821 lt!51480) lt!51499 lt!51502))))

(assert (=> b!34743 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!51485) (_1!1821 lt!51480) (bvsub lt!51499 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!146 lt!51502))))

(declare-fun lt!51500 () Unit!2549)

(assert (=> b!34743 (= lt!51500 lt!51481)))

(declare-fun lt!51483 () Unit!2549)

(assert (=> b!34743 (= lt!51483 (arrayBitRangesEqImpliesEq!0 (buf!1163 (_2!1820 lt!51493)) (buf!1163 (_2!1820 lt!51485)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!51521 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51493))) (currentByte!2536 (_2!1820 lt!51493)) (currentBit!2531 (_2!1820 lt!51493)))))))

(assert (=> b!34743 (= (bitAt!0 (buf!1163 (_2!1820 lt!51493)) lt!51521) (bitAt!0 (buf!1163 (_2!1820 lt!51485)) lt!51521))))

(declare-fun lt!51509 () Unit!2549)

(assert (=> b!34743 (= lt!51509 lt!51483)))

(declare-fun bm!430 () Bool)

(assert (=> bm!430 (= call!433 (reader!0 (ite c!2329 (_2!1820 lt!51493) (_2!1820 lt!50732)) (ite c!2329 (_2!1820 lt!51485) (_2!1820 lt!50732))))))

(declare-fun b!34744 () Bool)

(declare-fun res!29693 () Bool)

(assert (=> b!34744 (=> (not res!29693) (not e!22992))))

(assert (=> b!34744 (= res!29693 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!51478)))))

(assert (= (and d!9926 c!2329) b!34743))

(assert (= (and d!9926 (not c!2329)) b!34741))

(assert (= (or b!34743 b!34741) bm!430))

(assert (= (and d!9926 res!29691) b!34737))

(assert (= (and b!34737 res!29696) b!34738))

(assert (= (and b!34738 res!29692) b!34744))

(assert (= (and b!34744 res!29693) b!34739))

(assert (= (and b!34739 res!29694) b!34740))

(assert (= (and b!34740 res!29695) b!34742))

(declare-fun m!51913 () Bool)

(assert (=> bm!430 m!51913))

(declare-fun m!51915 () Bool)

(assert (=> b!34744 m!51915))

(declare-fun m!51917 () Bool)

(assert (=> b!34743 m!51917))

(declare-fun m!51919 () Bool)

(assert (=> b!34743 m!51919))

(declare-fun m!51921 () Bool)

(assert (=> b!34743 m!51921))

(declare-fun m!51923 () Bool)

(assert (=> b!34743 m!51923))

(declare-fun m!51925 () Bool)

(assert (=> b!34743 m!51925))

(declare-fun m!51927 () Bool)

(assert (=> b!34743 m!51927))

(declare-fun m!51929 () Bool)

(assert (=> b!34743 m!51929))

(declare-fun m!51931 () Bool)

(assert (=> b!34743 m!51931))

(declare-fun m!51933 () Bool)

(assert (=> b!34743 m!51933))

(declare-fun m!51935 () Bool)

(assert (=> b!34743 m!51935))

(declare-fun m!51937 () Bool)

(assert (=> b!34743 m!51937))

(declare-fun m!51939 () Bool)

(assert (=> b!34743 m!51939))

(declare-fun m!51941 () Bool)

(assert (=> b!34743 m!51941))

(declare-fun m!51943 () Bool)

(assert (=> b!34743 m!51943))

(assert (=> b!34743 m!51925))

(declare-fun m!51945 () Bool)

(assert (=> b!34743 m!51945))

(declare-fun m!51947 () Bool)

(assert (=> b!34743 m!51947))

(assert (=> b!34743 m!51919))

(declare-fun m!51949 () Bool)

(assert (=> b!34743 m!51949))

(declare-fun m!51951 () Bool)

(assert (=> b!34743 m!51951))

(declare-fun m!51953 () Bool)

(assert (=> b!34743 m!51953))

(declare-fun m!51955 () Bool)

(assert (=> b!34743 m!51955))

(assert (=> b!34743 m!51931))

(declare-fun m!51957 () Bool)

(assert (=> b!34743 m!51957))

(declare-fun m!51959 () Bool)

(assert (=> b!34743 m!51959))

(declare-fun m!51961 () Bool)

(assert (=> b!34743 m!51961))

(declare-fun m!51963 () Bool)

(assert (=> b!34743 m!51963))

(declare-fun m!51965 () Bool)

(assert (=> b!34743 m!51965))

(declare-fun m!51967 () Bool)

(assert (=> b!34743 m!51967))

(assert (=> b!34743 m!51963))

(declare-fun m!51969 () Bool)

(assert (=> b!34743 m!51969))

(declare-fun m!51971 () Bool)

(assert (=> b!34743 m!51971))

(assert (=> b!34743 m!51291))

(declare-fun m!51973 () Bool)

(assert (=> b!34743 m!51973))

(declare-fun m!51975 () Bool)

(assert (=> b!34743 m!51975))

(declare-fun m!51977 () Bool)

(assert (=> b!34743 m!51977))

(declare-fun m!51979 () Bool)

(assert (=> d!9926 m!51979))

(assert (=> d!9926 m!51291))

(declare-fun m!51981 () Bool)

(assert (=> d!9926 m!51981))

(declare-fun m!51983 () Bool)

(assert (=> d!9926 m!51983))

(declare-fun m!51985 () Bool)

(assert (=> b!34740 m!51985))

(declare-fun m!51987 () Bool)

(assert (=> b!34740 m!51987))

(declare-fun m!51989 () Bool)

(assert (=> b!34740 m!51989))

(declare-fun m!51991 () Bool)

(assert (=> b!34740 m!51991))

(declare-fun m!51993 () Bool)

(assert (=> b!34740 m!51993))

(declare-fun m!51995 () Bool)

(assert (=> b!34741 m!51995))

(declare-fun m!51997 () Bool)

(assert (=> b!34741 m!51997))

(declare-fun m!51999 () Bool)

(assert (=> b!34742 m!51999))

(declare-fun m!52001 () Bool)

(assert (=> b!34737 m!52001))

(assert (=> b!34354 d!9926))

(declare-fun b!34755 () Bool)

(declare-fun res!29703 () Bool)

(declare-fun e!22998 () Bool)

(assert (=> b!34755 (=> (not res!29703) (not e!22998))))

(declare-fun lt!51564 () tuple2!3468)

(assert (=> b!34755 (= res!29703 (isPrefixOf!0 (_1!1821 lt!51564) thiss!1379))))

(declare-fun b!34756 () Bool)

(declare-fun e!22999 () Unit!2549)

(declare-fun lt!51565 () Unit!2549)

(assert (=> b!34756 (= e!22999 lt!51565)))

(declare-fun lt!51578 () (_ BitVec 64))

(assert (=> b!34756 (= lt!51578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51572 () (_ BitVec 64))

(assert (=> b!34756 (= lt!51572 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1883 array!1883 (_ BitVec 64) (_ BitVec 64)) Unit!2549)

(assert (=> b!34756 (= lt!51565 (arrayBitRangesEqSymmetric!0 (buf!1163 thiss!1379) (buf!1163 (_2!1820 lt!50732)) lt!51578 lt!51572))))

(declare-fun arrayBitRangesEq!0 (array!1883 array!1883 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!34756 (arrayBitRangesEq!0 (buf!1163 (_2!1820 lt!50732)) (buf!1163 thiss!1379) lt!51578 lt!51572)))

(declare-fun b!34757 () Bool)

(declare-fun Unit!2574 () Unit!2549)

(assert (=> b!34757 (= e!22999 Unit!2574)))

(declare-fun b!34758 () Bool)

(declare-fun res!29704 () Bool)

(assert (=> b!34758 (=> (not res!29704) (not e!22998))))

(assert (=> b!34758 (= res!29704 (isPrefixOf!0 (_2!1821 lt!51564) (_2!1820 lt!50732)))))

(declare-fun d!10056 () Bool)

(assert (=> d!10056 e!22998))

(declare-fun res!29705 () Bool)

(assert (=> d!10056 (=> (not res!29705) (not e!22998))))

(assert (=> d!10056 (= res!29705 (isPrefixOf!0 (_1!1821 lt!51564) (_2!1821 lt!51564)))))

(declare-fun lt!51570 () BitStream!1456)

(assert (=> d!10056 (= lt!51564 (tuple2!3469 lt!51570 (_2!1820 lt!50732)))))

(declare-fun lt!51566 () Unit!2549)

(declare-fun lt!51575 () Unit!2549)

(assert (=> d!10056 (= lt!51566 lt!51575)))

(assert (=> d!10056 (isPrefixOf!0 lt!51570 (_2!1820 lt!50732))))

(assert (=> d!10056 (= lt!51575 (lemmaIsPrefixTransitive!0 lt!51570 (_2!1820 lt!50732) (_2!1820 lt!50732)))))

(declare-fun lt!51579 () Unit!2549)

(declare-fun lt!51581 () Unit!2549)

(assert (=> d!10056 (= lt!51579 lt!51581)))

(assert (=> d!10056 (isPrefixOf!0 lt!51570 (_2!1820 lt!50732))))

(assert (=> d!10056 (= lt!51581 (lemmaIsPrefixTransitive!0 lt!51570 thiss!1379 (_2!1820 lt!50732)))))

(declare-fun lt!51569 () Unit!2549)

(assert (=> d!10056 (= lt!51569 e!22999)))

(declare-fun c!2332 () Bool)

(assert (=> d!10056 (= c!2332 (not (= (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!51562 () Unit!2549)

(declare-fun lt!51580 () Unit!2549)

(assert (=> d!10056 (= lt!51562 lt!51580)))

(assert (=> d!10056 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50732))))

(assert (=> d!10056 (= lt!51580 (lemmaIsPrefixRefl!0 (_2!1820 lt!50732)))))

(declare-fun lt!51576 () Unit!2549)

(declare-fun lt!51574 () Unit!2549)

(assert (=> d!10056 (= lt!51576 lt!51574)))

(assert (=> d!10056 (= lt!51574 (lemmaIsPrefixRefl!0 (_2!1820 lt!50732)))))

(declare-fun lt!51568 () Unit!2549)

(declare-fun lt!51567 () Unit!2549)

(assert (=> d!10056 (= lt!51568 lt!51567)))

(assert (=> d!10056 (isPrefixOf!0 lt!51570 lt!51570)))

(assert (=> d!10056 (= lt!51567 (lemmaIsPrefixRefl!0 lt!51570))))

(declare-fun lt!51571 () Unit!2549)

(declare-fun lt!51577 () Unit!2549)

(assert (=> d!10056 (= lt!51571 lt!51577)))

(assert (=> d!10056 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10056 (= lt!51577 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10056 (= lt!51570 (BitStream!1457 (buf!1163 (_2!1820 lt!50732)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(assert (=> d!10056 (isPrefixOf!0 thiss!1379 (_2!1820 lt!50732))))

(assert (=> d!10056 (= (reader!0 thiss!1379 (_2!1820 lt!50732)) lt!51564)))

(declare-fun b!34759 () Bool)

(declare-fun lt!51563 () (_ BitVec 64))

(declare-fun lt!51573 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1456 (_ BitVec 64)) BitStream!1456)

(assert (=> b!34759 (= e!22998 (= (_1!1821 lt!51564) (withMovedBitIndex!0 (_2!1821 lt!51564) (bvsub lt!51563 lt!51573))))))

(assert (=> b!34759 (or (= (bvand lt!51563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51563 lt!51573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34759 (= lt!51573 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(assert (=> b!34759 (= lt!51563 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(assert (= (and d!10056 c!2332) b!34756))

(assert (= (and d!10056 (not c!2332)) b!34757))

(assert (= (and d!10056 res!29705) b!34755))

(assert (= (and b!34755 res!29703) b!34758))

(assert (= (and b!34758 res!29704) b!34759))

(declare-fun m!52003 () Bool)

(assert (=> b!34755 m!52003))

(assert (=> d!10056 m!51981))

(assert (=> d!10056 m!51279))

(declare-fun m!52005 () Bool)

(assert (=> d!10056 m!52005))

(declare-fun m!52007 () Bool)

(assert (=> d!10056 m!52007))

(declare-fun m!52009 () Bool)

(assert (=> d!10056 m!52009))

(assert (=> d!10056 m!51247))

(declare-fun m!52011 () Bool)

(assert (=> d!10056 m!52011))

(assert (=> d!10056 m!51983))

(declare-fun m!52013 () Bool)

(assert (=> d!10056 m!52013))

(declare-fun m!52015 () Bool)

(assert (=> d!10056 m!52015))

(assert (=> d!10056 m!51249))

(declare-fun m!52017 () Bool)

(assert (=> b!34758 m!52017))

(assert (=> b!34756 m!51251))

(declare-fun m!52019 () Bool)

(assert (=> b!34756 m!52019))

(declare-fun m!52021 () Bool)

(assert (=> b!34756 m!52021))

(declare-fun m!52023 () Bool)

(assert (=> b!34759 m!52023))

(assert (=> b!34759 m!51291))

(assert (=> b!34759 m!51251))

(assert (=> b!34354 d!10056))

(declare-fun d!10058 () Bool)

(declare-fun res!29713 () Bool)

(declare-fun e!23004 () Bool)

(assert (=> d!10058 (=> (not res!29713) (not e!23004))))

(assert (=> d!10058 (= res!29713 (= (size!835 (buf!1163 (_2!1820 lt!50732))) (size!835 (buf!1163 (_2!1820 lt!50730)))))))

(assert (=> d!10058 (= (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50730)) e!23004)))

(declare-fun b!34766 () Bool)

(declare-fun res!29714 () Bool)

(assert (=> b!34766 (=> (not res!29714) (not e!23004))))

(assert (=> b!34766 (= res!29714 (bvsle (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))) (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730)))))))

(declare-fun b!34767 () Bool)

(declare-fun e!23005 () Bool)

(assert (=> b!34767 (= e!23004 e!23005)))

(declare-fun res!29712 () Bool)

(assert (=> b!34767 (=> res!29712 e!23005)))

(assert (=> b!34767 (= res!29712 (= (size!835 (buf!1163 (_2!1820 lt!50732))) #b00000000000000000000000000000000))))

(declare-fun b!34768 () Bool)

(assert (=> b!34768 (= e!23005 (arrayBitRangesEq!0 (buf!1163 (_2!1820 lt!50732)) (buf!1163 (_2!1820 lt!50730)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732)))))))

(assert (= (and d!10058 res!29713) b!34766))

(assert (= (and b!34766 res!29714) b!34767))

(assert (= (and b!34767 (not res!29712)) b!34768))

(assert (=> b!34766 m!51291))

(assert (=> b!34766 m!51245))

(assert (=> b!34768 m!51291))

(assert (=> b!34768 m!51291))

(declare-fun m!52025 () Bool)

(assert (=> b!34768 m!52025))

(assert (=> b!34354 d!10058))

(declare-fun d!10060 () Bool)

(declare-fun res!29716 () Bool)

(declare-fun e!23006 () Bool)

(assert (=> d!10060 (=> (not res!29716) (not e!23006))))

(assert (=> d!10060 (= res!29716 (= (size!835 (buf!1163 thiss!1379)) (size!835 (buf!1163 (_2!1820 lt!50730)))))))

(assert (=> d!10060 (= (isPrefixOf!0 thiss!1379 (_2!1820 lt!50730)) e!23006)))

(declare-fun b!34769 () Bool)

(declare-fun res!29717 () Bool)

(assert (=> b!34769 (=> (not res!29717) (not e!23006))))

(assert (=> b!34769 (= res!29717 (bvsle (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)) (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730)))))))

(declare-fun b!34770 () Bool)

(declare-fun e!23007 () Bool)

(assert (=> b!34770 (= e!23006 e!23007)))

(declare-fun res!29715 () Bool)

(assert (=> b!34770 (=> res!29715 e!23007)))

(assert (=> b!34770 (= res!29715 (= (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34771 () Bool)

(assert (=> b!34771 (= e!23007 (arrayBitRangesEq!0 (buf!1163 thiss!1379) (buf!1163 (_2!1820 lt!50730)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(assert (= (and d!10060 res!29716) b!34769))

(assert (= (and b!34769 res!29717) b!34770))

(assert (= (and b!34770 (not res!29715)) b!34771))

(assert (=> b!34769 m!51251))

(assert (=> b!34769 m!51245))

(assert (=> b!34771 m!51251))

(assert (=> b!34771 m!51251))

(declare-fun m!52027 () Bool)

(assert (=> b!34771 m!52027))

(assert (=> b!34354 d!10060))

(declare-fun d!10062 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10062 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2738 () Bool)

(assert (= bs!2738 d!10062))

(declare-fun m!52029 () Bool)

(assert (=> bs!2738 m!52029))

(assert (=> b!34354 d!10062))

(declare-fun d!10064 () Bool)

(assert (=> d!10064 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2739 () Bool)

(assert (= bs!2739 d!10064))

(declare-fun m!52031 () Bool)

(assert (=> bs!2739 m!52031))

(assert (=> b!34365 d!10064))

(declare-fun b!34783 () Bool)

(declare-fun e!23012 () Bool)

(declare-fun lt!51590 () List!429)

(assert (=> b!34783 (= e!23012 (> (length!155 lt!51590) 0))))

(declare-fun lt!51589 () (_ BitVec 64))

(declare-fun b!34781 () Bool)

(declare-datatypes ((tuple2!3496 0))(
  ( (tuple2!3497 (_1!1835 List!429) (_2!1835 BitStream!1456)) )
))
(declare-fun e!23013 () tuple2!3496)

(declare-datatypes ((tuple2!3498 0))(
  ( (tuple2!3499 (_1!1836 Bool) (_2!1836 BitStream!1456)) )
))
(declare-fun lt!51588 () tuple2!3498)

(assert (=> b!34781 (= e!23013 (tuple2!3497 (Cons!425 (_1!1836 lt!51588) (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_2!1836 lt!51588) (bvsub (bvsub to!314 i!635) lt!51589))) (_2!1836 lt!51588)))))

(declare-fun readBit!0 (BitStream!1456) tuple2!3498)

(assert (=> b!34781 (= lt!51588 (readBit!0 (_1!1821 lt!50728)))))

(assert (=> b!34781 (= lt!51589 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34782 () Bool)

(declare-fun isEmpty!95 (List!429) Bool)

(assert (=> b!34782 (= e!23012 (isEmpty!95 lt!51590))))

(declare-fun d!10066 () Bool)

(assert (=> d!10066 e!23012))

(declare-fun c!2337 () Bool)

(assert (=> d!10066 (= c!2337 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10066 (= lt!51590 (_1!1835 e!23013))))

(declare-fun c!2338 () Bool)

(assert (=> d!10066 (= c!2338 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10066 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10066 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_1!1821 lt!50728) (bvsub to!314 i!635)) lt!51590)))

(declare-fun b!34780 () Bool)

(assert (=> b!34780 (= e!23013 (tuple2!3497 Nil!426 (_1!1821 lt!50728)))))

(assert (= (and d!10066 c!2338) b!34780))

(assert (= (and d!10066 (not c!2338)) b!34781))

(assert (= (and d!10066 c!2337) b!34782))

(assert (= (and d!10066 (not c!2337)) b!34783))

(declare-fun m!52033 () Bool)

(assert (=> b!34783 m!52033))

(declare-fun m!52035 () Bool)

(assert (=> b!34781 m!52035))

(declare-fun m!52037 () Bool)

(assert (=> b!34781 m!52037))

(declare-fun m!52039 () Bool)

(assert (=> b!34782 m!52039))

(assert (=> b!34365 d!10066))

(declare-fun d!10068 () Bool)

(assert (=> d!10068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!50725) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732)))) lt!50725))))

(declare-fun bs!2740 () Bool)

(assert (= bs!2740 d!10068))

(declare-fun m!52041 () Bool)

(assert (=> bs!2740 m!52041))

(assert (=> b!34365 d!10068))

(declare-fun b!34784 () Bool)

(declare-fun res!29718 () Bool)

(declare-fun e!23014 () Bool)

(assert (=> b!34784 (=> (not res!29718) (not e!23014))))

(declare-fun lt!51593 () tuple2!3468)

(assert (=> b!34784 (= res!29718 (isPrefixOf!0 (_1!1821 lt!51593) (_2!1820 lt!50732)))))

(declare-fun b!34785 () Bool)

(declare-fun e!23015 () Unit!2549)

(declare-fun lt!51594 () Unit!2549)

(assert (=> b!34785 (= e!23015 lt!51594)))

(declare-fun lt!51607 () (_ BitVec 64))

(assert (=> b!34785 (= lt!51607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51601 () (_ BitVec 64))

(assert (=> b!34785 (= lt!51601 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(assert (=> b!34785 (= lt!51594 (arrayBitRangesEqSymmetric!0 (buf!1163 (_2!1820 lt!50732)) (buf!1163 (_2!1820 lt!50730)) lt!51607 lt!51601))))

(assert (=> b!34785 (arrayBitRangesEq!0 (buf!1163 (_2!1820 lt!50730)) (buf!1163 (_2!1820 lt!50732)) lt!51607 lt!51601)))

(declare-fun b!34786 () Bool)

(declare-fun Unit!2580 () Unit!2549)

(assert (=> b!34786 (= e!23015 Unit!2580)))

(declare-fun b!34787 () Bool)

(declare-fun res!29719 () Bool)

(assert (=> b!34787 (=> (not res!29719) (not e!23014))))

(assert (=> b!34787 (= res!29719 (isPrefixOf!0 (_2!1821 lt!51593) (_2!1820 lt!50730)))))

(declare-fun d!10070 () Bool)

(assert (=> d!10070 e!23014))

(declare-fun res!29720 () Bool)

(assert (=> d!10070 (=> (not res!29720) (not e!23014))))

(assert (=> d!10070 (= res!29720 (isPrefixOf!0 (_1!1821 lt!51593) (_2!1821 lt!51593)))))

(declare-fun lt!51599 () BitStream!1456)

(assert (=> d!10070 (= lt!51593 (tuple2!3469 lt!51599 (_2!1820 lt!50730)))))

(declare-fun lt!51595 () Unit!2549)

(declare-fun lt!51604 () Unit!2549)

(assert (=> d!10070 (= lt!51595 lt!51604)))

(assert (=> d!10070 (isPrefixOf!0 lt!51599 (_2!1820 lt!50730))))

(assert (=> d!10070 (= lt!51604 (lemmaIsPrefixTransitive!0 lt!51599 (_2!1820 lt!50730) (_2!1820 lt!50730)))))

(declare-fun lt!51608 () Unit!2549)

(declare-fun lt!51610 () Unit!2549)

(assert (=> d!10070 (= lt!51608 lt!51610)))

(assert (=> d!10070 (isPrefixOf!0 lt!51599 (_2!1820 lt!50730))))

(assert (=> d!10070 (= lt!51610 (lemmaIsPrefixTransitive!0 lt!51599 (_2!1820 lt!50732) (_2!1820 lt!50730)))))

(declare-fun lt!51598 () Unit!2549)

(assert (=> d!10070 (= lt!51598 e!23015)))

(declare-fun c!2339 () Bool)

(assert (=> d!10070 (= c!2339 (not (= (size!835 (buf!1163 (_2!1820 lt!50732))) #b00000000000000000000000000000000)))))

(declare-fun lt!51591 () Unit!2549)

(declare-fun lt!51609 () Unit!2549)

(assert (=> d!10070 (= lt!51591 lt!51609)))

(assert (=> d!10070 (isPrefixOf!0 (_2!1820 lt!50730) (_2!1820 lt!50730))))

(assert (=> d!10070 (= lt!51609 (lemmaIsPrefixRefl!0 (_2!1820 lt!50730)))))

(declare-fun lt!51605 () Unit!2549)

(declare-fun lt!51603 () Unit!2549)

(assert (=> d!10070 (= lt!51605 lt!51603)))

(assert (=> d!10070 (= lt!51603 (lemmaIsPrefixRefl!0 (_2!1820 lt!50730)))))

(declare-fun lt!51597 () Unit!2549)

(declare-fun lt!51596 () Unit!2549)

(assert (=> d!10070 (= lt!51597 lt!51596)))

(assert (=> d!10070 (isPrefixOf!0 lt!51599 lt!51599)))

(assert (=> d!10070 (= lt!51596 (lemmaIsPrefixRefl!0 lt!51599))))

(declare-fun lt!51600 () Unit!2549)

(declare-fun lt!51606 () Unit!2549)

(assert (=> d!10070 (= lt!51600 lt!51606)))

(assert (=> d!10070 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50732))))

(assert (=> d!10070 (= lt!51606 (lemmaIsPrefixRefl!0 (_2!1820 lt!50732)))))

(assert (=> d!10070 (= lt!51599 (BitStream!1457 (buf!1163 (_2!1820 lt!50730)) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(assert (=> d!10070 (isPrefixOf!0 (_2!1820 lt!50732) (_2!1820 lt!50730))))

(assert (=> d!10070 (= (reader!0 (_2!1820 lt!50732) (_2!1820 lt!50730)) lt!51593)))

(declare-fun lt!51592 () (_ BitVec 64))

(declare-fun lt!51602 () (_ BitVec 64))

(declare-fun b!34788 () Bool)

(assert (=> b!34788 (= e!23014 (= (_1!1821 lt!51593) (withMovedBitIndex!0 (_2!1821 lt!51593) (bvsub lt!51592 lt!51602))))))

(assert (=> b!34788 (or (= (bvand lt!51592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51592 lt!51602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34788 (= lt!51602 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730))))))

(assert (=> b!34788 (= lt!51592 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))))))

(assert (= (and d!10070 c!2339) b!34785))

(assert (= (and d!10070 (not c!2339)) b!34786))

(assert (= (and d!10070 res!29720) b!34784))

(assert (= (and b!34784 res!29718) b!34787))

(assert (= (and b!34787 res!29719) b!34788))

(declare-fun m!52043 () Bool)

(assert (=> b!34784 m!52043))

(declare-fun m!52045 () Bool)

(assert (=> d!10070 m!52045))

(assert (=> d!10070 m!51239))

(declare-fun m!52047 () Bool)

(assert (=> d!10070 m!52047))

(declare-fun m!52049 () Bool)

(assert (=> d!10070 m!52049))

(declare-fun m!52051 () Bool)

(assert (=> d!10070 m!52051))

(assert (=> d!10070 m!51981))

(declare-fun m!52053 () Bool)

(assert (=> d!10070 m!52053))

(declare-fun m!52055 () Bool)

(assert (=> d!10070 m!52055))

(declare-fun m!52057 () Bool)

(assert (=> d!10070 m!52057))

(declare-fun m!52059 () Bool)

(assert (=> d!10070 m!52059))

(assert (=> d!10070 m!51983))

(declare-fun m!52061 () Bool)

(assert (=> b!34787 m!52061))

(assert (=> b!34785 m!51291))

(declare-fun m!52063 () Bool)

(assert (=> b!34785 m!52063))

(declare-fun m!52065 () Bool)

(assert (=> b!34785 m!52065))

(declare-fun m!52067 () Bool)

(assert (=> b!34788 m!52067))

(assert (=> b!34788 m!51245))

(assert (=> b!34788 m!51291))

(assert (=> b!34365 d!10070))

(declare-fun b!34792 () Bool)

(declare-fun e!23016 () Bool)

(declare-fun lt!51613 () List!429)

(assert (=> b!34792 (= e!23016 (> (length!155 lt!51613) 0))))

(declare-fun lt!51612 () (_ BitVec 64))

(declare-fun lt!51611 () tuple2!3498)

(declare-fun e!23017 () tuple2!3496)

(declare-fun b!34790 () Bool)

(assert (=> b!34790 (= e!23017 (tuple2!3497 (Cons!425 (_1!1836 lt!51611) (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_2!1836 lt!51611) (bvsub lt!50725 lt!51612))) (_2!1836 lt!51611)))))

(assert (=> b!34790 (= lt!51611 (readBit!0 (_1!1821 lt!50722)))))

(assert (=> b!34790 (= lt!51612 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34791 () Bool)

(assert (=> b!34791 (= e!23016 (isEmpty!95 lt!51613))))

(declare-fun d!10072 () Bool)

(assert (=> d!10072 e!23016))

(declare-fun c!2340 () Bool)

(assert (=> d!10072 (= c!2340 (= lt!50725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10072 (= lt!51613 (_1!1835 e!23017))))

(declare-fun c!2341 () Bool)

(assert (=> d!10072 (= c!2341 (= lt!50725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10072 (bvsge lt!50725 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10072 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_1!1821 lt!50722) lt!50725) lt!51613)))

(declare-fun b!34789 () Bool)

(assert (=> b!34789 (= e!23017 (tuple2!3497 Nil!426 (_1!1821 lt!50722)))))

(assert (= (and d!10072 c!2341) b!34789))

(assert (= (and d!10072 (not c!2341)) b!34790))

(assert (= (and d!10072 c!2340) b!34791))

(assert (= (and d!10072 (not c!2340)) b!34792))

(declare-fun m!52069 () Bool)

(assert (=> b!34792 m!52069))

(declare-fun m!52071 () Bool)

(assert (=> b!34790 m!52071))

(declare-fun m!52073 () Bool)

(assert (=> b!34790 m!52073))

(declare-fun m!52075 () Bool)

(assert (=> b!34791 m!52075))

(assert (=> b!34365 d!10072))

(declare-fun b!34793 () Bool)

(declare-fun res!29721 () Bool)

(declare-fun e!23018 () Bool)

(assert (=> b!34793 (=> (not res!29721) (not e!23018))))

(declare-fun lt!51616 () tuple2!3468)

(assert (=> b!34793 (= res!29721 (isPrefixOf!0 (_1!1821 lt!51616) thiss!1379))))

(declare-fun b!34794 () Bool)

(declare-fun e!23019 () Unit!2549)

(declare-fun lt!51617 () Unit!2549)

(assert (=> b!34794 (= e!23019 lt!51617)))

(declare-fun lt!51630 () (_ BitVec 64))

(assert (=> b!34794 (= lt!51630 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51624 () (_ BitVec 64))

(assert (=> b!34794 (= lt!51624 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(assert (=> b!34794 (= lt!51617 (arrayBitRangesEqSymmetric!0 (buf!1163 thiss!1379) (buf!1163 (_2!1820 lt!50730)) lt!51630 lt!51624))))

(assert (=> b!34794 (arrayBitRangesEq!0 (buf!1163 (_2!1820 lt!50730)) (buf!1163 thiss!1379) lt!51630 lt!51624)))

(declare-fun b!34795 () Bool)

(declare-fun Unit!2583 () Unit!2549)

(assert (=> b!34795 (= e!23019 Unit!2583)))

(declare-fun b!34796 () Bool)

(declare-fun res!29722 () Bool)

(assert (=> b!34796 (=> (not res!29722) (not e!23018))))

(assert (=> b!34796 (= res!29722 (isPrefixOf!0 (_2!1821 lt!51616) (_2!1820 lt!50730)))))

(declare-fun d!10074 () Bool)

(assert (=> d!10074 e!23018))

(declare-fun res!29723 () Bool)

(assert (=> d!10074 (=> (not res!29723) (not e!23018))))

(assert (=> d!10074 (= res!29723 (isPrefixOf!0 (_1!1821 lt!51616) (_2!1821 lt!51616)))))

(declare-fun lt!51622 () BitStream!1456)

(assert (=> d!10074 (= lt!51616 (tuple2!3469 lt!51622 (_2!1820 lt!50730)))))

(declare-fun lt!51618 () Unit!2549)

(declare-fun lt!51627 () Unit!2549)

(assert (=> d!10074 (= lt!51618 lt!51627)))

(assert (=> d!10074 (isPrefixOf!0 lt!51622 (_2!1820 lt!50730))))

(assert (=> d!10074 (= lt!51627 (lemmaIsPrefixTransitive!0 lt!51622 (_2!1820 lt!50730) (_2!1820 lt!50730)))))

(declare-fun lt!51631 () Unit!2549)

(declare-fun lt!51633 () Unit!2549)

(assert (=> d!10074 (= lt!51631 lt!51633)))

(assert (=> d!10074 (isPrefixOf!0 lt!51622 (_2!1820 lt!50730))))

(assert (=> d!10074 (= lt!51633 (lemmaIsPrefixTransitive!0 lt!51622 thiss!1379 (_2!1820 lt!50730)))))

(declare-fun lt!51621 () Unit!2549)

(assert (=> d!10074 (= lt!51621 e!23019)))

(declare-fun c!2342 () Bool)

(assert (=> d!10074 (= c!2342 (not (= (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!51614 () Unit!2549)

(declare-fun lt!51632 () Unit!2549)

(assert (=> d!10074 (= lt!51614 lt!51632)))

(assert (=> d!10074 (isPrefixOf!0 (_2!1820 lt!50730) (_2!1820 lt!50730))))

(assert (=> d!10074 (= lt!51632 (lemmaIsPrefixRefl!0 (_2!1820 lt!50730)))))

(declare-fun lt!51628 () Unit!2549)

(declare-fun lt!51626 () Unit!2549)

(assert (=> d!10074 (= lt!51628 lt!51626)))

(assert (=> d!10074 (= lt!51626 (lemmaIsPrefixRefl!0 (_2!1820 lt!50730)))))

(declare-fun lt!51620 () Unit!2549)

(declare-fun lt!51619 () Unit!2549)

(assert (=> d!10074 (= lt!51620 lt!51619)))

(assert (=> d!10074 (isPrefixOf!0 lt!51622 lt!51622)))

(assert (=> d!10074 (= lt!51619 (lemmaIsPrefixRefl!0 lt!51622))))

(declare-fun lt!51623 () Unit!2549)

(declare-fun lt!51629 () Unit!2549)

(assert (=> d!10074 (= lt!51623 lt!51629)))

(assert (=> d!10074 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10074 (= lt!51629 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10074 (= lt!51622 (BitStream!1457 (buf!1163 (_2!1820 lt!50730)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(assert (=> d!10074 (isPrefixOf!0 thiss!1379 (_2!1820 lt!50730))))

(assert (=> d!10074 (= (reader!0 thiss!1379 (_2!1820 lt!50730)) lt!51616)))

(declare-fun b!34797 () Bool)

(declare-fun lt!51615 () (_ BitVec 64))

(declare-fun lt!51625 () (_ BitVec 64))

(assert (=> b!34797 (= e!23018 (= (_1!1821 lt!51616) (withMovedBitIndex!0 (_2!1821 lt!51616) (bvsub lt!51615 lt!51625))))))

(assert (=> b!34797 (or (= (bvand lt!51615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51615 lt!51625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34797 (= lt!51625 (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730))))))

(assert (=> b!34797 (= lt!51615 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(assert (= (and d!10074 c!2342) b!34794))

(assert (= (and d!10074 (not c!2342)) b!34795))

(assert (= (and d!10074 res!29723) b!34793))

(assert (= (and b!34793 res!29721) b!34796))

(assert (= (and b!34796 res!29722) b!34797))

(declare-fun m!52077 () Bool)

(assert (=> b!34793 m!52077))

(assert (=> d!10074 m!52045))

(assert (=> d!10074 m!51237))

(declare-fun m!52079 () Bool)

(assert (=> d!10074 m!52079))

(declare-fun m!52081 () Bool)

(assert (=> d!10074 m!52081))

(declare-fun m!52083 () Bool)

(assert (=> d!10074 m!52083))

(assert (=> d!10074 m!51247))

(declare-fun m!52085 () Bool)

(assert (=> d!10074 m!52085))

(assert (=> d!10074 m!52055))

(declare-fun m!52087 () Bool)

(assert (=> d!10074 m!52087))

(declare-fun m!52089 () Bool)

(assert (=> d!10074 m!52089))

(assert (=> d!10074 m!51249))

(declare-fun m!52091 () Bool)

(assert (=> b!34796 m!52091))

(assert (=> b!34794 m!51251))

(declare-fun m!52093 () Bool)

(assert (=> b!34794 m!52093))

(declare-fun m!52095 () Bool)

(assert (=> b!34794 m!52095))

(declare-fun m!52097 () Bool)

(assert (=> b!34797 m!52097))

(assert (=> b!34797 m!51245))

(assert (=> b!34797 m!51251))

(assert (=> b!34365 d!10074))

(declare-fun d!10076 () Bool)

(assert (=> d!10076 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!51634 () Unit!2549)

(assert (=> d!10076 (= lt!51634 (choose!9 thiss!1379 (buf!1163 (_2!1820 lt!50730)) (bvsub to!314 i!635) (BitStream!1457 (buf!1163 (_2!1820 lt!50730)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(assert (=> d!10076 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1163 (_2!1820 lt!50730)) (bvsub to!314 i!635)) lt!51634)))

(declare-fun bs!2741 () Bool)

(assert (= bs!2741 d!10076))

(assert (=> bs!2741 m!51221))

(declare-fun m!52099 () Bool)

(assert (=> bs!2741 m!52099))

(assert (=> b!34365 d!10076))

(declare-fun d!10078 () Bool)

(assert (=> d!10078 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!50725)))

(declare-fun lt!51635 () Unit!2549)

(assert (=> d!10078 (= lt!51635 (choose!9 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!50730)) lt!50725 (BitStream!1457 (buf!1163 (_2!1820 lt!50730)) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732)))))))

(assert (=> d!10078 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1820 lt!50732) (buf!1163 (_2!1820 lt!50730)) lt!50725) lt!51635)))

(declare-fun bs!2742 () Bool)

(assert (= bs!2742 d!10078))

(assert (=> bs!2742 m!51217))

(declare-fun m!52101 () Bool)

(assert (=> bs!2742 m!52101))

(assert (=> b!34365 d!10078))

(declare-fun d!10080 () Bool)

(declare-fun size!840 (List!429) Int)

(assert (=> d!10080 (= (length!155 lt!50724) (size!840 lt!50724))))

(declare-fun bs!2743 () Bool)

(assert (= bs!2743 d!10080))

(declare-fun m!52103 () Bool)

(assert (=> bs!2743 m!52103))

(assert (=> b!34355 d!10080))

(declare-fun d!10082 () Bool)

(declare-fun res!29725 () Bool)

(declare-fun e!23020 () Bool)

(assert (=> d!10082 (=> (not res!29725) (not e!23020))))

(assert (=> d!10082 (= res!29725 (= (size!835 (buf!1163 thiss!1379)) (size!835 (buf!1163 thiss!1379))))))

(assert (=> d!10082 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23020)))

(declare-fun b!34798 () Bool)

(declare-fun res!29726 () Bool)

(assert (=> b!34798 (=> (not res!29726) (not e!23020))))

(assert (=> b!34798 (= res!29726 (bvsle (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)) (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(declare-fun b!34799 () Bool)

(declare-fun e!23021 () Bool)

(assert (=> b!34799 (= e!23020 e!23021)))

(declare-fun res!29724 () Bool)

(assert (=> b!34799 (=> res!29724 e!23021)))

(assert (=> b!34799 (= res!29724 (= (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34800 () Bool)

(assert (=> b!34800 (= e!23021 (arrayBitRangesEq!0 (buf!1163 thiss!1379) (buf!1163 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(assert (= (and d!10082 res!29725) b!34798))

(assert (= (and b!34798 res!29726) b!34799))

(assert (= (and b!34799 (not res!29724)) b!34800))

(assert (=> b!34798 m!51251))

(assert (=> b!34798 m!51251))

(assert (=> b!34800 m!51251))

(assert (=> b!34800 m!51251))

(declare-fun m!52105 () Bool)

(assert (=> b!34800 m!52105))

(assert (=> b!34366 d!10082))

(declare-fun d!10084 () Bool)

(assert (=> d!10084 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!51638 () Unit!2549)

(declare-fun choose!11 (BitStream!1456) Unit!2549)

(assert (=> d!10084 (= lt!51638 (choose!11 thiss!1379))))

(assert (=> d!10084 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!51638)))

(declare-fun bs!2745 () Bool)

(assert (= bs!2745 d!10084))

(assert (=> bs!2745 m!51247))

(declare-fun m!52107 () Bool)

(assert (=> bs!2745 m!52107))

(assert (=> b!34366 d!10084))

(declare-fun d!10086 () Bool)

(declare-fun e!23026 () Bool)

(assert (=> d!10086 e!23026))

(declare-fun res!29731 () Bool)

(assert (=> d!10086 (=> (not res!29731) (not e!23026))))

(declare-fun lt!51731 () (_ BitVec 64))

(declare-fun lt!51727 () (_ BitVec 64))

(declare-fun lt!51732 () (_ BitVec 64))

(assert (=> d!10086 (= res!29731 (= lt!51727 (bvsub lt!51732 lt!51731)))))

(assert (=> d!10086 (or (= (bvand lt!51732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51731 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51732 lt!51731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10086 (= lt!51731 (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379))))))

(declare-fun lt!51729 () (_ BitVec 64))

(declare-fun lt!51728 () (_ BitVec 64))

(assert (=> d!10086 (= lt!51732 (bvmul lt!51729 lt!51728))))

(assert (=> d!10086 (or (= lt!51729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51728 (bvsdiv (bvmul lt!51729 lt!51728) lt!51729)))))

(assert (=> d!10086 (= lt!51728 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10086 (= lt!51729 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))))))

(assert (=> d!10086 (= lt!51727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2536 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2531 thiss!1379))))))

(assert (=> d!10086 (invariant!0 (currentBit!2531 thiss!1379) (currentByte!2536 thiss!1379) (size!835 (buf!1163 thiss!1379)))))

(assert (=> d!10086 (= (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)) lt!51727)))

(declare-fun b!34809 () Bool)

(declare-fun res!29732 () Bool)

(assert (=> b!34809 (=> (not res!29732) (not e!23026))))

(assert (=> b!34809 (= res!29732 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51727))))

(declare-fun b!34810 () Bool)

(declare-fun lt!51730 () (_ BitVec 64))

(assert (=> b!34810 (= e!23026 (bvsle lt!51727 (bvmul lt!51730 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34810 (or (= lt!51730 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51730 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51730)))))

(assert (=> b!34810 (= lt!51730 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))))))

(assert (= (and d!10086 res!29731) b!34809))

(assert (= (and b!34809 res!29732) b!34810))

(declare-fun m!52109 () Bool)

(assert (=> d!10086 m!52109))

(declare-fun m!52111 () Bool)

(assert (=> d!10086 m!52111))

(assert (=> b!34366 d!10086))

(declare-fun d!10088 () Bool)

(declare-fun e!23029 () Bool)

(assert (=> d!10088 e!23029))

(declare-fun res!29735 () Bool)

(assert (=> d!10088 (=> (not res!29735) (not e!23029))))

(declare-fun lt!51742 () (_ BitVec 64))

(declare-fun lt!51741 () (_ BitVec 64))

(declare-fun lt!51737 () (_ BitVec 64))

(assert (=> d!10088 (= res!29735 (= lt!51737 (bvsub lt!51742 lt!51741)))))

(assert (=> d!10088 (or (= (bvand lt!51742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51742 lt!51741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10088 (= lt!51741 (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732)))))))

(declare-fun lt!51739 () (_ BitVec 64))

(declare-fun lt!51738 () (_ BitVec 64))

(assert (=> d!10088 (= lt!51742 (bvmul lt!51739 lt!51738))))

(assert (=> d!10088 (or (= lt!51739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51738 (bvsdiv (bvmul lt!51739 lt!51738) lt!51739)))))

(assert (=> d!10088 (= lt!51738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10088 (= lt!51739 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))))))

(assert (=> d!10088 (= lt!51737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732)))))))

(assert (=> d!10088 (invariant!0 (currentBit!2531 (_2!1820 lt!50732)) (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50732))))))

(assert (=> d!10088 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732))) lt!51737)))

(declare-fun b!34811 () Bool)

(declare-fun res!29736 () Bool)

(assert (=> b!34811 (=> (not res!29736) (not e!23029))))

(assert (=> b!34811 (= res!29736 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51737))))

(declare-fun b!34812 () Bool)

(declare-fun lt!51740 () (_ BitVec 64))

(assert (=> b!34812 (= e!23029 (bvsle lt!51737 (bvmul lt!51740 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34812 (or (= lt!51740 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51740 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51740)))))

(assert (=> b!34812 (= lt!51740 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))))))

(assert (= (and d!10088 res!29735) b!34811))

(assert (= (and b!34811 res!29736) b!34812))

(declare-fun m!52113 () Bool)

(assert (=> d!10088 m!52113))

(assert (=> d!10088 m!51223))

(assert (=> b!34351 d!10088))

(declare-fun d!10090 () Bool)

(assert (=> d!10090 (= (invariant!0 (currentBit!2531 (_2!1820 lt!50732)) (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50730)))) (and (bvsge (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (bvslt (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000001000) (bvsge (currentByte!2536 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50730)))) (and (= (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (= (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50730))))))))))

(assert (=> b!34362 d!10090))

(declare-fun d!10092 () Bool)

(assert (=> d!10092 (= (array_inv!781 srcBuffer!2) (bvsge (size!835 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7070 d!10092))

(declare-fun d!10094 () Bool)

(assert (=> d!10094 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2531 thiss!1379) (currentByte!2536 thiss!1379) (size!835 (buf!1163 thiss!1379))))))

(declare-fun bs!2746 () Bool)

(assert (= bs!2746 d!10094))

(assert (=> bs!2746 m!52111))

(assert (=> start!7070 d!10094))

(declare-fun d!10096 () Bool)

(assert (=> d!10096 (= (invariant!0 (currentBit!2531 (_2!1820 lt!50730)) (currentByte!2536 (_2!1820 lt!50730)) (size!835 (buf!1163 (_2!1820 lt!50730)))) (and (bvsge (currentBit!2531 (_2!1820 lt!50730)) #b00000000000000000000000000000000) (bvslt (currentBit!2531 (_2!1820 lt!50730)) #b00000000000000000000000000001000) (bvsge (currentByte!2536 (_2!1820 lt!50730)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2536 (_2!1820 lt!50730)) (size!835 (buf!1163 (_2!1820 lt!50730)))) (and (= (currentBit!2531 (_2!1820 lt!50730)) #b00000000000000000000000000000000) (= (currentByte!2536 (_2!1820 lt!50730)) (size!835 (buf!1163 (_2!1820 lt!50730))))))))))

(assert (=> b!34352 d!10096))

(declare-fun d!10098 () Bool)

(assert (=> d!10098 (= (head!266 (byteArrayBitContentToList!0 (_2!1820 lt!50730) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!544 (byteArrayBitContentToList!0 (_2!1820 lt!50730) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!34363 d!10098))

(declare-fun d!10100 () Bool)

(declare-fun c!2347 () Bool)

(assert (=> d!10100 (= c!2347 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23034 () List!429)

(assert (=> d!10100 (= (byteArrayBitContentToList!0 (_2!1820 lt!50730) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23034)))

(declare-fun b!34829 () Bool)

(assert (=> b!34829 (= e!23034 Nil!426)))

(declare-fun b!34830 () Bool)

(assert (=> b!34830 (= e!23034 (Cons!425 (not (= (bvand ((_ sign_extend 24) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1820 lt!50730) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10100 c!2347) b!34829))

(assert (= (and d!10100 (not c!2347)) b!34830))

(assert (=> b!34830 m!51281))

(declare-fun m!52115 () Bool)

(assert (=> b!34830 m!52115))

(declare-fun m!52117 () Bool)

(assert (=> b!34830 m!52117))

(assert (=> b!34363 d!10100))

(declare-fun d!10102 () Bool)

(assert (=> d!10102 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2747 () Bool)

(assert (= bs!2747 d!10102))

(assert (=> bs!2747 m!51281))

(assert (=> bs!2747 m!52115))

(assert (=> b!34363 d!10102))

(declare-fun d!10104 () Bool)

(assert (=> d!10104 (= (invariant!0 (currentBit!2531 (_2!1820 lt!50732)) (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50732)))) (and (bvsge (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (bvslt (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000001000) (bvsge (currentByte!2536 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50732)))) (and (= (currentBit!2531 (_2!1820 lt!50732)) #b00000000000000000000000000000000) (= (currentByte!2536 (_2!1820 lt!50732)) (size!835 (buf!1163 (_2!1820 lt!50732))))))))))

(assert (=> b!34353 d!10104))

(declare-fun d!10106 () Bool)

(assert (=> d!10106 (= (bitAt!0 (buf!1163 (_2!1820 lt!50732)) lt!50714) (not (= (bvand ((_ sign_extend 24) (select (arr!1313 (buf!1163 (_2!1820 lt!50732))) ((_ extract 31 0) (bvsdiv lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2748 () Bool)

(assert (= bs!2748 d!10106))

(declare-fun m!52119 () Bool)

(assert (=> bs!2748 m!52119))

(declare-fun m!52121 () Bool)

(assert (=> bs!2748 m!52121))

(assert (=> b!34359 d!10106))

(declare-fun d!10108 () Bool)

(declare-fun res!29754 () Bool)

(declare-fun e!23038 () Bool)

(assert (=> d!10108 (=> (not res!29754) (not e!23038))))

(assert (=> d!10108 (= res!29754 (= (size!835 (buf!1163 thiss!1379)) (size!835 (buf!1163 (_2!1820 lt!50732)))))))

(assert (=> d!10108 (= (isPrefixOf!0 thiss!1379 (_2!1820 lt!50732)) e!23038)))

(declare-fun b!34839 () Bool)

(declare-fun res!29755 () Bool)

(assert (=> b!34839 (=> (not res!29755) (not e!23038))))

(assert (=> b!34839 (= res!29755 (bvsle (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)) (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50732))) (currentByte!2536 (_2!1820 lt!50732)) (currentBit!2531 (_2!1820 lt!50732)))))))

(declare-fun b!34840 () Bool)

(declare-fun e!23039 () Bool)

(assert (=> b!34840 (= e!23038 e!23039)))

(declare-fun res!29753 () Bool)

(assert (=> b!34840 (=> res!29753 e!23039)))

(assert (=> b!34840 (= res!29753 (= (size!835 (buf!1163 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34841 () Bool)

(assert (=> b!34841 (= e!23039 (arrayBitRangesEq!0 (buf!1163 thiss!1379) (buf!1163 (_2!1820 lt!50732)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379))))))

(assert (= (and d!10108 res!29754) b!34839))

(assert (= (and b!34839 res!29755) b!34840))

(assert (= (and b!34840 (not res!29753)) b!34841))

(assert (=> b!34839 m!51251))

(assert (=> b!34839 m!51291))

(assert (=> b!34841 m!51251))

(assert (=> b!34841 m!51251))

(declare-fun m!52157 () Bool)

(assert (=> b!34841 m!52157))

(assert (=> b!34360 d!10108))

(declare-fun d!10110 () Bool)

(assert (=> d!10110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) lt!50725) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732)))) lt!50725))))

(declare-fun bs!2749 () Bool)

(assert (= bs!2749 d!10110))

(assert (=> bs!2749 m!52113))

(assert (=> b!34360 d!10110))

(declare-fun d!10112 () Bool)

(declare-fun e!23046 () Bool)

(assert (=> d!10112 e!23046))

(declare-fun res!29764 () Bool)

(assert (=> d!10112 (=> (not res!29764) (not e!23046))))

(assert (=> d!10112 (= res!29764 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51817 () Unit!2549)

(declare-fun choose!27 (BitStream!1456 BitStream!1456 (_ BitVec 64) (_ BitVec 64)) Unit!2549)

(assert (=> d!10112 (= lt!51817 (choose!27 thiss!1379 (_2!1820 lt!50732) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10112 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1820 lt!50732) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51817)))

(declare-fun b!34852 () Bool)

(assert (=> b!34852 (= e!23046 (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50732)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50732))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50732))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10112 res!29764) b!34852))

(declare-fun m!52237 () Bool)

(assert (=> d!10112 m!52237))

(declare-fun m!52239 () Bool)

(assert (=> b!34852 m!52239))

(assert (=> b!34360 d!10112))

(declare-fun b!34879 () Bool)

(declare-fun e!23064 () Bool)

(declare-fun e!23061 () Bool)

(assert (=> b!34879 (= e!23064 e!23061)))

(declare-fun res!29790 () Bool)

(assert (=> b!34879 (=> (not res!29790) (not e!23061))))

(declare-fun lt!51861 () tuple2!3466)

(declare-datatypes ((tuple2!3500 0))(
  ( (tuple2!3501 (_1!1837 BitStream!1456) (_2!1837 Bool)) )
))
(declare-fun lt!51856 () tuple2!3500)

(declare-fun lt!51857 () Bool)

(assert (=> b!34879 (= res!29790 (and (= (_2!1837 lt!51856) lt!51857) (= (_1!1837 lt!51856) (_2!1820 lt!51861))))))

(declare-fun readBitPure!0 (BitStream!1456) tuple2!3500)

(declare-fun readerFrom!0 (BitStream!1456 (_ BitVec 32) (_ BitVec 32)) BitStream!1456)

(assert (=> b!34879 (= lt!51856 (readBitPure!0 (readerFrom!0 (_2!1820 lt!51861) (currentBit!2531 thiss!1379) (currentByte!2536 thiss!1379))))))

(declare-fun b!34880 () Bool)

(declare-fun e!23063 () Bool)

(declare-fun e!23062 () Bool)

(assert (=> b!34880 (= e!23063 e!23062)))

(declare-fun res!29789 () Bool)

(assert (=> b!34880 (=> (not res!29789) (not e!23062))))

(declare-fun lt!51860 () tuple2!3500)

(declare-fun lt!51851 () (_ BitVec 8))

(declare-fun lt!51853 () tuple2!3466)

(assert (=> b!34880 (= res!29789 (and (= (_2!1837 lt!51860) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!51851)) #b00000000000000000000000000000000))) (= (_1!1837 lt!51860) (_2!1820 lt!51853))))))

(declare-fun lt!51858 () tuple2!3490)

(declare-fun lt!51855 () BitStream!1456)

(assert (=> b!34880 (= lt!51858 (readBits!0 lt!51855 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34880 (= lt!51860 (readBitPure!0 lt!51855))))

(assert (=> b!34880 (= lt!51855 (readerFrom!0 (_2!1820 lt!51853) (currentBit!2531 thiss!1379) (currentByte!2536 thiss!1379)))))

(declare-fun b!34882 () Bool)

(assert (=> b!34882 (= e!23061 (= (bitIndex!0 (size!835 (buf!1163 (_1!1837 lt!51856))) (currentByte!2536 (_1!1837 lt!51856)) (currentBit!2531 (_1!1837 lt!51856))) (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51861))) (currentByte!2536 (_2!1820 lt!51861)) (currentBit!2531 (_2!1820 lt!51861)))))))

(declare-fun b!34883 () Bool)

(declare-fun res!29787 () Bool)

(assert (=> b!34883 (=> (not res!29787) (not e!23063))))

(assert (=> b!34883 (= res!29787 (isPrefixOf!0 thiss!1379 (_2!1820 lt!51853)))))

(declare-fun b!34884 () Bool)

(declare-fun res!29788 () Bool)

(assert (=> b!34884 (=> (not res!29788) (not e!23064))))

(assert (=> b!34884 (= res!29788 (isPrefixOf!0 thiss!1379 (_2!1820 lt!51861)))))

(declare-fun b!34885 () Bool)

(assert (=> b!34885 (= e!23062 (= (bitIndex!0 (size!835 (buf!1163 (_1!1837 lt!51860))) (currentByte!2536 (_1!1837 lt!51860)) (currentBit!2531 (_1!1837 lt!51860))) (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51853))) (currentByte!2536 (_2!1820 lt!51853)) (currentBit!2531 (_2!1820 lt!51853)))))))

(declare-fun b!34886 () Bool)

(declare-fun res!29786 () Bool)

(assert (=> b!34886 (=> (not res!29786) (not e!23064))))

(assert (=> b!34886 (= res!29786 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51861))) (currentByte!2536 (_2!1820 lt!51861)) (currentBit!2531 (_2!1820 lt!51861))) (bvadd (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34881 () Bool)

(declare-fun res!29785 () Bool)

(assert (=> b!34881 (=> (not res!29785) (not e!23063))))

(declare-fun lt!51852 () (_ BitVec 64))

(declare-fun lt!51854 () (_ BitVec 64))

(assert (=> b!34881 (= res!29785 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!51853))) (currentByte!2536 (_2!1820 lt!51853)) (currentBit!2531 (_2!1820 lt!51853))) (bvadd lt!51852 lt!51854)))))

(assert (=> b!34881 (or (not (= (bvand lt!51852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51854 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!51852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!51852 lt!51854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34881 (= lt!51854 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34881 (= lt!51852 (bitIndex!0 (size!835 (buf!1163 thiss!1379)) (currentByte!2536 thiss!1379) (currentBit!2531 thiss!1379)))))

(declare-fun d!10124 () Bool)

(assert (=> d!10124 e!23063))

(declare-fun res!29784 () Bool)

(assert (=> d!10124 (=> (not res!29784) (not e!23063))))

(assert (=> d!10124 (= res!29784 (= (size!835 (buf!1163 (_2!1820 lt!51853))) (size!835 (buf!1163 thiss!1379))))))

(declare-fun lt!51862 () array!1883)

(assert (=> d!10124 (= lt!51851 (select (arr!1313 lt!51862) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10124 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!835 lt!51862)))))

(assert (=> d!10124 (= lt!51862 (array!1884 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!51859 () tuple2!3466)

(assert (=> d!10124 (= lt!51853 (tuple2!3467 (_1!1820 lt!51859) (_2!1820 lt!51859)))))

(assert (=> d!10124 (= lt!51859 lt!51861)))

(assert (=> d!10124 e!23064))

(declare-fun res!29791 () Bool)

(assert (=> d!10124 (=> (not res!29791) (not e!23064))))

(assert (=> d!10124 (= res!29791 (= (size!835 (buf!1163 thiss!1379)) (size!835 (buf!1163 (_2!1820 lt!51861)))))))

(declare-fun appendBit!0 (BitStream!1456 Bool) tuple2!3466)

(assert (=> d!10124 (= lt!51861 (appendBit!0 thiss!1379 lt!51857))))

(assert (=> d!10124 (= lt!51857 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10124 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10124 (= (appendBitFromByte!0 thiss!1379 (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!51853)))

(assert (= (and d!10124 res!29791) b!34886))

(assert (= (and b!34886 res!29786) b!34884))

(assert (= (and b!34884 res!29788) b!34879))

(assert (= (and b!34879 res!29790) b!34882))

(assert (= (and d!10124 res!29784) b!34881))

(assert (= (and b!34881 res!29785) b!34883))

(assert (= (and b!34883 res!29787) b!34880))

(assert (= (and b!34880 res!29789) b!34885))

(declare-fun m!52255 () Bool)

(assert (=> d!10124 m!52255))

(declare-fun m!52257 () Bool)

(assert (=> d!10124 m!52257))

(assert (=> d!10124 m!52115))

(declare-fun m!52259 () Bool)

(assert (=> b!34880 m!52259))

(declare-fun m!52261 () Bool)

(assert (=> b!34880 m!52261))

(declare-fun m!52263 () Bool)

(assert (=> b!34880 m!52263))

(declare-fun m!52265 () Bool)

(assert (=> b!34886 m!52265))

(assert (=> b!34886 m!51251))

(declare-fun m!52267 () Bool)

(assert (=> b!34885 m!52267))

(declare-fun m!52269 () Bool)

(assert (=> b!34885 m!52269))

(declare-fun m!52271 () Bool)

(assert (=> b!34884 m!52271))

(declare-fun m!52273 () Bool)

(assert (=> b!34883 m!52273))

(declare-fun m!52275 () Bool)

(assert (=> b!34879 m!52275))

(assert (=> b!34879 m!52275))

(declare-fun m!52277 () Bool)

(assert (=> b!34879 m!52277))

(declare-fun m!52279 () Bool)

(assert (=> b!34882 m!52279))

(assert (=> b!34882 m!52265))

(assert (=> b!34881 m!52269))

(assert (=> b!34881 m!51251))

(assert (=> b!34360 d!10124))

(declare-fun d!10134 () Bool)

(declare-fun e!23065 () Bool)

(assert (=> d!10134 e!23065))

(declare-fun res!29792 () Bool)

(assert (=> d!10134 (=> (not res!29792) (not e!23065))))

(declare-fun lt!51868 () (_ BitVec 64))

(declare-fun lt!51863 () (_ BitVec 64))

(declare-fun lt!51867 () (_ BitVec 64))

(assert (=> d!10134 (= res!29792 (= lt!51863 (bvsub lt!51868 lt!51867)))))

(assert (=> d!10134 (or (= (bvand lt!51868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!51868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!51868 lt!51867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10134 (= lt!51867 (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))) ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50730))) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50730)))))))

(declare-fun lt!51865 () (_ BitVec 64))

(declare-fun lt!51864 () (_ BitVec 64))

(assert (=> d!10134 (= lt!51868 (bvmul lt!51865 lt!51864))))

(assert (=> d!10134 (or (= lt!51865 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!51864 (bvsdiv (bvmul lt!51865 lt!51864) lt!51865)))))

(assert (=> d!10134 (= lt!51864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10134 (= lt!51865 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))))))

(assert (=> d!10134 (= lt!51863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2536 (_2!1820 lt!50730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2531 (_2!1820 lt!50730)))))))

(assert (=> d!10134 (invariant!0 (currentBit!2531 (_2!1820 lt!50730)) (currentByte!2536 (_2!1820 lt!50730)) (size!835 (buf!1163 (_2!1820 lt!50730))))))

(assert (=> d!10134 (= (bitIndex!0 (size!835 (buf!1163 (_2!1820 lt!50730))) (currentByte!2536 (_2!1820 lt!50730)) (currentBit!2531 (_2!1820 lt!50730))) lt!51863)))

(declare-fun b!34887 () Bool)

(declare-fun res!29793 () Bool)

(assert (=> b!34887 (=> (not res!29793) (not e!23065))))

(assert (=> b!34887 (= res!29793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!51863))))

(declare-fun b!34888 () Bool)

(declare-fun lt!51866 () (_ BitVec 64))

(assert (=> b!34888 (= e!23065 (bvsle lt!51863 (bvmul lt!51866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34888 (or (= lt!51866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!51866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!51866)))))

(assert (=> b!34888 (= lt!51866 ((_ sign_extend 32) (size!835 (buf!1163 (_2!1820 lt!50730)))))))

(assert (= (and d!10134 res!29792) b!34887))

(assert (= (and b!34887 res!29793) b!34888))

(declare-fun m!52281 () Bool)

(assert (=> d!10134 m!52281))

(assert (=> d!10134 m!51225))

(assert (=> b!34350 d!10134))

(declare-fun d!10136 () Bool)

(assert (=> d!10136 (= (bitAt!0 (buf!1163 (_2!1820 lt!50730)) lt!50714) (not (= (bvand ((_ sign_extend 24) (select (arr!1313 (buf!1163 (_2!1820 lt!50730))) ((_ extract 31 0) (bvsdiv lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2751 () Bool)

(assert (= bs!2751 d!10136))

(declare-fun m!52283 () Bool)

(assert (=> bs!2751 m!52283))

(assert (=> bs!2751 m!52121))

(assert (=> b!34361 d!10136))

(declare-fun d!10138 () Bool)

(assert (=> d!10138 (= (bitAt!0 (buf!1163 (_2!1820 lt!50732)) lt!50714) (bitAt!0 (buf!1163 (_2!1820 lt!50730)) lt!50714))))

(declare-fun lt!51871 () Unit!2549)

(declare-fun choose!31 (array!1883 array!1883 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2549)

(assert (=> d!10138 (= lt!51871 (choose!31 (buf!1163 (_2!1820 lt!50732)) (buf!1163 (_2!1820 lt!50730)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50714 lt!50721))))

(assert (=> d!10138 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50721))))

(assert (=> d!10138 (= (arrayBitRangesEqImpliesEq!0 (buf!1163 (_2!1820 lt!50732)) (buf!1163 (_2!1820 lt!50730)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50714 lt!50721) lt!51871)))

(declare-fun bs!2752 () Bool)

(assert (= bs!2752 d!10138))

(assert (=> bs!2752 m!51289))

(assert (=> bs!2752 m!51227))

(declare-fun m!52285 () Bool)

(assert (=> bs!2752 m!52285))

(assert (=> b!34361 d!10138))

(declare-fun d!10140 () Bool)

(assert (=> d!10140 (= (head!266 lt!50724) (h!544 lt!50724))))

(assert (=> b!34356 d!10140))

(declare-fun d!10142 () Bool)

(assert (=> d!10142 (= (head!266 (byteArrayBitContentToList!0 (_2!1820 lt!50732) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!544 (byteArrayBitContentToList!0 (_2!1820 lt!50732) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34367 d!10142))

(declare-fun d!10144 () Bool)

(declare-fun c!2353 () Bool)

(assert (=> d!10144 (= c!2353 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23066 () List!429)

(assert (=> d!10144 (= (byteArrayBitContentToList!0 (_2!1820 lt!50732) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23066)))

(declare-fun b!34889 () Bool)

(assert (=> b!34889 (= e!23066 Nil!426)))

(declare-fun b!34890 () Bool)

(assert (=> b!34890 (= e!23066 (Cons!425 (not (= (bvand ((_ sign_extend 24) (select (arr!1313 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1820 lt!50732) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10144 c!2353) b!34889))

(assert (= (and d!10144 (not c!2353)) b!34890))

(assert (=> b!34890 m!51281))

(assert (=> b!34890 m!52115))

(declare-fun m!52287 () Bool)

(assert (=> b!34890 m!52287))

(assert (=> b!34367 d!10144))

(declare-fun d!10146 () Bool)

(assert (=> d!10146 (= (head!266 (bitStreamReadBitsIntoList!0 (_2!1820 lt!50732) (_1!1821 lt!50717) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!544 (bitStreamReadBitsIntoList!0 (_2!1820 lt!50732) (_1!1821 lt!50717) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!34367 d!10146))

(declare-fun b!34894 () Bool)

(declare-fun e!23067 () Bool)

(declare-fun lt!51874 () List!429)

(assert (=> b!34894 (= e!23067 (> (length!155 lt!51874) 0))))

(declare-fun b!34892 () Bool)

(declare-fun e!23068 () tuple2!3496)

(declare-fun lt!51873 () (_ BitVec 64))

(declare-fun lt!51872 () tuple2!3498)

(assert (=> b!34892 (= e!23068 (tuple2!3497 (Cons!425 (_1!1836 lt!51872) (bitStreamReadBitsIntoList!0 (_2!1820 lt!50732) (_2!1836 lt!51872) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!51873))) (_2!1836 lt!51872)))))

(assert (=> b!34892 (= lt!51872 (readBit!0 (_1!1821 lt!50717)))))

(assert (=> b!34892 (= lt!51873 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34893 () Bool)

(assert (=> b!34893 (= e!23067 (isEmpty!95 lt!51874))))

(declare-fun d!10148 () Bool)

(assert (=> d!10148 e!23067))

(declare-fun c!2354 () Bool)

(assert (=> d!10148 (= c!2354 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10148 (= lt!51874 (_1!1835 e!23068))))

(declare-fun c!2355 () Bool)

(assert (=> d!10148 (= c!2355 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10148 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10148 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!50732) (_1!1821 lt!50717) #b0000000000000000000000000000000000000000000000000000000000000001) lt!51874)))

(declare-fun b!34891 () Bool)

(assert (=> b!34891 (= e!23068 (tuple2!3497 Nil!426 (_1!1821 lt!50717)))))

(assert (= (and d!10148 c!2355) b!34891))

(assert (= (and d!10148 (not c!2355)) b!34892))

(assert (= (and d!10148 c!2354) b!34893))

(assert (= (and d!10148 (not c!2354)) b!34894))

(declare-fun m!52289 () Bool)

(assert (=> b!34894 m!52289))

(declare-fun m!52291 () Bool)

(assert (=> b!34892 m!52291))

(declare-fun m!52293 () Bool)

(assert (=> b!34892 m!52293))

(declare-fun m!52295 () Bool)

(assert (=> b!34893 m!52295))

(assert (=> b!34367 d!10148))

(declare-fun d!10150 () Bool)

(assert (=> d!10150 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!835 (buf!1163 thiss!1379))) ((_ sign_extend 32) (currentByte!2536 thiss!1379)) ((_ sign_extend 32) (currentBit!2531 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2753 () Bool)

(assert (= bs!2753 d!10150))

(assert (=> bs!2753 m!52109))

(assert (=> b!34357 d!10150))

(declare-fun d!10152 () Bool)

(assert (=> d!10152 (= (bitAt!0 (buf!1163 (_1!1821 lt!50722)) lt!50714) (not (= (bvand ((_ sign_extend 24) (select (arr!1313 (buf!1163 (_1!1821 lt!50722))) ((_ extract 31 0) (bvsdiv lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2754 () Bool)

(assert (= bs!2754 d!10152))

(declare-fun m!52297 () Bool)

(assert (=> bs!2754 m!52297))

(assert (=> bs!2754 m!52121))

(assert (=> b!34358 d!10152))

(declare-fun d!10154 () Bool)

(assert (=> d!10154 (= (bitAt!0 (buf!1163 (_1!1821 lt!50728)) lt!50714) (not (= (bvand ((_ sign_extend 24) (select (arr!1313 (buf!1163 (_1!1821 lt!50728))) ((_ extract 31 0) (bvsdiv lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!50714 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2755 () Bool)

(assert (= bs!2755 d!10154))

(declare-fun m!52299 () Bool)

(assert (=> bs!2755 m!52299))

(assert (=> bs!2755 m!52121))

(assert (=> b!34358 d!10154))

(declare-fun d!10156 () Bool)

(assert (=> d!10156 (= (tail!146 lt!50724) (t!1179 lt!50724))))

(assert (=> b!34369 d!10156))

(declare-fun d!10158 () Bool)

(declare-fun e!23071 () Bool)

(assert (=> d!10158 e!23071))

(declare-fun res!29796 () Bool)

(assert (=> d!10158 (=> (not res!29796) (not e!23071))))

(declare-fun lt!51880 () (_ BitVec 64))

(assert (=> d!10158 (= res!29796 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!51880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!51880) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10158 (= lt!51880 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!51879 () Unit!2549)

(declare-fun choose!42 (BitStream!1456 BitStream!1456 BitStream!1456 BitStream!1456 (_ BitVec 64) List!429) Unit!2549)

(assert (=> d!10158 (= lt!51879 (choose!42 (_2!1820 lt!50730) (_2!1820 lt!50730) (_1!1821 lt!50728) (_1!1821 lt!50722) (bvsub to!314 i!635) lt!50724))))

(assert (=> d!10158 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10158 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1820 lt!50730) (_2!1820 lt!50730) (_1!1821 lt!50728) (_1!1821 lt!50722) (bvsub to!314 i!635) lt!50724) lt!51879)))

(declare-fun b!34897 () Bool)

(assert (=> b!34897 (= e!23071 (= (bitStreamReadBitsIntoList!0 (_2!1820 lt!50730) (_1!1821 lt!50722) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!146 lt!50724)))))

(assert (= (and d!10158 res!29796) b!34897))

(declare-fun m!52301 () Bool)

(assert (=> d!10158 m!52301))

(declare-fun m!52303 () Bool)

(assert (=> b!34897 m!52303))

(assert (=> b!34897 m!51273))

(assert (=> b!34369 d!10158))

(push 1)

(assert (not b!34769))

(assert (not b!34796))

(assert (not b!34892))

(assert (not d!9918))

(assert (not d!10150))

(assert (not b!34792))

(assert (not b!34756))

(assert (not b!34787))

(assert (not b!34788))

(assert (not b!34782))

(assert (not d!10134))

(assert (not b!34880))

(assert (not b!34741))

(assert (not b!34794))

(assert (not d!9926))

(assert (not b!34755))

(assert (not d!10084))

(assert (not b!34881))

(assert (not b!34841))

(assert (not d!10074))

(assert (not d!10064))

(assert (not b!34742))

(assert (not d!10110))

(assert (not d!10076))

(assert (not d!10124))

(assert (not b!34793))

(assert (not b!34737))

(assert (not d!10056))

(assert (not b!34890))

(assert (not b!34852))

(assert (not b!34790))

(assert (not b!34882))

(assert (not d!10094))

(assert (not d!10088))

(assert (not b!34768))

(assert (not b!34784))

(assert (not b!34797))

(assert (not b!34758))

(assert (not b!34781))

(assert (not b!34785))

(assert (not b!34783))

(assert (not bm!430))

(assert (not b!34743))

(assert (not d!10158))

(assert (not b!34766))

(assert (not b!34791))

(assert (not b!34798))

(assert (not b!34759))

(assert (not b!34885))

(assert (not b!34884))

(assert (not b!34839))

(assert (not b!34879))

(assert (not b!34893))

(assert (not b!34894))

(assert (not d!10070))

(assert (not d!10078))

(assert (not d!9916))

(assert (not d!10062))

(assert (not b!34744))

(assert (not b!34830))

(assert (not d!10112))

(assert (not d!10080))

(assert (not b!34883))

(assert (not b!34886))

(assert (not b!34771))

(assert (not d!10068))

(assert (not d!10138))

(assert (not b!34800))

(assert (not d!10086))

(assert (not b!34740))

(assert (not b!34897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

