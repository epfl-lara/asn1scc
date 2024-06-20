; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14784 () Bool)

(assert start!14784)

(declare-datatypes ((array!3151 0))(
  ( (array!3152 (arr!2067 (Array (_ BitVec 32) (_ BitVec 8))) (size!1469 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3151)

(declare-datatypes ((BitStream!2512 0))(
  ( (BitStream!2513 (buf!1850 array!3151) (currentByte!3641 (_ BitVec 32)) (currentBit!3636 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2512)

(declare-fun b!76276 () Bool)

(declare-datatypes ((tuple2!6634 0))(
  ( (tuple2!6635 (_1!3448 BitStream!2512) (_2!3448 BitStream!2512)) )
))
(declare-fun lt!122195 () tuple2!6634)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!50055 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((List!786 0))(
  ( (Nil!783) (Cons!782 (h!901 Bool) (t!1536 List!786)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2512 BitStream!2512 (_ BitVec 64)) List!786)

(declare-fun byteArrayBitContentToList!0 (BitStream!2512 array!3151 (_ BitVec 64) (_ BitVec 64)) List!786)

(assert (=> b!76276 (= e!50055 (= (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3448 lt!122195) (bvsub to!314 i!635)) (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-datatypes ((Unit!5038 0))(
  ( (Unit!5039) )
))
(declare-fun lt!122196 () Unit!5038)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2512 array!3151 (_ BitVec 64)) Unit!5038)

(assert (=> b!76276 (= lt!122196 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1850 thiss!1379) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!6636 0))(
  ( (tuple2!6637 (_1!3449 array!3151) (_2!3449 BitStream!2512)) )
))
(declare-fun lt!122199 () tuple2!6636)

(declare-fun checkByteArrayBitContent!0 (BitStream!2512 array!3151 array!3151 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76276 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3449 lt!122199) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76277 () Bool)

(declare-fun res!63069 () Bool)

(declare-fun e!50058 () Bool)

(assert (=> b!76277 (=> res!63069 e!50058)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76277 (= res!63069 (not (invariant!0 (currentBit!3636 thiss!1379) (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379)))))))

(declare-fun b!76279 () Bool)

(declare-fun e!50053 () Bool)

(declare-fun array_inv!1315 (array!3151) Bool)

(assert (=> b!76279 (= e!50053 (array_inv!1315 (buf!1850 thiss!1379)))))

(declare-fun b!76278 () Bool)

(declare-fun res!63071 () Bool)

(declare-fun e!50054 () Bool)

(assert (=> b!76278 (=> (not res!63071) (not e!50054))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76278 (= res!63071 (validate_offset_bits!1 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))) ((_ sign_extend 32) (currentByte!3641 thiss!1379)) ((_ sign_extend 32) (currentBit!3636 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!63070 () Bool)

(assert (=> start!14784 (=> (not res!63070) (not e!50054))))

(assert (=> start!14784 (= res!63070 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1469 srcBuffer!2))))))))

(assert (=> start!14784 e!50054))

(assert (=> start!14784 true))

(assert (=> start!14784 (array_inv!1315 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2512) Bool)

(assert (=> start!14784 (and (inv!12 thiss!1379) e!50053)))

(declare-fun b!76280 () Bool)

(assert (=> b!76280 (= e!50054 (not e!50058))))

(declare-fun res!63073 () Bool)

(assert (=> b!76280 (=> res!63073 e!50058)))

(declare-fun lt!122198 () (_ BitVec 64))

(assert (=> b!76280 (= res!63073 (or (bvslt i!635 to!314) (not (= lt!122198 (bvsub (bvadd lt!122198 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2512 BitStream!2512) Bool)

(assert (=> b!76280 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122197 () Unit!5038)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2512) Unit!5038)

(assert (=> b!76280 (= lt!122197 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76280 (= lt!122198 (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)))))

(declare-fun b!76281 () Bool)

(assert (=> b!76281 (= e!50058 e!50055)))

(declare-fun res!63072 () Bool)

(assert (=> b!76281 (=> res!63072 e!50055)))

(assert (=> b!76281 (= res!63072 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2512 (_ BitVec 64)) tuple2!6636)

(assert (=> b!76281 (= lt!122199 (readBits!0 (_1!3448 lt!122195) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2512 BitStream!2512) tuple2!6634)

(assert (=> b!76281 (= lt!122195 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!14784 res!63070) b!76278))

(assert (= (and b!76278 res!63071) b!76280))

(assert (= (and b!76280 (not res!63073)) b!76277))

(assert (= (and b!76277 (not res!63069)) b!76281))

(assert (= (and b!76281 (not res!63072)) b!76276))

(assert (= start!14784 b!76279))

(declare-fun m!121499 () Bool)

(assert (=> b!76276 m!121499))

(declare-fun m!121501 () Bool)

(assert (=> b!76276 m!121501))

(declare-fun m!121503 () Bool)

(assert (=> b!76276 m!121503))

(declare-fun m!121505 () Bool)

(assert (=> b!76276 m!121505))

(declare-fun m!121507 () Bool)

(assert (=> start!14784 m!121507))

(declare-fun m!121509 () Bool)

(assert (=> start!14784 m!121509))

(declare-fun m!121511 () Bool)

(assert (=> b!76281 m!121511))

(declare-fun m!121513 () Bool)

(assert (=> b!76281 m!121513))

(declare-fun m!121515 () Bool)

(assert (=> b!76278 m!121515))

(declare-fun m!121517 () Bool)

(assert (=> b!76277 m!121517))

(declare-fun m!121519 () Bool)

(assert (=> b!76280 m!121519))

(declare-fun m!121521 () Bool)

(assert (=> b!76280 m!121521))

(declare-fun m!121523 () Bool)

(assert (=> b!76280 m!121523))

(declare-fun m!121525 () Bool)

(assert (=> b!76279 m!121525))

(push 1)

(assert (not b!76278))

(assert (not b!76280))

(assert (not start!14784))

(assert (not b!76281))

(assert (not b!76279))

(assert (not b!76277))

(assert (not b!76276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!122267 () tuple2!6636)

(declare-fun e!50112 () Bool)

(declare-fun b!76352 () Bool)

(assert (=> b!76352 (= e!50112 (= (byteArrayBitContentToList!0 (_2!3449 lt!122267) (_1!3449 lt!122267) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3449 lt!122267) (_1!3448 lt!122195) (bvsub to!314 i!635))))))

(declare-fun b!76353 () Bool)

(declare-fun res!63121 () Bool)

(assert (=> b!76353 (=> (not res!63121) (not e!50112))))

(assert (=> b!76353 (= res!63121 (bvsle (currentByte!3641 (_1!3448 lt!122195)) (currentByte!3641 (_2!3449 lt!122267))))))

(declare-fun b!76354 () Bool)

(declare-fun res!63120 () Bool)

(assert (=> b!76354 (=> (not res!63120) (not e!50112))))

(declare-fun lt!122268 () (_ BitVec 64))

(assert (=> b!76354 (= res!63120 (= (size!1469 (_1!3449 lt!122267)) ((_ extract 31 0) lt!122268)))))

(assert (=> b!76354 (and (bvslt lt!122268 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!122268 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!122264 () (_ BitVec 64))

(declare-fun lt!122260 () (_ BitVec 64))

(assert (=> b!76354 (= lt!122268 (bvsdiv lt!122264 lt!122260))))

(assert (=> b!76354 (and (not (= lt!122260 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!122264 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!122260 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!76354 (= lt!122260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!122263 () (_ BitVec 64))

(declare-fun lt!122266 () (_ BitVec 64))

(assert (=> b!76354 (= lt!122264 (bvsub lt!122263 lt!122266))))

(assert (=> b!76354 (or (= (bvand lt!122263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122263 lt!122266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76354 (= lt!122266 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!122262 () (_ BitVec 64))

(assert (=> b!76354 (= lt!122263 (bvadd (bvsub to!314 i!635) lt!122262))))

(assert (=> b!76354 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122262 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!122262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76354 (= lt!122262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!76355 () Bool)

(declare-fun res!63124 () Bool)

(assert (=> b!76355 (=> (not res!63124) (not e!50112))))

(declare-fun lt!122261 () (_ BitVec 64))

(assert (=> b!76355 (= res!63124 (= (bvadd lt!122261 (bvsub to!314 i!635)) (bitIndex!0 (size!1469 (buf!1850 (_2!3449 lt!122267))) (currentByte!3641 (_2!3449 lt!122267)) (currentBit!3636 (_2!3449 lt!122267)))))))

(assert (=> b!76355 (or (not (= (bvand lt!122261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122261 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76355 (= lt!122261 (bitIndex!0 (size!1469 (buf!1850 (_1!3448 lt!122195))) (currentByte!3641 (_1!3448 lt!122195)) (currentBit!3636 (_1!3448 lt!122195))))))

(declare-fun b!76356 () Bool)

(declare-fun res!63123 () Bool)

(assert (=> b!76356 (=> (not res!63123) (not e!50112))))

(assert (=> b!76356 (= res!63123 (invariant!0 (currentBit!3636 (_2!3449 lt!122267)) (currentByte!3641 (_2!3449 lt!122267)) (size!1469 (buf!1850 (_2!3449 lt!122267)))))))

(declare-fun d!24122 () Bool)

(assert (=> d!24122 e!50112))

(declare-fun res!63122 () Bool)

(assert (=> d!24122 (=> (not res!63122) (not e!50112))))

(assert (=> d!24122 (= res!63122 (= (buf!1850 (_2!3449 lt!122267)) (buf!1850 (_1!3448 lt!122195))))))

(declare-datatypes ((tuple3!220 0))(
  ( (tuple3!221 (_1!3456 Unit!5038) (_2!3456 BitStream!2512) (_3!131 array!3151)) )
))
(declare-fun lt!122265 () tuple3!220)

(assert (=> d!24122 (= lt!122267 (tuple2!6637 (_3!131 lt!122265) (_2!3456 lt!122265)))))

(declare-fun readBitsLoop!0 (BitStream!2512 (_ BitVec 64) array!3151 (_ BitVec 64) (_ BitVec 64)) tuple3!220)

(assert (=> d!24122 (= lt!122265 (readBitsLoop!0 (_1!3448 lt!122195) (bvsub to!314 i!635) (array!3152 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24122 (= (readBits!0 (_1!3448 lt!122195) (bvsub to!314 i!635)) lt!122267)))

(assert (= (and d!24122 res!63122) b!76355))

(assert (= (and b!76355 res!63124) b!76356))

(assert (= (and b!76356 res!63123) b!76354))

(assert (= (and b!76354 res!63120) b!76353))

(assert (= (and b!76353 res!63121) b!76352))

(declare-fun m!121607 () Bool)

(assert (=> b!76352 m!121607))

(declare-fun m!121609 () Bool)

(assert (=> b!76352 m!121609))

(declare-fun m!121611 () Bool)

(assert (=> b!76355 m!121611))

(declare-fun m!121613 () Bool)

(assert (=> b!76355 m!121613))

(declare-fun m!121615 () Bool)

(assert (=> b!76356 m!121615))

(declare-fun m!121617 () Bool)

(assert (=> d!24122 m!121617))

(assert (=> b!76281 d!24122))

(declare-fun b!76388 () Bool)

(declare-fun res!63152 () Bool)

(declare-fun e!50123 () Bool)

(assert (=> b!76388 (=> (not res!63152) (not e!50123))))

(declare-fun lt!122350 () tuple2!6634)

(assert (=> b!76388 (= res!63152 (isPrefixOf!0 (_2!3448 lt!122350) thiss!1379))))

(declare-fun b!76389 () Bool)

(declare-fun e!50122 () Unit!5038)

(declare-fun lt!122359 () Unit!5038)

(assert (=> b!76389 (= e!50122 lt!122359)))

(declare-fun lt!122360 () (_ BitVec 64))

(assert (=> b!76389 (= lt!122360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122357 () (_ BitVec 64))

(assert (=> b!76389 (= lt!122357 (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3151 array!3151 (_ BitVec 64) (_ BitVec 64)) Unit!5038)

(assert (=> b!76389 (= lt!122359 (arrayBitRangesEqSymmetric!0 (buf!1850 thiss!1379) (buf!1850 thiss!1379) lt!122360 lt!122357))))

(declare-fun arrayBitRangesEq!0 (array!3151 array!3151 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76389 (arrayBitRangesEq!0 (buf!1850 thiss!1379) (buf!1850 thiss!1379) lt!122360 lt!122357)))

(declare-fun lt!122345 () (_ BitVec 64))

(declare-fun lt!122342 () (_ BitVec 64))

(declare-fun b!76390 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2512 (_ BitVec 64)) BitStream!2512)

(assert (=> b!76390 (= e!50123 (= (_1!3448 lt!122350) (withMovedBitIndex!0 (_2!3448 lt!122350) (bvsub lt!122345 lt!122342))))))

(assert (=> b!76390 (or (= (bvand lt!122345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122345 lt!122342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76390 (= lt!122342 (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)))))

(assert (=> b!76390 (= lt!122345 (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)))))

(declare-fun b!76391 () Bool)

(declare-fun res!63153 () Bool)

(assert (=> b!76391 (=> (not res!63153) (not e!50123))))

(assert (=> b!76391 (= res!63153 (isPrefixOf!0 (_1!3448 lt!122350) thiss!1379))))

(declare-fun d!24132 () Bool)

(assert (=> d!24132 e!50123))

(declare-fun res!63154 () Bool)

(assert (=> d!24132 (=> (not res!63154) (not e!50123))))

(assert (=> d!24132 (= res!63154 (isPrefixOf!0 (_1!3448 lt!122350) (_2!3448 lt!122350)))))

(declare-fun lt!122353 () BitStream!2512)

(assert (=> d!24132 (= lt!122350 (tuple2!6635 lt!122353 thiss!1379))))

(declare-fun lt!122354 () Unit!5038)

(declare-fun lt!122351 () Unit!5038)

(assert (=> d!24132 (= lt!122354 lt!122351)))

(assert (=> d!24132 (isPrefixOf!0 lt!122353 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2512 BitStream!2512 BitStream!2512) Unit!5038)

(assert (=> d!24132 (= lt!122351 (lemmaIsPrefixTransitive!0 lt!122353 thiss!1379 thiss!1379))))

(declare-fun lt!122346 () Unit!5038)

(declare-fun lt!122344 () Unit!5038)

(assert (=> d!24132 (= lt!122346 lt!122344)))

(assert (=> d!24132 (isPrefixOf!0 lt!122353 thiss!1379)))

(assert (=> d!24132 (= lt!122344 (lemmaIsPrefixTransitive!0 lt!122353 thiss!1379 thiss!1379))))

(declare-fun lt!122358 () Unit!5038)

(assert (=> d!24132 (= lt!122358 e!50122)))

(declare-fun c!5552 () Bool)

(assert (=> d!24132 (= c!5552 (not (= (size!1469 (buf!1850 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!122349 () Unit!5038)

(declare-fun lt!122352 () Unit!5038)

(assert (=> d!24132 (= lt!122349 lt!122352)))

(assert (=> d!24132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24132 (= lt!122352 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122347 () Unit!5038)

(declare-fun lt!122361 () Unit!5038)

(assert (=> d!24132 (= lt!122347 lt!122361)))

(assert (=> d!24132 (= lt!122361 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!122356 () Unit!5038)

(declare-fun lt!122343 () Unit!5038)

(assert (=> d!24132 (= lt!122356 lt!122343)))

(assert (=> d!24132 (isPrefixOf!0 lt!122353 lt!122353)))

(assert (=> d!24132 (= lt!122343 (lemmaIsPrefixRefl!0 lt!122353))))

(declare-fun lt!122348 () Unit!5038)

(declare-fun lt!122355 () Unit!5038)

(assert (=> d!24132 (= lt!122348 lt!122355)))

(assert (=> d!24132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24132 (= lt!122355 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24132 (= lt!122353 (BitStream!2513 (buf!1850 thiss!1379) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)))))

(assert (=> d!24132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24132 (= (reader!0 thiss!1379 thiss!1379) lt!122350)))

(declare-fun b!76392 () Bool)

(declare-fun Unit!5045 () Unit!5038)

(assert (=> b!76392 (= e!50122 Unit!5045)))

(assert (= (and d!24132 c!5552) b!76389))

(assert (= (and d!24132 (not c!5552)) b!76392))

(assert (= (and d!24132 res!63154) b!76391))

(assert (= (and b!76391 res!63153) b!76388))

(assert (= (and b!76388 res!63152) b!76390))

(assert (=> b!76389 m!121523))

(declare-fun m!121631 () Bool)

(assert (=> b!76389 m!121631))

(declare-fun m!121633 () Bool)

(assert (=> b!76389 m!121633))

(declare-fun m!121635 () Bool)

(assert (=> b!76390 m!121635))

(assert (=> b!76390 m!121523))

(assert (=> b!76390 m!121523))

(declare-fun m!121637 () Bool)

(assert (=> b!76388 m!121637))

(declare-fun m!121639 () Bool)

(assert (=> d!24132 m!121639))

(declare-fun m!121641 () Bool)

(assert (=> d!24132 m!121641))

(assert (=> d!24132 m!121519))

(assert (=> d!24132 m!121519))

(assert (=> d!24132 m!121521))

(declare-fun m!121643 () Bool)

(assert (=> d!24132 m!121643))

(assert (=> d!24132 m!121519))

(assert (=> d!24132 m!121639))

(declare-fun m!121645 () Bool)

(assert (=> d!24132 m!121645))

(declare-fun m!121647 () Bool)

(assert (=> d!24132 m!121647))

(assert (=> d!24132 m!121521))

(declare-fun m!121649 () Bool)

(assert (=> b!76391 m!121649))

(assert (=> b!76281 d!24132))

(declare-fun b!76410 () Bool)

(declare-datatypes ((tuple2!6650 0))(
  ( (tuple2!6651 (_1!3458 List!786) (_2!3458 BitStream!2512)) )
))
(declare-fun e!50129 () tuple2!6650)

(assert (=> b!76410 (= e!50129 (tuple2!6651 Nil!783 (_1!3448 lt!122195)))))

(declare-fun lt!122390 () (_ BitVec 64))

(declare-datatypes ((tuple2!6652 0))(
  ( (tuple2!6653 (_1!3459 Bool) (_2!3459 BitStream!2512)) )
))
(declare-fun lt!122389 () tuple2!6652)

(declare-fun b!76411 () Bool)

(assert (=> b!76411 (= e!50129 (tuple2!6651 (Cons!782 (_1!3459 lt!122389) (bitStreamReadBitsIntoList!0 thiss!1379 (_2!3459 lt!122389) (bvsub (bvsub to!314 i!635) lt!122390))) (_2!3459 lt!122389)))))

(declare-fun readBit!0 (BitStream!2512) tuple2!6652)

(assert (=> b!76411 (= lt!122389 (readBit!0 (_1!3448 lt!122195)))))

(assert (=> b!76411 (= lt!122390 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!76413 () Bool)

(declare-fun e!50130 () Bool)

(declare-fun lt!122391 () List!786)

(declare-fun length!399 (List!786) Int)

(assert (=> b!76413 (= e!50130 (> (length!399 lt!122391) 0))))

(declare-fun b!76412 () Bool)

(declare-fun isEmpty!240 (List!786) Bool)

(assert (=> b!76412 (= e!50130 (isEmpty!240 lt!122391))))

(declare-fun d!24136 () Bool)

(assert (=> d!24136 e!50130))

(declare-fun c!5557 () Bool)

(assert (=> d!24136 (= c!5557 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24136 (= lt!122391 (_1!3458 e!50129))))

(declare-fun c!5558 () Bool)

(assert (=> d!24136 (= c!5558 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24136 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!24136 (= (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3448 lt!122195) (bvsub to!314 i!635)) lt!122391)))

(assert (= (and d!24136 c!5558) b!76410))

(assert (= (and d!24136 (not c!5558)) b!76411))

(assert (= (and d!24136 c!5557) b!76412))

(assert (= (and d!24136 (not c!5557)) b!76413))

(declare-fun m!121663 () Bool)

(assert (=> b!76411 m!121663))

(declare-fun m!121665 () Bool)

(assert (=> b!76411 m!121665))

(declare-fun m!121667 () Bool)

(assert (=> b!76413 m!121667))

(declare-fun m!121669 () Bool)

(assert (=> b!76412 m!121669))

(assert (=> b!76276 d!24136))

(declare-fun d!24140 () Bool)

(declare-fun c!5563 () Bool)

(assert (=> d!24140 (= c!5563 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50137 () List!786)

(assert (=> d!24140 (= (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 i!635 (bvsub to!314 i!635)) e!50137)))

(declare-fun b!76428 () Bool)

(assert (=> b!76428 (= e!50137 Nil!783)))

(declare-fun b!76429 () Bool)

(assert (=> b!76429 (= e!50137 (Cons!782 (not (= (bvand ((_ sign_extend 24) (select (arr!2067 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1379 srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!24140 c!5563) b!76428))

(assert (= (and d!24140 (not c!5563)) b!76429))

(declare-fun m!121671 () Bool)

(assert (=> b!76429 m!121671))

(declare-fun m!121673 () Bool)

(assert (=> b!76429 m!121673))

(declare-fun m!121675 () Bool)

(assert (=> b!76429 m!121675))

(assert (=> b!76276 d!24140))

(declare-fun d!24142 () Bool)

(assert (=> d!24142 (validate_offset_bits!1 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))) ((_ sign_extend 32) (currentByte!3641 thiss!1379)) ((_ sign_extend 32) (currentBit!3636 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!122454 () Unit!5038)

(declare-fun choose!9 (BitStream!2512 array!3151 (_ BitVec 64) BitStream!2512) Unit!5038)

(assert (=> d!24142 (= lt!122454 (choose!9 thiss!1379 (buf!1850 thiss!1379) (bvsub to!314 i!635) (BitStream!2513 (buf!1850 thiss!1379) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379))))))

(assert (=> d!24142 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1850 thiss!1379) (bvsub to!314 i!635)) lt!122454)))

(declare-fun bs!5821 () Bool)

(assert (= bs!5821 d!24142))

(assert (=> bs!5821 m!121515))

(declare-fun m!121697 () Bool)

(assert (=> bs!5821 m!121697))

(assert (=> b!76276 d!24142))

(declare-fun d!24146 () Bool)

(declare-fun res!63186 () Bool)

(declare-fun e!50150 () Bool)

(assert (=> d!24146 (=> res!63186 e!50150)))

(assert (=> d!24146 (= res!63186 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24146 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3449 lt!122199) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!50150)))

(declare-fun b!76448 () Bool)

(declare-fun e!50151 () Bool)

(assert (=> b!76448 (= e!50150 e!50151)))

(declare-fun res!63187 () Bool)

(assert (=> b!76448 (=> (not res!63187) (not e!50151))))

(assert (=> b!76448 (= res!63187 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2067 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2067 (_1!3449 lt!122199)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!76449 () Bool)

(assert (=> b!76449 (= e!50151 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3449 lt!122199) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24146 (not res!63186)) b!76448))

(assert (= (and b!76448 res!63187) b!76449))

(assert (=> b!76448 m!121671))

(assert (=> b!76448 m!121673))

(declare-fun m!121703 () Bool)

(assert (=> b!76448 m!121703))

(declare-fun m!121705 () Bool)

(assert (=> b!76448 m!121705))

(declare-fun m!121707 () Bool)

(assert (=> b!76449 m!121707))

(assert (=> b!76276 d!24146))

(declare-fun d!24152 () Bool)

(assert (=> d!24152 (= (invariant!0 (currentBit!3636 thiss!1379) (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379))) (and (bvsge (currentBit!3636 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3636 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3641 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379))) (and (= (currentBit!3636 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379)))))))))

(assert (=> b!76277 d!24152))

(declare-fun d!24154 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))) ((_ sign_extend 32) (currentByte!3641 thiss!1379)) ((_ sign_extend 32) (currentBit!3636 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))) ((_ sign_extend 32) (currentByte!3641 thiss!1379)) ((_ sign_extend 32) (currentBit!3636 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5824 () Bool)

(assert (= bs!5824 d!24154))

(declare-fun m!121709 () Bool)

(assert (=> bs!5824 m!121709))

(assert (=> b!76278 d!24154))

(declare-fun d!24156 () Bool)

(assert (=> d!24156 (= (array_inv!1315 (buf!1850 thiss!1379)) (bvsge (size!1469 (buf!1850 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!76279 d!24156))

(declare-fun d!24158 () Bool)

(assert (=> d!24158 (= (array_inv!1315 srcBuffer!2) (bvsge (size!1469 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14784 d!24158))

(declare-fun d!24160 () Bool)

(assert (=> d!24160 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3636 thiss!1379) (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379))))))

(declare-fun bs!5825 () Bool)

(assert (= bs!5825 d!24160))

(assert (=> bs!5825 m!121517))

(assert (=> start!14784 d!24160))

(declare-fun d!24162 () Bool)

(declare-fun res!63202 () Bool)

(declare-fun e!50159 () Bool)

(assert (=> d!24162 (=> (not res!63202) (not e!50159))))

(assert (=> d!24162 (= res!63202 (= (size!1469 (buf!1850 thiss!1379)) (size!1469 (buf!1850 thiss!1379))))))

(assert (=> d!24162 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!50159)))

(declare-fun b!76462 () Bool)

(declare-fun res!63200 () Bool)

(assert (=> b!76462 (=> (not res!63200) (not e!50159))))

(assert (=> b!76462 (= res!63200 (bvsle (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)) (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379))))))

(declare-fun b!76463 () Bool)

(declare-fun e!50160 () Bool)

(assert (=> b!76463 (= e!50159 e!50160)))

(declare-fun res!63201 () Bool)

(assert (=> b!76463 (=> res!63201 e!50160)))

(assert (=> b!76463 (= res!63201 (= (size!1469 (buf!1850 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!76464 () Bool)

(assert (=> b!76464 (= e!50160 (arrayBitRangesEq!0 (buf!1850 thiss!1379) (buf!1850 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379))))))

(assert (= (and d!24162 res!63202) b!76462))

(assert (= (and b!76462 res!63200) b!76463))

(assert (= (and b!76463 (not res!63201)) b!76464))

(assert (=> b!76462 m!121523))

(assert (=> b!76462 m!121523))

(assert (=> b!76464 m!121523))

(assert (=> b!76464 m!121523))

(declare-fun m!121711 () Bool)

(assert (=> b!76464 m!121711))

(assert (=> b!76280 d!24162))

(declare-fun d!24164 () Bool)

(assert (=> d!24164 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122506 () Unit!5038)

(declare-fun choose!11 (BitStream!2512) Unit!5038)

(assert (=> d!24164 (= lt!122506 (choose!11 thiss!1379))))

(assert (=> d!24164 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!122506)))

(declare-fun bs!5827 () Bool)

(assert (= bs!5827 d!24164))

(assert (=> bs!5827 m!121519))

(declare-fun m!121713 () Bool)

(assert (=> bs!5827 m!121713))

(assert (=> b!76280 d!24164))

(declare-fun d!24166 () Bool)

(declare-fun e!50169 () Bool)

(assert (=> d!24166 e!50169))

(declare-fun res!63217 () Bool)

(assert (=> d!24166 (=> (not res!63217) (not e!50169))))

(declare-fun lt!122553 () (_ BitVec 64))

(declare-fun lt!122551 () (_ BitVec 64))

(declare-fun lt!122556 () (_ BitVec 64))

(assert (=> d!24166 (= res!63217 (= lt!122553 (bvsub lt!122551 lt!122556)))))

(assert (=> d!24166 (or (= (bvand lt!122551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122551 lt!122556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24166 (= lt!122556 (remainingBits!0 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))) ((_ sign_extend 32) (currentByte!3641 thiss!1379)) ((_ sign_extend 32) (currentBit!3636 thiss!1379))))))

(declare-fun lt!122554 () (_ BitVec 64))

(declare-fun lt!122552 () (_ BitVec 64))

(assert (=> d!24166 (= lt!122551 (bvmul lt!122554 lt!122552))))

(assert (=> d!24166 (or (= lt!122554 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122552 (bvsdiv (bvmul lt!122554 lt!122552) lt!122554)))))

(assert (=> d!24166 (= lt!122552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24166 (= lt!122554 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))))))

(assert (=> d!24166 (= lt!122553 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3641 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3636 thiss!1379))))))

(assert (=> d!24166 (invariant!0 (currentBit!3636 thiss!1379) (currentByte!3641 thiss!1379) (size!1469 (buf!1850 thiss!1379)))))

(assert (=> d!24166 (= (bitIndex!0 (size!1469 (buf!1850 thiss!1379)) (currentByte!3641 thiss!1379) (currentBit!3636 thiss!1379)) lt!122553)))

(declare-fun b!76484 () Bool)

(declare-fun res!63216 () Bool)

(assert (=> b!76484 (=> (not res!63216) (not e!50169))))

(assert (=> b!76484 (= res!63216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122553))))

(declare-fun b!76485 () Bool)

(declare-fun lt!122555 () (_ BitVec 64))

(assert (=> b!76485 (= e!50169 (bvsle lt!122553 (bvmul lt!122555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76485 (or (= lt!122555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122555)))))

(assert (=> b!76485 (= lt!122555 ((_ sign_extend 32) (size!1469 (buf!1850 thiss!1379))))))

(assert (= (and d!24166 res!63217) b!76484))

(assert (= (and b!76484 res!63216) b!76485))

(assert (=> d!24166 m!121709))

(assert (=> d!24166 m!121517))

(assert (=> b!76280 d!24166))

(push 1)

(assert (not b!76390))

(assert (not b!76464))

(assert (not b!76429))

(assert (not d!24122))

(assert (not b!76412))

(assert (not b!76355))

(assert (not d!24166))

(assert (not b!76352))

(assert (not b!76388))

(assert (not d!24154))

(assert (not b!76389))

(assert (not b!76413))

(assert (not d!24142))

(assert (not b!76411))

(assert (not d!24132))

(assert (not d!24164))

(assert (not d!24160))

(assert (not b!76356))

(assert (not b!76391))

(assert (not b!76462))

(assert (not b!76449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

