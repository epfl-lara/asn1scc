; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6892 () Bool)

(assert start!6892)

(declare-fun b!32650 () Bool)

(declare-fun e!21593 () Bool)

(declare-fun e!21600 () Bool)

(assert (=> b!32650 (= e!21593 e!21600)))

(declare-fun res!27908 () Bool)

(assert (=> b!32650 (=> res!27908 e!21600)))

(declare-datatypes ((array!1828 0))(
  ( (array!1829 (arr!1281 (Array (_ BitVec 32) (_ BitVec 8))) (size!806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1404 0))(
  ( (BitStream!1405 (buf!1134 array!1828) (currentByte!2501 (_ BitVec 32)) (currentBit!2496 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2467 0))(
  ( (Unit!2468) )
))
(declare-datatypes ((tuple2!3338 0))(
  ( (tuple2!3339 (_1!1756 Unit!2467) (_2!1756 BitStream!1404)) )
))
(declare-fun lt!48318 () tuple2!3338)

(declare-fun lt!48323 () tuple2!3338)

(declare-fun isPrefixOf!0 (BitStream!1404 BitStream!1404) Bool)

(assert (=> b!32650 (= res!27908 (not (isPrefixOf!0 (_2!1756 lt!48318) (_2!1756 lt!48323))))))

(declare-fun thiss!1379 () BitStream!1404)

(assert (=> b!32650 (isPrefixOf!0 thiss!1379 (_2!1756 lt!48323))))

(declare-fun lt!48312 () Unit!2467)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1404 BitStream!1404 BitStream!1404) Unit!2467)

(assert (=> b!32650 (= lt!48312 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1756 lt!48318) (_2!1756 lt!48323)))))

(declare-fun srcBuffer!2 () array!1828)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1404 array!1828 (_ BitVec 64) (_ BitVec 64)) tuple2!3338)

