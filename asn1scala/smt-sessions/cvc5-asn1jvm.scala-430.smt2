; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11580 () Bool)

(assert start!11580)

(declare-fun b!57202 () Bool)

(declare-fun res!47537 () Bool)

(declare-fun e!37976 () Bool)

(assert (=> b!57202 (=> res!47537 e!37976)))

(declare-datatypes ((array!2623 0))(
  ( (array!2624 (arr!1748 (Array (_ BitVec 32) (_ BitVec 8))) (size!1190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2068 0))(
  ( (BitStream!2069 (buf!1565 array!2623) (currentByte!3171 (_ BitVec 32)) (currentBit!3166 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3955 0))(
  ( (Unit!3956) )
))
(declare-datatypes ((tuple2!5210 0))(
  ( (tuple2!5211 (_1!2716 Unit!3955) (_2!2716 BitStream!2068)) )
))
(declare-fun lt!90227 () tuple2!5210)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!90226 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57202 (= res!47537 (not (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90227))) (currentByte!3171 (_2!2716 lt!90227)) (currentBit!3166 (_2!2716 lt!90227))) (bvsub (bvadd lt!90226 to!314) i!635))))))

(declare-fun res!47536 () Bool)

(declare-fun e!37972 () Bool)

(assert (=> start!11580 (=> (not res!47536) (not e!37972))))

(declare-fun srcBuffer!2 () array!2623)

(assert (=> start!11580 (= res!47536 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1190 srcBuffer!2))))))))

(assert (=> start!11580 e!37972))

(assert (=> start!11580 true))

(declare-fun array_inv!1093 (array!2623) Bool)

(assert (=> start!11580 (array_inv!1093 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2068)

(declare-fun e!37974 () Bool)

(declare-fun inv!12 (BitStream!2068) Bool)

(assert (=> start!11580 (and (inv!12 thiss!1379) e!37974)))

(declare-fun b!57203 () Bool)

(declare-fun res!47530 () Bool)

(assert (=> b!57203 (=> res!47530 e!37976)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57203 (= res!47530 (not (invariant!0 (currentBit!3166 (_2!2716 lt!90227)) (currentByte!3171 (_2!2716 lt!90227)) (size!1190 (buf!1565 (_2!2716 lt!90227))))))))

(declare-fun b!57204 () Bool)

(declare-fun res!47532 () Bool)

(assert (=> b!57204 (=> res!47532 e!37976)))

(assert (=> b!57204 (= res!47532 (not (= (size!1190 (buf!1565 thiss!1379)) (size!1190 (buf!1565 (_2!2716 lt!90227))))))))

(declare-fun b!57205 () Bool)

(assert (=> b!57205 (= e!37974 (array_inv!1093 (buf!1565 thiss!1379)))))

(declare-fun b!57206 () Bool)

(declare-fun lt!90229 () (_ BitVec 64))

(declare-fun lt!90234 () (_ BitVec 64))

(assert (=> b!57206 (= e!37976 (or (= lt!90229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90229 (bvand (bvsub lt!90234 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57206 (= lt!90229 (bvand lt!90234 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!90232 () tuple2!5210)

(assert (=> b!57206 (= lt!90234 (bvsub (bvadd (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))) to!314) i!635))))

(assert (=> b!57206 (= (size!1190 (buf!1565 (_2!2716 lt!90227))) (size!1190 (buf!1565 thiss!1379)))))

(declare-fun b!57207 () Bool)

(declare-fun e!37973 () Bool)

(assert (=> b!57207 (= e!37973 e!37976)))

(declare-fun res!47535 () Bool)

(assert (=> b!57207 (=> res!47535 e!37976)))

(declare-fun isPrefixOf!0 (BitStream!2068 BitStream!2068) Bool)

(assert (=> b!57207 (= res!47535 (not (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90227))))))

(assert (=> b!57207 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90227))))

(declare-fun lt!90230 () Unit!3955)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2068 BitStream!2068 BitStream!2068) Unit!3955)

(assert (=> b!57207 (= lt!90230 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2716 lt!90232) (_2!2716 lt!90227)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2068 array!2623 (_ BitVec 64) (_ BitVec 64)) tuple2!5210)

(assert (=> b!57207 (= lt!90227 (appendBitsMSBFirstLoop!0 (_2!2716 lt!90232) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!37975 () Bool)

(assert (=> b!57207 e!37975))

(declare-fun res!47533 () Bool)

(assert (=> b!57207 (=> (not res!47533) (not e!37975))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57207 (= res!47533 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90235 () Unit!3955)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2068 array!2623 (_ BitVec 64)) Unit!3955)

(assert (=> b!57207 (= lt!90235 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1565 (_2!2716 lt!90232)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5212 0))(
  ( (tuple2!5213 (_1!2717 BitStream!2068) (_2!2717 BitStream!2068)) )
))
(declare-fun lt!90231 () tuple2!5212)

(declare-fun reader!0 (BitStream!2068 BitStream!2068) tuple2!5212)

(assert (=> b!57207 (= lt!90231 (reader!0 thiss!1379 (_2!2716 lt!90232)))))

(declare-fun b!57208 () Bool)

(declare-fun e!37978 () Bool)

(assert (=> b!57208 (= e!37972 (not e!37978))))

(declare-fun res!47534 () Bool)

(assert (=> b!57208 (=> res!47534 e!37978)))

(assert (=> b!57208 (= res!47534 (bvsge i!635 to!314))))

(assert (=> b!57208 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90233 () Unit!3955)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2068) Unit!3955)

(assert (=> b!57208 (= lt!90233 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!57208 (= lt!90226 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)))))

(declare-fun b!57209 () Bool)

(declare-fun res!47538 () Bool)

(assert (=> b!57209 (=> (not res!47538) (not e!37972))))

(assert (=> b!57209 (= res!47538 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!57210 () Bool)

(declare-datatypes ((List!609 0))(
  ( (Nil!606) (Cons!605 (h!724 Bool) (t!1359 List!609)) )
))
(declare-fun head!428 (List!609) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2068 array!2623 (_ BitVec 64) (_ BitVec 64)) List!609)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2068 BitStream!2068 (_ BitVec 64)) List!609)

(assert (=> b!57210 (= e!37975 (= (head!428 (byteArrayBitContentToList!0 (_2!2716 lt!90232) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!428 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90232) (_1!2717 lt!90231) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57211 () Bool)

(assert (=> b!57211 (= e!37978 e!37973)))

(declare-fun res!47531 () Bool)

(assert (=> b!57211 (=> res!47531 e!37973)))

(assert (=> b!57211 (= res!47531 (not (isPrefixOf!0 thiss!1379 (_2!2716 lt!90232))))))

(assert (=> b!57211 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90228 () Unit!3955)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2068 BitStream!2068 (_ BitVec 64) (_ BitVec 64)) Unit!3955)

(assert (=> b!57211 (= lt!90228 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2716 lt!90232) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2068 (_ BitVec 8) (_ BitVec 32)) tuple2!5210)

(assert (=> b!57211 (= lt!90232 (appendBitFromByte!0 thiss!1379 (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11580 res!47536) b!57209))

(assert (= (and b!57209 res!47538) b!57208))

(assert (= (and b!57208 (not res!47534)) b!57211))

(assert (= (and b!57211 (not res!47531)) b!57207))

(assert (= (and b!57207 res!47533) b!57210))

(assert (= (and b!57207 (not res!47535)) b!57202))

(assert (= (and b!57202 (not res!47537)) b!57203))

(assert (= (and b!57203 (not res!47530)) b!57204))

(assert (= (and b!57204 (not res!47532)) b!57206))

(assert (= start!11580 b!57205))

(declare-fun m!90181 () Bool)

(assert (=> b!57203 m!90181))

(declare-fun m!90183 () Bool)

(assert (=> start!11580 m!90183))

(declare-fun m!90185 () Bool)

(assert (=> start!11580 m!90185))

(declare-fun m!90187 () Bool)

(assert (=> b!57202 m!90187))

(declare-fun m!90189 () Bool)

(assert (=> b!57207 m!90189))

(declare-fun m!90191 () Bool)

(assert (=> b!57207 m!90191))

(declare-fun m!90193 () Bool)

(assert (=> b!57207 m!90193))

(declare-fun m!90195 () Bool)

(assert (=> b!57207 m!90195))

(declare-fun m!90197 () Bool)

(assert (=> b!57207 m!90197))

(declare-fun m!90199 () Bool)

(assert (=> b!57207 m!90199))

(declare-fun m!90201 () Bool)

(assert (=> b!57207 m!90201))

(declare-fun m!90203 () Bool)

(assert (=> b!57206 m!90203))

(declare-fun m!90205 () Bool)

(assert (=> b!57208 m!90205))

(declare-fun m!90207 () Bool)

(assert (=> b!57208 m!90207))

(declare-fun m!90209 () Bool)

(assert (=> b!57208 m!90209))

(declare-fun m!90211 () Bool)

(assert (=> b!57209 m!90211))

(declare-fun m!90213 () Bool)

(assert (=> b!57210 m!90213))

(assert (=> b!57210 m!90213))

(declare-fun m!90215 () Bool)

(assert (=> b!57210 m!90215))

(declare-fun m!90217 () Bool)

(assert (=> b!57210 m!90217))

(assert (=> b!57210 m!90217))

(declare-fun m!90219 () Bool)

(assert (=> b!57210 m!90219))

(declare-fun m!90221 () Bool)

(assert (=> b!57205 m!90221))

(declare-fun m!90223 () Bool)

(assert (=> b!57211 m!90223))

(declare-fun m!90225 () Bool)

(assert (=> b!57211 m!90225))

(declare-fun m!90227 () Bool)

(assert (=> b!57211 m!90227))

(declare-fun m!90229 () Bool)

(assert (=> b!57211 m!90229))

(assert (=> b!57211 m!90225))

(declare-fun m!90231 () Bool)

(assert (=> b!57211 m!90231))

(push 1)

(assert (not b!57207))

(assert (not b!57211))

(assert (not b!57209))

(assert (not b!57206))

(assert (not b!57202))

(assert (not b!57208))

(assert (not b!57205))

(assert (not b!57210))

(assert (not b!57203))

(assert (not start!11580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18254 () Bool)

(assert (=> d!18254 (= (array_inv!1093 srcBuffer!2) (bvsge (size!1190 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11580 d!18254))

(declare-fun d!18256 () Bool)

(assert (=> d!18256 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3166 thiss!1379) (currentByte!3171 thiss!1379) (size!1190 (buf!1565 thiss!1379))))))

(declare-fun bs!4552 () Bool)

(assert (= bs!4552 d!18256))

(declare-fun m!90341 () Bool)

(assert (=> bs!4552 m!90341))

(assert (=> start!11580 d!18256))

(declare-fun d!18258 () Bool)

(declare-fun e!38036 () Bool)

(assert (=> d!18258 e!38036))

(declare-fun res!47606 () Bool)

(assert (=> d!18258 (=> (not res!47606) (not e!38036))))

(declare-fun lt!90311 () (_ BitVec 64))

(declare-fun lt!90312 () (_ BitVec 64))

(declare-fun lt!90313 () (_ BitVec 64))

(assert (=> d!18258 (= res!47606 (= lt!90311 (bvsub lt!90312 lt!90313)))))

(assert (=> d!18258 (or (= (bvand lt!90312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90312 lt!90313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18258 (= lt!90313 (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232)))))))

(declare-fun lt!90316 () (_ BitVec 64))

(declare-fun lt!90315 () (_ BitVec 64))

(assert (=> d!18258 (= lt!90312 (bvmul lt!90316 lt!90315))))

(assert (=> d!18258 (or (= lt!90316 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90315 (bvsdiv (bvmul lt!90316 lt!90315) lt!90316)))))

(assert (=> d!18258 (= lt!90315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18258 (= lt!90316 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))))))

(assert (=> d!18258 (= lt!90311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232)))))))

(assert (=> d!18258 (invariant!0 (currentBit!3166 (_2!2716 lt!90232)) (currentByte!3171 (_2!2716 lt!90232)) (size!1190 (buf!1565 (_2!2716 lt!90232))))))

(assert (=> d!18258 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))) lt!90311)))

