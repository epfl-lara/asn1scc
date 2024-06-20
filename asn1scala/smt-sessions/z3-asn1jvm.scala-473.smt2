; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14060 () Bool)

(assert start!14060)

(declare-fun b!71951 () Bool)

(declare-fun res!59319 () Bool)

(declare-fun e!46851 () Bool)

(assert (=> b!71951 (=> res!59319 e!46851)))

(declare-datatypes ((List!739 0))(
  ( (Nil!736) (Cons!735 (h!854 Bool) (t!1489 List!739)) )
))
(declare-fun lt!116318 () List!739)

(declare-fun lt!116320 () Bool)

(declare-fun head!558 (List!739) Bool)

(assert (=> b!71951 (= res!59319 (not (= (head!558 lt!116318) lt!116320)))))

(declare-fun b!71952 () Bool)

(declare-fun e!46853 () Bool)

(declare-fun e!46848 () Bool)

(assert (=> b!71952 (= e!46853 e!46848)))

(declare-fun res!59328 () Bool)

(assert (=> b!71952 (=> res!59328 e!46848)))

(declare-fun lt!116326 () Bool)

(declare-fun lt!116319 () Bool)

(assert (=> b!71952 (= res!59328 (not (= lt!116326 lt!116319)))))

(declare-datatypes ((array!2943 0))(
  ( (array!2944 (arr!1965 (Array (_ BitVec 32) (_ BitVec 8))) (size!1374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2328 0))(
  ( (BitStream!2329 (buf!1755 array!2943) (currentByte!3481 (_ BitVec 32)) (currentBit!3476 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4801 0))(
  ( (Unit!4802) )
))
(declare-datatypes ((tuple2!6216 0))(
  ( (tuple2!6217 (_1!3222 Unit!4801) (_2!3222 BitStream!2328)) )
))
(declare-fun lt!116324 () tuple2!6216)

(declare-fun lt!116321 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2943 (_ BitVec 64)) Bool)

(assert (=> b!71952 (= lt!116326 (bitAt!0 (buf!1755 (_2!3222 lt!116324)) lt!116321))))

(declare-fun b!71953 () Bool)

(declare-fun e!46849 () Bool)

(assert (=> b!71953 (= e!46849 true)))

(declare-datatypes ((tuple2!6218 0))(
  ( (tuple2!6219 (_1!3223 BitStream!2328) (_2!3223 Bool)) )
))
(declare-fun lt!116317 () tuple2!6218)

(declare-datatypes ((tuple2!6220 0))(
  ( (tuple2!6221 (_1!3224 BitStream!2328) (_2!3224 BitStream!2328)) )
))
(declare-fun lt!116338 () tuple2!6220)

(declare-fun readBitPure!0 (BitStream!2328) tuple2!6218)

(assert (=> b!71953 (= lt!116317 (readBitPure!0 (_1!3224 lt!116338)))))

(declare-fun b!71954 () Bool)

(declare-fun e!46846 () Bool)

(declare-fun e!46843 () Bool)

(assert (=> b!71954 (= e!46846 e!46843)))

(declare-fun res!59316 () Bool)

(assert (=> b!71954 (=> res!59316 e!46843)))

(declare-fun lt!116333 () tuple2!6216)

(assert (=> b!71954 (= res!59316 (not (= (size!1374 (buf!1755 (_2!3222 lt!116324))) (size!1374 (buf!1755 (_2!3222 lt!116333))))))))

(declare-fun lt!116336 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!116328 () (_ BitVec 64))

(assert (=> b!71954 (= lt!116336 (bvsub (bvsub (bvadd lt!116328 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!71954 (= lt!116328 (bitIndex!0 (size!1374 (buf!1755 (_2!3222 lt!116324))) (currentByte!3481 (_2!3222 lt!116324)) (currentBit!3476 (_2!3222 lt!116324))))))

(declare-fun thiss!1379 () BitStream!2328)

(assert (=> b!71954 (= (size!1374 (buf!1755 (_2!3222 lt!116333))) (size!1374 (buf!1755 thiss!1379)))))

(declare-fun b!71956 () Bool)

(declare-fun res!59311 () Bool)

(assert (=> b!71956 (=> res!59311 e!46846)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!71956 (= res!59311 (not (invariant!0 (currentBit!3476 (_2!3222 lt!116333)) (currentByte!3481 (_2!3222 lt!116333)) (size!1374 (buf!1755 (_2!3222 lt!116333))))))))

(declare-fun b!71957 () Bool)

(declare-fun e!46842 () Bool)

(assert (=> b!71957 (= e!46843 e!46842)))

(declare-fun res!59323 () Bool)

(assert (=> b!71957 (=> res!59323 e!46842)))

(assert (=> b!71957 (= res!59323 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!116316 () tuple2!6220)

(declare-fun lt!116334 () (_ BitVec 64))

(declare-fun lt!116327 () List!739)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2328 BitStream!2328 (_ BitVec 64)) List!739)

(assert (=> b!71957 (= lt!116327 (bitStreamReadBitsIntoList!0 (_2!3222 lt!116333) (_1!3224 lt!116316) lt!116334))))

(assert (=> b!71957 (= lt!116318 (bitStreamReadBitsIntoList!0 (_2!3222 lt!116333) (_1!3224 lt!116338) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71957 (validate_offset_bits!1 ((_ sign_extend 32) (size!1374 (buf!1755 (_2!3222 lt!116333)))) ((_ sign_extend 32) (currentByte!3481 (_2!3222 lt!116324))) ((_ sign_extend 32) (currentBit!3476 (_2!3222 lt!116324))) lt!116334)))

(declare-fun lt!116314 () Unit!4801)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2328 array!2943 (_ BitVec 64)) Unit!4801)

(assert (=> b!71957 (= lt!116314 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3222 lt!116324) (buf!1755 (_2!3222 lt!116333)) lt!116334))))

(declare-fun reader!0 (BitStream!2328 BitStream!2328) tuple2!6220)

(assert (=> b!71957 (= lt!116316 (reader!0 (_2!3222 lt!116324) (_2!3222 lt!116333)))))

(assert (=> b!71957 (validate_offset_bits!1 ((_ sign_extend 32) (size!1374 (buf!1755 (_2!3222 lt!116333)))) ((_ sign_extend 32) (currentByte!3481 thiss!1379)) ((_ sign_extend 32) (currentBit!3476 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!116322 () Unit!4801)

(assert (=> b!71957 (= lt!116322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1755 (_2!3222 lt!116333)) (bvsub to!314 i!635)))))

(assert (=> b!71957 (= lt!116338 (reader!0 thiss!1379 (_2!3222 lt!116333)))))

(declare-fun b!71958 () Bool)

(declare-fun e!46856 () Bool)

(assert (=> b!71958 (= e!46842 e!46856)))

(declare-fun res!59318 () Bool)

(assert (=> b!71958 (=> res!59318 e!46856)))

(declare-fun lt!116335 () List!739)

(assert (=> b!71958 (= res!59318 (not (= lt!116335 lt!116327)))))

(assert (=> b!71958 (= lt!116327 lt!116335)))

(declare-fun tail!343 (List!739) List!739)

(assert (=> b!71958 (= lt!116335 (tail!343 lt!116318))))

(declare-fun lt!116332 () Unit!4801)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2328 BitStream!2328 BitStream!2328 BitStream!2328 (_ BitVec 64) List!739) Unit!4801)

(assert (=> b!71958 (= lt!116332 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3222 lt!116333) (_2!3222 lt!116333) (_1!3224 lt!116338) (_1!3224 lt!116316) (bvsub to!314 i!635) lt!116318))))

(declare-fun b!71959 () Bool)

(declare-fun res!59312 () Bool)

(assert (=> b!71959 (=> res!59312 e!46843)))

(assert (=> b!71959 (= res!59312 (not (invariant!0 (currentBit!3476 (_2!3222 lt!116324)) (currentByte!3481 (_2!3222 lt!116324)) (size!1374 (buf!1755 (_2!3222 lt!116333))))))))

(declare-fun srcBuffer!2 () array!2943)

(declare-fun lt!116325 () tuple2!6220)

(declare-fun e!46852 () Bool)

(declare-fun b!71960 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2328 array!2943 (_ BitVec 64) (_ BitVec 64)) List!739)

(assert (=> b!71960 (= e!46852 (= (head!558 (byteArrayBitContentToList!0 (_2!3222 lt!116324) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!558 (bitStreamReadBitsIntoList!0 (_2!3222 lt!116324) (_1!3224 lt!116325) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!71961 () Bool)

(declare-fun e!46845 () Bool)

(assert (=> b!71961 (= e!46845 e!46846)))

(declare-fun res!59310 () Bool)

(assert (=> b!71961 (=> res!59310 e!46846)))

(assert (=> b!71961 (= res!59310 (not (= lt!116336 (bvsub (bvadd lt!116321 to!314) i!635))))))

(assert (=> b!71961 (= lt!116336 (bitIndex!0 (size!1374 (buf!1755 (_2!3222 lt!116333))) (currentByte!3481 (_2!3222 lt!116333)) (currentBit!3476 (_2!3222 lt!116333))))))

(declare-fun b!71962 () Bool)

(assert (=> b!71962 (= e!46851 e!46853)))

(declare-fun res!59317 () Bool)

(assert (=> b!71962 (=> res!59317 e!46853)))

(assert (=> b!71962 (= res!59317 (not (= (head!558 (byteArrayBitContentToList!0 (_2!3222 lt!116333) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!116319)))))

(assert (=> b!71962 (= lt!116319 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!71963 () Bool)

(declare-fun e!46841 () Bool)

(declare-fun e!46847 () Bool)

(assert (=> b!71963 (= e!46841 e!46847)))

(declare-fun res!59326 () Bool)

(assert (=> b!71963 (=> res!59326 e!46847)))

(declare-fun isPrefixOf!0 (BitStream!2328 BitStream!2328) Bool)

(assert (=> b!71963 (= res!59326 (not (isPrefixOf!0 thiss!1379 (_2!3222 lt!116324))))))

(assert (=> b!71963 (validate_offset_bits!1 ((_ sign_extend 32) (size!1374 (buf!1755 (_2!3222 lt!116324)))) ((_ sign_extend 32) (currentByte!3481 (_2!3222 lt!116324))) ((_ sign_extend 32) (currentBit!3476 (_2!3222 lt!116324))) lt!116334)))

(assert (=> b!71963 (= lt!116334 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116323 () Unit!4801)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2328 BitStream!2328 (_ BitVec 64) (_ BitVec 64)) Unit!4801)

(assert (=> b!71963 (= lt!116323 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3222 lt!116324) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2328 (_ BitVec 8) (_ BitVec 32)) tuple2!6216)

(assert (=> b!71963 (= lt!116324 (appendBitFromByte!0 thiss!1379 (select (arr!1965 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!71964 () Bool)

(declare-fun e!46854 () Bool)

(declare-fun array_inv!1223 (array!2943) Bool)

(assert (=> b!71964 (= e!46854 (array_inv!1223 (buf!1755 thiss!1379)))))

(declare-fun b!71965 () Bool)

(assert (=> b!71965 (= e!46847 e!46845)))

(declare-fun res!59313 () Bool)

(assert (=> b!71965 (=> res!59313 e!46845)))

(assert (=> b!71965 (= res!59313 (not (isPrefixOf!0 (_2!3222 lt!116324) (_2!3222 lt!116333))))))

(assert (=> b!71965 (isPrefixOf!0 thiss!1379 (_2!3222 lt!116333))))

(declare-fun lt!116329 () Unit!4801)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2328 BitStream!2328 BitStream!2328) Unit!4801)

(assert (=> b!71965 (= lt!116329 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3222 lt!116324) (_2!3222 lt!116333)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2328 array!2943 (_ BitVec 64) (_ BitVec 64)) tuple2!6216)

(assert (=> b!71965 (= lt!116333 (appendBitsMSBFirstLoop!0 (_2!3222 lt!116324) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!71965 e!46852))

(declare-fun res!59327 () Bool)

(assert (=> b!71965 (=> (not res!59327) (not e!46852))))

(assert (=> b!71965 (= res!59327 (validate_offset_bits!1 ((_ sign_extend 32) (size!1374 (buf!1755 (_2!3222 lt!116324)))) ((_ sign_extend 32) (currentByte!3481 thiss!1379)) ((_ sign_extend 32) (currentBit!3476 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116337 () Unit!4801)

(assert (=> b!71965 (= lt!116337 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1755 (_2!3222 lt!116324)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!71965 (= lt!116325 (reader!0 thiss!1379 (_2!3222 lt!116324)))))

(declare-fun res!59315 () Bool)

(declare-fun e!46844 () Bool)

(assert (=> start!14060 (=> (not res!59315) (not e!46844))))

(assert (=> start!14060 (= res!59315 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1374 srcBuffer!2))))))))

(assert (=> start!14060 e!46844))

(assert (=> start!14060 true))

(assert (=> start!14060 (array_inv!1223 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2328) Bool)

(assert (=> start!14060 (and (inv!12 thiss!1379) e!46854)))

(declare-fun b!71955 () Bool)

(assert (=> b!71955 (= e!46844 (not e!46841))))

(declare-fun res!59322 () Bool)

(assert (=> b!71955 (=> res!59322 e!46841)))

(assert (=> b!71955 (= res!59322 (bvsge i!635 to!314))))

(assert (=> b!71955 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!116315 () Unit!4801)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2328) Unit!4801)

(assert (=> b!71955 (= lt!116315 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!71955 (= lt!116321 (bitIndex!0 (size!1374 (buf!1755 thiss!1379)) (currentByte!3481 thiss!1379) (currentBit!3476 thiss!1379)))))

(declare-fun b!71966 () Bool)

(declare-fun res!59324 () Bool)

(assert (=> b!71966 (=> res!59324 e!46843)))

(assert (=> b!71966 (= res!59324 (not (invariant!0 (currentBit!3476 (_2!3222 lt!116324)) (currentByte!3481 (_2!3222 lt!116324)) (size!1374 (buf!1755 (_2!3222 lt!116324))))))))

(declare-fun b!71967 () Bool)

(declare-fun res!59325 () Bool)

(assert (=> b!71967 (=> res!59325 e!46842)))

(declare-fun length!367 (List!739) Int)

(assert (=> b!71967 (= res!59325 (<= (length!367 lt!116318) 0))))

(declare-fun b!71968 () Bool)

(assert (=> b!71968 (= e!46856 e!46851)))

(declare-fun res!59309 () Bool)

(assert (=> b!71968 (=> res!59309 e!46851)))

(assert (=> b!71968 (= res!59309 (not (= lt!116320 (bitAt!0 (buf!1755 (_1!3224 lt!116316)) lt!116321))))))

(assert (=> b!71968 (= lt!116320 (bitAt!0 (buf!1755 (_1!3224 lt!116338)) lt!116321))))

(declare-fun b!71969 () Bool)

(declare-fun res!59320 () Bool)

(assert (=> b!71969 (=> res!59320 e!46846)))

(assert (=> b!71969 (= res!59320 (not (= (size!1374 (buf!1755 thiss!1379)) (size!1374 (buf!1755 (_2!3222 lt!116333))))))))

(declare-fun b!71970 () Bool)

(assert (=> b!71970 (= e!46848 e!46849)))

(declare-fun res!59321 () Bool)

(assert (=> b!71970 (=> res!59321 e!46849)))

(declare-fun lt!116331 () Bool)

(assert (=> b!71970 (= res!59321 (not (= lt!116331 lt!116319)))))

(assert (=> b!71970 (= lt!116326 lt!116331)))

(assert (=> b!71970 (= lt!116331 (bitAt!0 (buf!1755 (_2!3222 lt!116333)) lt!116321))))

(declare-fun lt!116330 () Unit!4801)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2943 array!2943 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4801)

(assert (=> b!71970 (= lt!116330 (arrayBitRangesEqImpliesEq!0 (buf!1755 (_2!3222 lt!116324)) (buf!1755 (_2!3222 lt!116333)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!116321 lt!116328))))

(declare-fun b!71971 () Bool)

(declare-fun res!59314 () Bool)

(assert (=> b!71971 (=> (not res!59314) (not e!46844))))

(assert (=> b!71971 (= res!59314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1374 (buf!1755 thiss!1379))) ((_ sign_extend 32) (currentByte!3481 thiss!1379)) ((_ sign_extend 32) (currentBit!3476 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14060 res!59315) b!71971))

(assert (= (and b!71971 res!59314) b!71955))

(assert (= (and b!71955 (not res!59322)) b!71963))

(assert (= (and b!71963 (not res!59326)) b!71965))

(assert (= (and b!71965 res!59327) b!71960))

(assert (= (and b!71965 (not res!59313)) b!71961))

(assert (= (and b!71961 (not res!59310)) b!71956))

(assert (= (and b!71956 (not res!59311)) b!71969))

(assert (= (and b!71969 (not res!59320)) b!71954))

(assert (= (and b!71954 (not res!59316)) b!71966))

(assert (= (and b!71966 (not res!59324)) b!71959))

(assert (= (and b!71959 (not res!59312)) b!71957))

(assert (= (and b!71957 (not res!59323)) b!71967))

(assert (= (and b!71967 (not res!59325)) b!71958))

(assert (= (and b!71958 (not res!59318)) b!71968))

(assert (= (and b!71968 (not res!59309)) b!71951))

(assert (= (and b!71951 (not res!59319)) b!71962))

(assert (= (and b!71962 (not res!59317)) b!71952))

(assert (= (and b!71952 (not res!59328)) b!71970))

(assert (= (and b!71970 (not res!59321)) b!71953))

(assert (= start!14060 b!71964))

(declare-fun m!115479 () Bool)

(assert (=> b!71962 m!115479))

(assert (=> b!71962 m!115479))

(declare-fun m!115481 () Bool)

(assert (=> b!71962 m!115481))

(declare-fun m!115483 () Bool)

(assert (=> b!71962 m!115483))

(declare-fun m!115485 () Bool)

(assert (=> b!71958 m!115485))

(declare-fun m!115487 () Bool)

(assert (=> b!71958 m!115487))

(declare-fun m!115489 () Bool)

(assert (=> b!71964 m!115489))

(declare-fun m!115491 () Bool)

(assert (=> b!71959 m!115491))

(declare-fun m!115493 () Bool)

(assert (=> b!71968 m!115493))

(declare-fun m!115495 () Bool)

(assert (=> b!71968 m!115495))

(declare-fun m!115497 () Bool)

(assert (=> b!71960 m!115497))

(assert (=> b!71960 m!115497))

(declare-fun m!115499 () Bool)

(assert (=> b!71960 m!115499))

(declare-fun m!115501 () Bool)

(assert (=> b!71960 m!115501))

(assert (=> b!71960 m!115501))

(declare-fun m!115503 () Bool)

(assert (=> b!71960 m!115503))

(declare-fun m!115505 () Bool)

(assert (=> b!71957 m!115505))

(declare-fun m!115507 () Bool)

(assert (=> b!71957 m!115507))

(declare-fun m!115509 () Bool)

(assert (=> b!71957 m!115509))

(declare-fun m!115511 () Bool)

(assert (=> b!71957 m!115511))

(declare-fun m!115513 () Bool)

(assert (=> b!71957 m!115513))

(declare-fun m!115515 () Bool)

(assert (=> b!71957 m!115515))

(declare-fun m!115517 () Bool)

(assert (=> b!71957 m!115517))

(declare-fun m!115519 () Bool)

(assert (=> b!71957 m!115519))

(declare-fun m!115521 () Bool)

(assert (=> b!71952 m!115521))

(declare-fun m!115523 () Bool)

(assert (=> b!71971 m!115523))

(declare-fun m!115525 () Bool)

(assert (=> b!71963 m!115525))

(declare-fun m!115527 () Bool)

(assert (=> b!71963 m!115527))

(declare-fun m!115529 () Bool)

(assert (=> b!71963 m!115529))

(declare-fun m!115531 () Bool)

(assert (=> b!71963 m!115531))

(assert (=> b!71963 m!115527))

(declare-fun m!115533 () Bool)

(assert (=> b!71963 m!115533))

(declare-fun m!115535 () Bool)

(assert (=> b!71965 m!115535))

(declare-fun m!115537 () Bool)

(assert (=> b!71965 m!115537))

(declare-fun m!115539 () Bool)

(assert (=> b!71965 m!115539))

(declare-fun m!115541 () Bool)

(assert (=> b!71965 m!115541))

(declare-fun m!115543 () Bool)

(assert (=> b!71965 m!115543))

(declare-fun m!115545 () Bool)

(assert (=> b!71965 m!115545))

(declare-fun m!115547 () Bool)

(assert (=> b!71965 m!115547))

(declare-fun m!115549 () Bool)

(assert (=> b!71956 m!115549))

(declare-fun m!115551 () Bool)

(assert (=> start!14060 m!115551))

(declare-fun m!115553 () Bool)

(assert (=> start!14060 m!115553))

(declare-fun m!115555 () Bool)

(assert (=> b!71961 m!115555))

(declare-fun m!115557 () Bool)

(assert (=> b!71954 m!115557))

(declare-fun m!115559 () Bool)

(assert (=> b!71970 m!115559))

(declare-fun m!115561 () Bool)

(assert (=> b!71970 m!115561))

(declare-fun m!115563 () Bool)

(assert (=> b!71951 m!115563))

(declare-fun m!115565 () Bool)

(assert (=> b!71967 m!115565))

(declare-fun m!115567 () Bool)

(assert (=> b!71966 m!115567))

(declare-fun m!115569 () Bool)

(assert (=> b!71955 m!115569))

(declare-fun m!115571 () Bool)

(assert (=> b!71955 m!115571))

(declare-fun m!115573 () Bool)

(assert (=> b!71955 m!115573))

(declare-fun m!115575 () Bool)

(assert (=> b!71953 m!115575))

(check-sat (not b!71959) (not b!71951) (not b!71961) (not b!71965) (not b!71963) (not b!71967) (not b!71966) (not b!71958) (not b!71956) (not b!71954) (not b!71970) (not b!71968) (not start!14060) (not b!71962) (not b!71960) (not b!71955) (not b!71952) (not b!71971) (not b!71953) (not b!71964) (not b!71957))
