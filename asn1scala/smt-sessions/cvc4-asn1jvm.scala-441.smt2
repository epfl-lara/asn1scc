; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11842 () Bool)

(assert start!11842)

(declare-fun b!59286 () Bool)

(declare-fun e!39426 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!59286 (= e!39426 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!2699 0))(
  ( (array!2700 (arr!1789 (Array (_ BitVec 32) (_ BitVec 8))) (size!1225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2138 0))(
  ( (BitStream!2139 (buf!1606 array!2699) (currentByte!3224 (_ BitVec 32)) (currentBit!3219 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4073 0))(
  ( (Unit!4074) )
))
(declare-datatypes ((tuple2!5398 0))(
  ( (tuple2!5399 (_1!2810 Unit!4073) (_2!2810 BitStream!2138)) )
))
(declare-fun lt!93089 () tuple2!5398)

(declare-fun lt!93082 () tuple2!5398)

(declare-fun lt!93090 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59286 (validate_offset_bits!1 ((_ sign_extend 32) (size!1225 (buf!1606 (_2!2810 lt!93089)))) ((_ sign_extend 32) (currentByte!3224 (_2!2810 lt!93082))) ((_ sign_extend 32) (currentBit!3219 (_2!2810 lt!93082))) lt!93090)))

(declare-fun lt!93087 () Unit!4073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2138 array!2699 (_ BitVec 64)) Unit!4073)

(assert (=> b!59286 (= lt!93087 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2810 lt!93082) (buf!1606 (_2!2810 lt!93089)) lt!93090))))

(declare-datatypes ((tuple2!5400 0))(
  ( (tuple2!5401 (_1!2811 BitStream!2138) (_2!2811 BitStream!2138)) )
))
(declare-fun lt!93085 () tuple2!5400)

(declare-fun reader!0 (BitStream!2138 BitStream!2138) tuple2!5400)

(assert (=> b!59286 (= lt!93085 (reader!0 (_2!2810 lt!93082) (_2!2810 lt!93089)))))

(declare-fun thiss!1379 () BitStream!2138)