(declare-fun b!57285 () Bool)

(declare-fun res!47607 () Bool)

(assert (=> b!57285 (=> (not res!47607) (not e!38036))))

(assert (=> b!57285 (= res!47607 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90311))))

(declare-fun b!57286 () Bool)

(declare-fun lt!90314 () (_ BitVec 64))

(assert (=> b!57286 (= e!38036 (bvsle lt!90311 (bvmul lt!90314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57286 (or (= lt!90314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90314)))))

(assert (=> b!57286 (= lt!90314 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))))))

(assert (= (and d!18258 res!47606) b!57285))

(assert (= (and b!57285 res!47607) b!57286))

(declare-fun m!90343 () Bool)

(assert (=> d!18258 m!90343))

(declare-fun m!90345 () Bool)

(assert (=> d!18258 m!90345))

(assert (=> b!57206 d!18258))

(declare-fun d!18260 () Bool)

(declare-fun res!47616 () Bool)

(declare-fun e!38042 () Bool)

(assert (=> d!18260 (=> (not res!47616) (not e!38042))))

(assert (=> d!18260 (= res!47616 (= (size!1190 (buf!1565 thiss!1379)) (size!1190 (buf!1565 (_2!2716 lt!90232)))))))

(assert (=> d!18260 (= (isPrefixOf!0 thiss!1379 (_2!2716 lt!90232)) e!38042)))

(declare-fun b!57293 () Bool)

(declare-fun res!47615 () Bool)

(assert (=> b!57293 (=> (not res!47615) (not e!38042))))

(assert (=> b!57293 (= res!47615 (bvsle (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)) (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232)))))))

(declare-fun b!57294 () Bool)

(declare-fun e!38041 () Bool)

(assert (=> b!57294 (= e!38042 e!38041)))

(declare-fun res!47614 () Bool)

(assert (=> b!57294 (=> res!47614 e!38041)))