(assert (=> b!32650 (= lt!48323 (appendBitsMSBFirstLoop!0 (_2!1756 lt!48318) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21598 () Bool)

(assert (=> b!32650 e!21598))

(declare-fun res!27917 () Bool)

(assert (=> b!32650 (=> (not res!27917) (not e!21598))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32650 (= res!27917 (validate_offset_bits!1 ((_ sign_extend 32) (size!806 (buf!1134 (_2!1756 lt!48318)))) ((_ sign_extend 32) (currentByte!2501 thiss!1379)) ((_ sign_extend 32) (currentBit!2496 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48327 () Unit!2467)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1404 array!1828 (_ BitVec 64)) Unit!2467)

(assert (=> b!32650 (= lt!48327 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1134 (_2!1756 lt!48318)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3340 0))(
  ( (tuple2!3341 (_1!1757 BitStream!1404) (_2!1757 BitStream!1404)) )
))
(declare-fun lt!48325 () tuple2!3340)

(declare-fun reader!0 (BitStream!1404 BitStream!1404) tuple2!3340)

(assert (=> b!32650 (= lt!48325 (reader!0 thiss!1379 (_2!1756 lt!48318)))))

(declare-fun b!32651 () Bool)

(declare-fun e!21596 () Bool)

(assert (=> b!32651 (= e!21596 true)))

(declare-datatypes ((List!403 0))(
  ( (Nil!400) (Cons!399 (h!518 Bool) (t!1153 List!403)) )
))
(declare-fun lt!48322 () List!403)

(declare-fun lt!48313 () List!403)

(declare-fun tail!120 (List!403) List!403)

(assert (=> b!32651 (= lt!48322 (tail!120 lt!48313))))

(declare-fun lt!48316 () tuple2!3340)

(declare-fun lt!48315 () tuple2!3340)

(declare-fun lt!48326 () Unit!2467)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1404 BitStream!1404 BitStream!1404 BitStream!1404 (_ BitVec 64) List!403) Unit!2467)

(assert (=> b!32651 (= lt!48326 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1756 lt!48323) (_2!1756 lt!48323) (_1!1757 lt!48315) (_1!1757 lt!48316) (bvsub to!314 i!635) lt!48313))))

(declare-fun b!32652 () Bool)

(declare-fun e!21591 () Bool)

(declare-fun e!21594 () Bool)

(assert (=> b!32652 (= e!21591 e!21594)))

(declare-fun res!27918 () Bool)

(assert (=> b!32652 (=> res!27918 e!21594)))

(assert (=> b!32652 (= res!27918 (not (= (size!806 (buf!1134 (_2!1756 lt!48318))) (size!806 (buf!1134 (_2!1756 lt!48323))))))))

(declare-fun e!21590 () Bool)

(assert (=> b!32652 e!21590))

(declare-fun res!27906 () Bool)

(assert (=> b!32652 (=> (not res!27906) (not e!21590))))

(assert (=> b!32652 (= res!27906 (= (size!806 (buf!1134 (_2!1756 lt!48323))) (size!806 (buf!1134 thiss!1379))))))

(declare-fun b!32653 () Bool)

(declare-fun res!27907 () Bool)

(assert (=> b!32653 (=> res!27907 e!21591)))

(assert (=> b!32653 (= res!27907 (not (= (size!806 (buf!1134 thiss!1379)) (size!806 (buf!1134 (_2!1756 lt!48323))))))))

(declare-fun b!32654 () Bool)

(declare-fun res!27910 () Bool)

(assert (=> b!32654 (=> res!27910 e!21591)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32654 (= res!27910 (not (invariant!0 (currentBit!2496 (_2!1756 lt!48323)) (currentByte!2501 (_2!1756 lt!48323)) (size!806 (buf!1134 (_2!1756 lt!48323))))))))

(declare-fun b!32655 () Bool)

(declare-fun e!21599 () Bool)

(assert (=> b!32655 (= e!21599 e!21593)))

(declare-fun res!27916 () Bool)

(assert (=> b!32655 (=> res!27916 e!21593)))

(assert (=> b!32655 (= res!27916 (not (isPrefixOf!0 thiss!1379 (_2!1756 lt!48318))))))

(declare-fun lt!48321 () (_ BitVec 64))

(assert (=> b!32655 (validate_offset_bits!1 ((_ sign_extend 32) (size!806 (buf!1134 (_2!1756 lt!48318)))) ((_ sign_extend 32) (currentByte!2501 (_2!1756 lt!48318))) ((_ sign_extend 32) (currentBit!2496 (_2!1756 lt!48318))) lt!48321)))

(assert (=> b!32655 (= lt!48321 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48317 () Unit!2467)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1404 BitStream!1404 (_ BitVec 64) (_ BitVec 64)) Unit!2467)

(assert (=> b!32655 (= lt!48317 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1756 lt!48318) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1404 (_ BitVec 8) (_ BitVec 32)) tuple2!3338)

(assert (=> b!32655 (= lt!48318 (appendBitFromByte!0 thiss!1379 (select (arr!1281 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32656 () Bool)

(assert (=> b!32656 (= e!21594 e!21596)))

(declare-fun res!27905 () Bool)

(assert (=> b!32656 (=> res!27905 e!21596)))

(assert (=> b!32656 (= res!27905 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1404 BitStream!1404 (_ BitVec 64)) List!403)

(assert (=> b!32656 (= lt!48322 (bitStreamReadBitsIntoList!0 (_2!1756 lt!48323) (_1!1757 lt!48316) lt!48321))))

(assert (=> b!32656 (= lt!48313 (bitStreamReadBitsIntoList!0 (_2!1756 lt!48323) (_1!1757 lt!48315) (bvsub to!314 i!635)))))

(assert (=> b!32656 (validate_offset_bits!1 ((_ sign_extend 32) (size!806 (buf!1134 (_2!1756 lt!48323)))) ((_ sign_extend 32) (currentByte!2501 (_2!1756 lt!48318))) ((_ sign_extend 32) (currentBit!2496 (_2!1756 lt!48318))) lt!48321)))

(declare-fun lt!48320 () Unit!2467)

(assert (=> b!32656 (= lt!48320 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1756 lt!48318) (buf!1134 (_2!1756 lt!48323)) lt!48321))))

(assert (=> b!32656 (= lt!48316 (reader!0 (_2!1756 lt!48318) (_2!1756 lt!48323)))))

(assert (=> b!32656 (validate_offset_bits!1 ((_ sign_extend 32) (size!806 (buf!1134 (_2!1756 lt!48323)))) ((_ sign_extend 32) (currentByte!2501 thiss!1379)) ((_ sign_extend 32) (currentBit!2496 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48314 () Unit!2467)

(assert (=> b!32656 (= lt!48314 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1134 (_2!1756 lt!48323)) (bvsub to!314 i!635)))))

(assert (=> b!32656 (= lt!48315 (reader!0 thiss!1379 (_2!1756 lt!48323)))))

(declare-fun b!32657 () Bool)

(declare-fun res!27912 () Bool)

(assert (=> b!32657 (=> res!27912 e!21594)))

(assert (=> b!32657 (= res!27912 (not (invariant!0 (currentBit!2496 (_2!1756 lt!48318)) (currentByte!2501 (_2!1756 lt!48318)) (size!806 (buf!1134 (_2!1756 lt!48323))))))))

(declare-fun b!32658 () Bool)

(declare-fun res!27911 () Bool)

(assert (=> b!32658 (=> res!27911 e!21596)))

(declare-fun length!129 (List!403) Int)

(assert (=> b!32658 (= res!27911 (<= (length!129 lt!48313) 0))))

(declare-fun res!27904 () Bool)

(declare-fun e!21601 () Bool)

(assert (=> start!6892 (=> (not res!27904) (not e!21601))))

(assert (=> start!6892 (= res!27904 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!806 srcBuffer!2))))))))

(assert (=> start!6892 e!21601))

(assert (=> start!6892 true))

(declare-fun array_inv!755 (array!1828) Bool)

(assert (=> start!6892 (array_inv!755 srcBuffer!2)))

(declare-fun e!21597 () Bool)

(declare-fun inv!12 (BitStream!1404) Bool)

(assert (=> start!6892 (and (inv!12 thiss!1379) e!21597)))

(declare-fun b!32659 () Bool)

(assert (=> b!32659 (= e!21600 e!21591)))

(declare-fun res!27909 () Bool)

(assert (=> b!32659 (=> res!27909 e!21591)))

(declare-fun lt!48328 () (_ BitVec 64))

(declare-fun lt!48319 () (_ BitVec 64))

(assert (=> b!32659 (= res!27909 (not (= lt!48328 (bvsub (bvadd lt!48319 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32659 (= lt!48328 (bitIndex!0 (size!806 (buf!1134 (_2!1756 lt!48323))) (currentByte!2501 (_2!1756 lt!48323)) (currentBit!2496 (_2!1756 lt!48323))))))

(declare-fun b!32660 () Bool)

(declare-fun res!27915 () Bool)

(assert (=> b!32660 (=> (not res!27915) (not e!21601))))

(assert (=> b!32660 (= res!27915 (validate_offset_bits!1 ((_ sign_extend 32) (size!806 (buf!1134 thiss!1379))) ((_ sign_extend 32) (currentByte!2501 thiss!1379)) ((_ sign_extend 32) (currentBit!2496 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32661 () Bool)

(declare-fun res!27913 () Bool)

(assert (=> b!32661 (=> res!27913 e!21594)))

(assert (=> b!32661 (= res!27913 (not (invariant!0 (currentBit!2496 (_2!1756 lt!48318)) (currentByte!2501 (_2!1756 lt!48318)) (size!806 (buf!1134 (_2!1756 lt!48318))))))))

(declare-fun b!32662 () Bool)

(assert (=> b!32662 (= e!21590 (= lt!48328 (bvsub (bvsub (bvadd (bitIndex!0 (size!806 (buf!1134 (_2!1756 lt!48318))) (currentByte!2501 (_2!1756 lt!48318)) (currentBit!2496 (_2!1756 lt!48318))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32663 () Bool)

(declare-fun head!240 (List!403) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1404 array!1828 (_ BitVec 64) (_ BitVec 64)) List!403)

(assert (=> b!32663 (= e!21598 (= (head!240 (byteArrayBitContentToList!0 (_2!1756 lt!48318) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!240 (bitStreamReadBitsIntoList!0 (_2!1756 lt!48318) (_1!1757 lt!48325) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32664 () Bool)

(assert (=> b!32664 (= e!21601 (not e!21599))))

(declare-fun res!27914 () Bool)

(assert (=> b!32664 (=> res!27914 e!21599)))

(assert (=> b!32664 (= res!27914 (bvsge i!635 to!314))))

(assert (=> b!32664 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48324 () Unit!2467)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1404) Unit!2467)

(assert (=> b!32664 (= lt!48324 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!32664 (= lt!48319 (bitIndex!0 (size!806 (buf!1134 thiss!1379)) (currentByte!2501 thiss!1379) (currentBit!2496 thiss!1379)))))

(declare-fun b!32665 () Bool)

(assert (=> b!32665 (= e!21597 (array_inv!755 (buf!1134 thiss!1379)))))

(assert (= (and start!6892 res!27904) b!32660))

(assert (= (and b!32660 res!27915) b!32664))

(assert (= (and b!32664 (not res!27914)) b!32655))

(assert (= (and b!32655 (not res!27916)) b!32650))

(assert (= (and b!32650 res!27917) b!32663))

(assert (= (and b!32650 (not res!27908)) b!32659))

(assert (= (and b!32659 (not res!27909)) b!32654))

(assert (= (and b!32654 (not res!27910)) b!32653))

(assert (= (and b!32653 (not res!27907)) b!32652))

(assert (= (and b!32652 res!27906) b!32662))

(assert (= (and b!32652 (not res!27918)) b!32661))

(assert (= (and b!32661 (not res!27913)) b!32657))

(assert (= (and b!32657 (not res!27912)) b!32656))

(assert (= (and b!32656 (not res!27905)) b!32658))

(assert (= (and b!32658 (not res!27911)) b!32651))

(assert (= start!6892 b!32665))

(declare-fun m!48315 () Bool)

(assert (=> b!32656 m!48315))

(declare-fun m!48317 () Bool)

(assert (=> b!32656 m!48317))

(declare-fun m!48319 () Bool)

(assert (=> b!32656 m!48319))

(declare-fun m!48321 () Bool)

(assert (=> b!32656 m!48321))

(declare-fun m!48323 () Bool)

(assert (=> b!32656 m!48323))

(declare-fun m!48325 () Bool)

(assert (=> b!32656 m!48325))

(declare-fun m!48327 () Bool)

(assert (=> b!32656 m!48327))

(declare-fun m!48329 () Bool)

(assert (=> b!32656 m!48329))

(declare-fun m!48331 () Bool)

(assert (=> b!32654 m!48331))

(declare-fun m!48333 () Bool)

(assert (=> b!32663 m!48333))

(assert (=> b!32663 m!48333))

(declare-fun m!48335 () Bool)

(assert (=> b!32663 m!48335))

(declare-fun m!48337 () Bool)

(assert (=> b!32663 m!48337))

(assert (=> b!32663 m!48337))

(declare-fun m!48339 () Bool)

(assert (=> b!32663 m!48339))

(declare-fun m!48341 () Bool)

(assert (=> b!32655 m!48341))

(declare-fun m!48343 () Bool)

(assert (=> b!32655 m!48343))

(assert (=> b!32655 m!48341))

(declare-fun m!48345 () Bool)

(assert (=> b!32655 m!48345))

(declare-fun m!48347 () Bool)

(assert (=> b!32655 m!48347))

(declare-fun m!48349 () Bool)

(assert (=> b!32655 m!48349))

(declare-fun m!48351 () Bool)

(assert (=> b!32658 m!48351))

(declare-fun m!48353 () Bool)

(assert (=> b!32650 m!48353))

(declare-fun m!48355 () Bool)

(assert (=> b!32650 m!48355))

(declare-fun m!48357 () Bool)

(assert (=> b!32650 m!48357))

(declare-fun m!48359 () Bool)

(assert (=> b!32650 m!48359))

(declare-fun m!48361 () Bool)

(assert (=> b!32650 m!48361))

(declare-fun m!48363 () Bool)

(assert (=> b!32650 m!48363))

(declare-fun m!48365 () Bool)

(assert (=> b!32650 m!48365))

(declare-fun m!48367 () Bool)

(assert (=> b!32661 m!48367))

(declare-fun m!48369 () Bool)

(assert (=> b!32657 m!48369))

(declare-fun m!48371 () Bool)

(assert (=> b!32664 m!48371))

(declare-fun m!48373 () Bool)

(assert (=> b!32664 m!48373))

(declare-fun m!48375 () Bool)

(assert (=> b!32664 m!48375))

(declare-fun m!48377 () Bool)

(assert (=> b!32662 m!48377))

(declare-fun m!48379 () Bool)

(assert (=> b!32660 m!48379))

(declare-fun m!48381 () Bool)

(assert (=> b!32651 m!48381))

(declare-fun m!48383 () Bool)

(assert (=> b!32651 m!48383))

(declare-fun m!48385 () Bool)

(assert (=> b!32665 m!48385))

(declare-fun m!48387 () Bool)

(assert (=> start!6892 m!48387))

(declare-fun m!48389 () Bool)

(assert (=> start!6892 m!48389))

(declare-fun m!48391 () Bool)

(assert (=> b!32659 m!48391))

(check-sat (not b!32656) (not b!32655) (not b!32659) (not start!6892) (not b!32650) (not b!32664) (not b!32662) (not b!32654) (not b!32661) (not b!32660) (not b!32651) (not b!32658) (not b!32663) (not b!32657) (not b!32665))
