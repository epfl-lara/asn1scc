; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8292 () Bool)

(assert start!8292)

(declare-fun b!41466 () Bool)

(declare-fun e!27517 () Bool)

(declare-fun e!27516 () Bool)

(assert (=> b!41466 (= e!27517 (not e!27516))))

(declare-fun res!35271 () Bool)

(assert (=> b!41466 (=> res!35271 e!27516)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!62644 () (_ BitVec 64))

(assert (=> b!41466 (= res!35271 (or (bvslt i!635 to!314) (not (= lt!62644 (bvsub (bvadd lt!62644 to!314) i!635)))))))

(declare-datatypes ((array!2095 0))(
  ( (array!2096 (arr!1446 (Array (_ BitVec 32) (_ BitVec 8))) (size!947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1638 0))(
  ( (BitStream!1639 (buf!1275 array!2095) (currentByte!2718 (_ BitVec 32)) (currentBit!2713 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1638)

(declare-fun isPrefixOf!0 (BitStream!1638 BitStream!1638) Bool)

(assert (=> b!41466 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2942 0))(
  ( (Unit!2943) )
))
(declare-fun lt!62643 () Unit!2942)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1638) Unit!2942)

(assert (=> b!41466 (= lt!62643 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41466 (= lt!62644 (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)))))

(declare-fun res!35273 () Bool)

(assert (=> start!8292 (=> (not res!35273) (not e!27517))))

(declare-fun srcBuffer!2 () array!2095)

(assert (=> start!8292 (= res!35273 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!947 srcBuffer!2))))))))

(assert (=> start!8292 e!27517))

(assert (=> start!8292 true))

(declare-fun array_inv!872 (array!2095) Bool)

(assert (=> start!8292 (array_inv!872 srcBuffer!2)))

(declare-fun e!27519 () Bool)

(declare-fun inv!12 (BitStream!1638) Bool)

(assert (=> start!8292 (and (inv!12 thiss!1379) e!27519)))

(declare-fun b!41467 () Bool)

(declare-fun res!35272 () Bool)

(assert (=> b!41467 (=> res!35272 e!27516)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41467 (= res!35272 (not (invariant!0 (currentBit!2713 thiss!1379) (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379)))))))

(declare-datatypes ((tuple2!4010 0))(
  ( (tuple2!4011 (_1!2092 array!2095) (_2!2092 BitStream!1638)) )
))
(declare-fun lt!62642 () tuple2!4010)

(declare-fun b!41468 () Bool)

(assert (=> b!41468 (= e!27516 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635))) (bvsle (bvsub to!314 i!635) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!947 (_1!2092 lt!62642)))))))))

(declare-fun readBits!0 (BitStream!1638 (_ BitVec 64)) tuple2!4010)

(declare-datatypes ((tuple2!4012 0))(
  ( (tuple2!4013 (_1!2093 BitStream!1638) (_2!2093 BitStream!1638)) )
))
(declare-fun reader!0 (BitStream!1638 BitStream!1638) tuple2!4012)