(assert (=> b!57294 (= res!47614 (= (size!1190 (buf!1565 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57295 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2623 array!2623 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57295 (= e!38041 (arrayBitRangesEq!0 (buf!1565 thiss!1379) (buf!1565 (_2!2716 lt!90232)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379))))))

(assert (= (and d!18260 res!47616) b!57293))

(assert (= (and b!57293 res!47615) b!57294))

(assert (= (and b!57294 (not res!47614)) b!57295))

(assert (=> b!57293 m!90209))

(assert (=> b!57293 m!90203))

(assert (=> b!57295 m!90209))

(assert (=> b!57295 m!90209))

(declare-fun m!90347 () Bool)

(assert (=> b!57295 m!90347))

(assert (=> b!57211 d!18260))

(declare-fun d!18262 () Bool)

(assert (=> d!18262 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4553 () Bool)

(assert (= bs!4553 d!18262))

(assert (=> bs!4553 m!90343))

(assert (=> b!57211 d!18262))

(declare-fun d!18264 () Bool)

(declare-fun e!38045 () Bool)

(assert (=> d!18264 e!38045))

(declare-fun res!47619 () Bool)

(assert (=> d!18264 (=> (not res!47619) (not e!38045))))

(assert (=> d!18264 (= res!47619 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!90319 () Unit!3955)

(declare-fun choose!27 (BitStream!2068 BitStream!2068 (_ BitVec 64) (_ BitVec 64)) Unit!3955)

(assert (=> d!18264 (= lt!90319 (choose!27 thiss!1379 (_2!2716 lt!90232) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18264 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18264 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2716 lt!90232) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90319)))

(declare-fun b!57298 () Bool)

(assert (=> b!57298 (= e!38045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18264 res!47619) b!57298))

(declare-fun m!90349 () Bool)

(assert (=> d!18264 m!90349))

(assert (=> b!57298 m!90227))

(assert (=> b!57211 d!18264))

(declare-fun b!57328 () Bool)

(declare-fun e!38066 () Bool)

(declare-fun e!38063 () Bool)

(assert (=> b!57328 (= e!38066 e!38063)))

(declare-fun res!47650 () Bool)

(assert (=> b!57328 (=> (not res!47650) (not e!38063))))

(declare-fun lt!90357 () (_ BitVec 8))

(declare-fun lt!90354 () tuple2!5210)

(declare-datatypes ((tuple2!5230 0))(
  ( (tuple2!5231 (_1!2726 BitStream!2068) (_2!2726 Bool)) )
))
(declare-fun lt!90349 () tuple2!5230)

(assert (=> b!57328 (= res!47650 (and (= (_2!2726 lt!90349) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!90357)) #b00000000000000000000000000000000))) (= (_1!2726 lt!90349) (_2!2716 lt!90354))))))

(declare-datatypes ((tuple2!5232 0))(
  ( (tuple2!5233 (_1!2727 array!2623) (_2!2727 BitStream!2068)) )
))
(declare-fun lt!90358 () tuple2!5232)

(declare-fun lt!90352 () BitStream!2068)

(declare-fun readBits!0 (BitStream!2068 (_ BitVec 64)) tuple2!5232)

(assert (=> b!57328 (= lt!90358 (readBits!0 lt!90352 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2068) tuple2!5230)

(assert (=> b!57328 (= lt!90349 (readBitPure!0 lt!90352))))

(declare-fun readerFrom!0 (BitStream!2068 (_ BitVec 32) (_ BitVec 32)) BitStream!2068)

(assert (=> b!57328 (= lt!90352 (readerFrom!0 (_2!2716 lt!90354) (currentBit!3166 thiss!1379) (currentByte!3171 thiss!1379)))))

(declare-fun b!57329 () Bool)

(assert (=> b!57329 (= e!38063 (= (bitIndex!0 (size!1190 (buf!1565 (_1!2726 lt!90349))) (currentByte!3171 (_1!2726 lt!90349)) (currentBit!3166 (_1!2726 lt!90349))) (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90354))) (currentByte!3171 (_2!2716 lt!90354)) (currentBit!3166 (_2!2716 lt!90354)))))))

(declare-fun b!57330 () Bool)

(declare-fun res!47655 () Bool)

(assert (=> b!57330 (=> (not res!47655) (not e!38066))))

(declare-fun lt!90350 () (_ BitVec 64))

(declare-fun lt!90347 () (_ BitVec 64))

(assert (=> b!57330 (= res!47655 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90354))) (currentByte!3171 (_2!2716 lt!90354)) (currentBit!3166 (_2!2716 lt!90354))) (bvadd lt!90347 lt!90350)))))

(assert (=> b!57330 (or (not (= (bvand lt!90347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90350 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90347 lt!90350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57330 (= lt!90350 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57330 (= lt!90347 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)))))

(declare-fun b!57331 () Bool)

(declare-fun res!47651 () Bool)

(declare-fun e!38064 () Bool)

(assert (=> b!57331 (=> (not res!47651) (not e!38064))))

(declare-fun lt!90351 () tuple2!5210)

(assert (=> b!57331 (= res!47651 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90351))) (currentByte!3171 (_2!2716 lt!90351)) (currentBit!3166 (_2!2716 lt!90351))) (bvadd (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57332 () Bool)

(declare-fun res!47648 () Bool)

(assert (=> b!57332 (=> (not res!47648) (not e!38064))))

(assert (=> b!57332 (= res!47648 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90351)))))

(declare-fun b!57333 () Bool)

(declare-fun e!38065 () Bool)

(declare-fun lt!90355 () tuple2!5230)

(assert (=> b!57333 (= e!38065 (= (bitIndex!0 (size!1190 (buf!1565 (_1!2726 lt!90355))) (currentByte!3171 (_1!2726 lt!90355)) (currentBit!3166 (_1!2726 lt!90355))) (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90351))) (currentByte!3171 (_2!2716 lt!90351)) (currentBit!3166 (_2!2716 lt!90351)))))))

(declare-fun d!18266 () Bool)

(assert (=> d!18266 e!38066))

(declare-fun res!47654 () Bool)

(assert (=> d!18266 (=> (not res!47654) (not e!38066))))

(assert (=> d!18266 (= res!47654 (= (size!1190 (buf!1565 (_2!2716 lt!90354))) (size!1190 (buf!1565 thiss!1379))))))

(declare-fun lt!90348 () array!2623)

(assert (=> d!18266 (= lt!90357 (select (arr!1748 lt!90348) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18266 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1190 lt!90348)))))