(assert (=> b!59286 (validate_offset_bits!1 ((_ sign_extend 32) (size!1225 (buf!1606 (_2!2810 lt!93089)))) ((_ sign_extend 32) (currentByte!3224 thiss!1379)) ((_ sign_extend 32) (currentBit!3219 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93093 () Unit!4073)

(assert (=> b!59286 (= lt!93093 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1606 (_2!2810 lt!93089)) (bvsub to!314 i!635)))))

(declare-fun lt!93086 () tuple2!5400)

(assert (=> b!59286 (= lt!93086 (reader!0 thiss!1379 (_2!2810 lt!93089)))))

(declare-fun b!59287 () Bool)

(declare-fun res!49333 () Bool)

(declare-fun e!39434 () Bool)

(assert (=> b!59287 (=> res!49333 e!39434)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59287 (= res!49333 (not (invariant!0 (currentBit!3219 (_2!2810 lt!93089)) (currentByte!3224 (_2!2810 lt!93089)) (size!1225 (buf!1606 (_2!2810 lt!93089))))))))

(declare-fun b!59289 () Bool)

(declare-fun e!39424 () Bool)

(declare-fun e!39432 () Bool)

(assert (=> b!59289 (= e!39424 e!39432)))

(declare-fun res!49331 () Bool)

(assert (=> b!59289 (=> res!49331 e!39432)))

(declare-fun isPrefixOf!0 (BitStream!2138 BitStream!2138) Bool)

(assert (=> b!59289 (= res!49331 (not (isPrefixOf!0 thiss!1379 (_2!2810 lt!93082))))))

(assert (=> b!59289 (validate_offset_bits!1 ((_ sign_extend 32) (size!1225 (buf!1606 (_2!2810 lt!93082)))) ((_ sign_extend 32) (currentByte!3224 (_2!2810 lt!93082))) ((_ sign_extend 32) (currentBit!3219 (_2!2810 lt!93082))) lt!93090)))

(assert (=> b!59289 (= lt!93090 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93091 () Unit!4073)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2138 BitStream!2138 (_ BitVec 64) (_ BitVec 64)) Unit!4073)

(assert (=> b!59289 (= lt!93091 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2810 lt!93082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2699)

(declare-fun appendBitFromByte!0 (BitStream!2138 (_ BitVec 8) (_ BitVec 32)) tuple2!5398)

(assert (=> b!59289 (= lt!93082 (appendBitFromByte!0 thiss!1379 (select (arr!1789 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59290 () Bool)

(assert (=> b!59290 (= e!39434 e!39426)))

(declare-fun res!49325 () Bool)

(assert (=> b!59290 (=> res!49325 e!39426)))

(assert (=> b!59290 (= res!49325 (not (= (size!1225 (buf!1606 (_2!2810 lt!93082))) (size!1225 (buf!1606 (_2!2810 lt!93089))))))))

(declare-fun e!39433 () Bool)

(assert (=> b!59290 e!39433))

(declare-fun res!49328 () Bool)

(assert (=> b!59290 (=> (not res!49328) (not e!39433))))

(assert (=> b!59290 (= res!49328 (= (size!1225 (buf!1606 (_2!2810 lt!93089))) (size!1225 (buf!1606 thiss!1379))))))

(declare-fun b!59291 () Bool)

(declare-fun e!39427 () Bool)

(assert (=> b!59291 (= e!39427 (not e!39424))))

(declare-fun res!49327 () Bool)

(assert (=> b!59291 (=> res!49327 e!39424)))

(assert (=> b!59291 (= res!49327 (bvsge i!635 to!314))))

(assert (=> b!59291 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93092 () Unit!4073)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2138) Unit!4073)

(assert (=> b!59291 (= lt!93092 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93084 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59291 (= lt!93084 (bitIndex!0 (size!1225 (buf!1606 thiss!1379)) (currentByte!3224 thiss!1379) (currentBit!3219 thiss!1379)))))

(declare-fun b!59292 () Bool)

(declare-fun res!49330 () Bool)

(assert (=> b!59292 (=> res!49330 e!39426)))

(assert (=> b!59292 (= res!49330 (not (invariant!0 (currentBit!3219 (_2!2810 lt!93082)) (currentByte!3224 (_2!2810 lt!93082)) (size!1225 (buf!1606 (_2!2810 lt!93089))))))))

(declare-fun b!59293 () Bool)

(declare-fun e!39430 () Bool)

(assert (=> b!59293 (= e!39430 e!39434)))

(declare-fun res!49334 () Bool)

(assert (=> b!59293 (=> res!49334 e!39434)))

(declare-fun lt!93083 () (_ BitVec 64))

(assert (=> b!59293 (= res!49334 (not (= lt!93083 (bvsub (bvadd lt!93084 to!314) i!635))))))

(assert (=> b!59293 (= lt!93083 (bitIndex!0 (size!1225 (buf!1606 (_2!2810 lt!93089))) (currentByte!3224 (_2!2810 lt!93089)) (currentBit!3219 (_2!2810 lt!93089))))))

(declare-fun lt!93088 () tuple2!5400)

(declare-fun e!39429 () Bool)

(declare-fun b!59288 () Bool)

(declare-datatypes ((List!644 0))(
  ( (Nil!641) (Cons!640 (h!759 Bool) (t!1394 List!644)) )
))
(declare-fun head!463 (List!644) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2138 array!2699 (_ BitVec 64) (_ BitVec 64)) List!644)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2138 BitStream!2138 (_ BitVec 64)) List!644)

(assert (=> b!59288 (= e!39429 (= (head!463 (byteArrayBitContentToList!0 (_2!2810 lt!93082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!463 (bitStreamReadBitsIntoList!0 (_2!2810 lt!93082) (_1!2811 lt!93088) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!49335 () Bool)

(assert (=> start!11842 (=> (not res!49335) (not e!39427))))

(assert (=> start!11842 (= res!49335 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1225 srcBuffer!2))))))))

(assert (=> start!11842 e!39427))

(assert (=> start!11842 true))

(declare-fun array_inv!1128 (array!2699) Bool)

(assert (=> start!11842 (array_inv!1128 srcBuffer!2)))

(declare-fun e!39428 () Bool)

(declare-fun inv!12 (BitStream!2138) Bool)

(assert (=> start!11842 (and (inv!12 thiss!1379) e!39428)))

(declare-fun b!59294 () Bool)

(declare-fun res!49329 () Bool)

(assert (=> b!59294 (=> res!49329 e!39426)))

(assert (=> b!59294 (= res!49329 (not (invariant!0 (currentBit!3219 (_2!2810 lt!93082)) (currentByte!3224 (_2!2810 lt!93082)) (size!1225 (buf!1606 (_2!2810 lt!93082))))))))

(declare-fun b!59295 () Bool)

(assert (=> b!59295 (= e!39433 (= lt!93083 (bvsub (bvsub (bvadd (bitIndex!0 (size!1225 (buf!1606 (_2!2810 lt!93082))) (currentByte!3224 (_2!2810 lt!93082)) (currentBit!3219 (_2!2810 lt!93082))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59296 () Bool)

(declare-fun res!49332 () Bool)

(assert (=> b!59296 (=> (not res!49332) (not e!39427))))

(assert (=> b!59296 (= res!49332 (validate_offset_bits!1 ((_ sign_extend 32) (size!1225 (buf!1606 thiss!1379))) ((_ sign_extend 32) (currentByte!3224 thiss!1379)) ((_ sign_extend 32) (currentBit!3219 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59297 () Bool)

(assert (=> b!59297 (= e!39432 e!39430)))

(declare-fun res!49323 () Bool)

(assert (=> b!59297 (=> res!49323 e!39430)))

(assert (=> b!59297 (= res!49323 (not (isPrefixOf!0 (_2!2810 lt!93082) (_2!2810 lt!93089))))))

(assert (=> b!59297 (isPrefixOf!0 thiss!1379 (_2!2810 lt!93089))))

(declare-fun lt!93094 () Unit!4073)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2138 BitStream!2138 BitStream!2138) Unit!4073)

(assert (=> b!59297 (= lt!93094 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2810 lt!93082) (_2!2810 lt!93089)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2138 array!2699 (_ BitVec 64) (_ BitVec 64)) tuple2!5398)

(assert (=> b!59297 (= lt!93089 (appendBitsMSBFirstLoop!0 (_2!2810 lt!93082) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59297 e!39429))

(declare-fun res!49324 () Bool)

(assert (=> b!59297 (=> (not res!49324) (not e!39429))))

(assert (=> b!59297 (= res!49324 (validate_offset_bits!1 ((_ sign_extend 32) (size!1225 (buf!1606 (_2!2810 lt!93082)))) ((_ sign_extend 32) (currentByte!3224 thiss!1379)) ((_ sign_extend 32) (currentBit!3219 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93081 () Unit!4073)

(assert (=> b!59297 (= lt!93081 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1606 (_2!2810 lt!93082)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59297 (= lt!93088 (reader!0 thiss!1379 (_2!2810 lt!93082)))))

(declare-fun b!59298 () Bool)

(assert (=> b!59298 (= e!39428 (array_inv!1128 (buf!1606 thiss!1379)))))

(declare-fun b!59299 () Bool)

(declare-fun res!49326 () Bool)

(assert (=> b!59299 (=> res!49326 e!39434)))

(assert (=> b!59299 (= res!49326 (not (= (size!1225 (buf!1606 thiss!1379)) (size!1225 (buf!1606 (_2!2810 lt!93089))))))))

(assert (= (and start!11842 res!49335) b!59296))

(assert (= (and b!59296 res!49332) b!59291))

(assert (= (and b!59291 (not res!49327)) b!59289))

(assert (= (and b!59289 (not res!49331)) b!59297))

(assert (= (and b!59297 res!49324) b!59288))

(assert (= (and b!59297 (not res!49323)) b!59293))

(assert (= (and b!59293 (not res!49334)) b!59287))

(assert (= (and b!59287 (not res!49333)) b!59299))

(assert (= (and b!59299 (not res!49326)) b!59290))

(assert (= (and b!59290 res!49328) b!59295))

(assert (= (and b!59290 (not res!49325)) b!59294))

(assert (= (and b!59294 (not res!49329)) b!59292))

(assert (= (and b!59292 (not res!49330)) b!59286))

(assert (= start!11842 b!59298))

(declare-fun m!93353 () Bool)

(assert (=> b!59288 m!93353))

(assert (=> b!59288 m!93353))

(declare-fun m!93355 () Bool)

(assert (=> b!59288 m!93355))

(declare-fun m!93357 () Bool)

(assert (=> b!59288 m!93357))

(assert (=> b!59288 m!93357))

(declare-fun m!93359 () Bool)

(assert (=> b!59288 m!93359))

(declare-fun m!93361 () Bool)

(assert (=> b!59296 m!93361))

(declare-fun m!93363 () Bool)

(assert (=> b!59289 m!93363))

(declare-fun m!93365 () Bool)

(assert (=> b!59289 m!93365))

(assert (=> b!59289 m!93365))

(declare-fun m!93367 () Bool)

(assert (=> b!59289 m!93367))

(declare-fun m!93369 () Bool)

(assert (=> b!59289 m!93369))

(declare-fun m!93371 () Bool)

(assert (=> b!59289 m!93371))

(declare-fun m!93373 () Bool)

(assert (=> b!59287 m!93373))

(declare-fun m!93375 () Bool)

(assert (=> b!59295 m!93375))

(declare-fun m!93377 () Bool)

(assert (=> b!59293 m!93377))

(declare-fun m!93379 () Bool)

(assert (=> b!59291 m!93379))

(declare-fun m!93381 () Bool)

(assert (=> b!59291 m!93381))

(declare-fun m!93383 () Bool)

(assert (=> b!59291 m!93383))

(declare-fun m!93385 () Bool)

(assert (=> b!59292 m!93385))

(declare-fun m!93387 () Bool)

(assert (=> b!59298 m!93387))

(declare-fun m!93389 () Bool)

(assert (=> b!59297 m!93389))

(declare-fun m!93391 () Bool)

(assert (=> b!59297 m!93391))

(declare-fun m!93393 () Bool)

(assert (=> b!59297 m!93393))

(declare-fun m!93395 () Bool)

(assert (=> b!59297 m!93395))

(declare-fun m!93397 () Bool)

(assert (=> b!59297 m!93397))

(declare-fun m!93399 () Bool)

(assert (=> b!59297 m!93399))

(declare-fun m!93401 () Bool)

(assert (=> b!59297 m!93401))

(declare-fun m!93403 () Bool)

(assert (=> start!11842 m!93403))

(declare-fun m!93405 () Bool)

(assert (=> start!11842 m!93405))

(declare-fun m!93407 () Bool)

(assert (=> b!59286 m!93407))

(declare-fun m!93409 () Bool)

(assert (=> b!59286 m!93409))

(declare-fun m!93411 () Bool)

(assert (=> b!59286 m!93411))

(declare-fun m!93413 () Bool)

(assert (=> b!59286 m!93413))

(declare-fun m!93415 () Bool)

(assert (=> b!59286 m!93415))

(declare-fun m!93417 () Bool)

(assert (=> b!59286 m!93417))

(declare-fun m!93419 () Bool)

(assert (=> b!59294 m!93419))

(push 1)

(assert (not b!59295))

(assert (not start!11842))

(assert (not b!59292))

(assert (not b!59286))

(assert (not b!59297))

(assert (not b!59298))

(assert (not b!59291))

(assert (not b!59293))

(assert (not b!59294))

(assert (not b!59296))

(assert (not b!59289))

(assert (not b!59287))

(assert (not b!59288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