(assert (=> b!41468 (= lt!62642 (readBits!0 (_1!2093 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41469 () Bool)

(declare-fun res!35274 () Bool)

(assert (=> b!41469 (=> (not res!35274) (not e!27517))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41469 (= res!35274 (validate_offset_bits!1 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))) ((_ sign_extend 32) (currentByte!2718 thiss!1379)) ((_ sign_extend 32) (currentBit!2713 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41470 () Bool)

(assert (=> b!41470 (= e!27519 (array_inv!872 (buf!1275 thiss!1379)))))

(assert (= (and start!8292 res!35273) b!41469))

(assert (= (and b!41469 res!35274) b!41466))

(assert (= (and b!41466 (not res!35271)) b!41467))

(assert (= (and b!41467 (not res!35272)) b!41468))

(assert (= start!8292 b!41470))

(declare-fun m!63207 () Bool)

(assert (=> b!41466 m!63207))

(declare-fun m!63209 () Bool)

(assert (=> b!41466 m!63209))

(declare-fun m!63211 () Bool)

(assert (=> b!41466 m!63211))

(declare-fun m!63213 () Bool)

(assert (=> start!8292 m!63213))

(declare-fun m!63215 () Bool)

(assert (=> start!8292 m!63215))

(declare-fun m!63217 () Bool)

(assert (=> b!41470 m!63217))

(declare-fun m!63219 () Bool)

(assert (=> b!41469 m!63219))

(declare-fun m!63221 () Bool)

(assert (=> b!41468 m!63221))

(declare-fun m!63223 () Bool)

(assert (=> b!41468 m!63223))

(declare-fun m!63225 () Bool)

(assert (=> b!41467 m!63225))

(check-sat (not start!8292) (not b!41469) (not b!41468) (not b!41466) (not b!41467) (not b!41470))
(check-sat)
(get-model)

(declare-fun d!12106 () Bool)

(declare-fun e!27546 () Bool)

(assert (=> d!12106 e!27546))

(declare-fun res!35313 () Bool)

(assert (=> d!12106 (=> (not res!35313) (not e!27546))))

(declare-fun lt!62692 () tuple2!4010)

(assert (=> d!12106 (= res!35313 (= (buf!1275 (_2!2092 lt!62692)) (buf!1275 (_1!2093 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!160 0))(
  ( (tuple3!161 (_1!2096 Unit!2942) (_2!2096 BitStream!1638) (_3!87 array!2095)) )
))
(declare-fun lt!62690 () tuple3!160)

(assert (=> d!12106 (= lt!62692 (tuple2!4011 (_3!87 lt!62690) (_2!2096 lt!62690)))))

(declare-fun readBitsLoop!0 (BitStream!1638 (_ BitVec 64) array!2095 (_ BitVec 64) (_ BitVec 64)) tuple3!160)

(assert (=> d!12106 (= lt!62690 (readBitsLoop!0 (_1!2093 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!2096 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12106 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12106 (= (readBits!0 (_1!2093 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!62692)))

(declare-fun b!41509 () Bool)

(declare-fun res!35312 () Bool)

(assert (=> b!41509 (=> (not res!35312) (not e!27546))))

(declare-fun lt!62688 () (_ BitVec 64))

(assert (=> b!41509 (= res!35312 (= (bvadd lt!62688 (bvsub to!314 i!635)) (bitIndex!0 (size!947 (buf!1275 (_2!2092 lt!62692))) (currentByte!2718 (_2!2092 lt!62692)) (currentBit!2713 (_2!2092 lt!62692)))))))

(assert (=> b!41509 (or (not (= (bvand lt!62688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!62688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!62688 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41509 (= lt!62688 (bitIndex!0 (size!947 (buf!1275 (_1!2093 (reader!0 thiss!1379 thiss!1379)))) (currentByte!2718 (_1!2093 (reader!0 thiss!1379 thiss!1379))) (currentBit!2713 (_1!2093 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!41510 () Bool)

(declare-fun res!35311 () Bool)

(assert (=> b!41510 (=> (not res!35311) (not e!27546))))

(assert (=> b!41510 (= res!35311 (invariant!0 (currentBit!2713 (_2!2092 lt!62692)) (currentByte!2718 (_2!2092 lt!62692)) (size!947 (buf!1275 (_2!2092 lt!62692)))))))

(declare-fun b!41511 () Bool)

(declare-fun res!35310 () Bool)

(assert (=> b!41511 (=> (not res!35310) (not e!27546))))

(assert (=> b!41511 (= res!35310 (bvsle (currentByte!2718 (_1!2093 (reader!0 thiss!1379 thiss!1379))) (currentByte!2718 (_2!2092 lt!62692))))))

(declare-fun b!41512 () Bool)

(declare-datatypes ((List!486 0))(
  ( (Nil!483) (Cons!482 (h!601 Bool) (t!1236 List!486)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1638 array!2095 (_ BitVec 64) (_ BitVec 64)) List!486)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1638 BitStream!1638 (_ BitVec 64)) List!486)

(assert (=> b!41512 (= e!27546 (= (byteArrayBitContentToList!0 (_2!2092 lt!62692) (_1!2092 lt!62692) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2092 lt!62692) (_1!2093 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!41513 () Bool)

(declare-fun res!35314 () Bool)

(assert (=> b!41513 (=> (not res!35314) (not e!27546))))

(declare-fun lt!62695 () (_ BitVec 64))

(assert (=> b!41513 (= res!35314 (= (size!947 (_1!2092 lt!62692)) ((_ extract 31 0) lt!62695)))))

(assert (=> b!41513 (and (bvslt lt!62695 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!62695 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!62693 () (_ BitVec 64))

(declare-fun lt!62689 () (_ BitVec 64))

(assert (=> b!41513 (= lt!62695 (bvsdiv lt!62693 lt!62689))))

(assert (=> b!41513 (and (not (= lt!62689 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!62693 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!62689 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!41513 (= lt!62689 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!62687 () (_ BitVec 64))

(declare-fun lt!62691 () (_ BitVec 64))

(assert (=> b!41513 (= lt!62693 (bvsub lt!62687 lt!62691))))

(assert (=> b!41513 (or (= (bvand lt!62687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62687 lt!62691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41513 (= lt!62691 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!62694 () (_ BitVec 64))

(assert (=> b!41513 (= lt!62687 (bvadd (bvsub to!314 i!635) lt!62694))))

(assert (=> b!41513 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62694 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!62694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41513 (= lt!62694 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!12106 res!35313) b!41509))

(assert (= (and b!41509 res!35312) b!41510))

(assert (= (and b!41510 res!35311) b!41513))

(assert (= (and b!41513 res!35314) b!41511))

(assert (= (and b!41511 res!35310) b!41512))

(declare-fun m!63253 () Bool)

(assert (=> d!12106 m!63253))

(declare-fun m!63255 () Bool)

(assert (=> b!41509 m!63255))

(declare-fun m!63257 () Bool)

(assert (=> b!41509 m!63257))

(declare-fun m!63259 () Bool)

(assert (=> b!41510 m!63259))

(declare-fun m!63261 () Bool)

(assert (=> b!41512 m!63261))

(declare-fun m!63263 () Bool)

(assert (=> b!41512 m!63263))

(assert (=> b!41468 d!12106))

(declare-fun d!12122 () Bool)

(declare-fun e!27556 () Bool)

(assert (=> d!12122 e!27556))

(declare-fun res!35340 () Bool)

(assert (=> d!12122 (=> (not res!35340) (not e!27556))))

(declare-fun lt!62788 () tuple2!4012)

(assert (=> d!12122 (= res!35340 (isPrefixOf!0 (_1!2093 lt!62788) (_2!2093 lt!62788)))))

(declare-fun lt!62786 () BitStream!1638)

(assert (=> d!12122 (= lt!62788 (tuple2!4013 lt!62786 thiss!1379))))

(declare-fun lt!62783 () Unit!2942)

(declare-fun lt!62787 () Unit!2942)

(assert (=> d!12122 (= lt!62783 lt!62787)))

(assert (=> d!12122 (isPrefixOf!0 lt!62786 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1638 BitStream!1638 BitStream!1638) Unit!2942)

(assert (=> d!12122 (= lt!62787 (lemmaIsPrefixTransitive!0 lt!62786 thiss!1379 thiss!1379))))

(declare-fun lt!62780 () Unit!2942)

(declare-fun lt!62779 () Unit!2942)

(assert (=> d!12122 (= lt!62780 lt!62779)))

(assert (=> d!12122 (isPrefixOf!0 lt!62786 thiss!1379)))

(assert (=> d!12122 (= lt!62779 (lemmaIsPrefixTransitive!0 lt!62786 thiss!1379 thiss!1379))))

(declare-fun lt!62777 () Unit!2942)

(declare-fun e!27555 () Unit!2942)

(assert (=> d!12122 (= lt!62777 e!27555)))

(declare-fun c!2763 () Bool)

(assert (=> d!12122 (= c!2763 (not (= (size!947 (buf!1275 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62784 () Unit!2942)

(declare-fun lt!62773 () Unit!2942)

(assert (=> d!12122 (= lt!62784 lt!62773)))

(assert (=> d!12122 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12122 (= lt!62773 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62785 () Unit!2942)

(declare-fun lt!62781 () Unit!2942)

(assert (=> d!12122 (= lt!62785 lt!62781)))

(assert (=> d!12122 (= lt!62781 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62771 () Unit!2942)

(declare-fun lt!62778 () Unit!2942)

(assert (=> d!12122 (= lt!62771 lt!62778)))

(assert (=> d!12122 (isPrefixOf!0 lt!62786 lt!62786)))

(assert (=> d!12122 (= lt!62778 (lemmaIsPrefixRefl!0 lt!62786))))

(declare-fun lt!62769 () Unit!2942)

(declare-fun lt!62772 () Unit!2942)

(assert (=> d!12122 (= lt!62769 lt!62772)))

(assert (=> d!12122 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12122 (= lt!62772 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12122 (= lt!62786 (BitStream!1639 (buf!1275 thiss!1379) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)))))

(assert (=> d!12122 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12122 (= (reader!0 thiss!1379 thiss!1379) lt!62788)))

(declare-fun b!41541 () Bool)

(declare-fun res!35338 () Bool)

(assert (=> b!41541 (=> (not res!35338) (not e!27556))))

(assert (=> b!41541 (= res!35338 (isPrefixOf!0 (_1!2093 lt!62788) thiss!1379))))

(declare-fun lt!62776 () (_ BitVec 64))

(declare-fun b!41542 () Bool)

(declare-fun lt!62770 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1638 (_ BitVec 64)) BitStream!1638)

(assert (=> b!41542 (= e!27556 (= (_1!2093 lt!62788) (withMovedBitIndex!0 (_2!2093 lt!62788) (bvsub lt!62776 lt!62770))))))

(assert (=> b!41542 (or (= (bvand lt!62776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62770 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62776 lt!62770) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41542 (= lt!62770 (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)))))

(assert (=> b!41542 (= lt!62776 (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)))))

(declare-fun b!41543 () Bool)

(declare-fun res!35339 () Bool)

(assert (=> b!41543 (=> (not res!35339) (not e!27556))))

(assert (=> b!41543 (= res!35339 (isPrefixOf!0 (_2!2093 lt!62788) thiss!1379))))

(declare-fun b!41544 () Bool)

(declare-fun lt!62775 () Unit!2942)

(assert (=> b!41544 (= e!27555 lt!62775)))

(declare-fun lt!62782 () (_ BitVec 64))

(assert (=> b!41544 (= lt!62782 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62774 () (_ BitVec 64))

(assert (=> b!41544 (= lt!62774 (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2095 array!2095 (_ BitVec 64) (_ BitVec 64)) Unit!2942)

(assert (=> b!41544 (= lt!62775 (arrayBitRangesEqSymmetric!0 (buf!1275 thiss!1379) (buf!1275 thiss!1379) lt!62782 lt!62774))))

(declare-fun arrayBitRangesEq!0 (array!2095 array!2095 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41544 (arrayBitRangesEq!0 (buf!1275 thiss!1379) (buf!1275 thiss!1379) lt!62782 lt!62774)))

(declare-fun b!41545 () Bool)

(declare-fun Unit!2946 () Unit!2942)

(assert (=> b!41545 (= e!27555 Unit!2946)))

(assert (= (and d!12122 c!2763) b!41544))

(assert (= (and d!12122 (not c!2763)) b!41545))

(assert (= (and d!12122 res!35340) b!41541))

(assert (= (and b!41541 res!35338) b!41543))

(assert (= (and b!41543 res!35339) b!41542))

(declare-fun m!63279 () Bool)

(assert (=> b!41543 m!63279))

(declare-fun m!63281 () Bool)

(assert (=> b!41541 m!63281))

(assert (=> b!41544 m!63211))

(declare-fun m!63283 () Bool)

(assert (=> b!41544 m!63283))

(declare-fun m!63285 () Bool)

(assert (=> b!41544 m!63285))

(declare-fun m!63287 () Bool)

(assert (=> d!12122 m!63287))

(declare-fun m!63289 () Bool)

(assert (=> d!12122 m!63289))

(declare-fun m!63291 () Bool)

(assert (=> d!12122 m!63291))

(assert (=> d!12122 m!63209))

(assert (=> d!12122 m!63209))

(declare-fun m!63293 () Bool)

(assert (=> d!12122 m!63293))

(assert (=> d!12122 m!63207))

(assert (=> d!12122 m!63207))

(assert (=> d!12122 m!63207))

(assert (=> d!12122 m!63287))

(declare-fun m!63295 () Bool)

(assert (=> d!12122 m!63295))

(declare-fun m!63297 () Bool)

(assert (=> b!41542 m!63297))

(assert (=> b!41542 m!63211))

(assert (=> b!41542 m!63211))

(assert (=> b!41468 d!12122))

(declare-fun d!12132 () Bool)

(assert (=> d!12132 (= (invariant!0 (currentBit!2713 thiss!1379) (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379))) (and (bvsge (currentBit!2713 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2713 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2718 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379))) (and (= (currentBit!2713 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379)))))))))

(assert (=> b!41467 d!12132))

(declare-fun d!12134 () Bool)

(assert (=> d!12134 (= (array_inv!872 srcBuffer!2) (bvsge (size!947 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8292 d!12134))

(declare-fun d!12136 () Bool)

(assert (=> d!12136 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2713 thiss!1379) (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379))))))

(declare-fun bs!3248 () Bool)

(assert (= bs!3248 d!12136))

(assert (=> bs!3248 m!63225))

(assert (=> start!8292 d!12136))

(declare-fun d!12138 () Bool)

(declare-fun res!35348 () Bool)

(declare-fun e!27561 () Bool)

(assert (=> d!12138 (=> (not res!35348) (not e!27561))))

(assert (=> d!12138 (= res!35348 (= (size!947 (buf!1275 thiss!1379)) (size!947 (buf!1275 thiss!1379))))))

(assert (=> d!12138 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27561)))

(declare-fun b!41552 () Bool)

(declare-fun res!35347 () Bool)

(assert (=> b!41552 (=> (not res!35347) (not e!27561))))

(assert (=> b!41552 (= res!35347 (bvsle (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)) (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379))))))

(declare-fun b!41553 () Bool)

(declare-fun e!27562 () Bool)

(assert (=> b!41553 (= e!27561 e!27562)))

(declare-fun res!35349 () Bool)

(assert (=> b!41553 (=> res!35349 e!27562)))

(assert (=> b!41553 (= res!35349 (= (size!947 (buf!1275 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41554 () Bool)

(assert (=> b!41554 (= e!27562 (arrayBitRangesEq!0 (buf!1275 thiss!1379) (buf!1275 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379))))))

(assert (= (and d!12138 res!35348) b!41552))

(assert (= (and b!41552 res!35347) b!41553))

(assert (= (and b!41553 (not res!35349)) b!41554))

(assert (=> b!41552 m!63211))

(assert (=> b!41552 m!63211))

(assert (=> b!41554 m!63211))

(assert (=> b!41554 m!63211))

(declare-fun m!63299 () Bool)

(assert (=> b!41554 m!63299))

(assert (=> b!41466 d!12138))

(declare-fun d!12140 () Bool)

(assert (=> d!12140 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62795 () Unit!2942)

(declare-fun choose!11 (BitStream!1638) Unit!2942)

(assert (=> d!12140 (= lt!62795 (choose!11 thiss!1379))))

(assert (=> d!12140 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62795)))

(declare-fun bs!3250 () Bool)

(assert (= bs!3250 d!12140))

(assert (=> bs!3250 m!63207))

(declare-fun m!63301 () Bool)

(assert (=> bs!3250 m!63301))

(assert (=> b!41466 d!12140))

(declare-fun d!12142 () Bool)

(declare-fun e!27574 () Bool)

(assert (=> d!12142 e!27574))

(declare-fun res!35379 () Bool)

(assert (=> d!12142 (=> (not res!35379) (not e!27574))))

(declare-fun lt!62893 () (_ BitVec 64))

(declare-fun lt!62894 () (_ BitVec 64))

(declare-fun lt!62895 () (_ BitVec 64))

(assert (=> d!12142 (= res!35379 (= lt!62893 (bvsub lt!62895 lt!62894)))))

(assert (=> d!12142 (or (= (bvand lt!62895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62895 lt!62894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12142 (= lt!62894 (remainingBits!0 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))) ((_ sign_extend 32) (currentByte!2718 thiss!1379)) ((_ sign_extend 32) (currentBit!2713 thiss!1379))))))

(declare-fun lt!62892 () (_ BitVec 64))

(declare-fun lt!62896 () (_ BitVec 64))

(assert (=> d!12142 (= lt!62895 (bvmul lt!62892 lt!62896))))

(assert (=> d!12142 (or (= lt!62892 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62896 (bvsdiv (bvmul lt!62892 lt!62896) lt!62892)))))

(assert (=> d!12142 (= lt!62896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12142 (= lt!62892 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))))))

(assert (=> d!12142 (= lt!62893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2718 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2713 thiss!1379))))))

(assert (=> d!12142 (invariant!0 (currentBit!2713 thiss!1379) (currentByte!2718 thiss!1379) (size!947 (buf!1275 thiss!1379)))))

(assert (=> d!12142 (= (bitIndex!0 (size!947 (buf!1275 thiss!1379)) (currentByte!2718 thiss!1379) (currentBit!2713 thiss!1379)) lt!62893)))

(declare-fun b!41589 () Bool)

(declare-fun res!35378 () Bool)

(assert (=> b!41589 (=> (not res!35378) (not e!27574))))

(assert (=> b!41589 (= res!35378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62893))))

(declare-fun b!41590 () Bool)

(declare-fun lt!62891 () (_ BitVec 64))

(assert (=> b!41590 (= e!27574 (bvsle lt!62893 (bvmul lt!62891 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41590 (or (= lt!62891 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62891 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62891)))))

(assert (=> b!41590 (= lt!62891 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))))))

(assert (= (and d!12142 res!35379) b!41589))

(assert (= (and b!41589 res!35378) b!41590))

(declare-fun m!63335 () Bool)

(assert (=> d!12142 m!63335))

(assert (=> d!12142 m!63225))

(assert (=> b!41466 d!12142))

(declare-fun d!12150 () Bool)

(assert (=> d!12150 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))) ((_ sign_extend 32) (currentByte!2718 thiss!1379)) ((_ sign_extend 32) (currentBit!2713 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!947 (buf!1275 thiss!1379))) ((_ sign_extend 32) (currentByte!2718 thiss!1379)) ((_ sign_extend 32) (currentBit!2713 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3251 () Bool)

(assert (= bs!3251 d!12150))

(assert (=> bs!3251 m!63335))

(assert (=> b!41469 d!12150))

(declare-fun d!12154 () Bool)

(assert (=> d!12154 (= (array_inv!872 (buf!1275 thiss!1379)) (bvsge (size!947 (buf!1275 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41470 d!12154))

(check-sat (not b!41543) (not b!41541) (not d!12106) (not d!12142) (not d!12122) (not d!12136) (not b!41542) (not b!41552) (not b!41512) (not b!41509) (not d!12150) (not b!41510) (not d!12140) (not b!41554) (not b!41544))
(check-sat)