(assert (=> d!18266 (= lt!90348 (array!2624 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!90353 () tuple2!5210)

(assert (=> d!18266 (= lt!90354 (tuple2!5211 (_1!2716 lt!90353) (_2!2716 lt!90353)))))

(assert (=> d!18266 (= lt!90353 lt!90351)))

(assert (=> d!18266 e!38064))

(declare-fun res!47652 () Bool)

(assert (=> d!18266 (=> (not res!47652) (not e!38064))))

(assert (=> d!18266 (= res!47652 (= (size!1190 (buf!1565 thiss!1379)) (size!1190 (buf!1565 (_2!2716 lt!90351)))))))

(declare-fun lt!90356 () Bool)

(declare-fun appendBit!0 (BitStream!2068 Bool) tuple2!5210)

(assert (=> d!18266 (= lt!90351 (appendBit!0 thiss!1379 lt!90356))))

(assert (=> d!18266 (= lt!90356 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18266 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18266 (= (appendBitFromByte!0 thiss!1379 (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!90354)))

(declare-fun b!57334 () Bool)

(assert (=> b!57334 (= e!38064 e!38065)))

(declare-fun res!47649 () Bool)

(assert (=> b!57334 (=> (not res!47649) (not e!38065))))

(assert (=> b!57334 (= res!47649 (and (= (_2!2726 lt!90355) lt!90356) (= (_1!2726 lt!90355) (_2!2716 lt!90351))))))

(assert (=> b!57334 (= lt!90355 (readBitPure!0 (readerFrom!0 (_2!2716 lt!90351) (currentBit!3166 thiss!1379) (currentByte!3171 thiss!1379))))))

(declare-fun b!57335 () Bool)

(declare-fun res!47653 () Bool)

(assert (=> b!57335 (=> (not res!47653) (not e!38066))))

(assert (=> b!57335 (= res!47653 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90354)))))

(assert (= (and d!18266 res!47652) b!57331))

(assert (= (and b!57331 res!47651) b!57332))

(assert (= (and b!57332 res!47648) b!57334))

(assert (= (and b!57334 res!47649) b!57333))

(assert (= (and d!18266 res!47654) b!57330))

(assert (= (and b!57330 res!47655) b!57335))

(assert (= (and b!57335 res!47653) b!57328))

(assert (= (and b!57328 res!47650) b!57329))

(declare-fun m!90359 () Bool)

(assert (=> d!18266 m!90359))

(declare-fun m!90361 () Bool)

(assert (=> d!18266 m!90361))

(declare-fun m!90363 () Bool)

(assert (=> d!18266 m!90363))

(declare-fun m!90365 () Bool)

(assert (=> b!57330 m!90365))

(assert (=> b!57330 m!90209))

(declare-fun m!90367 () Bool)

(assert (=> b!57334 m!90367))

(assert (=> b!57334 m!90367))

(declare-fun m!90369 () Bool)

(assert (=> b!57334 m!90369))

(declare-fun m!90371 () Bool)

(assert (=> b!57333 m!90371))

(declare-fun m!90373 () Bool)

(assert (=> b!57333 m!90373))

(declare-fun m!90375 () Bool)

(assert (=> b!57329 m!90375))

(assert (=> b!57329 m!90365))

(declare-fun m!90377 () Bool)

(assert (=> b!57328 m!90377))

(declare-fun m!90379 () Bool)

(assert (=> b!57328 m!90379))

(declare-fun m!90381 () Bool)

(assert (=> b!57328 m!90381))

(assert (=> b!57331 m!90373))

(assert (=> b!57331 m!90209))

(declare-fun m!90383 () Bool)

(assert (=> b!57332 m!90383))

(declare-fun m!90385 () Bool)

(assert (=> b!57335 m!90385))

(assert (=> b!57211 d!18266))

(declare-fun d!18278 () Bool)

(assert (=> d!18278 (= (array_inv!1093 (buf!1565 thiss!1379)) (bvsge (size!1190 (buf!1565 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57205 d!18278))

(declare-fun d!18280 () Bool)

(assert (=> d!18280 (= (head!428 (byteArrayBitContentToList!0 (_2!2716 lt!90232) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!724 (byteArrayBitContentToList!0 (_2!2716 lt!90232) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57210 d!18280))

(declare-fun d!18282 () Bool)

(declare-fun c!4140 () Bool)

(assert (=> d!18282 (= c!4140 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38069 () List!609)

(assert (=> d!18282 (= (byteArrayBitContentToList!0 (_2!2716 lt!90232) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38069)))

(declare-fun b!57340 () Bool)

(assert (=> b!57340 (= e!38069 Nil!606)))

(declare-fun b!57341 () Bool)

(assert (=> b!57341 (= e!38069 (Cons!605 (not (= (bvand ((_ sign_extend 24) (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2716 lt!90232) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18282 c!4140) b!57340))

(assert (= (and d!18282 (not c!4140)) b!57341))

(assert (=> b!57341 m!90225))

(assert (=> b!57341 m!90363))

(declare-fun m!90387 () Bool)

(assert (=> b!57341 m!90387))

(assert (=> b!57210 d!18282))

(declare-fun d!18284 () Bool)

(assert (=> d!18284 (= (head!428 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90232) (_1!2717 lt!90231) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!724 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90232) (_1!2717 lt!90231) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57210 d!18284))

(declare-fun d!18286 () Bool)

(declare-fun e!38074 () Bool)

(assert (=> d!18286 e!38074))

(declare-fun c!4146 () Bool)

(assert (=> d!18286 (= c!4146 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!90367 () List!609)

(declare-datatypes ((tuple2!5234 0))(
  ( (tuple2!5235 (_1!2728 List!609) (_2!2728 BitStream!2068)) )
))
(declare-fun e!38075 () tuple2!5234)

(assert (=> d!18286 (= lt!90367 (_1!2728 e!38075))))

(declare-fun c!4145 () Bool)

(assert (=> d!18286 (= c!4145 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18286 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18286 (= (bitStreamReadBitsIntoList!0 (_2!2716 lt!90232) (_1!2717 lt!90231) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90367)))

(declare-fun b!57353 () Bool)

(declare-fun length!289 (List!609) Int)

(assert (=> b!57353 (= e!38074 (> (length!289 lt!90367) 0))))

(declare-datatypes ((tuple2!5236 0))(
  ( (tuple2!5237 (_1!2729 Bool) (_2!2729 BitStream!2068)) )
))
(declare-fun lt!90366 () tuple2!5236)

(declare-fun lt!90365 () (_ BitVec 64))

(declare-fun b!57351 () Bool)

(assert (=> b!57351 (= e!38075 (tuple2!5235 (Cons!605 (_1!2729 lt!90366) (bitStreamReadBitsIntoList!0 (_2!2716 lt!90232) (_2!2729 lt!90366) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!90365))) (_2!2729 lt!90366)))))

(declare-fun readBit!0 (BitStream!2068) tuple2!5236)

(assert (=> b!57351 (= lt!90366 (readBit!0 (_1!2717 lt!90231)))))

(assert (=> b!57351 (= lt!90365 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57350 () Bool)

(assert (=> b!57350 (= e!38075 (tuple2!5235 Nil!606 (_1!2717 lt!90231)))))

(declare-fun b!57352 () Bool)

(declare-fun isEmpty!175 (List!609) Bool)

(assert (=> b!57352 (= e!38074 (isEmpty!175 lt!90367))))

(assert (= (and d!18286 c!4145) b!57350))

(assert (= (and d!18286 (not c!4145)) b!57351))

(assert (= (and d!18286 c!4146) b!57352))

(assert (= (and d!18286 (not c!4146)) b!57353))

(declare-fun m!90389 () Bool)

(assert (=> b!57353 m!90389))

(declare-fun m!90391 () Bool)

(assert (=> b!57351 m!90391))

(declare-fun m!90393 () Bool)

(assert (=> b!57351 m!90393))

(declare-fun m!90395 () Bool)

(assert (=> b!57352 m!90395))

(assert (=> b!57210 d!18286))

(declare-fun d!18288 () Bool)

(assert (=> d!18288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4556 () Bool)

(assert (= bs!4556 d!18288))

(declare-fun m!90397 () Bool)

(assert (=> bs!4556 m!90397))

(assert (=> b!57209 d!18288))

(declare-fun d!18290 () Bool)

(assert (=> d!18290 (= (invariant!0 (currentBit!3166 (_2!2716 lt!90227)) (currentByte!3171 (_2!2716 lt!90227)) (size!1190 (buf!1565 (_2!2716 lt!90227)))) (and (bvsge (currentBit!3166 (_2!2716 lt!90227)) #b00000000000000000000000000000000) (bvslt (currentBit!3166 (_2!2716 lt!90227)) #b00000000000000000000000000001000) (bvsge (currentByte!3171 (_2!2716 lt!90227)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3171 (_2!2716 lt!90227)) (size!1190 (buf!1565 (_2!2716 lt!90227)))) (and (= (currentBit!3166 (_2!2716 lt!90227)) #b00000000000000000000000000000000) (= (currentByte!3171 (_2!2716 lt!90227)) (size!1190 (buf!1565 (_2!2716 lt!90227))))))))))

(assert (=> b!57203 d!18290))

(declare-fun d!18292 () Bool)

(declare-fun res!47658 () Bool)

(declare-fun e!38077 () Bool)

(assert (=> d!18292 (=> (not res!47658) (not e!38077))))

(assert (=> d!18292 (= res!47658 (= (size!1190 (buf!1565 thiss!1379)) (size!1190 (buf!1565 thiss!1379))))))

(assert (=> d!18292 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38077)))

(declare-fun b!57354 () Bool)

(declare-fun res!47657 () Bool)

(assert (=> b!57354 (=> (not res!47657) (not e!38077))))

(assert (=> b!57354 (= res!47657 (bvsle (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)) (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379))))))

(declare-fun b!57355 () Bool)

(declare-fun e!38076 () Bool)

(assert (=> b!57355 (= e!38077 e!38076)))

(declare-fun res!47656 () Bool)

(assert (=> b!57355 (=> res!47656 e!38076)))

(assert (=> b!57355 (= res!47656 (= (size!1190 (buf!1565 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57356 () Bool)

(assert (=> b!57356 (= e!38076 (arrayBitRangesEq!0 (buf!1565 thiss!1379) (buf!1565 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379))))))

(assert (= (and d!18292 res!47658) b!57354))

(assert (= (and b!57354 res!47657) b!57355))

(assert (= (and b!57355 (not res!47656)) b!57356))

(assert (=> b!57354 m!90209))

(assert (=> b!57354 m!90209))

(assert (=> b!57356 m!90209))

(assert (=> b!57356 m!90209))

(declare-fun m!90399 () Bool)

(assert (=> b!57356 m!90399))

(assert (=> b!57208 d!18292))

(declare-fun d!18294 () Bool)

(assert (=> d!18294 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90370 () Unit!3955)

(declare-fun choose!11 (BitStream!2068) Unit!3955)

(assert (=> d!18294 (= lt!90370 (choose!11 thiss!1379))))

(assert (=> d!18294 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!90370)))

(declare-fun bs!4558 () Bool)

(assert (= bs!4558 d!18294))

(assert (=> bs!4558 m!90205))

(declare-fun m!90401 () Bool)

(assert (=> bs!4558 m!90401))

(assert (=> b!57208 d!18294))

(declare-fun d!18296 () Bool)

(declare-fun e!38078 () Bool)

(assert (=> d!18296 e!38078))

(declare-fun res!47659 () Bool)

(assert (=> d!18296 (=> (not res!47659) (not e!38078))))

(declare-fun lt!90372 () (_ BitVec 64))

(declare-fun lt!90373 () (_ BitVec 64))

(declare-fun lt!90371 () (_ BitVec 64))

(assert (=> d!18296 (= res!47659 (= lt!90371 (bvsub lt!90372 lt!90373)))))

(assert (=> d!18296 (or (= (bvand lt!90372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90373 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90372 lt!90373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18296 (= lt!90373 (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379))))))

(declare-fun lt!90376 () (_ BitVec 64))

(declare-fun lt!90375 () (_ BitVec 64))

(assert (=> d!18296 (= lt!90372 (bvmul lt!90376 lt!90375))))

(assert (=> d!18296 (or (= lt!90376 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90375 (bvsdiv (bvmul lt!90376 lt!90375) lt!90376)))))

(assert (=> d!18296 (= lt!90375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18296 (= lt!90376 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))))))

(assert (=> d!18296 (= lt!90371 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3171 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3166 thiss!1379))))))

(assert (=> d!18296 (invariant!0 (currentBit!3166 thiss!1379) (currentByte!3171 thiss!1379) (size!1190 (buf!1565 thiss!1379)))))

(assert (=> d!18296 (= (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)) lt!90371)))

(declare-fun b!57357 () Bool)

(declare-fun res!47660 () Bool)

(assert (=> b!57357 (=> (not res!47660) (not e!38078))))

(assert (=> b!57357 (= res!47660 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90371))))

(declare-fun b!57358 () Bool)

(declare-fun lt!90374 () (_ BitVec 64))

(assert (=> b!57358 (= e!38078 (bvsle lt!90371 (bvmul lt!90374 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57358 (or (= lt!90374 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90374 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90374)))))

(assert (=> b!57358 (= lt!90374 ((_ sign_extend 32) (size!1190 (buf!1565 thiss!1379))))))

(assert (= (and d!18296 res!47659) b!57357))

(assert (= (and b!57357 res!47660) b!57358))

(assert (=> d!18296 m!90397))

(assert (=> d!18296 m!90341))

(assert (=> b!57208 d!18296))

(declare-fun d!18298 () Bool)

(declare-fun e!38079 () Bool)

(assert (=> d!18298 e!38079))

(declare-fun res!47661 () Bool)

(assert (=> d!18298 (=> (not res!47661) (not e!38079))))

(declare-fun lt!90377 () (_ BitVec 64))

(declare-fun lt!90378 () (_ BitVec 64))

(declare-fun lt!90379 () (_ BitVec 64))

(assert (=> d!18298 (= res!47661 (= lt!90377 (bvsub lt!90378 lt!90379)))))

(assert (=> d!18298 (or (= (bvand lt!90378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90378 lt!90379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18298 (= lt!90379 (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90227)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90227))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90227)))))))

(declare-fun lt!90382 () (_ BitVec 64))

(declare-fun lt!90381 () (_ BitVec 64))

(assert (=> d!18298 (= lt!90378 (bvmul lt!90382 lt!90381))))

(assert (=> d!18298 (or (= lt!90382 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90381 (bvsdiv (bvmul lt!90382 lt!90381) lt!90382)))))

(assert (=> d!18298 (= lt!90381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18298 (= lt!90382 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90227)))))))

(assert (=> d!18298 (= lt!90377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90227))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90227)))))))

(assert (=> d!18298 (invariant!0 (currentBit!3166 (_2!2716 lt!90227)) (currentByte!3171 (_2!2716 lt!90227)) (size!1190 (buf!1565 (_2!2716 lt!90227))))))

(assert (=> d!18298 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90227))) (currentByte!3171 (_2!2716 lt!90227)) (currentBit!3166 (_2!2716 lt!90227))) lt!90377)))

(declare-fun b!57359 () Bool)

(declare-fun res!47662 () Bool)

(assert (=> b!57359 (=> (not res!47662) (not e!38079))))

(assert (=> b!57359 (= res!47662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90377))))

(declare-fun b!57360 () Bool)

(declare-fun lt!90380 () (_ BitVec 64))

(assert (=> b!57360 (= e!38079 (bvsle lt!90377 (bvmul lt!90380 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57360 (or (= lt!90380 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90380 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90380)))))

(assert (=> b!57360 (= lt!90380 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90227)))))))

(assert (= (and d!18298 res!47661) b!57359))

(assert (= (and b!57359 res!47662) b!57360))

(declare-fun m!90403 () Bool)

(assert (=> d!18298 m!90403))

(assert (=> d!18298 m!90181))

(assert (=> b!57202 d!18298))

(declare-fun d!18300 () Bool)

(declare-fun e!38152 () Bool)

(assert (=> d!18300 e!38152))

(declare-fun res!47778 () Bool)

(assert (=> d!18300 (=> (not res!47778) (not e!38152))))

(declare-fun lt!90868 () (_ BitVec 64))

(declare-fun lt!90883 () tuple2!5210)

(assert (=> d!18300 (= res!47778 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90883))) (currentByte!3171 (_2!2716 lt!90883)) (currentBit!3166 (_2!2716 lt!90883))) (bvsub lt!90868 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18300 (or (= (bvand lt!90868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90868 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90864 () (_ BitVec 64))

(assert (=> d!18300 (= lt!90868 (bvadd lt!90864 to!314))))

(assert (=> d!18300 (or (not (= (bvand lt!90864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90864 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18300 (= lt!90864 (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))))))

(declare-fun e!38154 () tuple2!5210)

(assert (=> d!18300 (= lt!90883 e!38154)))

(declare-fun c!4166 () Bool)

(assert (=> d!18300 (= c!4166 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!90869 () Unit!3955)

(declare-fun lt!90885 () Unit!3955)

(assert (=> d!18300 (= lt!90869 lt!90885)))

(assert (=> d!18300 (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90232))))

(assert (=> d!18300 (= lt!90885 (lemmaIsPrefixRefl!0 (_2!2716 lt!90232)))))

(declare-fun lt!90879 () (_ BitVec 64))

(assert (=> d!18300 (= lt!90879 (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))))))

(assert (=> d!18300 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18300 (= (appendBitsMSBFirstLoop!0 (_2!2716 lt!90232) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!90883)))

(declare-fun b!57513 () Bool)

(declare-fun lt!90886 () tuple2!5212)

(assert (=> b!57513 (= e!38152 (= (bitStreamReadBitsIntoList!0 (_2!2716 lt!90883) (_1!2717 lt!90886) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2716 lt!90883) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57513 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57513 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90897 () Unit!3955)

(declare-fun lt!90866 () Unit!3955)

(assert (=> b!57513 (= lt!90897 lt!90866)))

(declare-fun lt!90867 () (_ BitVec 64))

(assert (=> b!57513 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90883)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) lt!90867)))

(assert (=> b!57513 (= lt!90866 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2716 lt!90232) (buf!1565 (_2!2716 lt!90883)) lt!90867))))

(declare-fun e!38153 () Bool)

(assert (=> b!57513 e!38153))

(declare-fun res!47775 () Bool)

(assert (=> b!57513 (=> (not res!47775) (not e!38153))))

(assert (=> b!57513 (= res!47775 (and (= (size!1190 (buf!1565 (_2!2716 lt!90232))) (size!1190 (buf!1565 (_2!2716 lt!90883)))) (bvsge lt!90867 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57513 (= lt!90867 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57513 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57513 (= lt!90886 (reader!0 (_2!2716 lt!90232) (_2!2716 lt!90883)))))

(declare-fun lt!90890 () tuple2!5210)

(declare-fun bm!748 () Bool)

(declare-fun call!753 () tuple2!5212)

(assert (=> bm!748 (= call!753 (reader!0 (_2!2716 lt!90232) (ite c!4166 (_2!2716 lt!90890) (_2!2716 lt!90232))))))

(declare-fun b!57514 () Bool)

(assert (=> b!57514 (= e!38153 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) lt!90867))))

(declare-fun b!57515 () Bool)

(declare-fun res!47777 () Bool)

(assert (=> b!57515 (=> (not res!47777) (not e!38152))))

(assert (=> b!57515 (= res!47777 (invariant!0 (currentBit!3166 (_2!2716 lt!90883)) (currentByte!3171 (_2!2716 lt!90883)) (size!1190 (buf!1565 (_2!2716 lt!90883)))))))

(declare-fun b!57516 () Bool)

(declare-fun res!47776 () Bool)

(assert (=> b!57516 (=> (not res!47776) (not e!38152))))

(assert (=> b!57516 (= res!47776 (= (size!1190 (buf!1565 (_2!2716 lt!90232))) (size!1190 (buf!1565 (_2!2716 lt!90883)))))))

(declare-fun b!57517 () Bool)

(declare-fun res!47780 () Bool)

(assert (=> b!57517 (=> (not res!47780) (not e!38152))))

(assert (=> b!57517 (= res!47780 (= (size!1190 (buf!1565 (_2!2716 lt!90883))) (size!1190 (buf!1565 (_2!2716 lt!90232)))))))

(declare-fun b!57518 () Bool)

(declare-fun Unit!3969 () Unit!3955)

(assert (=> b!57518 (= e!38154 (tuple2!5211 Unit!3969 (_2!2716 lt!90232)))))

(assert (=> b!57518 (= (size!1190 (buf!1565 (_2!2716 lt!90232))) (size!1190 (buf!1565 (_2!2716 lt!90232))))))

(declare-fun lt!90893 () Unit!3955)

(declare-fun Unit!3970 () Unit!3955)

(assert (=> b!57518 (= lt!90893 Unit!3970)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2068 array!2623 array!2623 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57518 (checkByteArrayBitContent!0 (_2!2716 lt!90232) srcBuffer!2 (_1!2727 (readBits!0 (_1!2717 call!753) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57519 () Bool)

(declare-fun res!47779 () Bool)

(assert (=> b!57519 (=> (not res!47779) (not e!38152))))

(assert (=> b!57519 (= res!47779 (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90883)))))

(declare-fun b!57520 () Bool)

(declare-fun lt!90887 () tuple2!5210)

(declare-fun Unit!3971 () Unit!3955)

(assert (=> b!57520 (= e!38154 (tuple2!5211 Unit!3971 (_2!2716 lt!90887)))))

(assert (=> b!57520 (= lt!90890 (appendBitFromByte!0 (_2!2716 lt!90232) (select (arr!1748 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!90888 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90888 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90881 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90894 () Unit!3955)

(assert (=> b!57520 (= lt!90894 (validateOffsetBitsIneqLemma!0 (_2!2716 lt!90232) (_2!2716 lt!90890) lt!90888 lt!90881))))

(assert (=> b!57520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90890)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90890))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90890))) (bvsub lt!90888 lt!90881))))

(declare-fun lt!90904 () Unit!3955)

(assert (=> b!57520 (= lt!90904 lt!90894)))

(declare-fun lt!90877 () tuple2!5212)

(assert (=> b!57520 (= lt!90877 call!753)))

(declare-fun lt!90901 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90901 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90889 () Unit!3955)

(assert (=> b!57520 (= lt!90889 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2716 lt!90232) (buf!1565 (_2!2716 lt!90890)) lt!90901))))

(assert (=> b!57520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90890)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) lt!90901)))

(declare-fun lt!90863 () Unit!3955)

(assert (=> b!57520 (= lt!90863 lt!90889)))

(assert (=> b!57520 (= (head!428 (byteArrayBitContentToList!0 (_2!2716 lt!90890) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!428 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90890) (_1!2717 lt!90877) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90876 () Unit!3955)

(declare-fun Unit!3972 () Unit!3955)

(assert (=> b!57520 (= lt!90876 Unit!3972)))

(assert (=> b!57520 (= lt!90887 (appendBitsMSBFirstLoop!0 (_2!2716 lt!90890) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!90899 () Unit!3955)

(assert (=> b!57520 (= lt!90899 (lemmaIsPrefixTransitive!0 (_2!2716 lt!90232) (_2!2716 lt!90890) (_2!2716 lt!90887)))))

(assert (=> b!57520 (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90887))))

(declare-fun lt!90878 () Unit!3955)

(assert (=> b!57520 (= lt!90878 lt!90899)))

(assert (=> b!57520 (= (size!1190 (buf!1565 (_2!2716 lt!90887))) (size!1190 (buf!1565 (_2!2716 lt!90232))))))

(declare-fun lt!90905 () Unit!3955)

(declare-fun Unit!3973 () Unit!3955)

(assert (=> b!57520 (= lt!90905 Unit!3973)))

(assert (=> b!57520 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90887))) (currentByte!3171 (_2!2716 lt!90887)) (currentBit!3166 (_2!2716 lt!90887))) (bvsub (bvadd (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90891 () Unit!3955)

(declare-fun Unit!3974 () Unit!3955)

(assert (=> b!57520 (= lt!90891 Unit!3974)))

(assert (=> b!57520 (= (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90887))) (currentByte!3171 (_2!2716 lt!90887)) (currentBit!3166 (_2!2716 lt!90887))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90890))) (currentByte!3171 (_2!2716 lt!90890)) (currentBit!3166 (_2!2716 lt!90890))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90892 () Unit!3955)

(declare-fun Unit!3975 () Unit!3955)

(assert (=> b!57520 (= lt!90892 Unit!3975)))

(declare-fun lt!90895 () tuple2!5212)

(assert (=> b!57520 (= lt!90895 (reader!0 (_2!2716 lt!90232) (_2!2716 lt!90887)))))

(declare-fun lt!90900 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90900 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90871 () Unit!3955)

(assert (=> b!57520 (= lt!90871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2716 lt!90232) (buf!1565 (_2!2716 lt!90887)) lt!90900))))

(assert (=> b!57520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90887)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90232))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90232))) lt!90900)))

(declare-fun lt!90874 () Unit!3955)

(assert (=> b!57520 (= lt!90874 lt!90871)))

(declare-fun lt!90882 () tuple2!5212)

(assert (=> b!57520 (= lt!90882 (reader!0 (_2!2716 lt!90890) (_2!2716 lt!90887)))))

(declare-fun lt!90903 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90903 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90870 () Unit!3955)

(assert (=> b!57520 (= lt!90870 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2716 lt!90890) (buf!1565 (_2!2716 lt!90887)) lt!90903))))

