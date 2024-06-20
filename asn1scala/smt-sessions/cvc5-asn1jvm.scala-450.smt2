; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11892 () Bool)

(assert start!11892)

(declare-fun b!60356 () Bool)

(declare-fun res!50324 () Bool)

(declare-fun e!40261 () Bool)

(assert (=> b!60356 (=> res!50324 e!40261)))

(declare-datatypes ((array!2749 0))(
  ( (array!2750 (arr!1814 (Array (_ BitVec 32) (_ BitVec 8))) (size!1250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2188 0))(
  ( (BitStream!2189 (buf!1631 array!2749) (currentByte!3249 (_ BitVec 32)) (currentBit!3244 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4123 0))(
  ( (Unit!4124) )
))
(declare-datatypes ((tuple2!5498 0))(
  ( (tuple2!5499 (_1!2860 Unit!4123) (_2!2860 BitStream!2188)) )
))
(declare-fun lt!94219 () tuple2!5498)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60356 (= res!50324 (not (invariant!0 (currentBit!3244 (_2!2860 lt!94219)) (currentByte!3249 (_2!2860 lt!94219)) (size!1250 (buf!1631 (_2!2860 lt!94219))))))))

(declare-fun b!60357 () Bool)

(declare-fun res!50331 () Bool)

(declare-fun e!40264 () Bool)

(assert (=> b!60357 (=> res!50331 e!40264)))

(declare-fun lt!94220 () tuple2!5498)

(assert (=> b!60357 (= res!50331 (not (invariant!0 (currentBit!3244 (_2!2860 lt!94220)) (currentByte!3249 (_2!2860 lt!94220)) (size!1250 (buf!1631 (_2!2860 lt!94220))))))))

(declare-fun b!60358 () Bool)

(declare-fun e!40271 () Bool)

(declare-fun thiss!1379 () BitStream!2188)

(declare-fun array_inv!1153 (array!2749) Bool)

(assert (=> b!60358 (= e!40271 (array_inv!1153 (buf!1631 thiss!1379)))))

(declare-fun b!60360 () Bool)

(declare-fun e!40263 () Bool)

(assert (=> b!60360 (= e!40263 e!40261)))

(declare-fun res!50327 () Bool)

(assert (=> b!60360 (=> res!50327 e!40261)))

(declare-fun lt!94225 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!94217 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60360 (= res!50327 (not (= lt!94225 (bvsub (bvadd lt!94217 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60360 (= lt!94225 (bitIndex!0 (size!1250 (buf!1631 (_2!2860 lt!94219))) (currentByte!3249 (_2!2860 lt!94219)) (currentBit!3244 (_2!2860 lt!94219))))))

(declare-fun b!60361 () Bool)

(declare-fun e!40269 () Bool)

(assert (=> b!60361 (= e!40269 true)))

(declare-fun lt!94212 () Int)

(declare-datatypes ((List!669 0))(
  ( (Nil!666) (Cons!665 (h!784 Bool) (t!1419 List!669)) )
))
(declare-fun lt!94214 () List!669)

(declare-fun length!297 (List!669) Int)

(assert (=> b!60361 (= lt!94212 (length!297 lt!94214))))

(declare-fun b!60362 () Bool)

(declare-fun e!40266 () Bool)

(declare-fun e!40267 () Bool)

(assert (=> b!60362 (= e!40266 (not e!40267))))

(declare-fun res!50330 () Bool)

(assert (=> b!60362 (=> res!50330 e!40267)))

(assert (=> b!60362 (= res!50330 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2188 BitStream!2188) Bool)

(assert (=> b!60362 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94213 () Unit!4123)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2188) Unit!4123)

(assert (=> b!60362 (= lt!94213 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60362 (= lt!94217 (bitIndex!0 (size!1250 (buf!1631 thiss!1379)) (currentByte!3249 thiss!1379) (currentBit!3244 thiss!1379)))))

(declare-fun b!60363 () Bool)

(declare-fun res!50320 () Bool)

(assert (=> b!60363 (=> res!50320 e!40261)))

(assert (=> b!60363 (= res!50320 (not (= (size!1250 (buf!1631 thiss!1379)) (size!1250 (buf!1631 (_2!2860 lt!94219))))))))

(declare-fun b!60364 () Bool)

(assert (=> b!60364 (= e!40264 e!40269)))

(declare-fun res!50321 () Bool)

(assert (=> b!60364 (=> res!50321 e!40269)))

(assert (=> b!60364 (= res!50321 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94210 () List!669)

(declare-datatypes ((tuple2!5500 0))(
  ( (tuple2!5501 (_1!2861 BitStream!2188) (_2!2861 BitStream!2188)) )
))
(declare-fun lt!94218 () tuple2!5500)

(declare-fun lt!94215 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2188 BitStream!2188 (_ BitVec 64)) List!669)

(assert (=> b!60364 (= lt!94210 (bitStreamReadBitsIntoList!0 (_2!2860 lt!94219) (_1!2861 lt!94218) lt!94215))))

(declare-fun lt!94224 () tuple2!5500)

(assert (=> b!60364 (= lt!94214 (bitStreamReadBitsIntoList!0 (_2!2860 lt!94219) (_1!2861 lt!94224) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60364 (validate_offset_bits!1 ((_ sign_extend 32) (size!1250 (buf!1631 (_2!2860 lt!94219)))) ((_ sign_extend 32) (currentByte!3249 (_2!2860 lt!94220))) ((_ sign_extend 32) (currentBit!3244 (_2!2860 lt!94220))) lt!94215)))

(declare-fun lt!94223 () Unit!4123)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2188 array!2749 (_ BitVec 64)) Unit!4123)

(assert (=> b!60364 (= lt!94223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2860 lt!94220) (buf!1631 (_2!2860 lt!94219)) lt!94215))))

(declare-fun reader!0 (BitStream!2188 BitStream!2188) tuple2!5500)

(assert (=> b!60364 (= lt!94218 (reader!0 (_2!2860 lt!94220) (_2!2860 lt!94219)))))

(assert (=> b!60364 (validate_offset_bits!1 ((_ sign_extend 32) (size!1250 (buf!1631 (_2!2860 lt!94219)))) ((_ sign_extend 32) (currentByte!3249 thiss!1379)) ((_ sign_extend 32) (currentBit!3244 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94211 () Unit!4123)

(assert (=> b!60364 (= lt!94211 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1631 (_2!2860 lt!94219)) (bvsub to!314 i!635)))))

(assert (=> b!60364 (= lt!94224 (reader!0 thiss!1379 (_2!2860 lt!94219)))))

(declare-fun srcBuffer!2 () array!2749)

(declare-fun lt!94222 () tuple2!5500)

(declare-fun e!40270 () Bool)

(declare-fun b!60365 () Bool)

(declare-fun head!488 (List!669) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2188 array!2749 (_ BitVec 64) (_ BitVec 64)) List!669)

(assert (=> b!60365 (= e!40270 (= (head!488 (byteArrayBitContentToList!0 (_2!2860 lt!94220) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!488 (bitStreamReadBitsIntoList!0 (_2!2860 lt!94220) (_1!2861 lt!94222) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60366 () Bool)

(declare-fun res!50328 () Bool)

(assert (=> b!60366 (=> (not res!50328) (not e!40266))))

(assert (=> b!60366 (= res!50328 (validate_offset_bits!1 ((_ sign_extend 32) (size!1250 (buf!1631 thiss!1379))) ((_ sign_extend 32) (currentByte!3249 thiss!1379)) ((_ sign_extend 32) (currentBit!3244 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60359 () Bool)

(declare-fun e!40265 () Bool)

(assert (=> b!60359 (= e!40267 e!40265)))

(declare-fun res!50319 () Bool)

(assert (=> b!60359 (=> res!50319 e!40265)))

(assert (=> b!60359 (= res!50319 (not (isPrefixOf!0 thiss!1379 (_2!2860 lt!94220))))))

(assert (=> b!60359 (validate_offset_bits!1 ((_ sign_extend 32) (size!1250 (buf!1631 (_2!2860 lt!94220)))) ((_ sign_extend 32) (currentByte!3249 (_2!2860 lt!94220))) ((_ sign_extend 32) (currentBit!3244 (_2!2860 lt!94220))) lt!94215)))

(assert (=> b!60359 (= lt!94215 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94209 () Unit!4123)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2188 BitStream!2188 (_ BitVec 64) (_ BitVec 64)) Unit!4123)

(assert (=> b!60359 (= lt!94209 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2860 lt!94220) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2188 (_ BitVec 8) (_ BitVec 32)) tuple2!5498)

(assert (=> b!60359 (= lt!94220 (appendBitFromByte!0 thiss!1379 (select (arr!1814 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!50322 () Bool)

(assert (=> start!11892 (=> (not res!50322) (not e!40266))))

(assert (=> start!11892 (= res!50322 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1250 srcBuffer!2))))))))

(assert (=> start!11892 e!40266))

(assert (=> start!11892 true))

(assert (=> start!11892 (array_inv!1153 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2188) Bool)

(assert (=> start!11892 (and (inv!12 thiss!1379) e!40271)))

(declare-fun e!40262 () Bool)

(declare-fun b!60367 () Bool)

(assert (=> b!60367 (= e!40262 (= lt!94225 (bvsub (bvsub (bvadd (bitIndex!0 (size!1250 (buf!1631 (_2!2860 lt!94220))) (currentByte!3249 (_2!2860 lt!94220)) (currentBit!3244 (_2!2860 lt!94220))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60368 () Bool)

(assert (=> b!60368 (= e!40261 e!40264)))

(declare-fun res!50318 () Bool)

(assert (=> b!60368 (=> res!50318 e!40264)))

(assert (=> b!60368 (= res!50318 (not (= (size!1250 (buf!1631 (_2!2860 lt!94220))) (size!1250 (buf!1631 (_2!2860 lt!94219))))))))

(assert (=> b!60368 e!40262))

(declare-fun res!50323 () Bool)

(assert (=> b!60368 (=> (not res!50323) (not e!40262))))

(assert (=> b!60368 (= res!50323 (= (size!1250 (buf!1631 (_2!2860 lt!94219))) (size!1250 (buf!1631 thiss!1379))))))

(declare-fun b!60369 () Bool)

(assert (=> b!60369 (= e!40265 e!40263)))

(declare-fun res!50329 () Bool)

(assert (=> b!60369 (=> res!50329 e!40263)))

(assert (=> b!60369 (= res!50329 (not (isPrefixOf!0 (_2!2860 lt!94220) (_2!2860 lt!94219))))))

(assert (=> b!60369 (isPrefixOf!0 thiss!1379 (_2!2860 lt!94219))))

(declare-fun lt!94221 () Unit!4123)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2188 BitStream!2188 BitStream!2188) Unit!4123)

(assert (=> b!60369 (= lt!94221 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2860 lt!94220) (_2!2860 lt!94219)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2188 array!2749 (_ BitVec 64) (_ BitVec 64)) tuple2!5498)

(assert (=> b!60369 (= lt!94219 (appendBitsMSBFirstLoop!0 (_2!2860 lt!94220) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60369 e!40270))

(declare-fun res!50325 () Bool)

(assert (=> b!60369 (=> (not res!50325) (not e!40270))))

(assert (=> b!60369 (= res!50325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1250 (buf!1631 (_2!2860 lt!94220)))) ((_ sign_extend 32) (currentByte!3249 thiss!1379)) ((_ sign_extend 32) (currentBit!3244 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94216 () Unit!4123)

(assert (=> b!60369 (= lt!94216 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1631 (_2!2860 lt!94220)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!60369 (= lt!94222 (reader!0 thiss!1379 (_2!2860 lt!94220)))))

(declare-fun b!60370 () Bool)

(declare-fun res!50326 () Bool)

(assert (=> b!60370 (=> res!50326 e!40264)))

(assert (=> b!60370 (= res!50326 (not (invariant!0 (currentBit!3244 (_2!2860 lt!94220)) (currentByte!3249 (_2!2860 lt!94220)) (size!1250 (buf!1631 (_2!2860 lt!94219))))))))

(assert (= (and start!11892 res!50322) b!60366))

(assert (= (and b!60366 res!50328) b!60362))

(assert (= (and b!60362 (not res!50330)) b!60359))

(assert (= (and b!60359 (not res!50319)) b!60369))

(assert (= (and b!60369 res!50325) b!60365))

(assert (= (and b!60369 (not res!50329)) b!60360))

(assert (= (and b!60360 (not res!50327)) b!60356))

(assert (= (and b!60356 (not res!50324)) b!60363))

(assert (= (and b!60363 (not res!50320)) b!60368))

(assert (= (and b!60368 res!50323) b!60367))

(assert (= (and b!60368 (not res!50318)) b!60357))

(assert (= (and b!60357 (not res!50331)) b!60370))

(assert (= (and b!60370 (not res!50326)) b!60364))

(assert (= (and b!60364 (not res!50321)) b!60361))

(assert (= start!11892 b!60358))

(declare-fun m!95095 () Bool)

(assert (=> b!60364 m!95095))

(declare-fun m!95097 () Bool)

(assert (=> b!60364 m!95097))

(declare-fun m!95099 () Bool)

(assert (=> b!60364 m!95099))

(declare-fun m!95101 () Bool)

(assert (=> b!60364 m!95101))

(declare-fun m!95103 () Bool)

(assert (=> b!60364 m!95103))

(declare-fun m!95105 () Bool)

(assert (=> b!60364 m!95105))

(declare-fun m!95107 () Bool)

(assert (=> b!60364 m!95107))

(declare-fun m!95109 () Bool)

(assert (=> b!60364 m!95109))

(declare-fun m!95111 () Bool)

(assert (=> start!11892 m!95111))

(declare-fun m!95113 () Bool)

(assert (=> start!11892 m!95113))

(declare-fun m!95115 () Bool)

(assert (=> b!60361 m!95115))

(declare-fun m!95117 () Bool)

(assert (=> b!60369 m!95117))

(declare-fun m!95119 () Bool)

(assert (=> b!60369 m!95119))

(declare-fun m!95121 () Bool)

(assert (=> b!60369 m!95121))

(declare-fun m!95123 () Bool)

(assert (=> b!60369 m!95123))

(declare-fun m!95125 () Bool)

(assert (=> b!60369 m!95125))

(declare-fun m!95127 () Bool)

(assert (=> b!60369 m!95127))

(declare-fun m!95129 () Bool)

(assert (=> b!60369 m!95129))

(declare-fun m!95131 () Bool)

(assert (=> b!60356 m!95131))

(declare-fun m!95133 () Bool)

(assert (=> b!60370 m!95133))

(declare-fun m!95135 () Bool)

(assert (=> b!60358 m!95135))

(declare-fun m!95137 () Bool)

(assert (=> b!60357 m!95137))

(declare-fun m!95139 () Bool)

(assert (=> b!60360 m!95139))

(declare-fun m!95141 () Bool)

(assert (=> b!60366 m!95141))

(declare-fun m!95143 () Bool)

(assert (=> b!60365 m!95143))

(assert (=> b!60365 m!95143))

(declare-fun m!95145 () Bool)

(assert (=> b!60365 m!95145))

(declare-fun m!95147 () Bool)

(assert (=> b!60365 m!95147))

(assert (=> b!60365 m!95147))

(declare-fun m!95149 () Bool)

(assert (=> b!60365 m!95149))

(declare-fun m!95151 () Bool)

(assert (=> b!60359 m!95151))

(declare-fun m!95153 () Bool)

(assert (=> b!60359 m!95153))

(declare-fun m!95155 () Bool)

(assert (=> b!60359 m!95155))

(assert (=> b!60359 m!95153))

(declare-fun m!95157 () Bool)

(assert (=> b!60359 m!95157))

(declare-fun m!95159 () Bool)

(assert (=> b!60359 m!95159))

(declare-fun m!95161 () Bool)

(assert (=> b!60362 m!95161))

(declare-fun m!95163 () Bool)

(assert (=> b!60362 m!95163))

(declare-fun m!95165 () Bool)

(assert (=> b!60362 m!95165))

(declare-fun m!95167 () Bool)

(assert (=> b!60367 m!95167))

(push 1)

