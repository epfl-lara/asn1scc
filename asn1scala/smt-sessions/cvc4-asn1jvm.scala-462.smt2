; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12886 () Bool)

(assert start!12886)

(declare-fun b!66264 () Bool)

(declare-fun res!54956 () Bool)

(declare-fun e!43541 () Bool)

(assert (=> b!66264 (=> res!54956 e!43541)))

(declare-datatypes ((array!2852 0))(
  ( (array!2853 (arr!1879 (Array (_ BitVec 32) (_ BitVec 8))) (size!1315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2264 0))(
  ( (BitStream!2265 (buf!1696 array!2852) (currentByte!3368 (_ BitVec 32)) (currentBit!3363 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4467 0))(
  ( (Unit!4468) )
))
(declare-datatypes ((tuple2!5864 0))(
  ( (tuple2!5865 (_1!3043 Unit!4467) (_2!3043 BitStream!2264)) )
))
(declare-fun lt!105069 () tuple2!5864)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66264 (= res!54956 (not (invariant!0 (currentBit!3363 (_2!3043 lt!105069)) (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105069))))))))

(declare-fun b!66265 () Bool)

(declare-fun e!43543 () Bool)

(declare-fun e!43539 () Bool)

(assert (=> b!66265 (= e!43543 e!43539)))

(declare-fun res!54964 () Bool)

(assert (=> b!66265 (=> res!54964 e!43539)))

(declare-fun lt!105076 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!105077 () (_ BitVec 64))

(assert (=> b!66265 (= res!54964 (not (= lt!105077 (bvsub (bvadd lt!105076 to!314) i!635))))))

(declare-fun lt!105066 () tuple2!5864)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66265 (= lt!105077 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066))))))

(declare-fun b!66266 () Bool)

(declare-fun res!54951 () Bool)

(assert (=> b!66266 (=> res!54951 e!43541)))

