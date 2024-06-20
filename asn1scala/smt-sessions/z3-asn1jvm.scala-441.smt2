; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11840 () Bool)

(assert start!11840)

(declare-fun b!59244 () Bool)

(declare-fun res!49296 () Bool)

(declare-fun e!39393 () Bool)

(assert (=> b!59244 (=> res!49296 e!39393)))

(declare-datatypes ((array!2697 0))(
  ( (array!2698 (arr!1788 (Array (_ BitVec 32) (_ BitVec 8))) (size!1224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2136 0))(
  ( (BitStream!2137 (buf!1605 array!2697) (currentByte!3223 (_ BitVec 32)) (currentBit!3218 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4071 0))(
  ( (Unit!4072) )
))
(declare-datatypes ((tuple2!5394 0))(
  ( (tuple2!5395 (_1!2808 Unit!4071) (_2!2808 BitStream!2136)) )
))
(declare-fun lt!93041 () tuple2!5394)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59244 (= res!49296 (not (invariant!0 (currentBit!3218 (_2!2808 lt!93041)) (currentByte!3223 (_2!2808 lt!93041)) (size!1224 (buf!1605 (_2!2808 lt!93041))))))))

(declare-fun b!59245 () Bool)

(declare-fun e!39391 () Bool)

(declare-fun e!39394 () Bool)

(assert (=> b!59245 (= e!39391 e!39394)))

(declare-fun res!49294 () Bool)

(assert (=> b!59245 (=> res!49294 e!39394)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!93039 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!93045 () (_ BitVec 64))

(assert (=> b!59245 (= res!49294 (not (= lt!93045 (bvsub (bvadd lt!93039 to!314) i!635))))))

(declare-fun lt!93040 () tuple2!5394)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59245 (= lt!93045 (bitIndex!0 (size!1224 (buf!1605 (_2!2808 lt!93040))) (currentByte!3223 (_2!2808 lt!93040)) (currentBit!3218 (_2!2808 lt!93040))))))

(declare-fun b!59246 () Bool)

(assert (=> b!59246 (= e!39393 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93052 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59246 (validate_offset_bits!1 ((_ sign_extend 32) (size!1224 (buf!1605 (_2!2808 lt!93040)))) ((_ sign_extend 32) (currentByte!3223 (_2!2808 lt!93041))) ((_ sign_extend 32) (currentBit!3218 (_2!2808 lt!93041))) lt!93052)))

(declare-fun lt!93042 () Unit!4071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2136 array!2697 (_ BitVec 64)) Unit!4071)

(assert (=> b!59246 (= lt!93042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2808 lt!93041) (buf!1605 (_2!2808 lt!93040)) lt!93052))))

(declare-datatypes ((tuple2!5396 0))(
  ( (tuple2!5397 (_1!2809 BitStream!2136) (_2!2809 BitStream!2136)) )
))
(declare-fun lt!93043 () tuple2!5396)

(declare-fun reader!0 (BitStream!2136 BitStream!2136) tuple2!5396)

(assert (=> b!59246 (= lt!93043 (reader!0 (_2!2808 lt!93041) (_2!2808 lt!93040)))))

(declare-fun thiss!1379 () BitStream!2136)