(assert (=> b!57520 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90887)))) ((_ sign_extend 32) (currentByte!3171 (_2!2716 lt!90890))) ((_ sign_extend 32) (currentBit!3166 (_2!2716 lt!90890))) lt!90903)))

(declare-fun lt!90880 () Unit!3955)

(assert (=> b!57520 (= lt!90880 lt!90870)))

(declare-fun lt!90872 () List!609)

(assert (=> b!57520 (= lt!90872 (byteArrayBitContentToList!0 (_2!2716 lt!90887) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90862 () List!609)

(assert (=> b!57520 (= lt!90862 (byteArrayBitContentToList!0 (_2!2716 lt!90887) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90865 () List!609)

(assert (=> b!57520 (= lt!90865 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90887) (_1!2717 lt!90895) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90875 () List!609)

(assert (=> b!57520 (= lt!90875 (bitStreamReadBitsIntoList!0 (_2!2716 lt!90887) (_1!2717 lt!90882) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90884 () (_ BitVec 64))

(assert (=> b!57520 (= lt!90884 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90896 () Unit!3955)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2068 BitStream!2068 BitStream!2068 BitStream!2068 (_ BitVec 64) List!609) Unit!3955)

(assert (=> b!57520 (= lt!90896 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2716 lt!90887) (_2!2716 lt!90887) (_1!2717 lt!90895) (_1!2717 lt!90882) lt!90884 lt!90865))))

(declare-fun tail!277 (List!609) List!609)

(assert (=> b!57520 (= (bitStreamReadBitsIntoList!0 (_2!2716 lt!90887) (_1!2717 lt!90882) (bvsub lt!90884 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!277 lt!90865))))

(declare-fun lt!90902 () Unit!3955)

(assert (=> b!57520 (= lt!90902 lt!90896)))

(declare-fun lt!90873 () Unit!3955)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2623 array!2623 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3955)

(assert (=> b!57520 (= lt!90873 (arrayBitRangesEqImpliesEq!0 (buf!1565 (_2!2716 lt!90890)) (buf!1565 (_2!2716 lt!90887)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!90879 (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90890))) (currentByte!3171 (_2!2716 lt!90890)) (currentBit!3166 (_2!2716 lt!90890)))))))

(declare-fun bitAt!0 (array!2623 (_ BitVec 64)) Bool)

(assert (=> b!57520 (= (bitAt!0 (buf!1565 (_2!2716 lt!90890)) lt!90879) (bitAt!0 (buf!1565 (_2!2716 lt!90887)) lt!90879))))

(declare-fun lt!90898 () Unit!3955)

(assert (=> b!57520 (= lt!90898 lt!90873)))

(assert (= (and d!18300 c!4166) b!57520))

(assert (= (and d!18300 (not c!4166)) b!57518))

(assert (= (or b!57520 b!57518) bm!748))

(assert (= (and d!18300 res!47778) b!57515))

(assert (= (and b!57515 res!47777) b!57516))

(assert (= (and b!57516 res!47776) b!57519))

(assert (= (and b!57519 res!47779) b!57517))

(assert (= (and b!57517 res!47780) b!57513))

(assert (= (and b!57513 res!47775) b!57514))

(declare-fun m!90611 () Bool)

(assert (=> b!57520 m!90611))

(declare-fun m!90613 () Bool)

(assert (=> b!57520 m!90613))

(declare-fun m!90615 () Bool)

(assert (=> b!57520 m!90615))

(declare-fun m!90617 () Bool)

(assert (=> b!57520 m!90617))

(declare-fun m!90619 () Bool)

(assert (=> b!57520 m!90619))

(declare-fun m!90621 () Bool)

(assert (=> b!57520 m!90621))

(declare-fun m!90623 () Bool)

(assert (=> b!57520 m!90623))

(declare-fun m!90625 () Bool)

(assert (=> b!57520 m!90625))

(declare-fun m!90627 () Bool)

(assert (=> b!57520 m!90627))

(declare-fun m!90629 () Bool)

(assert (=> b!57520 m!90629))

(declare-fun m!90631 () Bool)

(assert (=> b!57520 m!90631))

(declare-fun m!90633 () Bool)

(assert (=> b!57520 m!90633))

(declare-fun m!90635 () Bool)

(assert (=> b!57520 m!90635))

(assert (=> b!57520 m!90203))

(declare-fun m!90637 () Bool)

(assert (=> b!57520 m!90637))

(declare-fun m!90639 () Bool)

(assert (=> b!57520 m!90639))

(declare-fun m!90641 () Bool)

(assert (=> b!57520 m!90641))

(declare-fun m!90643 () Bool)

(assert (=> b!57520 m!90643))

(declare-fun m!90645 () Bool)

(assert (=> b!57520 m!90645))

(assert (=> b!57520 m!90621))

(declare-fun m!90647 () Bool)

(assert (=> b!57520 m!90647))

(declare-fun m!90649 () Bool)

(assert (=> b!57520 m!90649))

(declare-fun m!90651 () Bool)

(assert (=> b!57520 m!90651))

(declare-fun m!90653 () Bool)

(assert (=> b!57520 m!90653))

(declare-fun m!90655 () Bool)

(assert (=> b!57520 m!90655))

(assert (=> b!57520 m!90613))

(declare-fun m!90657 () Bool)

(assert (=> b!57520 m!90657))

(declare-fun m!90659 () Bool)

(assert (=> b!57520 m!90659))

(declare-fun m!90661 () Bool)

(assert (=> b!57520 m!90661))

(assert (=> b!57520 m!90641))

(declare-fun m!90663 () Bool)

(assert (=> b!57520 m!90663))

(assert (=> b!57520 m!90625))

(declare-fun m!90665 () Bool)

(assert (=> b!57520 m!90665))

(declare-fun m!90667 () Bool)

(assert (=> b!57520 m!90667))

(declare-fun m!90669 () Bool)

(assert (=> b!57520 m!90669))

(declare-fun m!90671 () Bool)

(assert (=> b!57520 m!90671))

(declare-fun m!90673 () Bool)

(assert (=> b!57515 m!90673))

(declare-fun m!90675 () Bool)

(assert (=> bm!748 m!90675))

(declare-fun m!90677 () Bool)

(assert (=> b!57519 m!90677))

(declare-fun m!90679 () Bool)

(assert (=> b!57514 m!90679))

(declare-fun m!90681 () Bool)

(assert (=> d!18300 m!90681))

(assert (=> d!18300 m!90203))

(declare-fun m!90683 () Bool)

(assert (=> d!18300 m!90683))

(declare-fun m!90685 () Bool)

(assert (=> d!18300 m!90685))

(declare-fun m!90687 () Bool)

(assert (=> b!57513 m!90687))

(declare-fun m!90689 () Bool)

(assert (=> b!57513 m!90689))

(declare-fun m!90691 () Bool)

(assert (=> b!57513 m!90691))

(declare-fun m!90693 () Bool)

(assert (=> b!57513 m!90693))

(declare-fun m!90695 () Bool)

(assert (=> b!57513 m!90695))

(declare-fun m!90697 () Bool)

(assert (=> b!57518 m!90697))

(declare-fun m!90699 () Bool)

(assert (=> b!57518 m!90699))

(assert (=> b!57207 d!18300))

(declare-fun b!57554 () Bool)

(declare-fun e!38169 () Unit!3955)

(declare-fun lt!91021 () Unit!3955)

(assert (=> b!57554 (= e!38169 lt!91021)))

(declare-fun lt!91005 () (_ BitVec 64))

(assert (=> b!57554 (= lt!91005 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91018 () (_ BitVec 64))

(assert (=> b!57554 (= lt!91018 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2623 array!2623 (_ BitVec 64) (_ BitVec 64)) Unit!3955)

(assert (=> b!57554 (= lt!91021 (arrayBitRangesEqSymmetric!0 (buf!1565 thiss!1379) (buf!1565 (_2!2716 lt!90232)) lt!91005 lt!91018))))

(assert (=> b!57554 (arrayBitRangesEq!0 (buf!1565 (_2!2716 lt!90232)) (buf!1565 thiss!1379) lt!91005 lt!91018)))

(declare-fun b!57555 () Bool)

(declare-fun Unit!3976 () Unit!3955)

(assert (=> b!57555 (= e!38169 Unit!3976)))

(declare-fun b!57556 () Bool)

(declare-fun e!38168 () Bool)

(declare-fun lt!91007 () (_ BitVec 64))

(declare-fun lt!91014 () tuple2!5212)

(declare-fun lt!91013 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2068 (_ BitVec 64)) BitStream!2068)

(assert (=> b!57556 (= e!38168 (= (_1!2717 lt!91014) (withMovedBitIndex!0 (_2!2717 lt!91014) (bvsub lt!91013 lt!91007))))))

(assert (=> b!57556 (or (= (bvand lt!91013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91013 lt!91007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57556 (= lt!91007 (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))))))

(assert (=> b!57556 (= lt!91013 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)))))

(declare-fun b!57558 () Bool)

(declare-fun res!47810 () Bool)

(assert (=> b!57558 (=> (not res!47810) (not e!38168))))

(assert (=> b!57558 (= res!47810 (isPrefixOf!0 (_1!2717 lt!91014) thiss!1379))))

(declare-fun b!57557 () Bool)

(declare-fun res!47809 () Bool)

(assert (=> b!57557 (=> (not res!47809) (not e!38168))))

(assert (=> b!57557 (= res!47809 (isPrefixOf!0 (_2!2717 lt!91014) (_2!2716 lt!90232)))))

(declare-fun d!18352 () Bool)

(assert (=> d!18352 e!38168))

(declare-fun res!47808 () Bool)

(assert (=> d!18352 (=> (not res!47808) (not e!38168))))

(assert (=> d!18352 (= res!47808 (isPrefixOf!0 (_1!2717 lt!91014) (_2!2717 lt!91014)))))

(declare-fun lt!91011 () BitStream!2068)

(assert (=> d!18352 (= lt!91014 (tuple2!5213 lt!91011 (_2!2716 lt!90232)))))

(declare-fun lt!91019 () Unit!3955)

(declare-fun lt!91010 () Unit!3955)

(assert (=> d!18352 (= lt!91019 lt!91010)))

(assert (=> d!18352 (isPrefixOf!0 lt!91011 (_2!2716 lt!90232))))

(assert (=> d!18352 (= lt!91010 (lemmaIsPrefixTransitive!0 lt!91011 (_2!2716 lt!90232) (_2!2716 lt!90232)))))

(declare-fun lt!91006 () Unit!3955)

(declare-fun lt!91023 () Unit!3955)

(assert (=> d!18352 (= lt!91006 lt!91023)))

(assert (=> d!18352 (isPrefixOf!0 lt!91011 (_2!2716 lt!90232))))

(assert (=> d!18352 (= lt!91023 (lemmaIsPrefixTransitive!0 lt!91011 thiss!1379 (_2!2716 lt!90232)))))

(declare-fun lt!91020 () Unit!3955)

(assert (=> d!18352 (= lt!91020 e!38169)))

(declare-fun c!4170 () Bool)

(assert (=> d!18352 (= c!4170 (not (= (size!1190 (buf!1565 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!91024 () Unit!3955)

(declare-fun lt!91017 () Unit!3955)

(assert (=> d!18352 (= lt!91024 lt!91017)))

(assert (=> d!18352 (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90232))))

(assert (=> d!18352 (= lt!91017 (lemmaIsPrefixRefl!0 (_2!2716 lt!90232)))))

(declare-fun lt!91015 () Unit!3955)

(declare-fun lt!91016 () Unit!3955)

(assert (=> d!18352 (= lt!91015 lt!91016)))

(assert (=> d!18352 (= lt!91016 (lemmaIsPrefixRefl!0 (_2!2716 lt!90232)))))

(declare-fun lt!91009 () Unit!3955)

(declare-fun lt!91008 () Unit!3955)

(assert (=> d!18352 (= lt!91009 lt!91008)))

(assert (=> d!18352 (isPrefixOf!0 lt!91011 lt!91011)))

(assert (=> d!18352 (= lt!91008 (lemmaIsPrefixRefl!0 lt!91011))))

(declare-fun lt!91012 () Unit!3955)

(declare-fun lt!91022 () Unit!3955)

(assert (=> d!18352 (= lt!91012 lt!91022)))

(assert (=> d!18352 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18352 (= lt!91022 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18352 (= lt!91011 (BitStream!2069 (buf!1565 (_2!2716 lt!90232)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)))))

(assert (=> d!18352 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90232))))

(assert (=> d!18352 (= (reader!0 thiss!1379 (_2!2716 lt!90232)) lt!91014)))

(assert (= (and d!18352 c!4170) b!57554))

(assert (= (and d!18352 (not c!4170)) b!57555))

(assert (= (and d!18352 res!47808) b!57558))

(assert (= (and b!57558 res!47810) b!57557))

(assert (= (and b!57557 res!47809) b!57556))

(declare-fun m!90797 () Bool)

(assert (=> b!57558 m!90797))

(assert (=> d!18352 m!90205))

(assert (=> d!18352 m!90223))

(declare-fun m!90799 () Bool)

(assert (=> d!18352 m!90799))

(assert (=> d!18352 m!90685))

(declare-fun m!90801 () Bool)

(assert (=> d!18352 m!90801))

(declare-fun m!90803 () Bool)

(assert (=> d!18352 m!90803))

(declare-fun m!90805 () Bool)

(assert (=> d!18352 m!90805))

(declare-fun m!90807 () Bool)

(assert (=> d!18352 m!90807))

(declare-fun m!90809 () Bool)

(assert (=> d!18352 m!90809))

(assert (=> d!18352 m!90683))

(assert (=> d!18352 m!90207))

(declare-fun m!90811 () Bool)

(assert (=> b!57557 m!90811))

(declare-fun m!90813 () Bool)

(assert (=> b!57556 m!90813))

(assert (=> b!57556 m!90203))

(assert (=> b!57556 m!90209))

(assert (=> b!57554 m!90209))

(declare-fun m!90815 () Bool)

(assert (=> b!57554 m!90815))

(declare-fun m!90817 () Bool)

(assert (=> b!57554 m!90817))

(assert (=> b!57207 d!18352))

(declare-fun d!18362 () Bool)

(declare-fun res!47813 () Bool)

(declare-fun e!38171 () Bool)

(assert (=> d!18362 (=> (not res!47813) (not e!38171))))

(assert (=> d!18362 (= res!47813 (= (size!1190 (buf!1565 (_2!2716 lt!90232))) (size!1190 (buf!1565 (_2!2716 lt!90227)))))))

(assert (=> d!18362 (= (isPrefixOf!0 (_2!2716 lt!90232) (_2!2716 lt!90227)) e!38171)))

(declare-fun b!57559 () Bool)

(declare-fun res!47812 () Bool)

(assert (=> b!57559 (=> (not res!47812) (not e!38171))))

(assert (=> b!57559 (= res!47812 (bvsle (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232))) (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90227))) (currentByte!3171 (_2!2716 lt!90227)) (currentBit!3166 (_2!2716 lt!90227)))))))

(declare-fun b!57560 () Bool)

(declare-fun e!38170 () Bool)

(assert (=> b!57560 (= e!38171 e!38170)))

(declare-fun res!47811 () Bool)

(assert (=> b!57560 (=> res!47811 e!38170)))

(assert (=> b!57560 (= res!47811 (= (size!1190 (buf!1565 (_2!2716 lt!90232))) #b00000000000000000000000000000000))))

(declare-fun b!57561 () Bool)

(assert (=> b!57561 (= e!38170 (arrayBitRangesEq!0 (buf!1565 (_2!2716 lt!90232)) (buf!1565 (_2!2716 lt!90227)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90232))) (currentByte!3171 (_2!2716 lt!90232)) (currentBit!3166 (_2!2716 lt!90232)))))))

(assert (= (and d!18362 res!47813) b!57559))

(assert (= (and b!57559 res!47812) b!57560))

(assert (= (and b!57560 (not res!47811)) b!57561))

(assert (=> b!57559 m!90203))

(assert (=> b!57559 m!90187))

(assert (=> b!57561 m!90203))

(assert (=> b!57561 m!90203))

(declare-fun m!90819 () Bool)

(assert (=> b!57561 m!90819))

(assert (=> b!57207 d!18362))

(declare-fun d!18364 () Bool)

(assert (=> d!18364 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4569 () Bool)

(assert (= bs!4569 d!18364))

(declare-fun m!90821 () Bool)

(assert (=> bs!4569 m!90821))

(assert (=> b!57207 d!18364))

(declare-fun d!18366 () Bool)

(declare-fun res!47816 () Bool)

(declare-fun e!38173 () Bool)

(assert (=> d!18366 (=> (not res!47816) (not e!38173))))

(assert (=> d!18366 (= res!47816 (= (size!1190 (buf!1565 thiss!1379)) (size!1190 (buf!1565 (_2!2716 lt!90227)))))))

(assert (=> d!18366 (= (isPrefixOf!0 thiss!1379 (_2!2716 lt!90227)) e!38173)))

(declare-fun b!57562 () Bool)

(declare-fun res!47815 () Bool)

(assert (=> b!57562 (=> (not res!47815) (not e!38173))))

(assert (=> b!57562 (= res!47815 (bvsle (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379)) (bitIndex!0 (size!1190 (buf!1565 (_2!2716 lt!90227))) (currentByte!3171 (_2!2716 lt!90227)) (currentBit!3166 (_2!2716 lt!90227)))))))

(declare-fun b!57563 () Bool)

(declare-fun e!38172 () Bool)

(assert (=> b!57563 (= e!38173 e!38172)))

(declare-fun res!47814 () Bool)

(assert (=> b!57563 (=> res!47814 e!38172)))

(assert (=> b!57563 (= res!47814 (= (size!1190 (buf!1565 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57564 () Bool)

(assert (=> b!57564 (= e!38172 (arrayBitRangesEq!0 (buf!1565 thiss!1379) (buf!1565 (_2!2716 lt!90227)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1190 (buf!1565 thiss!1379)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379))))))

(assert (= (and d!18366 res!47816) b!57562))

(assert (= (and b!57562 res!47815) b!57563))

(assert (= (and b!57563 (not res!47814)) b!57564))

(assert (=> b!57562 m!90209))

(assert (=> b!57562 m!90187))

(assert (=> b!57564 m!90209))

(assert (=> b!57564 m!90209))

(declare-fun m!90823 () Bool)

(assert (=> b!57564 m!90823))

(assert (=> b!57207 d!18366))

(declare-fun d!18368 () Bool)

(assert (=> d!18368 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90227))))

(declare-fun lt!91027 () Unit!3955)

(declare-fun choose!30 (BitStream!2068 BitStream!2068 BitStream!2068) Unit!3955)

(assert (=> d!18368 (= lt!91027 (choose!30 thiss!1379 (_2!2716 lt!90232) (_2!2716 lt!90227)))))

(assert (=> d!18368 (isPrefixOf!0 thiss!1379 (_2!2716 lt!90232))))

(assert (=> d!18368 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2716 lt!90232) (_2!2716 lt!90227)) lt!91027)))

(declare-fun bs!4570 () Bool)

(assert (= bs!4570 d!18368))

(assert (=> bs!4570 m!90199))

(declare-fun m!90825 () Bool)

(assert (=> bs!4570 m!90825))

(assert (=> bs!4570 m!90223))

(assert (=> b!57207 d!18368))

(declare-fun d!18370 () Bool)

(assert (=> d!18370 (validate_offset_bits!1 ((_ sign_extend 32) (size!1190 (buf!1565 (_2!2716 lt!90232)))) ((_ sign_extend 32) (currentByte!3171 thiss!1379)) ((_ sign_extend 32) (currentBit!3166 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91030 () Unit!3955)

(declare-fun choose!9 (BitStream!2068 array!2623 (_ BitVec 64) BitStream!2068) Unit!3955)

(assert (=> d!18370 (= lt!91030 (choose!9 thiss!1379 (buf!1565 (_2!2716 lt!90232)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2069 (buf!1565 (_2!2716 lt!90232)) (currentByte!3171 thiss!1379) (currentBit!3166 thiss!1379))))))

(assert (=> d!18370 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1565 (_2!2716 lt!90232)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91030)))

(declare-fun bs!4571 () Bool)

(assert (= bs!4571 d!18370))

(assert (=> bs!4571 m!90191))

(declare-fun m!90827 () Bool)

(assert (=> bs!4571 m!90827))

(assert (=> b!57207 d!18370))

(push 1)

(assert (not b!57520))

(assert (not d!18364))

(assert (not d!18298))

(assert (not b!57298))

(assert (not b!57515))

(assert (not b!57564))

(assert (not d!18370))

(assert (not b!57334))

(assert (not b!57559))

(assert (not d!18294))

(assert (not b!57558))

(assert (not b!57513))

(assert (not b!57562))

(assert (not b!57293))

(assert (not b!57341))

(assert (not d!18258))

(assert (not b!57514))

(assert (not b!57335))

(assert (not b!57556))

(assert (not b!57329))

(assert (not d!18368))

(assert (not b!57351))

(assert (not d!18296))

(assert (not b!57330))

(assert (not b!57554))

(assert (not d!18288))

(assert (not b!57356))

(assert (not d!18352))

(assert (not b!57557))

(assert (not d!18300))

(assert (not d!18262))

(assert (not d!18256))

(assert (not b!57354))

(assert (not b!57332))

(assert (not b!57561))

(assert (not d!18266))

(assert (not b!57328))

(assert (not b!57331))

(assert (not bm!748))

(assert (not b!57333))

(assert (not b!57352))

(assert (not b!57519))

(assert (not d!18264))

(assert (not b!57518))

(assert (not b!57353))

(assert (not b!57295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