(assert (=> b!66266 (= res!54951 (not (invariant!0 (currentBit!3363 (_2!3043 lt!105069)) (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))

(declare-fun b!66267 () Bool)

(declare-fun e!43547 () Bool)

(declare-fun e!43536 () Bool)

(assert (=> b!66267 (= e!43547 e!43536)))

(declare-fun res!54962 () Bool)

(assert (=> b!66267 (=> res!54962 e!43536)))

(declare-fun thiss!1379 () BitStream!2264)

(declare-fun isPrefixOf!0 (BitStream!2264 BitStream!2264) Bool)

(assert (=> b!66267 (= res!54962 (not (isPrefixOf!0 thiss!1379 (_2!3043 lt!105069))))))

(declare-fun lt!105070 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66267 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!105070)))

(assert (=> b!66267 (= lt!105070 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105061 () Unit!4467)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2264 BitStream!2264 (_ BitVec 64) (_ BitVec 64)) Unit!4467)

(assert (=> b!66267 (= lt!105061 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3043 lt!105069) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2852)

(declare-fun appendBitFromByte!0 (BitStream!2264 (_ BitVec 8) (_ BitVec 32)) tuple2!5864)

(assert (=> b!66267 (= lt!105069 (appendBitFromByte!0 thiss!1379 (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!66268 () Bool)

(declare-fun res!54965 () Bool)

(declare-fun e!43545 () Bool)

(assert (=> b!66268 (=> res!54965 e!43545)))

(declare-fun lt!105072 () Bool)

(declare-fun bitAt!0 (array!2852 (_ BitVec 64)) Bool)

(assert (=> b!66268 (= res!54965 (not (= (bitAt!0 (buf!1696 (_2!3043 lt!105069)) lt!105076) lt!105072)))))

(declare-fun b!66269 () Bool)

(declare-fun e!43534 () Bool)

(declare-fun e!43535 () Bool)

(assert (=> b!66269 (= e!43534 e!43535)))

(declare-fun res!54966 () Bool)

(assert (=> b!66269 (=> res!54966 e!43535)))

(declare-fun lt!105060 () Bool)

(declare-datatypes ((tuple2!5866 0))(
  ( (tuple2!5867 (_1!3044 BitStream!2264) (_2!3044 BitStream!2264)) )
))
(declare-fun lt!105080 () tuple2!5866)

(assert (=> b!66269 (= res!54966 (not (= lt!105060 (bitAt!0 (buf!1696 (_1!3044 lt!105080)) lt!105076))))))

(declare-fun lt!105065 () tuple2!5866)

(assert (=> b!66269 (= lt!105060 (bitAt!0 (buf!1696 (_1!3044 lt!105065)) lt!105076))))

(declare-fun b!66270 () Bool)

(declare-fun e!43540 () Bool)

(assert (=> b!66270 (= e!43540 e!43534)))

(declare-fun res!54957 () Bool)

(assert (=> b!66270 (=> res!54957 e!43534)))

(declare-datatypes ((List!707 0))(
  ( (Nil!704) (Cons!703 (h!822 Bool) (t!1457 List!707)) )
))
(declare-fun lt!105075 () List!707)

(declare-fun lt!105067 () List!707)

(assert (=> b!66270 (= res!54957 (not (= lt!105075 lt!105067)))))

(assert (=> b!66270 (= lt!105067 lt!105075)))

(declare-fun lt!105079 () List!707)

(declare-fun tail!311 (List!707) List!707)

(assert (=> b!66270 (= lt!105075 (tail!311 lt!105079))))

(declare-fun lt!105063 () Unit!4467)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2264 BitStream!2264 BitStream!2264 BitStream!2264 (_ BitVec 64) List!707) Unit!4467)

(assert (=> b!66270 (= lt!105063 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3043 lt!105066) (_2!3043 lt!105066) (_1!3044 lt!105065) (_1!3044 lt!105080) (bvsub to!314 i!635) lt!105079))))

(declare-fun b!66271 () Bool)

(declare-fun lt!105071 () (_ BitVec 64))

(declare-fun lt!105078 () (_ BitVec 64))

(assert (=> b!66271 (= e!43545 (or (not (= lt!105078 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!105078 (bvand lt!105071 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!105074 () (_ BitVec 64))

(assert (=> b!66271 (= lt!105078 (bvand lt!105074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66272 () Bool)

(assert (=> b!66272 (= e!43539 e!43541)))

(declare-fun res!54955 () Bool)

(assert (=> b!66272 (=> res!54955 e!43541)))

(assert (=> b!66272 (= res!54955 (not (= (size!1315 (buf!1696 (_2!3043 lt!105069))) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))

(assert (=> b!66272 (= lt!105077 (bvsub (bvsub lt!105071 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!66272 (= lt!105071 (bvadd lt!105074 to!314))))

(assert (=> b!66272 (= lt!105074 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(assert (=> b!66272 (= (size!1315 (buf!1696 (_2!3043 lt!105066))) (size!1315 (buf!1696 thiss!1379)))))

(declare-fun res!54958 () Bool)

(declare-fun e!43544 () Bool)

(assert (=> start!12886 (=> (not res!54958) (not e!43544))))

(assert (=> start!12886 (= res!54958 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1315 srcBuffer!2))))))))

(assert (=> start!12886 e!43544))

(assert (=> start!12886 true))

(declare-fun array_inv!1191 (array!2852) Bool)

(assert (=> start!12886 (array_inv!1191 srcBuffer!2)))

(declare-fun e!43542 () Bool)

(declare-fun inv!12 (BitStream!2264) Bool)

(assert (=> start!12886 (and (inv!12 thiss!1379) e!43542)))

(declare-fun b!66273 () Bool)

(declare-fun e!43537 () Bool)

(declare-fun lt!105082 () tuple2!5866)

(declare-fun head!526 (List!707) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2264 array!2852 (_ BitVec 64) (_ BitVec 64)) List!707)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2264 BitStream!2264 (_ BitVec 64)) List!707)

(assert (=> b!66273 (= e!43537 (= (head!526 (byteArrayBitContentToList!0 (_2!3043 lt!105069) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!526 (bitStreamReadBitsIntoList!0 (_2!3043 lt!105069) (_1!3044 lt!105082) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66274 () Bool)

(assert (=> b!66274 (= e!43536 e!43543)))

(declare-fun res!54952 () Bool)

(assert (=> b!66274 (=> res!54952 e!43543)))

(assert (=> b!66274 (= res!54952 (not (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105066))))))

(assert (=> b!66274 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105066))))

(declare-fun lt!105064 () Unit!4467)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2264 BitStream!2264 BitStream!2264) Unit!4467)

(assert (=> b!66274 (= lt!105064 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3043 lt!105069) (_2!3043 lt!105066)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2264 array!2852 (_ BitVec 64) (_ BitVec 64)) tuple2!5864)

(assert (=> b!66274 (= lt!105066 (appendBitsMSBFirstLoop!0 (_2!3043 lt!105069) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!66274 e!43537))

(declare-fun res!54959 () Bool)

(assert (=> b!66274 (=> (not res!54959) (not e!43537))))

(assert (=> b!66274 (= res!54959 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105062 () Unit!4467)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2264 array!2852 (_ BitVec 64)) Unit!4467)

(assert (=> b!66274 (= lt!105062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1696 (_2!3043 lt!105069)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2264 BitStream!2264) tuple2!5866)

(assert (=> b!66274 (= lt!105082 (reader!0 thiss!1379 (_2!3043 lt!105069)))))

(declare-fun b!66275 () Bool)

(declare-fun res!54961 () Bool)

(assert (=> b!66275 (=> res!54961 e!43539)))

(assert (=> b!66275 (= res!54961 (not (invariant!0 (currentBit!3363 (_2!3043 lt!105066)) (currentByte!3368 (_2!3043 lt!105066)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))

(declare-fun b!66276 () Bool)

(assert (=> b!66276 (= e!43542 (array_inv!1191 (buf!1696 thiss!1379)))))

(declare-fun b!66277 () Bool)

(assert (=> b!66277 (= e!43541 e!43540)))

(declare-fun res!54963 () Bool)

(assert (=> b!66277 (=> res!54963 e!43540)))

(assert (=> b!66277 (= res!54963 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!66277 (= lt!105067 (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_1!3044 lt!105080) lt!105070))))

(assert (=> b!66277 (= lt!105079 (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_1!3044 lt!105065) (bvsub to!314 i!635)))))

(assert (=> b!66277 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!105070)))

(declare-fun lt!105081 () Unit!4467)

(assert (=> b!66277 (= lt!105081 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!105066)) lt!105070))))

(assert (=> b!66277 (= lt!105080 (reader!0 (_2!3043 lt!105069) (_2!3043 lt!105066)))))

(assert (=> b!66277 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!105073 () Unit!4467)

(assert (=> b!66277 (= lt!105073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1696 (_2!3043 lt!105066)) (bvsub to!314 i!635)))))

(assert (=> b!66277 (= lt!105065 (reader!0 thiss!1379 (_2!3043 lt!105066)))))

(declare-fun b!66278 () Bool)

(declare-fun res!54968 () Bool)

(assert (=> b!66278 (=> res!54968 e!43535)))

(assert (=> b!66278 (= res!54968 (not (= (head!526 lt!105079) lt!105060)))))

(declare-fun b!66279 () Bool)

(declare-fun res!54969 () Bool)

(assert (=> b!66279 (=> (not res!54969) (not e!43544))))

(assert (=> b!66279 (= res!54969 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66280 () Bool)

(assert (=> b!66280 (= e!43535 e!43545)))

(declare-fun res!54960 () Bool)

(assert (=> b!66280 (=> res!54960 e!43545)))

(assert (=> b!66280 (= res!54960 (not (= (head!526 (byteArrayBitContentToList!0 (_2!3043 lt!105066) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!105072)))))

(assert (=> b!66280 (= lt!105072 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66281 () Bool)

(declare-fun res!54953 () Bool)

(assert (=> b!66281 (=> res!54953 e!43539)))

(assert (=> b!66281 (= res!54953 (not (= (size!1315 (buf!1696 thiss!1379)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))

(declare-fun b!66282 () Bool)

(declare-fun res!54967 () Bool)

(assert (=> b!66282 (=> res!54967 e!43540)))

(declare-fun length!335 (List!707) Int)

(assert (=> b!66282 (= res!54967 (<= (length!335 lt!105079) 0))))

(declare-fun b!66283 () Bool)

(assert (=> b!66283 (= e!43544 (not e!43547))))

(declare-fun res!54954 () Bool)

(assert (=> b!66283 (=> res!54954 e!43547)))

(assert (=> b!66283 (= res!54954 (bvsge i!635 to!314))))

(assert (=> b!66283 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!105068 () Unit!4467)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2264) Unit!4467)

(assert (=> b!66283 (= lt!105068 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66283 (= lt!105076 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(assert (= (and start!12886 res!54958) b!66279))

(assert (= (and b!66279 res!54969) b!66283))

(assert (= (and b!66283 (not res!54954)) b!66267))

(assert (= (and b!66267 (not res!54962)) b!66274))

(assert (= (and b!66274 res!54959) b!66273))

(assert (= (and b!66274 (not res!54952)) b!66265))

(assert (= (and b!66265 (not res!54964)) b!66275))

(assert (= (and b!66275 (not res!54961)) b!66281))

(assert (= (and b!66281 (not res!54953)) b!66272))

(assert (= (and b!66272 (not res!54955)) b!66264))

(assert (= (and b!66264 (not res!54956)) b!66266))

(assert (= (and b!66266 (not res!54951)) b!66277))

(assert (= (and b!66277 (not res!54963)) b!66282))

(assert (= (and b!66282 (not res!54967)) b!66270))

(assert (= (and b!66270 (not res!54957)) b!66269))

(assert (= (and b!66269 (not res!54966)) b!66278))

(assert (= (and b!66278 (not res!54968)) b!66280))

(assert (= (and b!66280 (not res!54960)) b!66268))

(assert (= (and b!66268 (not res!54965)) b!66271))

(assert (= start!12886 b!66276))

(declare-fun m!105257 () Bool)

(assert (=> b!66264 m!105257))

(declare-fun m!105259 () Bool)

(assert (=> b!66268 m!105259))

(declare-fun m!105261 () Bool)

(assert (=> b!66266 m!105261))

(declare-fun m!105263 () Bool)

(assert (=> b!66279 m!105263))

(declare-fun m!105265 () Bool)

(assert (=> b!66280 m!105265))

(assert (=> b!66280 m!105265))

(declare-fun m!105267 () Bool)

(assert (=> b!66280 m!105267))

(declare-fun m!105269 () Bool)

(assert (=> b!66280 m!105269))

(declare-fun m!105271 () Bool)

(assert (=> b!66274 m!105271))

(declare-fun m!105273 () Bool)

(assert (=> b!66274 m!105273))

(declare-fun m!105275 () Bool)

(assert (=> b!66274 m!105275))

(declare-fun m!105277 () Bool)

(assert (=> b!66274 m!105277))

(declare-fun m!105279 () Bool)

(assert (=> b!66274 m!105279))

(declare-fun m!105281 () Bool)

(assert (=> b!66274 m!105281))

(declare-fun m!105283 () Bool)

(assert (=> b!66274 m!105283))

(declare-fun m!105285 () Bool)

(assert (=> b!66275 m!105285))

(declare-fun m!105287 () Bool)

(assert (=> b!66278 m!105287))

(declare-fun m!105289 () Bool)

(assert (=> b!66265 m!105289))

(declare-fun m!105291 () Bool)

(assert (=> b!66283 m!105291))

(declare-fun m!105293 () Bool)

(assert (=> b!66283 m!105293))

(declare-fun m!105295 () Bool)

(assert (=> b!66283 m!105295))

(declare-fun m!105297 () Bool)

(assert (=> b!66273 m!105297))

(assert (=> b!66273 m!105297))

(declare-fun m!105299 () Bool)

(assert (=> b!66273 m!105299))

(declare-fun m!105301 () Bool)

(assert (=> b!66273 m!105301))

(assert (=> b!66273 m!105301))

(declare-fun m!105303 () Bool)

(assert (=> b!66273 m!105303))

(declare-fun m!105305 () Bool)

(assert (=> b!66270 m!105305))

(declare-fun m!105307 () Bool)

(assert (=> b!66270 m!105307))

(declare-fun m!105309 () Bool)

(assert (=> b!66269 m!105309))

(declare-fun m!105311 () Bool)

(assert (=> b!66269 m!105311))

(declare-fun m!105313 () Bool)

(assert (=> b!66267 m!105313))

(declare-fun m!105315 () Bool)

(assert (=> b!66267 m!105315))

(declare-fun m!105317 () Bool)

(assert (=> b!66267 m!105317))

(declare-fun m!105319 () Bool)

(assert (=> b!66267 m!105319))

(declare-fun m!105321 () Bool)

(assert (=> b!66267 m!105321))

(assert (=> b!66267 m!105317))

(declare-fun m!105323 () Bool)

(assert (=> b!66272 m!105323))

(declare-fun m!105325 () Bool)

(assert (=> b!66277 m!105325))

(declare-fun m!105327 () Bool)

(assert (=> b!66277 m!105327))

(declare-fun m!105329 () Bool)

(assert (=> b!66277 m!105329))

(declare-fun m!105331 () Bool)

(assert (=> b!66277 m!105331))

(declare-fun m!105333 () Bool)

(assert (=> b!66277 m!105333))

(declare-fun m!105335 () Bool)

(assert (=> b!66277 m!105335))

(declare-fun m!105337 () Bool)

(assert (=> b!66277 m!105337))

(declare-fun m!105339 () Bool)

(assert (=> b!66277 m!105339))

(declare-fun m!105341 () Bool)

(assert (=> b!66282 m!105341))

(declare-fun m!105343 () Bool)

(assert (=> b!66276 m!105343))

(declare-fun m!105345 () Bool)

(assert (=> start!12886 m!105345))

(declare-fun m!105347 () Bool)

(assert (=> start!12886 m!105347))

(push 1)

(assert (not b!66274))

(assert (not b!66264))

(assert (not b!66278))

(assert (not b!66265))

(assert (not b!66280))

(assert (not b!66277))

(assert (not start!12886))

(assert (not b!66275))

(assert (not b!66272))

(assert (not b!66266))

(assert (not b!66270))

(assert (not b!66276))

(assert (not b!66273))

(assert (not b!66267))

(assert (not b!66269))

(assert (not b!66282))

(assert (not b!66268))

(assert (not b!66283))

(assert (not b!66279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20810 () Bool)

(declare-fun e!43585 () Bool)

(assert (=> d!20810 e!43585))

(declare-fun res!55010 () Bool)

(assert (=> d!20810 (=> (not res!55010) (not e!43585))))

(declare-fun lt!105244 () (_ BitVec 64))

(declare-fun lt!105239 () (_ BitVec 64))

(declare-fun lt!105242 () (_ BitVec 64))

(assert (=> d!20810 (= res!55010 (= lt!105239 (bvsub lt!105244 lt!105242)))))

(assert (=> d!20810 (or (= (bvand lt!105244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105244 lt!105242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20810 (= lt!105242 (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105066))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105066)))))))

(declare-fun lt!105241 () (_ BitVec 64))

(declare-fun lt!105243 () (_ BitVec 64))

(assert (=> d!20810 (= lt!105244 (bvmul lt!105241 lt!105243))))

(assert (=> d!20810 (or (= lt!105241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105243 (bvsdiv (bvmul lt!105241 lt!105243) lt!105241)))))

(assert (=> d!20810 (= lt!105243 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20810 (= lt!105241 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))))))

(assert (=> d!20810 (= lt!105239 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105066))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105066)))))))

(assert (=> d!20810 (invariant!0 (currentBit!3363 (_2!3043 lt!105066)) (currentByte!3368 (_2!3043 lt!105066)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))

(assert (=> d!20810 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066))) lt!105239)))

(declare-fun b!66356 () Bool)

(declare-fun res!55011 () Bool)

(assert (=> b!66356 (=> (not res!55011) (not e!43585))))

(assert (=> b!66356 (= res!55011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105239))))

(declare-fun b!66357 () Bool)

(declare-fun lt!105240 () (_ BitVec 64))

(assert (=> b!66357 (= e!43585 (bvsle lt!105239 (bvmul lt!105240 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66357 (or (= lt!105240 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105240 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105240)))))

(assert (=> b!66357 (= lt!105240 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))))))

(assert (= (and d!20810 res!55010) b!66356))

(assert (= (and b!66356 res!55011) b!66357))

(declare-fun m!105475 () Bool)

(assert (=> d!20810 m!105475))

(assert (=> d!20810 m!105285))

(assert (=> b!66265 d!20810))

(declare-fun d!20812 () Bool)

(assert (=> d!20812 (= (array_inv!1191 (buf!1696 thiss!1379)) (bvsge (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66276 d!20812))

(declare-fun d!20814 () Bool)

(assert (=> d!20814 (= (invariant!0 (currentBit!3363 (_2!3043 lt!105069)) (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105066)))) (and (bvsge (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (bvslt (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000001000) (bvsge (currentByte!3368 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105066)))) (and (= (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (= (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))))

(assert (=> b!66266 d!20814))

(declare-fun d!20816 () Bool)

(assert (=> d!20816 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5066 () Bool)

(assert (= bs!5066 d!20816))

(declare-fun m!105477 () Bool)

(assert (=> bs!5066 m!105477))

(assert (=> b!66277 d!20816))

(declare-fun d!20818 () Bool)

(assert (=> d!20818 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!105070)))

(declare-fun lt!105275 () Unit!4467)

(declare-fun choose!9 (BitStream!2264 array!2852 (_ BitVec 64) BitStream!2264) Unit!4467)

(assert (=> d!20818 (= lt!105275 (choose!9 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!105066)) lt!105070 (BitStream!2265 (buf!1696 (_2!3043 lt!105066)) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069)))))))

(assert (=> d!20818 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!105066)) lt!105070) lt!105275)))

(declare-fun bs!5067 () Bool)

(assert (= bs!5067 d!20818))

(assert (=> bs!5067 m!105339))

(declare-fun m!105479 () Bool)

(assert (=> bs!5067 m!105479))

(assert (=> b!66277 d!20818))

(declare-fun b!66414 () Bool)

(declare-fun e!43612 () Unit!4467)

(declare-fun lt!105388 () Unit!4467)

(assert (=> b!66414 (= e!43612 lt!105388)))

(declare-fun lt!105395 () (_ BitVec 64))

(assert (=> b!66414 (= lt!105395 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105405 () (_ BitVec 64))

(assert (=> b!66414 (= lt!105405 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2852 array!2852 (_ BitVec 64) (_ BitVec 64)) Unit!4467)

(assert (=> b!66414 (= lt!105388 (arrayBitRangesEqSymmetric!0 (buf!1696 (_2!3043 lt!105069)) (buf!1696 (_2!3043 lt!105066)) lt!105395 lt!105405))))

(declare-fun arrayBitRangesEq!0 (array!2852 array!2852 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66414 (arrayBitRangesEq!0 (buf!1696 (_2!3043 lt!105066)) (buf!1696 (_2!3043 lt!105069)) lt!105395 lt!105405)))

(declare-fun d!20820 () Bool)

(declare-fun e!43611 () Bool)

(assert (=> d!20820 e!43611))

(declare-fun res!55032 () Bool)

(assert (=> d!20820 (=> (not res!55032) (not e!43611))))

(declare-fun lt!105390 () tuple2!5866)

(assert (=> d!20820 (= res!55032 (isPrefixOf!0 (_1!3044 lt!105390) (_2!3044 lt!105390)))))

(declare-fun lt!105393 () BitStream!2264)

(assert (=> d!20820 (= lt!105390 (tuple2!5867 lt!105393 (_2!3043 lt!105066)))))

(declare-fun lt!105402 () Unit!4467)

(declare-fun lt!105394 () Unit!4467)

(assert (=> d!20820 (= lt!105402 lt!105394)))

(assert (=> d!20820 (isPrefixOf!0 lt!105393 (_2!3043 lt!105066))))

(assert (=> d!20820 (= lt!105394 (lemmaIsPrefixTransitive!0 lt!105393 (_2!3043 lt!105066) (_2!3043 lt!105066)))))

(declare-fun lt!105387 () Unit!4467)

(declare-fun lt!105396 () Unit!4467)

(assert (=> d!20820 (= lt!105387 lt!105396)))

(assert (=> d!20820 (isPrefixOf!0 lt!105393 (_2!3043 lt!105066))))

(assert (=> d!20820 (= lt!105396 (lemmaIsPrefixTransitive!0 lt!105393 (_2!3043 lt!105069) (_2!3043 lt!105066)))))

(declare-fun lt!105401 () Unit!4467)

(assert (=> d!20820 (= lt!105401 e!43612)))

(declare-fun c!4830 () Bool)

(assert (=> d!20820 (= c!4830 (not (= (size!1315 (buf!1696 (_2!3043 lt!105069))) #b00000000000000000000000000000000)))))

(declare-fun lt!105404 () Unit!4467)

(declare-fun lt!105403 () Unit!4467)

(assert (=> d!20820 (= lt!105404 lt!105403)))

(assert (=> d!20820 (isPrefixOf!0 (_2!3043 lt!105066) (_2!3043 lt!105066))))

(assert (=> d!20820 (= lt!105403 (lemmaIsPrefixRefl!0 (_2!3043 lt!105066)))))

(declare-fun lt!105406 () Unit!4467)

(declare-fun lt!105399 () Unit!4467)

(assert (=> d!20820 (= lt!105406 lt!105399)))

(assert (=> d!20820 (= lt!105399 (lemmaIsPrefixRefl!0 (_2!3043 lt!105066)))))

(declare-fun lt!105392 () Unit!4467)

(declare-fun lt!105391 () Unit!4467)

(assert (=> d!20820 (= lt!105392 lt!105391)))

(assert (=> d!20820 (isPrefixOf!0 lt!105393 lt!105393)))

(assert (=> d!20820 (= lt!105391 (lemmaIsPrefixRefl!0 lt!105393))))

(declare-fun lt!105400 () Unit!4467)

(declare-fun lt!105389 () Unit!4467)

(assert (=> d!20820 (= lt!105400 lt!105389)))

(assert (=> d!20820 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105069))))

(assert (=> d!20820 (= lt!105389 (lemmaIsPrefixRefl!0 (_2!3043 lt!105069)))))

(assert (=> d!20820 (= lt!105393 (BitStream!2265 (buf!1696 (_2!3043 lt!105066)) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(assert (=> d!20820 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105066))))

(assert (=> d!20820 (= (reader!0 (_2!3043 lt!105069) (_2!3043 lt!105066)) lt!105390)))

(declare-fun b!66415 () Bool)

(declare-fun Unit!4481 () Unit!4467)

(assert (=> b!66415 (= e!43612 Unit!4481)))

(declare-fun b!66416 () Bool)

(declare-fun res!55031 () Bool)

(assert (=> b!66416 (=> (not res!55031) (not e!43611))))

(assert (=> b!66416 (= res!55031 (isPrefixOf!0 (_2!3044 lt!105390) (_2!3043 lt!105066)))))

(declare-fun lt!105398 () (_ BitVec 64))

(declare-fun b!66417 () Bool)

(declare-fun lt!105397 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2264 (_ BitVec 64)) BitStream!2264)

(assert (=> b!66417 (= e!43611 (= (_1!3044 lt!105390) (withMovedBitIndex!0 (_2!3044 lt!105390) (bvsub lt!105397 lt!105398))))))

(assert (=> b!66417 (or (= (bvand lt!105397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105397 lt!105398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66417 (= lt!105398 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066))))))

(assert (=> b!66417 (= lt!105397 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(declare-fun b!66418 () Bool)

(declare-fun res!55030 () Bool)

(assert (=> b!66418 (=> (not res!55030) (not e!43611))))

(assert (=> b!66418 (= res!55030 (isPrefixOf!0 (_1!3044 lt!105390) (_2!3043 lt!105069)))))

(assert (= (and d!20820 c!4830) b!66414))

(assert (= (and d!20820 (not c!4830)) b!66415))

(assert (= (and d!20820 res!55032) b!66418))

(assert (= (and b!66418 res!55030) b!66416))

(assert (= (and b!66416 res!55031) b!66417))

(declare-fun m!105571 () Bool)

(assert (=> b!66416 m!105571))

(declare-fun m!105573 () Bool)

(assert (=> b!66417 m!105573))

(assert (=> b!66417 m!105289))

(assert (=> b!66417 m!105323))

(declare-fun m!105575 () Bool)

(assert (=> b!66418 m!105575))

(declare-fun m!105577 () Bool)

(assert (=> d!20820 m!105577))

(declare-fun m!105579 () Bool)

(assert (=> d!20820 m!105579))

(assert (=> d!20820 m!105275))

(declare-fun m!105581 () Bool)

(assert (=> d!20820 m!105581))

(declare-fun m!105583 () Bool)

(assert (=> d!20820 m!105583))

(declare-fun m!105585 () Bool)

(assert (=> d!20820 m!105585))

(declare-fun m!105587 () Bool)

(assert (=> d!20820 m!105587))

(declare-fun m!105589 () Bool)

(assert (=> d!20820 m!105589))

(declare-fun m!105591 () Bool)

(assert (=> d!20820 m!105591))

(declare-fun m!105593 () Bool)

(assert (=> d!20820 m!105593))

(declare-fun m!105595 () Bool)

(assert (=> d!20820 m!105595))

(assert (=> b!66414 m!105323))

(declare-fun m!105597 () Bool)

(assert (=> b!66414 m!105597))

(declare-fun m!105599 () Bool)

(assert (=> b!66414 m!105599))

(assert (=> b!66277 d!20820))

(declare-fun d!20848 () Bool)

(assert (=> d!20848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!105407 () Unit!4467)

(assert (=> d!20848 (= lt!105407 (choose!9 thiss!1379 (buf!1696 (_2!3043 lt!105066)) (bvsub to!314 i!635) (BitStream!2265 (buf!1696 (_2!3043 lt!105066)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(assert (=> d!20848 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1696 (_2!3043 lt!105066)) (bvsub to!314 i!635)) lt!105407)))

(declare-fun bs!5073 () Bool)

(assert (= bs!5073 d!20848))

(assert (=> bs!5073 m!105329))

(declare-fun m!105601 () Bool)

(assert (=> bs!5073 m!105601))

(assert (=> b!66277 d!20848))

(declare-fun b!66430 () Bool)

(declare-fun e!43617 () Bool)

(declare-fun lt!105416 () List!707)

(assert (=> b!66430 (= e!43617 (> (length!335 lt!105416) 0))))

(declare-fun b!66428 () Bool)

(declare-datatypes ((tuple2!5880 0))(
  ( (tuple2!5881 (_1!3051 List!707) (_2!3051 BitStream!2264)) )
))
(declare-fun e!43618 () tuple2!5880)

(declare-datatypes ((tuple2!5882 0))(
  ( (tuple2!5883 (_1!3052 Bool) (_2!3052 BitStream!2264)) )
))
(declare-fun lt!105415 () tuple2!5882)

(declare-fun lt!105414 () (_ BitVec 64))

(assert (=> b!66428 (= e!43618 (tuple2!5881 (Cons!703 (_1!3052 lt!105415) (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_2!3052 lt!105415) (bvsub (bvsub to!314 i!635) lt!105414))) (_2!3052 lt!105415)))))

(declare-fun readBit!0 (BitStream!2264) tuple2!5882)

(assert (=> b!66428 (= lt!105415 (readBit!0 (_1!3044 lt!105065)))))

(assert (=> b!66428 (= lt!105414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66429 () Bool)

(declare-fun isEmpty!209 (List!707) Bool)

(assert (=> b!66429 (= e!43617 (isEmpty!209 lt!105416))))

(declare-fun d!20850 () Bool)

(assert (=> d!20850 e!43617))

(declare-fun c!4836 () Bool)

(assert (=> d!20850 (= c!4836 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20850 (= lt!105416 (_1!3051 e!43618))))

(declare-fun c!4835 () Bool)

(assert (=> d!20850 (= c!4835 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20850 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20850 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_1!3044 lt!105065) (bvsub to!314 i!635)) lt!105416)))

(declare-fun b!66427 () Bool)

(assert (=> b!66427 (= e!43618 (tuple2!5881 Nil!704 (_1!3044 lt!105065)))))

(assert (= (and d!20850 c!4835) b!66427))

(assert (= (and d!20850 (not c!4835)) b!66428))

(assert (= (and d!20850 c!4836) b!66429))

(assert (= (and d!20850 (not c!4836)) b!66430))

(declare-fun m!105603 () Bool)

(assert (=> b!66430 m!105603))

(declare-fun m!105605 () Bool)

(assert (=> b!66428 m!105605))

(declare-fun m!105607 () Bool)

(assert (=> b!66428 m!105607))

(declare-fun m!105609 () Bool)

(assert (=> b!66429 m!105609))

(assert (=> b!66277 d!20850))

(declare-fun b!66431 () Bool)

(declare-fun e!43620 () Unit!4467)

(declare-fun lt!105418 () Unit!4467)

(assert (=> b!66431 (= e!43620 lt!105418)))

(declare-fun lt!105425 () (_ BitVec 64))

(assert (=> b!66431 (= lt!105425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105435 () (_ BitVec 64))

(assert (=> b!66431 (= lt!105435 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(assert (=> b!66431 (= lt!105418 (arrayBitRangesEqSymmetric!0 (buf!1696 thiss!1379) (buf!1696 (_2!3043 lt!105066)) lt!105425 lt!105435))))

(assert (=> b!66431 (arrayBitRangesEq!0 (buf!1696 (_2!3043 lt!105066)) (buf!1696 thiss!1379) lt!105425 lt!105435)))

(declare-fun d!20852 () Bool)

(declare-fun e!43619 () Bool)

(assert (=> d!20852 e!43619))

(declare-fun res!55035 () Bool)

(assert (=> d!20852 (=> (not res!55035) (not e!43619))))

(declare-fun lt!105420 () tuple2!5866)

(assert (=> d!20852 (= res!55035 (isPrefixOf!0 (_1!3044 lt!105420) (_2!3044 lt!105420)))))

(declare-fun lt!105423 () BitStream!2264)

(assert (=> d!20852 (= lt!105420 (tuple2!5867 lt!105423 (_2!3043 lt!105066)))))

(declare-fun lt!105432 () Unit!4467)

(declare-fun lt!105424 () Unit!4467)

(assert (=> d!20852 (= lt!105432 lt!105424)))

(assert (=> d!20852 (isPrefixOf!0 lt!105423 (_2!3043 lt!105066))))

(assert (=> d!20852 (= lt!105424 (lemmaIsPrefixTransitive!0 lt!105423 (_2!3043 lt!105066) (_2!3043 lt!105066)))))

(declare-fun lt!105417 () Unit!4467)

(declare-fun lt!105426 () Unit!4467)

(assert (=> d!20852 (= lt!105417 lt!105426)))

(assert (=> d!20852 (isPrefixOf!0 lt!105423 (_2!3043 lt!105066))))

(assert (=> d!20852 (= lt!105426 (lemmaIsPrefixTransitive!0 lt!105423 thiss!1379 (_2!3043 lt!105066)))))

(declare-fun lt!105431 () Unit!4467)

(assert (=> d!20852 (= lt!105431 e!43620)))

(declare-fun c!4837 () Bool)

(assert (=> d!20852 (= c!4837 (not (= (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105434 () Unit!4467)

(declare-fun lt!105433 () Unit!4467)

(assert (=> d!20852 (= lt!105434 lt!105433)))

(assert (=> d!20852 (isPrefixOf!0 (_2!3043 lt!105066) (_2!3043 lt!105066))))

(assert (=> d!20852 (= lt!105433 (lemmaIsPrefixRefl!0 (_2!3043 lt!105066)))))

(declare-fun lt!105436 () Unit!4467)

(declare-fun lt!105429 () Unit!4467)

(assert (=> d!20852 (= lt!105436 lt!105429)))

(assert (=> d!20852 (= lt!105429 (lemmaIsPrefixRefl!0 (_2!3043 lt!105066)))))

(declare-fun lt!105422 () Unit!4467)

(declare-fun lt!105421 () Unit!4467)

(assert (=> d!20852 (= lt!105422 lt!105421)))

(assert (=> d!20852 (isPrefixOf!0 lt!105423 lt!105423)))

(assert (=> d!20852 (= lt!105421 (lemmaIsPrefixRefl!0 lt!105423))))

(declare-fun lt!105430 () Unit!4467)

(declare-fun lt!105419 () Unit!4467)

(assert (=> d!20852 (= lt!105430 lt!105419)))

(assert (=> d!20852 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20852 (= lt!105419 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20852 (= lt!105423 (BitStream!2265 (buf!1696 (_2!3043 lt!105066)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(assert (=> d!20852 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105066))))

(assert (=> d!20852 (= (reader!0 thiss!1379 (_2!3043 lt!105066)) lt!105420)))

(declare-fun b!66432 () Bool)

(declare-fun Unit!4483 () Unit!4467)

(assert (=> b!66432 (= e!43620 Unit!4483)))

(declare-fun b!66433 () Bool)

(declare-fun res!55034 () Bool)

(assert (=> b!66433 (=> (not res!55034) (not e!43619))))

(assert (=> b!66433 (= res!55034 (isPrefixOf!0 (_2!3044 lt!105420) (_2!3043 lt!105066)))))

(declare-fun lt!105427 () (_ BitVec 64))

(declare-fun lt!105428 () (_ BitVec 64))

(declare-fun b!66434 () Bool)

(assert (=> b!66434 (= e!43619 (= (_1!3044 lt!105420) (withMovedBitIndex!0 (_2!3044 lt!105420) (bvsub lt!105427 lt!105428))))))

(assert (=> b!66434 (or (= (bvand lt!105427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105427 lt!105428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66434 (= lt!105428 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066))))))

(assert (=> b!66434 (= lt!105427 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(declare-fun b!66435 () Bool)

(declare-fun res!55033 () Bool)

(assert (=> b!66435 (=> (not res!55033) (not e!43619))))

(assert (=> b!66435 (= res!55033 (isPrefixOf!0 (_1!3044 lt!105420) thiss!1379))))

(assert (= (and d!20852 c!4837) b!66431))

(assert (= (and d!20852 (not c!4837)) b!66432))

(assert (= (and d!20852 res!55035) b!66435))

(assert (= (and b!66435 res!55033) b!66433))

(assert (= (and b!66433 res!55034) b!66434))

(declare-fun m!105611 () Bool)

(assert (=> b!66433 m!105611))

(declare-fun m!105613 () Bool)

(assert (=> b!66434 m!105613))

(assert (=> b!66434 m!105289))

(assert (=> b!66434 m!105295))

(declare-fun m!105615 () Bool)

(assert (=> b!66435 m!105615))

(declare-fun m!105617 () Bool)

(assert (=> d!20852 m!105617))

(declare-fun m!105619 () Bool)

(assert (=> d!20852 m!105619))

(assert (=> d!20852 m!105279))

(declare-fun m!105621 () Bool)

(assert (=> d!20852 m!105621))

(declare-fun m!105623 () Bool)

(assert (=> d!20852 m!105623))

(assert (=> d!20852 m!105293))

(assert (=> d!20852 m!105291))

(assert (=> d!20852 m!105589))

(declare-fun m!105625 () Bool)

(assert (=> d!20852 m!105625))

(assert (=> d!20852 m!105593))

(declare-fun m!105627 () Bool)

(assert (=> d!20852 m!105627))

(assert (=> b!66431 m!105295))

(declare-fun m!105629 () Bool)

(assert (=> b!66431 m!105629))

(declare-fun m!105631 () Bool)

(assert (=> b!66431 m!105631))

(assert (=> b!66277 d!20852))

(declare-fun d!20854 () Bool)

(assert (=> d!20854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!105070) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105066)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069)))) lt!105070))))

(declare-fun bs!5074 () Bool)

(assert (= bs!5074 d!20854))

(declare-fun m!105633 () Bool)

(assert (=> bs!5074 m!105633))

(assert (=> b!66277 d!20854))

(declare-fun b!66439 () Bool)

(declare-fun e!43621 () Bool)

(declare-fun lt!105439 () List!707)

(assert (=> b!66439 (= e!43621 (> (length!335 lt!105439) 0))))

(declare-fun lt!105437 () (_ BitVec 64))

(declare-fun b!66437 () Bool)

(declare-fun e!43622 () tuple2!5880)

(declare-fun lt!105438 () tuple2!5882)

(assert (=> b!66437 (= e!43622 (tuple2!5881 (Cons!703 (_1!3052 lt!105438) (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_2!3052 lt!105438) (bvsub lt!105070 lt!105437))) (_2!3052 lt!105438)))))

(assert (=> b!66437 (= lt!105438 (readBit!0 (_1!3044 lt!105080)))))

(assert (=> b!66437 (= lt!105437 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66438 () Bool)

(assert (=> b!66438 (= e!43621 (isEmpty!209 lt!105439))))

(declare-fun d!20856 () Bool)

(assert (=> d!20856 e!43621))

(declare-fun c!4839 () Bool)

(assert (=> d!20856 (= c!4839 (= lt!105070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20856 (= lt!105439 (_1!3051 e!43622))))

(declare-fun c!4838 () Bool)

(assert (=> d!20856 (= c!4838 (= lt!105070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20856 (bvsge lt!105070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20856 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_1!3044 lt!105080) lt!105070) lt!105439)))

(declare-fun b!66436 () Bool)

(assert (=> b!66436 (= e!43622 (tuple2!5881 Nil!704 (_1!3044 lt!105080)))))

(assert (= (and d!20856 c!4838) b!66436))

(assert (= (and d!20856 (not c!4838)) b!66437))

(assert (= (and d!20856 c!4839) b!66438))

(assert (= (and d!20856 (not c!4839)) b!66439))

(declare-fun m!105635 () Bool)

(assert (=> b!66439 m!105635))

(declare-fun m!105637 () Bool)

(assert (=> b!66437 m!105637))

(declare-fun m!105639 () Bool)

(assert (=> b!66437 m!105639))

(declare-fun m!105641 () Bool)

(assert (=> b!66438 m!105641))

(assert (=> b!66277 d!20856))

(declare-fun d!20858 () Bool)

(declare-fun res!55043 () Bool)

(declare-fun e!43627 () Bool)

(assert (=> d!20858 (=> (not res!55043) (not e!43627))))

(assert (=> d!20858 (= res!55043 (= (size!1315 (buf!1696 thiss!1379)) (size!1315 (buf!1696 (_2!3043 lt!105069)))))))

(assert (=> d!20858 (= (isPrefixOf!0 thiss!1379 (_2!3043 lt!105069)) e!43627)))

(declare-fun b!66446 () Bool)

(declare-fun res!55044 () Bool)

(assert (=> b!66446 (=> (not res!55044) (not e!43627))))

(assert (=> b!66446 (= res!55044 (bvsle (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)) (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069)))))))

(declare-fun b!66447 () Bool)

(declare-fun e!43628 () Bool)

(assert (=> b!66447 (= e!43627 e!43628)))

(declare-fun res!55042 () Bool)

(assert (=> b!66447 (=> res!55042 e!43628)))

(assert (=> b!66447 (= res!55042 (= (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66448 () Bool)

(assert (=> b!66448 (= e!43628 (arrayBitRangesEq!0 (buf!1696 thiss!1379) (buf!1696 (_2!3043 lt!105069)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(assert (= (and d!20858 res!55043) b!66446))

(assert (= (and b!66446 res!55044) b!66447))

(assert (= (and b!66447 (not res!55042)) b!66448))

(assert (=> b!66446 m!105295))

(assert (=> b!66446 m!105323))

(assert (=> b!66448 m!105295))

(assert (=> b!66448 m!105295))

(declare-fun m!105643 () Bool)

(assert (=> b!66448 m!105643))

(assert (=> b!66267 d!20858))

(declare-fun d!20860 () Bool)

(assert (=> d!20860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!105070) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069)))) lt!105070))))

(declare-fun bs!5075 () Bool)

(assert (= bs!5075 d!20860))

(declare-fun m!105645 () Bool)

(assert (=> bs!5075 m!105645))

(assert (=> b!66267 d!20860))

(declare-fun d!20862 () Bool)

(declare-fun e!43631 () Bool)

(assert (=> d!20862 e!43631))

(declare-fun res!55047 () Bool)

(assert (=> d!20862 (=> (not res!55047) (not e!43631))))

(assert (=> d!20862 (= res!55047 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!105442 () Unit!4467)

(declare-fun choose!27 (BitStream!2264 BitStream!2264 (_ BitVec 64) (_ BitVec 64)) Unit!4467)

(assert (=> d!20862 (= lt!105442 (choose!27 thiss!1379 (_2!3043 lt!105069) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20862 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20862 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3043 lt!105069) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105442)))

(declare-fun b!66451 () Bool)

(assert (=> b!66451 (= e!43631 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20862 res!55047) b!66451))

(declare-fun m!105647 () Bool)

(assert (=> d!20862 m!105647))

(declare-fun m!105649 () Bool)

(assert (=> b!66451 m!105649))

(assert (=> b!66267 d!20862))

(declare-fun b!66469 () Bool)

(declare-fun e!43643 () Bool)

(declare-datatypes ((tuple2!5886 0))(
  ( (tuple2!5887 (_1!3054 BitStream!2264) (_2!3054 Bool)) )
))
(declare-fun lt!105472 () tuple2!5886)

(declare-fun lt!105477 () tuple2!5864)

(assert (=> b!66469 (= e!43643 (= (bitIndex!0 (size!1315 (buf!1696 (_1!3054 lt!105472))) (currentByte!3368 (_1!3054 lt!105472)) (currentBit!3363 (_1!3054 lt!105472))) (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105477))) (currentByte!3368 (_2!3043 lt!105477)) (currentBit!3363 (_2!3043 lt!105477)))))))

(declare-fun b!66470 () Bool)

(declare-fun e!43640 () Bool)

(declare-fun e!43642 () Bool)

(assert (=> b!66470 (= e!43640 e!43642)))

(declare-fun res!55066 () Bool)

(assert (=> b!66470 (=> (not res!55066) (not e!43642))))

(declare-fun lt!105473 () tuple2!5864)

(declare-fun lt!105469 () (_ BitVec 8))

(declare-fun lt!105474 () tuple2!5886)

(assert (=> b!66470 (= res!55066 (and (= (_2!3054 lt!105474) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!105469)) #b00000000000000000000000000000000))) (= (_1!3054 lt!105474) (_2!3043 lt!105473))))))

(declare-datatypes ((tuple2!5888 0))(
  ( (tuple2!5889 (_1!3055 array!2852) (_2!3055 BitStream!2264)) )
))
(declare-fun lt!105475 () tuple2!5888)

(declare-fun lt!105471 () BitStream!2264)

(declare-fun readBits!0 (BitStream!2264 (_ BitVec 64)) tuple2!5888)

(assert (=> b!66470 (= lt!105475 (readBits!0 lt!105471 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2264) tuple2!5886)

(assert (=> b!66470 (= lt!105474 (readBitPure!0 lt!105471))))

(declare-fun readerFrom!0 (BitStream!2264 (_ BitVec 32) (_ BitVec 32)) BitStream!2264)

(assert (=> b!66470 (= lt!105471 (readerFrom!0 (_2!3043 lt!105473) (currentBit!3363 thiss!1379) (currentByte!3368 thiss!1379)))))

(declare-fun b!66471 () Bool)

(declare-fun res!55070 () Bool)

(assert (=> b!66471 (=> (not res!55070) (not e!43640))))

(assert (=> b!66471 (= res!55070 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105473)))))

(declare-fun b!66472 () Bool)

(declare-fun res!55065 () Bool)

(declare-fun e!43641 () Bool)

(assert (=> b!66472 (=> (not res!55065) (not e!43641))))

(assert (=> b!66472 (= res!55065 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105477))) (currentByte!3368 (_2!3043 lt!105477)) (currentBit!3363 (_2!3043 lt!105477))) (bvadd (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!66473 () Bool)

(assert (=> b!66473 (= e!43641 e!43643)))

(declare-fun res!55068 () Bool)

(assert (=> b!66473 (=> (not res!55068) (not e!43643))))

(declare-fun lt!105468 () Bool)

(assert (=> b!66473 (= res!55068 (and (= (_2!3054 lt!105472) lt!105468) (= (_1!3054 lt!105472) (_2!3043 lt!105477))))))

(assert (=> b!66473 (= lt!105472 (readBitPure!0 (readerFrom!0 (_2!3043 lt!105477) (currentBit!3363 thiss!1379) (currentByte!3368 thiss!1379))))))

(declare-fun b!66474 () Bool)

(declare-fun res!55067 () Bool)

(assert (=> b!66474 (=> (not res!55067) (not e!43640))))

(declare-fun lt!105478 () (_ BitVec 64))

(declare-fun lt!105476 () (_ BitVec 64))

(assert (=> b!66474 (= res!55067 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105473))) (currentByte!3368 (_2!3043 lt!105473)) (currentBit!3363 (_2!3043 lt!105473))) (bvadd lt!105476 lt!105478)))))

(assert (=> b!66474 (or (not (= (bvand lt!105476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105478 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!105476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!105476 lt!105478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66474 (= lt!105478 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!66474 (= lt!105476 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(declare-fun d!20864 () Bool)

(assert (=> d!20864 e!43640))

(declare-fun res!55069 () Bool)

(assert (=> d!20864 (=> (not res!55069) (not e!43640))))

(assert (=> d!20864 (= res!55069 (= (size!1315 (buf!1696 (_2!3043 lt!105473))) (size!1315 (buf!1696 thiss!1379))))))

(declare-fun lt!105470 () array!2852)

(assert (=> d!20864 (= lt!105469 (select (arr!1879 lt!105470) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20864 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1315 lt!105470)))))

(assert (=> d!20864 (= lt!105470 (array!2853 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!105467 () tuple2!5864)

(assert (=> d!20864 (= lt!105473 (tuple2!5865 (_1!3043 lt!105467) (_2!3043 lt!105467)))))

(assert (=> d!20864 (= lt!105467 lt!105477)))

(assert (=> d!20864 e!43641))

(declare-fun res!55071 () Bool)

(assert (=> d!20864 (=> (not res!55071) (not e!43641))))

(assert (=> d!20864 (= res!55071 (= (size!1315 (buf!1696 thiss!1379)) (size!1315 (buf!1696 (_2!3043 lt!105477)))))))

(declare-fun appendBit!0 (BitStream!2264 Bool) tuple2!5864)

(assert (=> d!20864 (= lt!105477 (appendBit!0 thiss!1379 lt!105468))))

(assert (=> d!20864 (= lt!105468 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20864 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20864 (= (appendBitFromByte!0 thiss!1379 (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!105473)))

(declare-fun b!66475 () Bool)

(declare-fun res!55064 () Bool)

(assert (=> b!66475 (=> (not res!55064) (not e!43641))))

(assert (=> b!66475 (= res!55064 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105477)))))

(declare-fun b!66476 () Bool)

(assert (=> b!66476 (= e!43642 (= (bitIndex!0 (size!1315 (buf!1696 (_1!3054 lt!105474))) (currentByte!3368 (_1!3054 lt!105474)) (currentBit!3363 (_1!3054 lt!105474))) (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105473))) (currentByte!3368 (_2!3043 lt!105473)) (currentBit!3363 (_2!3043 lt!105473)))))))

(assert (= (and d!20864 res!55071) b!66472))

(assert (= (and b!66472 res!55065) b!66475))

(assert (= (and b!66475 res!55064) b!66473))

(assert (= (and b!66473 res!55068) b!66469))

(assert (= (and d!20864 res!55069) b!66474))

(assert (= (and b!66474 res!55067) b!66471))

(assert (= (and b!66471 res!55070) b!66470))

(assert (= (and b!66470 res!55066) b!66476))

(declare-fun m!105651 () Bool)

(assert (=> b!66473 m!105651))

(assert (=> b!66473 m!105651))

(declare-fun m!105653 () Bool)

(assert (=> b!66473 m!105653))

(declare-fun m!105655 () Bool)

(assert (=> b!66469 m!105655))

(declare-fun m!105657 () Bool)

(assert (=> b!66469 m!105657))

(declare-fun m!105659 () Bool)

(assert (=> d!20864 m!105659))

(declare-fun m!105661 () Bool)

(assert (=> d!20864 m!105661))

(declare-fun m!105663 () Bool)

(assert (=> d!20864 m!105663))

(declare-fun m!105665 () Bool)

(assert (=> b!66474 m!105665))

(assert (=> b!66474 m!105295))

(assert (=> b!66472 m!105657))

(assert (=> b!66472 m!105295))

(declare-fun m!105667 () Bool)

(assert (=> b!66471 m!105667))

(declare-fun m!105669 () Bool)

(assert (=> b!66476 m!105669))

(assert (=> b!66476 m!105665))

(declare-fun m!105671 () Bool)

(assert (=> b!66475 m!105671))

(declare-fun m!105673 () Bool)

(assert (=> b!66470 m!105673))

(declare-fun m!105675 () Bool)

(assert (=> b!66470 m!105675))

(declare-fun m!105677 () Bool)

(assert (=> b!66470 m!105677))

(assert (=> b!66267 d!20864))

(declare-fun d!20866 () Bool)

(assert (=> d!20866 (= (head!526 lt!105079) (h!822 lt!105079))))

(assert (=> b!66278 d!20866))

(declare-fun d!20868 () Bool)

(assert (=> d!20868 (= (bitAt!0 (buf!1696 (_2!3043 lt!105069)) lt!105076) (not (= (bvand ((_ sign_extend 24) (select (arr!1879 (buf!1696 (_2!3043 lt!105069))) ((_ extract 31 0) (bvsdiv lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5076 () Bool)

(assert (= bs!5076 d!20868))

(declare-fun m!105679 () Bool)

(assert (=> bs!5076 m!105679))

(declare-fun m!105681 () Bool)

(assert (=> bs!5076 m!105681))

(assert (=> b!66268 d!20868))

(declare-fun d!20870 () Bool)

(assert (=> d!20870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5077 () Bool)

(assert (= bs!5077 d!20870))

(declare-fun m!105683 () Bool)

(assert (=> bs!5077 m!105683))

(assert (=> b!66279 d!20870))

(declare-fun d!20872 () Bool)

(assert (=> d!20872 (= (array_inv!1191 srcBuffer!2) (bvsge (size!1315 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12886 d!20872))

(declare-fun d!20874 () Bool)

(assert (=> d!20874 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3363 thiss!1379) (currentByte!3368 thiss!1379) (size!1315 (buf!1696 thiss!1379))))))

(declare-fun bs!5078 () Bool)

(assert (= bs!5078 d!20874))

(declare-fun m!105685 () Bool)

(assert (=> bs!5078 m!105685))

(assert (=> start!12886 d!20874))

(declare-fun d!20876 () Bool)

(assert (=> d!20876 (= (bitAt!0 (buf!1696 (_1!3044 lt!105080)) lt!105076) (not (= (bvand ((_ sign_extend 24) (select (arr!1879 (buf!1696 (_1!3044 lt!105080))) ((_ extract 31 0) (bvsdiv lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5079 () Bool)

(assert (= bs!5079 d!20876))

(declare-fun m!105687 () Bool)

(assert (=> bs!5079 m!105687))

(assert (=> bs!5079 m!105681))

(assert (=> b!66269 d!20876))

(declare-fun d!20878 () Bool)

(assert (=> d!20878 (= (bitAt!0 (buf!1696 (_1!3044 lt!105065)) lt!105076) (not (= (bvand ((_ sign_extend 24) (select (arr!1879 (buf!1696 (_1!3044 lt!105065))) ((_ extract 31 0) (bvsdiv lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!105076 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5080 () Bool)

(assert (= bs!5080 d!20878))

(declare-fun m!105689 () Bool)

(assert (=> bs!5080 m!105689))

(assert (=> bs!5080 m!105681))

(assert (=> b!66269 d!20878))

(declare-fun d!20880 () Bool)

(assert (=> d!20880 (= (head!526 (byteArrayBitContentToList!0 (_2!3043 lt!105066) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!822 (byteArrayBitContentToList!0 (_2!3043 lt!105066) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66280 d!20880))

(declare-fun d!20882 () Bool)

(declare-fun c!4842 () Bool)

(assert (=> d!20882 (= c!4842 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43646 () List!707)

(assert (=> d!20882 (= (byteArrayBitContentToList!0 (_2!3043 lt!105066) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!43646)))

(declare-fun b!66481 () Bool)

(assert (=> b!66481 (= e!43646 Nil!704)))

(declare-fun b!66482 () Bool)

(assert (=> b!66482 (= e!43646 (Cons!703 (not (= (bvand ((_ sign_extend 24) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3043 lt!105066) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20882 c!4842) b!66481))

(assert (= (and d!20882 (not c!4842)) b!66482))

(assert (=> b!66482 m!105317))

(assert (=> b!66482 m!105663))

(declare-fun m!105691 () Bool)

(assert (=> b!66482 m!105691))

(assert (=> b!66280 d!20882))

(declare-fun d!20884 () Bool)

(assert (=> d!20884 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5081 () Bool)

(assert (= bs!5081 d!20884))

(assert (=> bs!5081 m!105317))

(assert (=> bs!5081 m!105663))

(assert (=> b!66280 d!20884))

(declare-fun d!20886 () Bool)

(assert (=> d!20886 (= (tail!311 lt!105079) (t!1457 lt!105079))))

(assert (=> b!66270 d!20886))

(declare-fun d!20888 () Bool)

(declare-fun e!43649 () Bool)

(assert (=> d!20888 e!43649))

(declare-fun res!55074 () Bool)

(assert (=> d!20888 (=> (not res!55074) (not e!43649))))

(declare-fun lt!105484 () (_ BitVec 64))

(assert (=> d!20888 (= res!55074 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!105484) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!20888 (= lt!105484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105483 () Unit!4467)

(declare-fun choose!42 (BitStream!2264 BitStream!2264 BitStream!2264 BitStream!2264 (_ BitVec 64) List!707) Unit!4467)

(assert (=> d!20888 (= lt!105483 (choose!42 (_2!3043 lt!105066) (_2!3043 lt!105066) (_1!3044 lt!105065) (_1!3044 lt!105080) (bvsub to!314 i!635) lt!105079))))

(assert (=> d!20888 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20888 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3043 lt!105066) (_2!3043 lt!105066) (_1!3044 lt!105065) (_1!3044 lt!105080) (bvsub to!314 i!635) lt!105079) lt!105483)))

(declare-fun b!66485 () Bool)

(assert (=> b!66485 (= e!43649 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!105066) (_1!3044 lt!105080) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!311 lt!105079)))))

(assert (= (and d!20888 res!55074) b!66485))

(declare-fun m!105693 () Bool)

(assert (=> d!20888 m!105693))

(declare-fun m!105695 () Bool)

(assert (=> b!66485 m!105695))

(assert (=> b!66485 m!105305))

(assert (=> b!66270 d!20888))

(declare-fun d!20890 () Bool)

(declare-fun size!1318 (List!707) Int)

(assert (=> d!20890 (= (length!335 lt!105079) (size!1318 lt!105079))))

(declare-fun bs!5082 () Bool)

(assert (= bs!5082 d!20890))

(declare-fun m!105697 () Bool)

(assert (=> bs!5082 m!105697))

(assert (=> b!66282 d!20890))

(declare-fun d!20892 () Bool)

(declare-fun e!43650 () Bool)

(assert (=> d!20892 e!43650))

(declare-fun res!55075 () Bool)

(assert (=> d!20892 (=> (not res!55075) (not e!43650))))

(declare-fun lt!105488 () (_ BitVec 64))

(declare-fun lt!105490 () (_ BitVec 64))

(declare-fun lt!105485 () (_ BitVec 64))

(assert (=> d!20892 (= res!55075 (= lt!105485 (bvsub lt!105490 lt!105488)))))

(assert (=> d!20892 (or (= (bvand lt!105490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105490 lt!105488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20892 (= lt!105488 (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069)))))))

(declare-fun lt!105487 () (_ BitVec 64))

(declare-fun lt!105489 () (_ BitVec 64))

(assert (=> d!20892 (= lt!105490 (bvmul lt!105487 lt!105489))))

(assert (=> d!20892 (or (= lt!105487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105489 (bvsdiv (bvmul lt!105487 lt!105489) lt!105487)))))

(assert (=> d!20892 (= lt!105489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20892 (= lt!105487 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))))))

(assert (=> d!20892 (= lt!105485 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069)))))))

(assert (=> d!20892 (invariant!0 (currentBit!3363 (_2!3043 lt!105069)) (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105069))))))

(assert (=> d!20892 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))) lt!105485)))

(declare-fun b!66486 () Bool)

(declare-fun res!55076 () Bool)

(assert (=> b!66486 (=> (not res!55076) (not e!43650))))

(assert (=> b!66486 (= res!55076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105485))))

(declare-fun b!66487 () Bool)

(declare-fun lt!105486 () (_ BitVec 64))

(assert (=> b!66487 (= e!43650 (bvsle lt!105485 (bvmul lt!105486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66487 (or (= lt!105486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105486)))))

(assert (=> b!66487 (= lt!105486 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))))))

(assert (= (and d!20892 res!55075) b!66486))

(assert (= (and b!66486 res!55076) b!66487))

(assert (=> d!20892 m!105645))

(assert (=> d!20892 m!105257))

(assert (=> b!66272 d!20892))

(declare-fun d!20894 () Bool)

(declare-fun res!55078 () Bool)

(declare-fun e!43651 () Bool)

(assert (=> d!20894 (=> (not res!55078) (not e!43651))))

(assert (=> d!20894 (= res!55078 (= (size!1315 (buf!1696 thiss!1379)) (size!1315 (buf!1696 thiss!1379))))))

(assert (=> d!20894 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43651)))

(declare-fun b!66488 () Bool)

(declare-fun res!55079 () Bool)

(assert (=> b!66488 (=> (not res!55079) (not e!43651))))

(assert (=> b!66488 (= res!55079 (bvsle (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)) (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(declare-fun b!66489 () Bool)

(declare-fun e!43652 () Bool)

(assert (=> b!66489 (= e!43651 e!43652)))

(declare-fun res!55077 () Bool)

(assert (=> b!66489 (=> res!55077 e!43652)))

(assert (=> b!66489 (= res!55077 (= (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66490 () Bool)

(assert (=> b!66490 (= e!43652 (arrayBitRangesEq!0 (buf!1696 thiss!1379) (buf!1696 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(assert (= (and d!20894 res!55078) b!66488))

(assert (= (and b!66488 res!55079) b!66489))

(assert (= (and b!66489 (not res!55077)) b!66490))

(assert (=> b!66488 m!105295))

(assert (=> b!66488 m!105295))

(assert (=> b!66490 m!105295))

(assert (=> b!66490 m!105295))

(declare-fun m!105699 () Bool)

(assert (=> b!66490 m!105699))

(assert (=> b!66283 d!20894))

(declare-fun d!20896 () Bool)

(assert (=> d!20896 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!105493 () Unit!4467)

(declare-fun choose!11 (BitStream!2264) Unit!4467)

(assert (=> d!20896 (= lt!105493 (choose!11 thiss!1379))))

(assert (=> d!20896 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!105493)))

(declare-fun bs!5084 () Bool)

(assert (= bs!5084 d!20896))

(assert (=> bs!5084 m!105291))

(declare-fun m!105701 () Bool)

(assert (=> bs!5084 m!105701))

(assert (=> b!66283 d!20896))

(declare-fun d!20898 () Bool)

(declare-fun e!43653 () Bool)

(assert (=> d!20898 e!43653))

(declare-fun res!55080 () Bool)

(assert (=> d!20898 (=> (not res!55080) (not e!43653))))

(declare-fun lt!105499 () (_ BitVec 64))

(declare-fun lt!105494 () (_ BitVec 64))

(declare-fun lt!105497 () (_ BitVec 64))

(assert (=> d!20898 (= res!55080 (= lt!105494 (bvsub lt!105499 lt!105497)))))

(assert (=> d!20898 (or (= (bvand lt!105499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105499 lt!105497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20898 (= lt!105497 (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379))))))

(declare-fun lt!105496 () (_ BitVec 64))

(declare-fun lt!105498 () (_ BitVec 64))

(assert (=> d!20898 (= lt!105499 (bvmul lt!105496 lt!105498))))

(assert (=> d!20898 (or (= lt!105496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105498 (bvsdiv (bvmul lt!105496 lt!105498) lt!105496)))))

(assert (=> d!20898 (= lt!105498 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20898 (= lt!105496 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))))))

(assert (=> d!20898 (= lt!105494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3368 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3363 thiss!1379))))))

(assert (=> d!20898 (invariant!0 (currentBit!3363 thiss!1379) (currentByte!3368 thiss!1379) (size!1315 (buf!1696 thiss!1379)))))

(assert (=> d!20898 (= (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)) lt!105494)))

(declare-fun b!66491 () Bool)

(declare-fun res!55081 () Bool)

(assert (=> b!66491 (=> (not res!55081) (not e!43653))))

(assert (=> b!66491 (= res!55081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105494))))

(declare-fun b!66492 () Bool)

(declare-fun lt!105495 () (_ BitVec 64))

(assert (=> b!66492 (= e!43653 (bvsle lt!105494 (bvmul lt!105495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66492 (or (= lt!105495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105495)))))

(assert (=> b!66492 (= lt!105495 ((_ sign_extend 32) (size!1315 (buf!1696 thiss!1379))))))

(assert (= (and d!20898 res!55080) b!66491))

(assert (= (and b!66491 res!55081) b!66492))

(assert (=> d!20898 m!105683))

(assert (=> d!20898 m!105685))

(assert (=> b!66283 d!20898))

(declare-fun d!20900 () Bool)

(assert (=> d!20900 (= (head!526 (byteArrayBitContentToList!0 (_2!3043 lt!105069) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!822 (byteArrayBitContentToList!0 (_2!3043 lt!105069) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66273 d!20900))

(declare-fun d!20902 () Bool)

(declare-fun c!4843 () Bool)

(assert (=> d!20902 (= c!4843 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43654 () List!707)

(assert (=> d!20902 (= (byteArrayBitContentToList!0 (_2!3043 lt!105069) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43654)))

(declare-fun b!66493 () Bool)

(assert (=> b!66493 (= e!43654 Nil!704)))

(declare-fun b!66494 () Bool)

(assert (=> b!66494 (= e!43654 (Cons!703 (not (= (bvand ((_ sign_extend 24) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3043 lt!105069) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20902 c!4843) b!66493))

(assert (= (and d!20902 (not c!4843)) b!66494))

(assert (=> b!66494 m!105317))

(assert (=> b!66494 m!105663))

(declare-fun m!105703 () Bool)

(assert (=> b!66494 m!105703))

(assert (=> b!66273 d!20902))

(declare-fun d!20904 () Bool)

(assert (=> d!20904 (= (head!526 (bitStreamReadBitsIntoList!0 (_2!3043 lt!105069) (_1!3044 lt!105082) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!822 (bitStreamReadBitsIntoList!0 (_2!3043 lt!105069) (_1!3044 lt!105082) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66273 d!20904))

(declare-fun b!66498 () Bool)

(declare-fun e!43655 () Bool)

(declare-fun lt!105502 () List!707)

(assert (=> b!66498 (= e!43655 (> (length!335 lt!105502) 0))))

(declare-fun lt!105501 () tuple2!5882)

(declare-fun lt!105500 () (_ BitVec 64))

(declare-fun e!43656 () tuple2!5880)

(declare-fun b!66496 () Bool)

(assert (=> b!66496 (= e!43656 (tuple2!5881 (Cons!703 (_1!3052 lt!105501) (bitStreamReadBitsIntoList!0 (_2!3043 lt!105069) (_2!3052 lt!105501) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!105500))) (_2!3052 lt!105501)))))

(assert (=> b!66496 (= lt!105501 (readBit!0 (_1!3044 lt!105082)))))

(assert (=> b!66496 (= lt!105500 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66497 () Bool)

(assert (=> b!66497 (= e!43655 (isEmpty!209 lt!105502))))

(declare-fun d!20906 () Bool)

(assert (=> d!20906 e!43655))

(declare-fun c!4845 () Bool)

(assert (=> d!20906 (= c!4845 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20906 (= lt!105502 (_1!3051 e!43656))))

(declare-fun c!4844 () Bool)

(assert (=> d!20906 (= c!4844 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20906 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20906 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!105069) (_1!3044 lt!105082) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105502)))

(declare-fun b!66495 () Bool)

(assert (=> b!66495 (= e!43656 (tuple2!5881 Nil!704 (_1!3044 lt!105082)))))

(assert (= (and d!20906 c!4844) b!66495))

(assert (= (and d!20906 (not c!4844)) b!66496))

(assert (= (and d!20906 c!4845) b!66497))

(assert (= (and d!20906 (not c!4845)) b!66498))

(declare-fun m!105705 () Bool)

(assert (=> b!66498 m!105705))

(declare-fun m!105707 () Bool)

(assert (=> b!66496 m!105707))

(declare-fun m!105709 () Bool)

(assert (=> b!66496 m!105709))

(declare-fun m!105711 () Bool)

(assert (=> b!66497 m!105711))

(assert (=> b!66273 d!20906))

(declare-fun b!66499 () Bool)

(declare-fun e!43658 () Unit!4467)

(declare-fun lt!105504 () Unit!4467)

(assert (=> b!66499 (= e!43658 lt!105504)))

(declare-fun lt!105511 () (_ BitVec 64))

(assert (=> b!66499 (= lt!105511 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105521 () (_ BitVec 64))

(assert (=> b!66499 (= lt!105521 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(assert (=> b!66499 (= lt!105504 (arrayBitRangesEqSymmetric!0 (buf!1696 thiss!1379) (buf!1696 (_2!3043 lt!105069)) lt!105511 lt!105521))))

(assert (=> b!66499 (arrayBitRangesEq!0 (buf!1696 (_2!3043 lt!105069)) (buf!1696 thiss!1379) lt!105511 lt!105521)))

(declare-fun d!20908 () Bool)

(declare-fun e!43657 () Bool)

(assert (=> d!20908 e!43657))

(declare-fun res!55084 () Bool)

(assert (=> d!20908 (=> (not res!55084) (not e!43657))))

(declare-fun lt!105506 () tuple2!5866)

(assert (=> d!20908 (= res!55084 (isPrefixOf!0 (_1!3044 lt!105506) (_2!3044 lt!105506)))))

(declare-fun lt!105509 () BitStream!2264)

(assert (=> d!20908 (= lt!105506 (tuple2!5867 lt!105509 (_2!3043 lt!105069)))))

(declare-fun lt!105518 () Unit!4467)

(declare-fun lt!105510 () Unit!4467)

(assert (=> d!20908 (= lt!105518 lt!105510)))

(assert (=> d!20908 (isPrefixOf!0 lt!105509 (_2!3043 lt!105069))))

(assert (=> d!20908 (= lt!105510 (lemmaIsPrefixTransitive!0 lt!105509 (_2!3043 lt!105069) (_2!3043 lt!105069)))))

(declare-fun lt!105503 () Unit!4467)

(declare-fun lt!105512 () Unit!4467)

(assert (=> d!20908 (= lt!105503 lt!105512)))

(assert (=> d!20908 (isPrefixOf!0 lt!105509 (_2!3043 lt!105069))))

(assert (=> d!20908 (= lt!105512 (lemmaIsPrefixTransitive!0 lt!105509 thiss!1379 (_2!3043 lt!105069)))))

(declare-fun lt!105517 () Unit!4467)

(assert (=> d!20908 (= lt!105517 e!43658)))

(declare-fun c!4846 () Bool)

(assert (=> d!20908 (= c!4846 (not (= (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105520 () Unit!4467)

(declare-fun lt!105519 () Unit!4467)

(assert (=> d!20908 (= lt!105520 lt!105519)))

(assert (=> d!20908 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105069))))

(assert (=> d!20908 (= lt!105519 (lemmaIsPrefixRefl!0 (_2!3043 lt!105069)))))

(declare-fun lt!105522 () Unit!4467)

(declare-fun lt!105515 () Unit!4467)

(assert (=> d!20908 (= lt!105522 lt!105515)))

(assert (=> d!20908 (= lt!105515 (lemmaIsPrefixRefl!0 (_2!3043 lt!105069)))))

(declare-fun lt!105508 () Unit!4467)

(declare-fun lt!105507 () Unit!4467)

(assert (=> d!20908 (= lt!105508 lt!105507)))

(assert (=> d!20908 (isPrefixOf!0 lt!105509 lt!105509)))

(assert (=> d!20908 (= lt!105507 (lemmaIsPrefixRefl!0 lt!105509))))

(declare-fun lt!105516 () Unit!4467)

(declare-fun lt!105505 () Unit!4467)

(assert (=> d!20908 (= lt!105516 lt!105505)))

(assert (=> d!20908 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20908 (= lt!105505 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20908 (= lt!105509 (BitStream!2265 (buf!1696 (_2!3043 lt!105069)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(assert (=> d!20908 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105069))))

(assert (=> d!20908 (= (reader!0 thiss!1379 (_2!3043 lt!105069)) lt!105506)))

(declare-fun b!66500 () Bool)

(declare-fun Unit!4491 () Unit!4467)

(assert (=> b!66500 (= e!43658 Unit!4491)))

(declare-fun b!66501 () Bool)

(declare-fun res!55083 () Bool)

(assert (=> b!66501 (=> (not res!55083) (not e!43657))))

(assert (=> b!66501 (= res!55083 (isPrefixOf!0 (_2!3044 lt!105506) (_2!3043 lt!105069)))))

(declare-fun lt!105513 () (_ BitVec 64))

(declare-fun b!66502 () Bool)

(declare-fun lt!105514 () (_ BitVec 64))

(assert (=> b!66502 (= e!43657 (= (_1!3044 lt!105506) (withMovedBitIndex!0 (_2!3044 lt!105506) (bvsub lt!105513 lt!105514))))))

(assert (=> b!66502 (or (= (bvand lt!105513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105513 lt!105514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66502 (= lt!105514 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(assert (=> b!66502 (= lt!105513 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)))))

(declare-fun b!66503 () Bool)

(declare-fun res!55082 () Bool)

(assert (=> b!66503 (=> (not res!55082) (not e!43657))))

(assert (=> b!66503 (= res!55082 (isPrefixOf!0 (_1!3044 lt!105506) thiss!1379))))

(assert (= (and d!20908 c!4846) b!66499))

(assert (= (and d!20908 (not c!4846)) b!66500))

(assert (= (and d!20908 res!55084) b!66503))

(assert (= (and b!66503 res!55082) b!66501))

(assert (= (and b!66501 res!55083) b!66502))

(declare-fun m!105713 () Bool)

(assert (=> b!66501 m!105713))

(declare-fun m!105715 () Bool)

(assert (=> b!66502 m!105715))

(assert (=> b!66502 m!105323))

(assert (=> b!66502 m!105295))

(declare-fun m!105717 () Bool)

(assert (=> b!66503 m!105717))

(declare-fun m!105719 () Bool)

(assert (=> d!20908 m!105719))

(declare-fun m!105721 () Bool)

(assert (=> d!20908 m!105721))

(assert (=> d!20908 m!105313))

(declare-fun m!105723 () Bool)

(assert (=> d!20908 m!105723))

(declare-fun m!105725 () Bool)

(assert (=> d!20908 m!105725))

(assert (=> d!20908 m!105293))

(assert (=> d!20908 m!105291))

(assert (=> d!20908 m!105587))

(declare-fun m!105727 () Bool)

(assert (=> d!20908 m!105727))

(assert (=> d!20908 m!105585))

(declare-fun m!105729 () Bool)

(assert (=> d!20908 m!105729))

(assert (=> b!66499 m!105295))

(declare-fun m!105731 () Bool)

(assert (=> b!66499 m!105731))

(declare-fun m!105733 () Bool)

(assert (=> b!66499 m!105733))

(assert (=> b!66274 d!20908))

(declare-fun d!20910 () Bool)

(assert (=> d!20910 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105066))))

(declare-fun lt!105525 () Unit!4467)

(declare-fun choose!30 (BitStream!2264 BitStream!2264 BitStream!2264) Unit!4467)

(assert (=> d!20910 (= lt!105525 (choose!30 thiss!1379 (_2!3043 lt!105069) (_2!3043 lt!105066)))))

(assert (=> d!20910 (isPrefixOf!0 thiss!1379 (_2!3043 lt!105069))))

(assert (=> d!20910 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3043 lt!105069) (_2!3043 lt!105066)) lt!105525)))

(declare-fun bs!5085 () Bool)

(assert (= bs!5085 d!20910))

(assert (=> bs!5085 m!105279))

(declare-fun m!105735 () Bool)

(assert (=> bs!5085 m!105735))

(assert (=> bs!5085 m!105313))

(assert (=> b!66274 d!20910))

(declare-fun b!66678 () Bool)

(declare-fun res!55235 () Bool)

(declare-fun e!43747 () Bool)

(assert (=> b!66678 (=> (not res!55235) (not e!43747))))

(declare-fun lt!106044 () tuple2!5864)

(assert (=> b!66678 (= res!55235 (= (size!1315 (buf!1696 (_2!3043 lt!106044))) (size!1315 (buf!1696 (_2!3043 lt!105069)))))))

(declare-fun b!66679 () Bool)

(declare-fun res!55231 () Bool)

(assert (=> b!66679 (=> (not res!55231) (not e!43747))))

(assert (=> b!66679 (= res!55231 (= (size!1315 (buf!1696 (_2!3043 lt!105069))) (size!1315 (buf!1696 (_2!3043 lt!106044)))))))

(declare-fun b!66680 () Bool)

(declare-fun e!43745 () tuple2!5864)

(declare-fun lt!106045 () tuple2!5864)

(declare-fun Unit!4492 () Unit!4467)

(assert (=> b!66680 (= e!43745 (tuple2!5865 Unit!4492 (_2!3043 lt!106045)))))

(declare-fun lt!106063 () tuple2!5864)

(assert (=> b!66680 (= lt!106063 (appendBitFromByte!0 (_2!3043 lt!105069) (select (arr!1879 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!106057 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106057 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106061 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106061 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106052 () Unit!4467)

(assert (=> b!66680 (= lt!106052 (validateOffsetBitsIneqLemma!0 (_2!3043 lt!105069) (_2!3043 lt!106063) lt!106057 lt!106061))))

(assert (=> b!66680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!106063)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!106063))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!106063))) (bvsub lt!106057 lt!106061))))

(declare-fun lt!106077 () Unit!4467)

(assert (=> b!66680 (= lt!106077 lt!106052)))

(declare-fun lt!106065 () tuple2!5866)

(assert (=> b!66680 (= lt!106065 (reader!0 (_2!3043 lt!105069) (_2!3043 lt!106063)))))

(declare-fun lt!106054 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106054 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106078 () Unit!4467)

(assert (=> b!66680 (= lt!106078 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!106063)) lt!106054))))

(assert (=> b!66680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!106063)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!106054)))

(declare-fun lt!106040 () Unit!4467)

(assert (=> b!66680 (= lt!106040 lt!106078)))

(assert (=> b!66680 (= (head!526 (byteArrayBitContentToList!0 (_2!3043 lt!106063) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!526 (bitStreamReadBitsIntoList!0 (_2!3043 lt!106063) (_1!3044 lt!106065) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106046 () Unit!4467)

(declare-fun Unit!4493 () Unit!4467)

(assert (=> b!66680 (= lt!106046 Unit!4493)))

(assert (=> b!66680 (= lt!106045 (appendBitsMSBFirstLoop!0 (_2!3043 lt!106063) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!106070 () Unit!4467)

(assert (=> b!66680 (= lt!106070 (lemmaIsPrefixTransitive!0 (_2!3043 lt!105069) (_2!3043 lt!106063) (_2!3043 lt!106045)))))

(assert (=> b!66680 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!106045))))

(declare-fun lt!106066 () Unit!4467)

(assert (=> b!66680 (= lt!106066 lt!106070)))

(assert (=> b!66680 (= (size!1315 (buf!1696 (_2!3043 lt!106045))) (size!1315 (buf!1696 (_2!3043 lt!105069))))))

(declare-fun lt!106058 () Unit!4467)

(declare-fun Unit!4494 () Unit!4467)

(assert (=> b!66680 (= lt!106058 Unit!4494)))

(assert (=> b!66680 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!106045))) (currentByte!3368 (_2!3043 lt!106045)) (currentBit!3363 (_2!3043 lt!106045))) (bvsub (bvadd (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106067 () Unit!4467)

(declare-fun Unit!4495 () Unit!4467)

(assert (=> b!66680 (= lt!106067 Unit!4495)))

(assert (=> b!66680 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!106045))) (currentByte!3368 (_2!3043 lt!106045)) (currentBit!3363 (_2!3043 lt!106045))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!106063))) (currentByte!3368 (_2!3043 lt!106063)) (currentBit!3363 (_2!3043 lt!106063))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106038 () Unit!4467)

(declare-fun Unit!4496 () Unit!4467)

(assert (=> b!66680 (= lt!106038 Unit!4496)))

(declare-fun lt!106041 () tuple2!5866)

(assert (=> b!66680 (= lt!106041 (reader!0 (_2!3043 lt!105069) (_2!3043 lt!106045)))))

(declare-fun lt!106049 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106049 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106068 () Unit!4467)

(assert (=> b!66680 (= lt!106068 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!106045)) lt!106049))))

(assert (=> b!66680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!106045)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!106049)))

(declare-fun lt!106056 () Unit!4467)

(assert (=> b!66680 (= lt!106056 lt!106068)))

(declare-fun lt!106064 () tuple2!5866)

(declare-fun call!853 () tuple2!5866)

(assert (=> b!66680 (= lt!106064 call!853)))

(declare-fun lt!106079 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106079 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106072 () Unit!4467)

(assert (=> b!66680 (= lt!106072 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!106063) (buf!1696 (_2!3043 lt!106045)) lt!106079))))

(assert (=> b!66680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!106045)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!106063))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!106063))) lt!106079)))

(declare-fun lt!106050 () Unit!4467)

(assert (=> b!66680 (= lt!106050 lt!106072)))

(declare-fun lt!106048 () List!707)

(assert (=> b!66680 (= lt!106048 (byteArrayBitContentToList!0 (_2!3043 lt!106045) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106043 () List!707)

(assert (=> b!66680 (= lt!106043 (byteArrayBitContentToList!0 (_2!3043 lt!106045) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106047 () List!707)

(assert (=> b!66680 (= lt!106047 (bitStreamReadBitsIntoList!0 (_2!3043 lt!106045) (_1!3044 lt!106041) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106059 () List!707)

(assert (=> b!66680 (= lt!106059 (bitStreamReadBitsIntoList!0 (_2!3043 lt!106045) (_1!3044 lt!106064) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106071 () (_ BitVec 64))

(assert (=> b!66680 (= lt!106071 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106076 () Unit!4467)

(assert (=> b!66680 (= lt!106076 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3043 lt!106045) (_2!3043 lt!106045) (_1!3044 lt!106041) (_1!3044 lt!106064) lt!106071 lt!106047))))

(assert (=> b!66680 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!106045) (_1!3044 lt!106064) (bvsub lt!106071 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!311 lt!106047))))

(declare-fun lt!106074 () Unit!4467)

(assert (=> b!66680 (= lt!106074 lt!106076)))

(declare-fun lt!106075 () Unit!4467)

(declare-fun lt!106069 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2852 array!2852 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4467)

(assert (=> b!66680 (= lt!106075 (arrayBitRangesEqImpliesEq!0 (buf!1696 (_2!3043 lt!106063)) (buf!1696 (_2!3043 lt!106045)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!106069 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!106063))) (currentByte!3368 (_2!3043 lt!106063)) (currentBit!3363 (_2!3043 lt!106063)))))))

(assert (=> b!66680 (= (bitAt!0 (buf!1696 (_2!3043 lt!106063)) lt!106069) (bitAt!0 (buf!1696 (_2!3043 lt!106045)) lt!106069))))

(declare-fun lt!106055 () Unit!4467)

(assert (=> b!66680 (= lt!106055 lt!106075)))

(declare-fun b!66681 () Bool)

(declare-fun res!55236 () Bool)

(assert (=> b!66681 (=> (not res!55236) (not e!43747))))

(assert (=> b!66681 (= res!55236 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!106044)))))

(declare-fun b!66682 () Bool)

(declare-fun res!55234 () Bool)

(assert (=> b!66682 (=> (not res!55234) (not e!43747))))

(assert (=> b!66682 (= res!55234 (invariant!0 (currentBit!3363 (_2!3043 lt!106044)) (currentByte!3368 (_2!3043 lt!106044)) (size!1315 (buf!1696 (_2!3043 lt!106044)))))))

(declare-fun b!66683 () Bool)

(declare-fun e!43746 () Bool)

(declare-fun lt!106060 () (_ BitVec 64))

(assert (=> b!66683 (= e!43746 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!106060))))

(declare-fun bm!850 () Bool)

(declare-fun c!4860 () Bool)

(assert (=> bm!850 (= call!853 (reader!0 (ite c!4860 (_2!3043 lt!106063) (_2!3043 lt!105069)) (ite c!4860 (_2!3043 lt!106045) (_2!3043 lt!105069))))))

(declare-fun d!20912 () Bool)

(assert (=> d!20912 e!43747))

(declare-fun res!55232 () Bool)

(assert (=> d!20912 (=> (not res!55232) (not e!43747))))

(declare-fun lt!106039 () (_ BitVec 64))

(assert (=> d!20912 (= res!55232 (= (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!106044))) (currentByte!3368 (_2!3043 lt!106044)) (currentBit!3363 (_2!3043 lt!106044))) (bvsub lt!106039 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20912 (or (= (bvand lt!106039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106039 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106053 () (_ BitVec 64))

(assert (=> d!20912 (= lt!106039 (bvadd lt!106053 to!314))))

(assert (=> d!20912 (or (not (= (bvand lt!106053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106053 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20912 (= lt!106053 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(assert (=> d!20912 (= lt!106044 e!43745)))

(assert (=> d!20912 (= c!4860 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!106051 () Unit!4467)

(declare-fun lt!106037 () Unit!4467)

(assert (=> d!20912 (= lt!106051 lt!106037)))

(assert (=> d!20912 (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105069))))

(assert (=> d!20912 (= lt!106037 (lemmaIsPrefixRefl!0 (_2!3043 lt!105069)))))

(assert (=> d!20912 (= lt!106069 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))))))

(assert (=> d!20912 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20912 (= (appendBitsMSBFirstLoop!0 (_2!3043 lt!105069) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!106044)))

(declare-fun lt!106062 () tuple2!5866)

(declare-fun b!66684 () Bool)

(assert (=> b!66684 (= e!43747 (= (bitStreamReadBitsIntoList!0 (_2!3043 lt!106044) (_1!3044 lt!106062) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3043 lt!106044) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!66684 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66684 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106073 () Unit!4467)

(declare-fun lt!106080 () Unit!4467)

(assert (=> b!66684 (= lt!106073 lt!106080)))

(assert (=> b!66684 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!106044)))) ((_ sign_extend 32) (currentByte!3368 (_2!3043 lt!105069))) ((_ sign_extend 32) (currentBit!3363 (_2!3043 lt!105069))) lt!106060)))

(assert (=> b!66684 (= lt!106080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3043 lt!105069) (buf!1696 (_2!3043 lt!106044)) lt!106060))))

(assert (=> b!66684 e!43746))

(declare-fun res!55233 () Bool)

(assert (=> b!66684 (=> (not res!55233) (not e!43746))))

(assert (=> b!66684 (= res!55233 (and (= (size!1315 (buf!1696 (_2!3043 lt!105069))) (size!1315 (buf!1696 (_2!3043 lt!106044)))) (bvsge lt!106060 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66684 (= lt!106060 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!66684 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66684 (= lt!106062 (reader!0 (_2!3043 lt!105069) (_2!3043 lt!106044)))))

(declare-fun b!66685 () Bool)

(declare-fun Unit!4497 () Unit!4467)

(assert (=> b!66685 (= e!43745 (tuple2!5865 Unit!4497 (_2!3043 lt!105069)))))

(assert (=> b!66685 (= (size!1315 (buf!1696 (_2!3043 lt!105069))) (size!1315 (buf!1696 (_2!3043 lt!105069))))))

(declare-fun lt!106042 () Unit!4467)

(declare-fun Unit!4498 () Unit!4467)

(assert (=> b!66685 (= lt!106042 Unit!4498)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2264 array!2852 array!2852 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66685 (checkByteArrayBitContent!0 (_2!3043 lt!105069) srcBuffer!2 (_1!3055 (readBits!0 (_1!3044 call!853) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!20912 c!4860) b!66680))

(assert (= (and d!20912 (not c!4860)) b!66685))

(assert (= (or b!66680 b!66685) bm!850))

(assert (= (and d!20912 res!55232) b!66682))

(assert (= (and b!66682 res!55234) b!66679))

(assert (= (and b!66679 res!55231) b!66681))

(assert (= (and b!66681 res!55236) b!66678))

(assert (= (and b!66678 res!55235) b!66684))

(assert (= (and b!66684 res!55233) b!66683))

(declare-fun m!106053 () Bool)

(assert (=> b!66684 m!106053))

(declare-fun m!106055 () Bool)

(assert (=> b!66684 m!106055))

(declare-fun m!106057 () Bool)

(assert (=> b!66684 m!106057))

(declare-fun m!106059 () Bool)

(assert (=> b!66684 m!106059))

(declare-fun m!106061 () Bool)

(assert (=> b!66684 m!106061))

(declare-fun m!106063 () Bool)

(assert (=> b!66683 m!106063))

(declare-fun m!106065 () Bool)

(assert (=> b!66680 m!106065))

(declare-fun m!106067 () Bool)

(assert (=> b!66680 m!106067))

(declare-fun m!106069 () Bool)

(assert (=> b!66680 m!106069))

(declare-fun m!106071 () Bool)

(assert (=> b!66680 m!106071))

(declare-fun m!106073 () Bool)

(assert (=> b!66680 m!106073))

(declare-fun m!106075 () Bool)

(assert (=> b!66680 m!106075))

(declare-fun m!106077 () Bool)

(assert (=> b!66680 m!106077))

(declare-fun m!106079 () Bool)

(assert (=> b!66680 m!106079))

(declare-fun m!106081 () Bool)

(assert (=> b!66680 m!106081))

(declare-fun m!106083 () Bool)

(assert (=> b!66680 m!106083))

(declare-fun m!106085 () Bool)

(assert (=> b!66680 m!106085))

(declare-fun m!106087 () Bool)

(assert (=> b!66680 m!106087))

(declare-fun m!106089 () Bool)

(assert (=> b!66680 m!106089))

(declare-fun m!106091 () Bool)

(assert (=> b!66680 m!106091))

(declare-fun m!106093 () Bool)

(assert (=> b!66680 m!106093))

(assert (=> b!66680 m!106079))

(declare-fun m!106095 () Bool)

(assert (=> b!66680 m!106095))

(declare-fun m!106097 () Bool)

(assert (=> b!66680 m!106097))

(declare-fun m!106099 () Bool)

(assert (=> b!66680 m!106099))

(declare-fun m!106101 () Bool)

(assert (=> b!66680 m!106101))

(assert (=> b!66680 m!106083))

(declare-fun m!106103 () Bool)

(assert (=> b!66680 m!106103))

(declare-fun m!106105 () Bool)

(assert (=> b!66680 m!106105))

(declare-fun m!106107 () Bool)

(assert (=> b!66680 m!106107))

(declare-fun m!106109 () Bool)

(assert (=> b!66680 m!106109))

(declare-fun m!106111 () Bool)

(assert (=> b!66680 m!106111))

(declare-fun m!106113 () Bool)

(assert (=> b!66680 m!106113))

(declare-fun m!106115 () Bool)

(assert (=> b!66680 m!106115))

(assert (=> b!66680 m!105323))

(assert (=> b!66680 m!106105))

(declare-fun m!106117 () Bool)

(assert (=> b!66680 m!106117))

(declare-fun m!106119 () Bool)

(assert (=> b!66680 m!106119))

(declare-fun m!106121 () Bool)

(assert (=> b!66680 m!106121))

(declare-fun m!106123 () Bool)

(assert (=> b!66680 m!106123))

(declare-fun m!106125 () Bool)

(assert (=> b!66680 m!106125))

(assert (=> b!66680 m!106069))

(declare-fun m!106127 () Bool)

(assert (=> b!66685 m!106127))

(declare-fun m!106129 () Bool)

(assert (=> b!66685 m!106129))

(declare-fun m!106131 () Bool)

(assert (=> bm!850 m!106131))

(declare-fun m!106133 () Bool)

(assert (=> b!66681 m!106133))

(declare-fun m!106135 () Bool)

(assert (=> b!66682 m!106135))

(declare-fun m!106137 () Bool)

(assert (=> d!20912 m!106137))

(assert (=> d!20912 m!105323))

(assert (=> d!20912 m!105587))

(assert (=> d!20912 m!105585))

(assert (=> b!66274 d!20912))

(declare-fun d!21012 () Bool)

(declare-fun res!55238 () Bool)

(declare-fun e!43748 () Bool)

(assert (=> d!21012 (=> (not res!55238) (not e!43748))))

(assert (=> d!21012 (= res!55238 (= (size!1315 (buf!1696 (_2!3043 lt!105069))) (size!1315 (buf!1696 (_2!3043 lt!105066)))))))

(assert (=> d!21012 (= (isPrefixOf!0 (_2!3043 lt!105069) (_2!3043 lt!105066)) e!43748)))

(declare-fun b!66686 () Bool)

(declare-fun res!55239 () Bool)

(assert (=> b!66686 (=> (not res!55239) (not e!43748))))

(assert (=> b!66686 (= res!55239 (bvsle (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069))) (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066)))))))

(declare-fun b!66687 () Bool)

(declare-fun e!43749 () Bool)

(assert (=> b!66687 (= e!43748 e!43749)))

(declare-fun res!55237 () Bool)

(assert (=> b!66687 (=> res!55237 e!43749)))

(assert (=> b!66687 (= res!55237 (= (size!1315 (buf!1696 (_2!3043 lt!105069))) #b00000000000000000000000000000000))))

(declare-fun b!66688 () Bool)

(assert (=> b!66688 (= e!43749 (arrayBitRangesEq!0 (buf!1696 (_2!3043 lt!105069)) (buf!1696 (_2!3043 lt!105066)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105069))) (currentByte!3368 (_2!3043 lt!105069)) (currentBit!3363 (_2!3043 lt!105069)))))))

(assert (= (and d!21012 res!55238) b!66686))

(assert (= (and b!66686 res!55239) b!66687))

(assert (= (and b!66687 (not res!55237)) b!66688))

(assert (=> b!66686 m!105323))

(assert (=> b!66686 m!105289))

(assert (=> b!66688 m!105323))

(assert (=> b!66688 m!105323))

(declare-fun m!106139 () Bool)

(assert (=> b!66688 m!106139))

(assert (=> b!66274 d!21012))

(declare-fun d!21014 () Bool)

(assert (=> d!21014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106081 () Unit!4467)

(assert (=> d!21014 (= lt!106081 (choose!9 thiss!1379 (buf!1696 (_2!3043 lt!105069)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2265 (buf!1696 (_2!3043 lt!105069)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(assert (=> d!21014 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1696 (_2!3043 lt!105069)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!106081)))

(declare-fun bs!5104 () Bool)

(assert (= bs!5104 d!21014))

(assert (=> bs!5104 m!105277))

(declare-fun m!106141 () Bool)

(assert (=> bs!5104 m!106141))

(assert (=> b!66274 d!21014))

(declare-fun d!21016 () Bool)

(declare-fun res!55241 () Bool)

(declare-fun e!43750 () Bool)

(assert (=> d!21016 (=> (not res!55241) (not e!43750))))

(assert (=> d!21016 (= res!55241 (= (size!1315 (buf!1696 thiss!1379)) (size!1315 (buf!1696 (_2!3043 lt!105066)))))))

(assert (=> d!21016 (= (isPrefixOf!0 thiss!1379 (_2!3043 lt!105066)) e!43750)))

(declare-fun b!66689 () Bool)

(declare-fun res!55242 () Bool)

(assert (=> b!66689 (=> (not res!55242) (not e!43750))))

(assert (=> b!66689 (= res!55242 (bvsle (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379)) (bitIndex!0 (size!1315 (buf!1696 (_2!3043 lt!105066))) (currentByte!3368 (_2!3043 lt!105066)) (currentBit!3363 (_2!3043 lt!105066)))))))

(declare-fun b!66690 () Bool)

(declare-fun e!43751 () Bool)

(assert (=> b!66690 (= e!43750 e!43751)))

(declare-fun res!55240 () Bool)

(assert (=> b!66690 (=> res!55240 e!43751)))

(assert (=> b!66690 (= res!55240 (= (size!1315 (buf!1696 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66691 () Bool)

(assert (=> b!66691 (= e!43751 (arrayBitRangesEq!0 (buf!1696 thiss!1379) (buf!1696 (_2!3043 lt!105066)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1315 (buf!1696 thiss!1379)) (currentByte!3368 thiss!1379) (currentBit!3363 thiss!1379))))))

(assert (= (and d!21016 res!55241) b!66689))

(assert (= (and b!66689 res!55242) b!66690))

(assert (= (and b!66690 (not res!55240)) b!66691))

(assert (=> b!66689 m!105295))

(assert (=> b!66689 m!105289))

(assert (=> b!66691 m!105295))

(assert (=> b!66691 m!105295))

(declare-fun m!106143 () Bool)

(assert (=> b!66691 m!106143))

(assert (=> b!66274 d!21016))

(declare-fun d!21018 () Bool)

(assert (=> d!21018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1315 (buf!1696 (_2!3043 lt!105069)))) ((_ sign_extend 32) (currentByte!3368 thiss!1379)) ((_ sign_extend 32) (currentBit!3363 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5105 () Bool)

(assert (= bs!5105 d!21018))

(declare-fun m!106145 () Bool)

(assert (=> bs!5105 m!106145))

(assert (=> b!66274 d!21018))

(declare-fun d!21020 () Bool)

(assert (=> d!21020 (= (invariant!0 (currentBit!3363 (_2!3043 lt!105069)) (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105069)))) (and (bvsge (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (bvslt (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000001000) (bvsge (currentByte!3368 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105069)))) (and (= (currentBit!3363 (_2!3043 lt!105069)) #b00000000000000000000000000000000) (= (currentByte!3368 (_2!3043 lt!105069)) (size!1315 (buf!1696 (_2!3043 lt!105069))))))))))

(assert (=> b!66264 d!21020))

(declare-fun d!21022 () Bool)

(assert (=> d!21022 (= (invariant!0 (currentBit!3363 (_2!3043 lt!105066)) (currentByte!3368 (_2!3043 lt!105066)) (size!1315 (buf!1696 (_2!3043 lt!105066)))) (and (bvsge (currentBit!3363 (_2!3043 lt!105066)) #b00000000000000000000000000000000) (bvslt (currentBit!3363 (_2!3043 lt!105066)) #b00000000000000000000000000001000) (bvsge (currentByte!3368 (_2!3043 lt!105066)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3368 (_2!3043 lt!105066)) (size!1315 (buf!1696 (_2!3043 lt!105066)))) (and (= (currentBit!3363 (_2!3043 lt!105066)) #b00000000000000000000000000000000) (= (currentByte!3368 (_2!3043 lt!105066)) (size!1315 (buf!1696 (_2!3043 lt!105066))))))))))

(assert (=> b!66275 d!21022))

(push 1)