(assert (=> b!59246 (validate_offset_bits!1 ((_ sign_extend 32) (size!1224 (buf!1605 (_2!2808 lt!93040)))) ((_ sign_extend 32) (currentByte!3223 thiss!1379)) ((_ sign_extend 32) (currentBit!3218 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93044 () Unit!4071)

(assert (=> b!59246 (= lt!93044 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1605 (_2!2808 lt!93040)) (bvsub to!314 i!635)))))

(declare-fun lt!93050 () tuple2!5396)

(assert (=> b!59246 (= lt!93050 (reader!0 thiss!1379 (_2!2808 lt!93040)))))

(declare-fun b!59247 () Bool)

(assert (=> b!59247 (= e!39394 e!39393)))

(declare-fun res!49295 () Bool)

(assert (=> b!59247 (=> res!49295 e!39393)))

(assert (=> b!59247 (= res!49295 (not (= (size!1224 (buf!1605 (_2!2808 lt!93041))) (size!1224 (buf!1605 (_2!2808 lt!93040))))))))

(declare-fun e!39398 () Bool)

(assert (=> b!59247 e!39398))

(declare-fun res!49285 () Bool)

(assert (=> b!59247 (=> (not res!49285) (not e!39398))))

(assert (=> b!59247 (= res!49285 (= (size!1224 (buf!1605 (_2!2808 lt!93040))) (size!1224 (buf!1605 thiss!1379))))))

(declare-fun b!59248 () Bool)

(declare-fun e!39401 () Bool)

(declare-fun e!39400 () Bool)

(assert (=> b!59248 (= e!39401 e!39400)))

(declare-fun res!49292 () Bool)

(assert (=> b!59248 (=> res!49292 e!39400)))

(declare-fun isPrefixOf!0 (BitStream!2136 BitStream!2136) Bool)

(assert (=> b!59248 (= res!49292 (not (isPrefixOf!0 thiss!1379 (_2!2808 lt!93041))))))

(assert (=> b!59248 (validate_offset_bits!1 ((_ sign_extend 32) (size!1224 (buf!1605 (_2!2808 lt!93041)))) ((_ sign_extend 32) (currentByte!3223 (_2!2808 lt!93041))) ((_ sign_extend 32) (currentBit!3218 (_2!2808 lt!93041))) lt!93052)))

(assert (=> b!59248 (= lt!93052 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93047 () Unit!4071)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2136 BitStream!2136 (_ BitVec 64) (_ BitVec 64)) Unit!4071)

(assert (=> b!59248 (= lt!93047 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2808 lt!93041) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2697)

(declare-fun appendBitFromByte!0 (BitStream!2136 (_ BitVec 8) (_ BitVec 32)) tuple2!5394)

(assert (=> b!59248 (= lt!93041 (appendBitFromByte!0 thiss!1379 (select (arr!1788 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!49284 () Bool)

(declare-fun e!39399 () Bool)

(assert (=> start!11840 (=> (not res!49284) (not e!39399))))

(assert (=> start!11840 (= res!49284 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1224 srcBuffer!2))))))))

(assert (=> start!11840 e!39399))

(assert (=> start!11840 true))

(declare-fun array_inv!1127 (array!2697) Bool)

(assert (=> start!11840 (array_inv!1127 srcBuffer!2)))

(declare-fun e!39396 () Bool)

(declare-fun inv!12 (BitStream!2136) Bool)

(assert (=> start!11840 (and (inv!12 thiss!1379) e!39396)))

(declare-fun b!59249 () Bool)

(declare-fun res!49287 () Bool)

(assert (=> b!59249 (=> (not res!49287) (not e!39399))))

(assert (=> b!59249 (= res!49287 (validate_offset_bits!1 ((_ sign_extend 32) (size!1224 (buf!1605 thiss!1379))) ((_ sign_extend 32) (currentByte!3223 thiss!1379)) ((_ sign_extend 32) (currentBit!3218 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59250 () Bool)

(assert (=> b!59250 (= e!39398 (= lt!93045 (bvsub (bvsub (bvadd (bitIndex!0 (size!1224 (buf!1605 (_2!2808 lt!93041))) (currentByte!3223 (_2!2808 lt!93041)) (currentBit!3218 (_2!2808 lt!93041))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59251 () Bool)

(declare-fun e!39397 () Bool)

(declare-fun lt!93046 () tuple2!5396)

(declare-datatypes ((List!643 0))(
  ( (Nil!640) (Cons!639 (h!758 Bool) (t!1393 List!643)) )
))
(declare-fun head!462 (List!643) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2136 array!2697 (_ BitVec 64) (_ BitVec 64)) List!643)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2136 BitStream!2136 (_ BitVec 64)) List!643)

(assert (=> b!59251 (= e!39397 (= (head!462 (byteArrayBitContentToList!0 (_2!2808 lt!93041) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!462 (bitStreamReadBitsIntoList!0 (_2!2808 lt!93041) (_1!2809 lt!93046) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59252 () Bool)

(declare-fun res!49288 () Bool)

(assert (=> b!59252 (=> res!49288 e!39393)))

(assert (=> b!59252 (= res!49288 (not (invariant!0 (currentBit!3218 (_2!2808 lt!93041)) (currentByte!3223 (_2!2808 lt!93041)) (size!1224 (buf!1605 (_2!2808 lt!93040))))))))

(declare-fun b!59253 () Bool)

(declare-fun res!49293 () Bool)

(assert (=> b!59253 (=> res!49293 e!39394)))

(assert (=> b!59253 (= res!49293 (not (= (size!1224 (buf!1605 thiss!1379)) (size!1224 (buf!1605 (_2!2808 lt!93040))))))))

(declare-fun b!59254 () Bool)

(declare-fun res!49289 () Bool)

(assert (=> b!59254 (=> res!49289 e!39394)))

(assert (=> b!59254 (= res!49289 (not (invariant!0 (currentBit!3218 (_2!2808 lt!93040)) (currentByte!3223 (_2!2808 lt!93040)) (size!1224 (buf!1605 (_2!2808 lt!93040))))))))

(declare-fun b!59255 () Bool)

(assert (=> b!59255 (= e!39400 e!39391)))

(declare-fun res!49286 () Bool)

(assert (=> b!59255 (=> res!49286 e!39391)))

(assert (=> b!59255 (= res!49286 (not (isPrefixOf!0 (_2!2808 lt!93041) (_2!2808 lt!93040))))))

(assert (=> b!59255 (isPrefixOf!0 thiss!1379 (_2!2808 lt!93040))))

(declare-fun lt!93051 () Unit!4071)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2136 BitStream!2136 BitStream!2136) Unit!4071)

(assert (=> b!59255 (= lt!93051 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2808 lt!93041) (_2!2808 lt!93040)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2136 array!2697 (_ BitVec 64) (_ BitVec 64)) tuple2!5394)

(assert (=> b!59255 (= lt!93040 (appendBitsMSBFirstLoop!0 (_2!2808 lt!93041) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59255 e!39397))

(declare-fun res!49291 () Bool)

(assert (=> b!59255 (=> (not res!49291) (not e!39397))))

(assert (=> b!59255 (= res!49291 (validate_offset_bits!1 ((_ sign_extend 32) (size!1224 (buf!1605 (_2!2808 lt!93041)))) ((_ sign_extend 32) (currentByte!3223 thiss!1379)) ((_ sign_extend 32) (currentBit!3218 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93048 () Unit!4071)

(assert (=> b!59255 (= lt!93048 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1605 (_2!2808 lt!93041)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59255 (= lt!93046 (reader!0 thiss!1379 (_2!2808 lt!93041)))))

(declare-fun b!59256 () Bool)

(assert (=> b!59256 (= e!39396 (array_inv!1127 (buf!1605 thiss!1379)))))

(declare-fun b!59257 () Bool)

(assert (=> b!59257 (= e!39399 (not e!39401))))

(declare-fun res!49290 () Bool)

(assert (=> b!59257 (=> res!49290 e!39401)))

(assert (=> b!59257 (= res!49290 (bvsge i!635 to!314))))

(assert (=> b!59257 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93049 () Unit!4071)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2136) Unit!4071)

(assert (=> b!59257 (= lt!93049 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59257 (= lt!93039 (bitIndex!0 (size!1224 (buf!1605 thiss!1379)) (currentByte!3223 thiss!1379) (currentBit!3218 thiss!1379)))))

(assert (= (and start!11840 res!49284) b!59249))

(assert (= (and b!59249 res!49287) b!59257))

(assert (= (and b!59257 (not res!49290)) b!59248))

(assert (= (and b!59248 (not res!49292)) b!59255))

(assert (= (and b!59255 res!49291) b!59251))

(assert (= (and b!59255 (not res!49286)) b!59245))

(assert (= (and b!59245 (not res!49294)) b!59254))

(assert (= (and b!59254 (not res!49289)) b!59253))

(assert (= (and b!59253 (not res!49293)) b!59247))

(assert (= (and b!59247 res!49285) b!59250))

(assert (= (and b!59247 (not res!49295)) b!59244))

(assert (= (and b!59244 (not res!49296)) b!59252))

(assert (= (and b!59252 (not res!49288)) b!59246))

(assert (= start!11840 b!59256))

(declare-fun m!93285 () Bool)

(assert (=> start!11840 m!93285))

(declare-fun m!93287 () Bool)

(assert (=> start!11840 m!93287))

(declare-fun m!93289 () Bool)

(assert (=> b!59246 m!93289))

(declare-fun m!93291 () Bool)

(assert (=> b!59246 m!93291))

(declare-fun m!93293 () Bool)

(assert (=> b!59246 m!93293))

(declare-fun m!93295 () Bool)

(assert (=> b!59246 m!93295))

(declare-fun m!93297 () Bool)

(assert (=> b!59246 m!93297))

(declare-fun m!93299 () Bool)

(assert (=> b!59246 m!93299))

(declare-fun m!93301 () Bool)

(assert (=> b!59254 m!93301))

(declare-fun m!93303 () Bool)

(assert (=> b!59256 m!93303))

(declare-fun m!93305 () Bool)

(assert (=> b!59252 m!93305))

(declare-fun m!93307 () Bool)

(assert (=> b!59250 m!93307))

(declare-fun m!93309 () Bool)

(assert (=> b!59255 m!93309))

(declare-fun m!93311 () Bool)

(assert (=> b!59255 m!93311))

(declare-fun m!93313 () Bool)

(assert (=> b!59255 m!93313))

(declare-fun m!93315 () Bool)

(assert (=> b!59255 m!93315))

(declare-fun m!93317 () Bool)

(assert (=> b!59255 m!93317))

(declare-fun m!93319 () Bool)

(assert (=> b!59255 m!93319))

(declare-fun m!93321 () Bool)

(assert (=> b!59255 m!93321))

(declare-fun m!93323 () Bool)

(assert (=> b!59248 m!93323))

(declare-fun m!93325 () Bool)

(assert (=> b!59248 m!93325))

(declare-fun m!93327 () Bool)

(assert (=> b!59248 m!93327))

(assert (=> b!59248 m!93325))

(declare-fun m!93329 () Bool)

(assert (=> b!59248 m!93329))

(declare-fun m!93331 () Bool)

(assert (=> b!59248 m!93331))

(declare-fun m!93333 () Bool)

(assert (=> b!59251 m!93333))

(assert (=> b!59251 m!93333))

(declare-fun m!93335 () Bool)

(assert (=> b!59251 m!93335))

(declare-fun m!93337 () Bool)

(assert (=> b!59251 m!93337))

(assert (=> b!59251 m!93337))

(declare-fun m!93339 () Bool)

(assert (=> b!59251 m!93339))

(declare-fun m!93341 () Bool)

(assert (=> b!59245 m!93341))

(declare-fun m!93343 () Bool)

(assert (=> b!59257 m!93343))

(declare-fun m!93345 () Bool)

(assert (=> b!59257 m!93345))

(declare-fun m!93347 () Bool)

(assert (=> b!59257 m!93347))

(declare-fun m!93349 () Bool)

(assert (=> b!59249 m!93349))

(declare-fun m!93351 () Bool)

(assert (=> b!59244 m!93351))

(check-sat (not b!59257) (not b!59245) (not b!59250) (not b!59254) (not b!59246) (not b!59255) (not b!59252) (not b!59248) (not start!11840) (not b!59249) (not b!59251) (not b!59244) (not b!59256))
(check-sat)
