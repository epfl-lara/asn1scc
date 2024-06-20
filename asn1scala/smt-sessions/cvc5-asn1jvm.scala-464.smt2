; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13134 () Bool)

(assert start!13134)

(declare-fun b!67320 () Bool)

(declare-fun res!55738 () Bool)

(declare-fun e!44112 () Bool)

(assert (=> b!67320 (=> res!55738 e!44112)))

(declare-datatypes ((List!711 0))(
  ( (Nil!708) (Cons!707 (h!826 Bool) (t!1461 List!711)) )
))
(declare-fun lt!107351 () List!711)

(declare-fun length!339 (List!711) Int)

(assert (=> b!67320 (= res!55738 (<= (length!339 lt!107351) 0))))

(declare-fun b!67321 () Bool)

(declare-fun e!44123 () Bool)

(declare-fun e!44119 () Bool)

(assert (=> b!67321 (= e!44123 e!44119)))

(declare-fun res!55742 () Bool)

(assert (=> b!67321 (=> res!55742 e!44119)))

(declare-fun lt!107334 () Bool)

(declare-fun lt!107349 () (_ BitVec 64))

(declare-datatypes ((array!2866 0))(
  ( (array!2867 (arr!1895 (Array (_ BitVec 32) (_ BitVec 8))) (size!1325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2272 0))(
  ( (BitStream!2273 (buf!1706 array!2866) (currentByte!3390 (_ BitVec 32)) (currentBit!3385 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5928 0))(
  ( (tuple2!5929 (_1!3075 BitStream!2272) (_2!3075 BitStream!2272)) )
))
(declare-fun lt!107343 () tuple2!5928)

(declare-fun bitAt!0 (array!2866 (_ BitVec 64)) Bool)

(assert (=> b!67321 (= res!55742 (not (= lt!107334 (bitAt!0 (buf!1706 (_1!3075 lt!107343)) lt!107349))))))

(declare-fun lt!107347 () tuple2!5928)

(assert (=> b!67321 (= lt!107334 (bitAt!0 (buf!1706 (_1!3075 lt!107347)) lt!107349))))

(declare-fun b!67322 () Bool)

(declare-fun res!55732 () Bool)

(declare-fun e!44116 () Bool)

(assert (=> b!67322 (=> res!55732 e!44116)))

(declare-datatypes ((Unit!4535 0))(
  ( (Unit!4536) )
))
(declare-datatypes ((tuple2!5930 0))(
  ( (tuple2!5931 (_1!3076 Unit!4535) (_2!3076 BitStream!2272)) )
))
(declare-fun lt!107337 () tuple2!5930)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!67322 (= res!55732 (not (invariant!0 (currentBit!3385 (_2!3076 lt!107337)) (currentByte!3390 (_2!3076 lt!107337)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))

(declare-fun b!67323 () Bool)

(declare-fun res!55729 () Bool)

(assert (=> b!67323 (=> res!55729 e!44119)))

(declare-fun head!530 (List!711) Bool)

(assert (=> b!67323 (= res!55729 (not (= (head!530 lt!107351) lt!107334)))))

(declare-fun b!67324 () Bool)

(declare-fun e!44115 () Bool)

(declare-fun e!44117 () Bool)

(assert (=> b!67324 (= e!44115 (not e!44117))))

(declare-fun res!55743 () Bool)

(assert (=> b!67324 (=> res!55743 e!44117)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!67324 (= res!55743 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2272)

(declare-fun isPrefixOf!0 (BitStream!2272 BitStream!2272) Bool)

(assert (=> b!67324 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107355 () Unit!4535)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2272) Unit!4535)

(assert (=> b!67324 (= lt!107355 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!67324 (= lt!107349 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(declare-fun res!55726 () Bool)

(assert (=> start!13134 (=> (not res!55726) (not e!44115))))

(declare-fun srcBuffer!2 () array!2866)

(assert (=> start!13134 (= res!55726 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1325 srcBuffer!2))))))))

(assert (=> start!13134 e!44115))

(assert (=> start!13134 true))

(declare-fun array_inv!1195 (array!2866) Bool)

(assert (=> start!13134 (array_inv!1195 srcBuffer!2)))

(declare-fun e!44122 () Bool)

(declare-fun inv!12 (BitStream!2272) Bool)

(assert (=> start!13134 (and (inv!12 thiss!1379) e!44122)))

(declare-fun b!67325 () Bool)

(declare-fun e!44118 () Bool)

(declare-fun lt!107341 () (_ BitVec 64))

(declare-fun lt!107338 () (_ BitVec 64))

(assert (=> b!67325 (= e!44118 (or (= lt!107341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107341 (bvand lt!107338 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!107340 () (_ BitVec 64))

(assert (=> b!67325 (= lt!107341 (bvand lt!107340 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!67326 () Bool)

(declare-fun e!44110 () Bool)

(assert (=> b!67326 (= e!44117 e!44110)))

(declare-fun res!55728 () Bool)

(assert (=> b!67326 (=> res!55728 e!44110)))

(declare-fun lt!107353 () tuple2!5930)

(assert (=> b!67326 (= res!55728 (not (isPrefixOf!0 thiss!1379 (_2!3076 lt!107353))))))

(declare-fun lt!107350 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67326 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!107350)))

(assert (=> b!67326 (= lt!107350 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107348 () Unit!4535)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2272 BitStream!2272 (_ BitVec 64) (_ BitVec 64)) Unit!4535)

(assert (=> b!67326 (= lt!107348 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3076 lt!107353) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2272 (_ BitVec 8) (_ BitVec 32)) tuple2!5930)

(assert (=> b!67326 (= lt!107353 (appendBitFromByte!0 thiss!1379 (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!67327 () Bool)

(assert (=> b!67327 (= e!44119 e!44118)))

(declare-fun res!55736 () Bool)

(assert (=> b!67327 (=> res!55736 e!44118)))

(declare-fun lt!107336 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2272 array!2866 (_ BitVec 64) (_ BitVec 64)) List!711)

(assert (=> b!67327 (= res!55736 (not (= (head!530 (byteArrayBitContentToList!0 (_2!3076 lt!107337) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!107336)))))

(assert (=> b!67327 (= lt!107336 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!67328 () Bool)

(declare-fun e!44113 () Bool)

(assert (=> b!67328 (= e!44113 e!44116)))

(declare-fun res!55737 () Bool)

(assert (=> b!67328 (=> res!55737 e!44116)))

(declare-fun lt!107342 () (_ BitVec 64))

(assert (=> b!67328 (= res!55737 (not (= lt!107342 (bvsub (bvadd lt!107349 to!314) i!635))))))

(assert (=> b!67328 (= lt!107342 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337))))))

(declare-fun b!67329 () Bool)

(assert (=> b!67329 (= e!44122 (array_inv!1195 (buf!1706 thiss!1379)))))

(declare-fun b!67330 () Bool)

(declare-fun e!44120 () Bool)

(assert (=> b!67330 (= e!44120 e!44112)))

(declare-fun res!55740 () Bool)

(assert (=> b!67330 (=> res!55740 e!44112)))

(assert (=> b!67330 (= res!55740 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107354 () List!711)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2272 BitStream!2272 (_ BitVec 64)) List!711)

(assert (=> b!67330 (= lt!107354 (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_1!3075 lt!107343) lt!107350))))

(assert (=> b!67330 (= lt!107351 (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_1!3075 lt!107347) (bvsub to!314 i!635)))))

(assert (=> b!67330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!107350)))

(declare-fun lt!107356 () Unit!4535)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2272 array!2866 (_ BitVec 64)) Unit!4535)

(assert (=> b!67330 (= lt!107356 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!107337)) lt!107350))))

(declare-fun reader!0 (BitStream!2272 BitStream!2272) tuple2!5928)

(assert (=> b!67330 (= lt!107343 (reader!0 (_2!3076 lt!107353) (_2!3076 lt!107337)))))

(assert (=> b!67330 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107344 () Unit!4535)

(assert (=> b!67330 (= lt!107344 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1706 (_2!3076 lt!107337)) (bvsub to!314 i!635)))))

(assert (=> b!67330 (= lt!107347 (reader!0 thiss!1379 (_2!3076 lt!107337)))))

(declare-fun b!67331 () Bool)

(declare-fun res!55739 () Bool)

(assert (=> b!67331 (=> res!55739 e!44118)))

(assert (=> b!67331 (= res!55739 (not (= (bitAt!0 (buf!1706 (_2!3076 lt!107353)) lt!107349) lt!107336)))))

(declare-fun b!67332 () Bool)

(declare-fun res!55725 () Bool)

(assert (=> b!67332 (=> (not res!55725) (not e!44115))))

(assert (=> b!67332 (= res!55725 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!67333 () Bool)

(assert (=> b!67333 (= e!44116 e!44120)))

(declare-fun res!55727 () Bool)

(assert (=> b!67333 (=> res!55727 e!44120)))

(assert (=> b!67333 (= res!55727 (not (= (size!1325 (buf!1706 (_2!3076 lt!107353))) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))

(assert (=> b!67333 (= lt!107342 lt!107338)))

(assert (=> b!67333 (= lt!107338 (bvsub lt!107340 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67333 (= lt!107340 (bvsub (bvadd (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))) to!314) i!635))))

(assert (=> b!67333 (= (size!1325 (buf!1706 (_2!3076 lt!107337))) (size!1325 (buf!1706 thiss!1379)))))

(declare-fun b!67334 () Bool)

(declare-fun res!55731 () Bool)

(assert (=> b!67334 (=> res!55731 e!44116)))

(assert (=> b!67334 (= res!55731 (not (= (size!1325 (buf!1706 thiss!1379)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))

(declare-fun b!67335 () Bool)

(assert (=> b!67335 (= e!44110 e!44113)))

(declare-fun res!55741 () Bool)

(assert (=> b!67335 (=> res!55741 e!44113)))

(assert (=> b!67335 (= res!55741 (not (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107337))))))

(assert (=> b!67335 (isPrefixOf!0 thiss!1379 (_2!3076 lt!107337))))

(declare-fun lt!107339 () Unit!4535)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2272 BitStream!2272 BitStream!2272) Unit!4535)

(assert (=> b!67335 (= lt!107339 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3076 lt!107353) (_2!3076 lt!107337)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2272 array!2866 (_ BitVec 64) (_ BitVec 64)) tuple2!5930)

(assert (=> b!67335 (= lt!107337 (appendBitsMSBFirstLoop!0 (_2!3076 lt!107353) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44114 () Bool)

(assert (=> b!67335 e!44114))

(declare-fun res!55734 () Bool)

(assert (=> b!67335 (=> (not res!55734) (not e!44114))))

(assert (=> b!67335 (= res!55734 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107346 () Unit!4535)

(assert (=> b!67335 (= lt!107346 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1706 (_2!3076 lt!107353)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107352 () tuple2!5928)

(assert (=> b!67335 (= lt!107352 (reader!0 thiss!1379 (_2!3076 lt!107353)))))

(declare-fun b!67336 () Bool)

(declare-fun res!55730 () Bool)

(assert (=> b!67336 (=> res!55730 e!44120)))

(assert (=> b!67336 (= res!55730 (not (invariant!0 (currentBit!3385 (_2!3076 lt!107353)) (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))

(declare-fun b!67337 () Bool)

(assert (=> b!67337 (= e!44114 (= (head!530 (byteArrayBitContentToList!0 (_2!3076 lt!107353) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!530 (bitStreamReadBitsIntoList!0 (_2!3076 lt!107353) (_1!3075 lt!107352) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!67338 () Bool)

(assert (=> b!67338 (= e!44112 e!44123)))

(declare-fun res!55733 () Bool)

(assert (=> b!67338 (=> res!55733 e!44123)))

(declare-fun lt!107335 () List!711)

(assert (=> b!67338 (= res!55733 (not (= lt!107335 lt!107354)))))

(assert (=> b!67338 (= lt!107354 lt!107335)))

(declare-fun tail!315 (List!711) List!711)

(assert (=> b!67338 (= lt!107335 (tail!315 lt!107351))))

(declare-fun lt!107345 () Unit!4535)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2272 BitStream!2272 BitStream!2272 BitStream!2272 (_ BitVec 64) List!711) Unit!4535)

(assert (=> b!67338 (= lt!107345 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3076 lt!107337) (_2!3076 lt!107337) (_1!3075 lt!107347) (_1!3075 lt!107343) (bvsub to!314 i!635) lt!107351))))

(declare-fun b!67339 () Bool)

(declare-fun res!55735 () Bool)

(assert (=> b!67339 (=> res!55735 e!44120)))

(assert (=> b!67339 (= res!55735 (not (invariant!0 (currentBit!3385 (_2!3076 lt!107353)) (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107353))))))))

(assert (= (and start!13134 res!55726) b!67332))

(assert (= (and b!67332 res!55725) b!67324))

(assert (= (and b!67324 (not res!55743)) b!67326))

(assert (= (and b!67326 (not res!55728)) b!67335))

(assert (= (and b!67335 res!55734) b!67337))

(assert (= (and b!67335 (not res!55741)) b!67328))

(assert (= (and b!67328 (not res!55737)) b!67322))

(assert (= (and b!67322 (not res!55732)) b!67334))

(assert (= (and b!67334 (not res!55731)) b!67333))

(assert (= (and b!67333 (not res!55727)) b!67339))

(assert (= (and b!67339 (not res!55735)) b!67336))

(assert (= (and b!67336 (not res!55730)) b!67330))

(assert (= (and b!67330 (not res!55740)) b!67320))

(assert (= (and b!67320 (not res!55738)) b!67338))

(assert (= (and b!67338 (not res!55733)) b!67321))

(assert (= (and b!67321 (not res!55742)) b!67323))

(assert (= (and b!67323 (not res!55729)) b!67327))

(assert (= (and b!67327 (not res!55736)) b!67331))

(assert (= (and b!67331 (not res!55739)) b!67325))

(assert (= start!13134 b!67329))

(declare-fun m!107221 () Bool)

(assert (=> b!67323 m!107221))

(declare-fun m!107223 () Bool)

(assert (=> b!67338 m!107223))

(declare-fun m!107225 () Bool)

(assert (=> b!67338 m!107225))

(declare-fun m!107227 () Bool)

(assert (=> b!67320 m!107227))

(declare-fun m!107229 () Bool)

(assert (=> b!67327 m!107229))

(assert (=> b!67327 m!107229))

(declare-fun m!107231 () Bool)

(assert (=> b!67327 m!107231))

(declare-fun m!107233 () Bool)

(assert (=> b!67327 m!107233))

(declare-fun m!107235 () Bool)

(assert (=> b!67331 m!107235))

(declare-fun m!107237 () Bool)

(assert (=> b!67329 m!107237))

(declare-fun m!107239 () Bool)

(assert (=> b!67324 m!107239))

(declare-fun m!107241 () Bool)

(assert (=> b!67324 m!107241))

(declare-fun m!107243 () Bool)

(assert (=> b!67324 m!107243))

(declare-fun m!107245 () Bool)

(assert (=> b!67322 m!107245))

(declare-fun m!107247 () Bool)

(assert (=> start!13134 m!107247))

(declare-fun m!107249 () Bool)

(assert (=> start!13134 m!107249))

(declare-fun m!107251 () Bool)

(assert (=> b!67330 m!107251))

(declare-fun m!107253 () Bool)

(assert (=> b!67330 m!107253))

(declare-fun m!107255 () Bool)

(assert (=> b!67330 m!107255))

(declare-fun m!107257 () Bool)

(assert (=> b!67330 m!107257))

(declare-fun m!107259 () Bool)

(assert (=> b!67330 m!107259))

(declare-fun m!107261 () Bool)

(assert (=> b!67330 m!107261))

(declare-fun m!107263 () Bool)

(assert (=> b!67330 m!107263))

(declare-fun m!107265 () Bool)

(assert (=> b!67330 m!107265))

(declare-fun m!107267 () Bool)

(assert (=> b!67326 m!107267))

(declare-fun m!107269 () Bool)

(assert (=> b!67326 m!107269))

(assert (=> b!67326 m!107267))

(declare-fun m!107271 () Bool)

(assert (=> b!67326 m!107271))

(declare-fun m!107273 () Bool)

(assert (=> b!67326 m!107273))

(declare-fun m!107275 () Bool)

(assert (=> b!67326 m!107275))

(declare-fun m!107277 () Bool)

(assert (=> b!67333 m!107277))

(declare-fun m!107279 () Bool)

(assert (=> b!67336 m!107279))

(declare-fun m!107281 () Bool)

(assert (=> b!67321 m!107281))

(declare-fun m!107283 () Bool)

(assert (=> b!67321 m!107283))

(declare-fun m!107285 () Bool)

(assert (=> b!67337 m!107285))

(assert (=> b!67337 m!107285))

(declare-fun m!107287 () Bool)

(assert (=> b!67337 m!107287))

(declare-fun m!107289 () Bool)

(assert (=> b!67337 m!107289))

(assert (=> b!67337 m!107289))

(declare-fun m!107291 () Bool)

(assert (=> b!67337 m!107291))

(declare-fun m!107293 () Bool)

(assert (=> b!67332 m!107293))

(declare-fun m!107295 () Bool)

(assert (=> b!67328 m!107295))

(declare-fun m!107297 () Bool)

(assert (=> b!67339 m!107297))

(declare-fun m!107299 () Bool)

(assert (=> b!67335 m!107299))

(declare-fun m!107301 () Bool)

(assert (=> b!67335 m!107301))

(declare-fun m!107303 () Bool)

(assert (=> b!67335 m!107303))

(declare-fun m!107305 () Bool)

(assert (=> b!67335 m!107305))

(declare-fun m!107307 () Bool)

(assert (=> b!67335 m!107307))

(declare-fun m!107309 () Bool)

(assert (=> b!67335 m!107309))

(declare-fun m!107311 () Bool)

(assert (=> b!67335 m!107311))

(push 1)

(assert (not b!67323))

(assert (not b!67324))

(assert (not b!67322))

(assert (not b!67332))

(assert (not b!67329))

(assert (not b!67337))

(assert (not b!67320))

(assert (not start!13134))

(assert (not b!67327))

(assert (not b!67338))

(assert (not b!67339))

(assert (not b!67328))

(assert (not b!67336))

(assert (not b!67331))

(assert (not b!67335))

(assert (not b!67333))

(assert (not b!67330))

(assert (not b!67321))

(assert (not b!67326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!21368 () Bool)

(declare-fun e!44256 () Bool)

(assert (=> d!21368 e!44256))

(declare-fun res!55927 () Bool)

(assert (=> d!21368 (=> (not res!55927) (not e!44256))))

(declare-fun lt!107592 () (_ BitVec 64))

(declare-fun lt!107590 () (_ BitVec 64))

(declare-fun lt!107594 () (_ BitVec 64))

(assert (=> d!21368 (= res!55927 (= lt!107594 (bvsub lt!107590 lt!107592)))))

(assert (=> d!21368 (or (= (bvand lt!107590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107590 lt!107592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21368 (= lt!107592 (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353)))))))

(declare-fun lt!107593 () (_ BitVec 64))

(declare-fun lt!107591 () (_ BitVec 64))

(assert (=> d!21368 (= lt!107590 (bvmul lt!107593 lt!107591))))

(assert (=> d!21368 (or (= lt!107593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107591 (bvsdiv (bvmul lt!107593 lt!107591) lt!107593)))))

(assert (=> d!21368 (= lt!107591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21368 (= lt!107593 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))))))

(assert (=> d!21368 (= lt!107594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353)))))))

(assert (=> d!21368 (invariant!0 (currentBit!3385 (_2!3076 lt!107353)) (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107353))))))

(assert (=> d!21368 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))) lt!107594)))

(declare-fun b!67545 () Bool)

(declare-fun res!55926 () Bool)

(assert (=> b!67545 (=> (not res!55926) (not e!44256))))

(assert (=> b!67545 (= res!55926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107594))))

(declare-fun b!67547 () Bool)

(declare-fun lt!107595 () (_ BitVec 64))

(assert (=> b!67547 (= e!44256 (bvsle lt!107594 (bvmul lt!107595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67547 (or (= lt!107595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107595)))))

(assert (=> b!67547 (= lt!107595 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))))))

(assert (= (and d!21368 res!55927) b!67545))

(assert (= (and b!67545 res!55926) b!67547))

(declare-fun m!107573 () Bool)

(assert (=> d!21368 m!107573))

(assert (=> d!21368 m!107297))

(assert (=> b!67333 d!21368))

(declare-fun d!21380 () Bool)

(assert (=> d!21380 (= (head!530 lt!107351) (h!826 lt!107351))))

(assert (=> b!67323 d!21380))

(declare-fun d!21382 () Bool)

(declare-fun res!55937 () Bool)

(declare-fun e!44270 () Bool)

(assert (=> d!21382 (=> (not res!55937) (not e!44270))))

(assert (=> d!21382 (= res!55937 (= (size!1325 (buf!1706 thiss!1379)) (size!1325 (buf!1706 thiss!1379))))))

(assert (=> d!21382 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44270)))

(declare-fun b!67566 () Bool)

(declare-fun res!55939 () Bool)

(assert (=> b!67566 (=> (not res!55939) (not e!44270))))

(assert (=> b!67566 (= res!55939 (bvsle (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)) (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(declare-fun b!67567 () Bool)

(declare-fun e!44269 () Bool)

(assert (=> b!67567 (= e!44270 e!44269)))

(declare-fun res!55938 () Bool)

(assert (=> b!67567 (=> res!55938 e!44269)))

(assert (=> b!67567 (= res!55938 (= (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67568 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2866 array!2866 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67568 (= e!44269 (arrayBitRangesEq!0 (buf!1706 thiss!1379) (buf!1706 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(assert (= (and d!21382 res!55937) b!67566))

(assert (= (and b!67566 res!55939) b!67567))

(assert (= (and b!67567 (not res!55938)) b!67568))

(assert (=> b!67566 m!107243))

(assert (=> b!67566 m!107243))

(assert (=> b!67568 m!107243))

(assert (=> b!67568 m!107243))

(declare-fun m!107587 () Bool)

(assert (=> b!67568 m!107587))

(assert (=> b!67324 d!21382))

(declare-fun d!21394 () Bool)

(assert (=> d!21394 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107608 () Unit!4535)

(declare-fun choose!11 (BitStream!2272) Unit!4535)

(assert (=> d!21394 (= lt!107608 (choose!11 thiss!1379))))

(assert (=> d!21394 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!107608)))

(declare-fun bs!5179 () Bool)

(assert (= bs!5179 d!21394))

(assert (=> bs!5179 m!107239))

(declare-fun m!107591 () Bool)

(assert (=> bs!5179 m!107591))

(assert (=> b!67324 d!21394))

(declare-fun d!21398 () Bool)

(declare-fun e!44271 () Bool)

(assert (=> d!21398 e!44271))

(declare-fun res!55941 () Bool)

(assert (=> d!21398 (=> (not res!55941) (not e!44271))))

(declare-fun lt!107611 () (_ BitVec 64))

(declare-fun lt!107613 () (_ BitVec 64))

(declare-fun lt!107609 () (_ BitVec 64))

(assert (=> d!21398 (= res!55941 (= lt!107613 (bvsub lt!107609 lt!107611)))))

(assert (=> d!21398 (or (= (bvand lt!107609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107609 lt!107611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21398 (= lt!107611 (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379))))))

(declare-fun lt!107612 () (_ BitVec 64))

(declare-fun lt!107610 () (_ BitVec 64))

(assert (=> d!21398 (= lt!107609 (bvmul lt!107612 lt!107610))))

(assert (=> d!21398 (or (= lt!107612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107610 (bvsdiv (bvmul lt!107612 lt!107610) lt!107612)))))

(assert (=> d!21398 (= lt!107610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21398 (= lt!107612 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))))))

(assert (=> d!21398 (= lt!107613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3390 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3385 thiss!1379))))))

(assert (=> d!21398 (invariant!0 (currentBit!3385 thiss!1379) (currentByte!3390 thiss!1379) (size!1325 (buf!1706 thiss!1379)))))

(assert (=> d!21398 (= (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)) lt!107613)))

(declare-fun b!67569 () Bool)

(declare-fun res!55940 () Bool)

(assert (=> b!67569 (=> (not res!55940) (not e!44271))))

(assert (=> b!67569 (= res!55940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107613))))

(declare-fun b!67570 () Bool)

(declare-fun lt!107614 () (_ BitVec 64))

(assert (=> b!67570 (= e!44271 (bvsle lt!107613 (bvmul lt!107614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67570 (or (= lt!107614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107614)))))

(assert (=> b!67570 (= lt!107614 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))))))

(assert (= (and d!21398 res!55941) b!67569))

(assert (= (and b!67569 res!55940) b!67570))

(declare-fun m!107593 () Bool)

(assert (=> d!21398 m!107593))

(declare-fun m!107595 () Bool)

(assert (=> d!21398 m!107595))

(assert (=> b!67324 d!21398))

(declare-fun b!67733 () Bool)

(declare-fun e!44345 () tuple2!5930)

(declare-fun Unit!4552 () Unit!4535)

(assert (=> b!67733 (= e!44345 (tuple2!5931 Unit!4552 (_2!3076 lt!107353)))))

(assert (=> b!67733 (= (size!1325 (buf!1706 (_2!3076 lt!107353))) (size!1325 (buf!1706 (_2!3076 lt!107353))))))

(declare-fun lt!108147 () Unit!4535)

(declare-fun Unit!4553 () Unit!4535)

(assert (=> b!67733 (= lt!108147 Unit!4553)))

(declare-fun call!868 () tuple2!5928)

(declare-fun checkByteArrayBitContent!0 (BitStream!2272 array!2866 array!2866 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5956 0))(
  ( (tuple2!5957 (_1!3089 array!2866) (_2!3089 BitStream!2272)) )
))
(declare-fun readBits!0 (BitStream!2272 (_ BitVec 64)) tuple2!5956)

(assert (=> b!67733 (checkByteArrayBitContent!0 (_2!3076 lt!107353) srcBuffer!2 (_1!3089 (readBits!0 (_1!3075 call!868) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!67734 () Bool)

(declare-fun res!56047 () Bool)

(declare-fun e!44347 () Bool)

(assert (=> b!67734 (=> (not res!56047) (not e!44347))))

(declare-fun lt!108168 () tuple2!5930)

(assert (=> b!67734 (= res!56047 (invariant!0 (currentBit!3385 (_2!3076 lt!108168)) (currentByte!3390 (_2!3076 lt!108168)) (size!1325 (buf!1706 (_2!3076 lt!108168)))))))

(declare-fun b!67735 () Bool)

(declare-fun e!44346 () Bool)

(declare-fun lt!108144 () (_ BitVec 64))

(assert (=> b!67735 (= e!44346 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!108144))))

(declare-fun b!67736 () Bool)

(declare-fun res!56043 () Bool)

(assert (=> b!67736 (=> (not res!56043) (not e!44347))))

(assert (=> b!67736 (= res!56043 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!108168)))))

(declare-fun b!67737 () Bool)

(declare-fun lt!108146 () tuple2!5930)

(declare-fun Unit!4554 () Unit!4535)

(assert (=> b!67737 (= e!44345 (tuple2!5931 Unit!4554 (_2!3076 lt!108146)))))

(declare-fun lt!108155 () tuple2!5930)

(assert (=> b!67737 (= lt!108155 (appendBitFromByte!0 (_2!3076 lt!107353) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!108142 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108142 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108148 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108148 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108131 () Unit!4535)

(assert (=> b!67737 (= lt!108131 (validateOffsetBitsIneqLemma!0 (_2!3076 lt!107353) (_2!3076 lt!108155) lt!108142 lt!108148))))

(assert (=> b!67737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!108155)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!108155))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!108155))) (bvsub lt!108142 lt!108148))))

(declare-fun lt!108150 () Unit!4535)

(assert (=> b!67737 (= lt!108150 lt!108131)))

(declare-fun lt!108156 () tuple2!5928)

(assert (=> b!67737 (= lt!108156 (reader!0 (_2!3076 lt!107353) (_2!3076 lt!108155)))))

(declare-fun lt!108134 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108134 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108167 () Unit!4535)

(assert (=> b!67737 (= lt!108167 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!108155)) lt!108134))))

(assert (=> b!67737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!108155)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!108134)))

(declare-fun lt!108166 () Unit!4535)

(assert (=> b!67737 (= lt!108166 lt!108167)))

(assert (=> b!67737 (= (head!530 (byteArrayBitContentToList!0 (_2!3076 lt!108155) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!530 (bitStreamReadBitsIntoList!0 (_2!3076 lt!108155) (_1!3075 lt!108156) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108158 () Unit!4535)

(declare-fun Unit!4555 () Unit!4535)

(assert (=> b!67737 (= lt!108158 Unit!4555)))

(assert (=> b!67737 (= lt!108146 (appendBitsMSBFirstLoop!0 (_2!3076 lt!108155) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!108141 () Unit!4535)

(assert (=> b!67737 (= lt!108141 (lemmaIsPrefixTransitive!0 (_2!3076 lt!107353) (_2!3076 lt!108155) (_2!3076 lt!108146)))))

(assert (=> b!67737 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!108146))))

(declare-fun lt!108137 () Unit!4535)

(assert (=> b!67737 (= lt!108137 lt!108141)))

(assert (=> b!67737 (= (size!1325 (buf!1706 (_2!3076 lt!108146))) (size!1325 (buf!1706 (_2!3076 lt!107353))))))

(declare-fun lt!108138 () Unit!4535)

(declare-fun Unit!4556 () Unit!4535)

(assert (=> b!67737 (= lt!108138 Unit!4556)))

(assert (=> b!67737 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108146))) (currentByte!3390 (_2!3076 lt!108146)) (currentBit!3385 (_2!3076 lt!108146))) (bvsub (bvadd (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108160 () Unit!4535)

(declare-fun Unit!4557 () Unit!4535)

(assert (=> b!67737 (= lt!108160 Unit!4557)))

(assert (=> b!67737 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108146))) (currentByte!3390 (_2!3076 lt!108146)) (currentBit!3385 (_2!3076 lt!108146))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108155))) (currentByte!3390 (_2!3076 lt!108155)) (currentBit!3385 (_2!3076 lt!108155))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108154 () Unit!4535)

(declare-fun Unit!4558 () Unit!4535)

(assert (=> b!67737 (= lt!108154 Unit!4558)))

(declare-fun lt!108136 () tuple2!5928)

(assert (=> b!67737 (= lt!108136 (reader!0 (_2!3076 lt!107353) (_2!3076 lt!108146)))))

(declare-fun lt!108162 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108162 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108135 () Unit!4535)

(assert (=> b!67737 (= lt!108135 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!108146)) lt!108162))))

(assert (=> b!67737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!108146)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!108162)))

(declare-fun lt!108172 () Unit!4535)

(assert (=> b!67737 (= lt!108172 lt!108135)))

(declare-fun lt!108152 () tuple2!5928)

(assert (=> b!67737 (= lt!108152 call!868)))

(declare-fun lt!108130 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108130 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!108161 () Unit!4535)

(assert (=> b!67737 (= lt!108161 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!108155) (buf!1706 (_2!3076 lt!108146)) lt!108130))))

(assert (=> b!67737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!108146)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!108155))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!108155))) lt!108130)))

(declare-fun lt!108145 () Unit!4535)

(assert (=> b!67737 (= lt!108145 lt!108161)))

(declare-fun lt!108143 () List!711)

(assert (=> b!67737 (= lt!108143 (byteArrayBitContentToList!0 (_2!3076 lt!108146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!108163 () List!711)

(assert (=> b!67737 (= lt!108163 (byteArrayBitContentToList!0 (_2!3076 lt!108146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108159 () List!711)

(assert (=> b!67737 (= lt!108159 (bitStreamReadBitsIntoList!0 (_2!3076 lt!108146) (_1!3075 lt!108136) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!108139 () List!711)

(assert (=> b!67737 (= lt!108139 (bitStreamReadBitsIntoList!0 (_2!3076 lt!108146) (_1!3075 lt!108152) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!108157 () (_ BitVec 64))

(assert (=> b!67737 (= lt!108157 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!108171 () Unit!4535)

(assert (=> b!67737 (= lt!108171 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3076 lt!108146) (_2!3076 lt!108146) (_1!3075 lt!108136) (_1!3075 lt!108152) lt!108157 lt!108159))))

(assert (=> b!67737 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!108146) (_1!3075 lt!108152) (bvsub lt!108157 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!315 lt!108159))))

(declare-fun lt!108169 () Unit!4535)

(assert (=> b!67737 (= lt!108169 lt!108171)))

(declare-fun lt!108153 () (_ BitVec 64))

(declare-fun lt!108129 () Unit!4535)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2866 array!2866 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4535)

(assert (=> b!67737 (= lt!108129 (arrayBitRangesEqImpliesEq!0 (buf!1706 (_2!3076 lt!108155)) (buf!1706 (_2!3076 lt!108146)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!108153 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108155))) (currentByte!3390 (_2!3076 lt!108155)) (currentBit!3385 (_2!3076 lt!108155)))))))

(assert (=> b!67737 (= (bitAt!0 (buf!1706 (_2!3076 lt!108155)) lt!108153) (bitAt!0 (buf!1706 (_2!3076 lt!108146)) lt!108153))))

(declare-fun lt!108165 () Unit!4535)

(assert (=> b!67737 (= lt!108165 lt!108129)))

(declare-fun c!4970 () Bool)

(declare-fun bm!865 () Bool)

(assert (=> bm!865 (= call!868 (reader!0 (ite c!4970 (_2!3076 lt!108155) (_2!3076 lt!107353)) (ite c!4970 (_2!3076 lt!108146) (_2!3076 lt!107353))))))

(declare-fun lt!108149 () tuple2!5928)

(declare-fun b!67738 () Bool)

(assert (=> b!67738 (= e!44347 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!108168) (_1!3075 lt!108149) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3076 lt!108168) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!67738 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67738 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!108140 () Unit!4535)

(declare-fun lt!108151 () Unit!4535)

(assert (=> b!67738 (= lt!108140 lt!108151)))

(assert (=> b!67738 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!108168)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!108144)))

(assert (=> b!67738 (= lt!108151 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!108168)) lt!108144))))

(assert (=> b!67738 e!44346))

(declare-fun res!56045 () Bool)

(assert (=> b!67738 (=> (not res!56045) (not e!44346))))

(assert (=> b!67738 (= res!56045 (and (= (size!1325 (buf!1706 (_2!3076 lt!107353))) (size!1325 (buf!1706 (_2!3076 lt!108168)))) (bvsge lt!108144 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67738 (= lt!108144 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!67738 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67738 (= lt!108149 (reader!0 (_2!3076 lt!107353) (_2!3076 lt!108168)))))

(declare-fun d!21400 () Bool)

(assert (=> d!21400 e!44347))

(declare-fun res!56044 () Bool)

(assert (=> d!21400 (=> (not res!56044) (not e!44347))))

(declare-fun lt!108164 () (_ BitVec 64))

(assert (=> d!21400 (= res!56044 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108168))) (currentByte!3390 (_2!3076 lt!108168)) (currentBit!3385 (_2!3076 lt!108168))) (bvsub lt!108164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21400 (or (= (bvand lt!108164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!108133 () (_ BitVec 64))

(assert (=> d!21400 (= lt!108164 (bvadd lt!108133 to!314))))

(assert (=> d!21400 (or (not (= (bvand lt!108133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!108133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!108133 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21400 (= lt!108133 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(assert (=> d!21400 (= lt!108168 e!44345)))

(assert (=> d!21400 (= c!4970 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!108170 () Unit!4535)

(declare-fun lt!108132 () Unit!4535)

(assert (=> d!21400 (= lt!108170 lt!108132)))

(assert (=> d!21400 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107353))))

(assert (=> d!21400 (= lt!108132 (lemmaIsPrefixRefl!0 (_2!3076 lt!107353)))))

(assert (=> d!21400 (= lt!108153 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(assert (=> d!21400 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21400 (= (appendBitsMSBFirstLoop!0 (_2!3076 lt!107353) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!108168)))

(declare-fun b!67739 () Bool)

(declare-fun res!56046 () Bool)

(assert (=> b!67739 (=> (not res!56046) (not e!44347))))

(assert (=> b!67739 (= res!56046 (= (size!1325 (buf!1706 (_2!3076 lt!108168))) (size!1325 (buf!1706 (_2!3076 lt!107353)))))))

(declare-fun b!67740 () Bool)

(declare-fun res!56048 () Bool)

(assert (=> b!67740 (=> (not res!56048) (not e!44347))))

(assert (=> b!67740 (= res!56048 (= (size!1325 (buf!1706 (_2!3076 lt!107353))) (size!1325 (buf!1706 (_2!3076 lt!108168)))))))

(assert (= (and d!21400 c!4970) b!67737))

(assert (= (and d!21400 (not c!4970)) b!67733))

(assert (= (or b!67737 b!67733) bm!865))

(assert (= (and d!21400 res!56044) b!67734))

(assert (= (and b!67734 res!56047) b!67740))

(assert (= (and b!67740 res!56048) b!67736))

(assert (= (and b!67736 res!56043) b!67739))

(assert (= (and b!67739 res!56046) b!67738))

(assert (= (and b!67738 res!56045) b!67735))

(declare-fun m!107941 () Bool)

(assert (=> b!67736 m!107941))

(declare-fun m!107943 () Bool)

(assert (=> b!67737 m!107943))

(declare-fun m!107945 () Bool)

(assert (=> b!67737 m!107945))

(declare-fun m!107947 () Bool)

(assert (=> b!67737 m!107947))

(declare-fun m!107949 () Bool)

(assert (=> b!67737 m!107949))

(declare-fun m!107951 () Bool)

(assert (=> b!67737 m!107951))

(declare-fun m!107953 () Bool)

(assert (=> b!67737 m!107953))

(declare-fun m!107955 () Bool)

(assert (=> b!67737 m!107955))

(declare-fun m!107957 () Bool)

(assert (=> b!67737 m!107957))

(declare-fun m!107959 () Bool)

(assert (=> b!67737 m!107959))

(declare-fun m!107961 () Bool)

(assert (=> b!67737 m!107961))

(declare-fun m!107963 () Bool)

(assert (=> b!67737 m!107963))

(declare-fun m!107965 () Bool)

(assert (=> b!67737 m!107965))

(declare-fun m!107967 () Bool)

(assert (=> b!67737 m!107967))

(assert (=> b!67737 m!107967))

(declare-fun m!107969 () Bool)

(assert (=> b!67737 m!107969))

(declare-fun m!107971 () Bool)

(assert (=> b!67737 m!107971))

(declare-fun m!107973 () Bool)

(assert (=> b!67737 m!107973))

(declare-fun m!107975 () Bool)

(assert (=> b!67737 m!107975))

(declare-fun m!107977 () Bool)

(assert (=> b!67737 m!107977))

(declare-fun m!107979 () Bool)

(assert (=> b!67737 m!107979))

(declare-fun m!107981 () Bool)

(assert (=> b!67737 m!107981))

(declare-fun m!107983 () Bool)

(assert (=> b!67737 m!107983))

(declare-fun m!107985 () Bool)

(assert (=> b!67737 m!107985))

(declare-fun m!107987 () Bool)

(assert (=> b!67737 m!107987))

(declare-fun m!107989 () Bool)

(assert (=> b!67737 m!107989))

(declare-fun m!107991 () Bool)

(assert (=> b!67737 m!107991))

(assert (=> b!67737 m!107277))

(assert (=> b!67737 m!107945))

(declare-fun m!107993 () Bool)

(assert (=> b!67737 m!107993))

(assert (=> b!67737 m!107955))

(declare-fun m!107995 () Bool)

(assert (=> b!67737 m!107995))

(declare-fun m!107997 () Bool)

(assert (=> b!67737 m!107997))

(declare-fun m!107999 () Bool)

(assert (=> b!67737 m!107999))

(assert (=> b!67737 m!107975))

(declare-fun m!108001 () Bool)

(assert (=> b!67737 m!108001))

(declare-fun m!108003 () Bool)

(assert (=> b!67737 m!108003))

(declare-fun m!108005 () Bool)

(assert (=> b!67738 m!108005))

(declare-fun m!108007 () Bool)

(assert (=> b!67738 m!108007))

(declare-fun m!108009 () Bool)

(assert (=> b!67738 m!108009))

(declare-fun m!108011 () Bool)

(assert (=> b!67738 m!108011))

(declare-fun m!108013 () Bool)

(assert (=> b!67738 m!108013))

(declare-fun m!108015 () Bool)

(assert (=> bm!865 m!108015))

(declare-fun m!108017 () Bool)

(assert (=> d!21400 m!108017))

(assert (=> d!21400 m!107277))

(declare-fun m!108019 () Bool)

(assert (=> d!21400 m!108019))

(declare-fun m!108021 () Bool)

(assert (=> d!21400 m!108021))

(declare-fun m!108023 () Bool)

(assert (=> b!67735 m!108023))

(declare-fun m!108025 () Bool)

(assert (=> b!67734 m!108025))

(declare-fun m!108027 () Bool)

(assert (=> b!67733 m!108027))

(declare-fun m!108029 () Bool)

(assert (=> b!67733 m!108029))

(assert (=> b!67335 d!21400))

(declare-fun d!21478 () Bool)

(assert (=> d!21478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108175 () Unit!4535)

(declare-fun choose!9 (BitStream!2272 array!2866 (_ BitVec 64) BitStream!2272) Unit!4535)

(assert (=> d!21478 (= lt!108175 (choose!9 thiss!1379 (buf!1706 (_2!3076 lt!107353)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2273 (buf!1706 (_2!3076 lt!107353)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(assert (=> d!21478 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1706 (_2!3076 lt!107353)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108175)))

(declare-fun bs!5197 () Bool)

(assert (= bs!5197 d!21478))

(assert (=> bs!5197 m!107309))

(declare-fun m!108031 () Bool)

(assert (=> bs!5197 m!108031))

(assert (=> b!67335 d!21478))

(declare-fun d!21480 () Bool)

(declare-fun res!56049 () Bool)

(declare-fun e!44349 () Bool)

(assert (=> d!21480 (=> (not res!56049) (not e!44349))))

(assert (=> d!21480 (= res!56049 (= (size!1325 (buf!1706 thiss!1379)) (size!1325 (buf!1706 (_2!3076 lt!107337)))))))

(assert (=> d!21480 (= (isPrefixOf!0 thiss!1379 (_2!3076 lt!107337)) e!44349)))

(declare-fun b!67741 () Bool)

(declare-fun res!56051 () Bool)

(assert (=> b!67741 (=> (not res!56051) (not e!44349))))

(assert (=> b!67741 (= res!56051 (bvsle (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)) (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337)))))))

(declare-fun b!67742 () Bool)

(declare-fun e!44348 () Bool)

(assert (=> b!67742 (= e!44349 e!44348)))

(declare-fun res!56050 () Bool)

(assert (=> b!67742 (=> res!56050 e!44348)))

(assert (=> b!67742 (= res!56050 (= (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67743 () Bool)

(assert (=> b!67743 (= e!44348 (arrayBitRangesEq!0 (buf!1706 thiss!1379) (buf!1706 (_2!3076 lt!107337)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(assert (= (and d!21480 res!56049) b!67741))

(assert (= (and b!67741 res!56051) b!67742))

(assert (= (and b!67742 (not res!56050)) b!67743))

(assert (=> b!67741 m!107243))

(assert (=> b!67741 m!107295))

(assert (=> b!67743 m!107243))

(assert (=> b!67743 m!107243))

(declare-fun m!108033 () Bool)

(assert (=> b!67743 m!108033))

(assert (=> b!67335 d!21480))

(declare-fun d!21482 () Bool)

(declare-fun res!56052 () Bool)

(declare-fun e!44351 () Bool)

(assert (=> d!21482 (=> (not res!56052) (not e!44351))))

(assert (=> d!21482 (= res!56052 (= (size!1325 (buf!1706 (_2!3076 lt!107353))) (size!1325 (buf!1706 (_2!3076 lt!107337)))))))

(assert (=> d!21482 (= (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107337)) e!44351)))

(declare-fun b!67744 () Bool)

(declare-fun res!56054 () Bool)

(assert (=> b!67744 (=> (not res!56054) (not e!44351))))

(assert (=> b!67744 (= res!56054 (bvsle (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))) (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337)))))))

(declare-fun b!67745 () Bool)

(declare-fun e!44350 () Bool)

(assert (=> b!67745 (= e!44351 e!44350)))

(declare-fun res!56053 () Bool)

(assert (=> b!67745 (=> res!56053 e!44350)))

(assert (=> b!67745 (= res!56053 (= (size!1325 (buf!1706 (_2!3076 lt!107353))) #b00000000000000000000000000000000))))

(declare-fun b!67746 () Bool)

(assert (=> b!67746 (= e!44350 (arrayBitRangesEq!0 (buf!1706 (_2!3076 lt!107353)) (buf!1706 (_2!3076 lt!107337)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353)))))))

(assert (= (and d!21482 res!56052) b!67744))

(assert (= (and b!67744 res!56054) b!67745))

(assert (= (and b!67745 (not res!56053)) b!67746))

(assert (=> b!67744 m!107277))

(assert (=> b!67744 m!107295))

(assert (=> b!67746 m!107277))

(assert (=> b!67746 m!107277))

(declare-fun m!108035 () Bool)

(assert (=> b!67746 m!108035))

(assert (=> b!67335 d!21482))

(declare-fun d!21484 () Bool)

(assert (=> d!21484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5198 () Bool)

(assert (= bs!5198 d!21484))

(declare-fun m!108037 () Bool)

(assert (=> bs!5198 m!108037))

(assert (=> b!67335 d!21484))

(declare-fun d!21486 () Bool)

(assert (=> d!21486 (isPrefixOf!0 thiss!1379 (_2!3076 lt!107337))))

(declare-fun lt!108178 () Unit!4535)

(declare-fun choose!30 (BitStream!2272 BitStream!2272 BitStream!2272) Unit!4535)

(assert (=> d!21486 (= lt!108178 (choose!30 thiss!1379 (_2!3076 lt!107353) (_2!3076 lt!107337)))))

(assert (=> d!21486 (isPrefixOf!0 thiss!1379 (_2!3076 lt!107353))))

(assert (=> d!21486 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3076 lt!107353) (_2!3076 lt!107337)) lt!108178)))

(declare-fun bs!5199 () Bool)

(assert (= bs!5199 d!21486))

(assert (=> bs!5199 m!107311))

(declare-fun m!108039 () Bool)

(assert (=> bs!5199 m!108039))

(assert (=> bs!5199 m!107275))

(assert (=> b!67335 d!21486))

(declare-fun b!67764 () Bool)

(declare-fun lt!108314 () (_ BitVec 64))

(declare-fun lt!108317 () (_ BitVec 64))

(declare-fun lt!108308 () tuple2!5928)

(declare-fun e!44360 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2272 (_ BitVec 64)) BitStream!2272)

(assert (=> b!67764 (= e!44360 (= (_1!3075 lt!108308) (withMovedBitIndex!0 (_2!3075 lt!108308) (bvsub lt!108314 lt!108317))))))

(assert (=> b!67764 (or (= (bvand lt!108314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108317 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108314 lt!108317) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67764 (= lt!108317 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(assert (=> b!67764 (= lt!108314 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(declare-fun b!67765 () Bool)

(declare-fun res!56066 () Bool)

(assert (=> b!67765 (=> (not res!56066) (not e!44360))))

(assert (=> b!67765 (= res!56066 (isPrefixOf!0 (_2!3075 lt!108308) (_2!3076 lt!107353)))))

(declare-fun b!67766 () Bool)

(declare-fun res!56064 () Bool)

(assert (=> b!67766 (=> (not res!56064) (not e!44360))))

(assert (=> b!67766 (= res!56064 (isPrefixOf!0 (_1!3075 lt!108308) thiss!1379))))

(declare-fun b!67767 () Bool)

(declare-fun e!44361 () Unit!4535)

(declare-fun Unit!4560 () Unit!4535)

(assert (=> b!67767 (= e!44361 Unit!4560)))

(declare-fun b!67763 () Bool)

(declare-fun lt!108303 () Unit!4535)

(assert (=> b!67763 (= e!44361 lt!108303)))

(declare-fun lt!108311 () (_ BitVec 64))

(assert (=> b!67763 (= lt!108311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108309 () (_ BitVec 64))

(assert (=> b!67763 (= lt!108309 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2866 array!2866 (_ BitVec 64) (_ BitVec 64)) Unit!4535)

(assert (=> b!67763 (= lt!108303 (arrayBitRangesEqSymmetric!0 (buf!1706 thiss!1379) (buf!1706 (_2!3076 lt!107353)) lt!108311 lt!108309))))

(assert (=> b!67763 (arrayBitRangesEq!0 (buf!1706 (_2!3076 lt!107353)) (buf!1706 thiss!1379) lt!108311 lt!108309)))

(declare-fun d!21488 () Bool)

(assert (=> d!21488 e!44360))

(declare-fun res!56067 () Bool)

(assert (=> d!21488 (=> (not res!56067) (not e!44360))))

(assert (=> d!21488 (= res!56067 (isPrefixOf!0 (_1!3075 lt!108308) (_2!3075 lt!108308)))))

(declare-fun lt!108310 () BitStream!2272)

(assert (=> d!21488 (= lt!108308 (tuple2!5929 lt!108310 (_2!3076 lt!107353)))))

(declare-fun lt!108313 () Unit!4535)

(declare-fun lt!108299 () Unit!4535)

(assert (=> d!21488 (= lt!108313 lt!108299)))

(assert (=> d!21488 (isPrefixOf!0 lt!108310 (_2!3076 lt!107353))))

(assert (=> d!21488 (= lt!108299 (lemmaIsPrefixTransitive!0 lt!108310 (_2!3076 lt!107353) (_2!3076 lt!107353)))))

(declare-fun lt!108300 () Unit!4535)

(declare-fun lt!108318 () Unit!4535)

(assert (=> d!21488 (= lt!108300 lt!108318)))

(assert (=> d!21488 (isPrefixOf!0 lt!108310 (_2!3076 lt!107353))))

(assert (=> d!21488 (= lt!108318 (lemmaIsPrefixTransitive!0 lt!108310 thiss!1379 (_2!3076 lt!107353)))))

(declare-fun lt!108312 () Unit!4535)

(assert (=> d!21488 (= lt!108312 e!44361)))

(declare-fun c!4975 () Bool)

(assert (=> d!21488 (= c!4975 (not (= (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!108304 () Unit!4535)

(declare-fun lt!108305 () Unit!4535)

(assert (=> d!21488 (= lt!108304 lt!108305)))

(assert (=> d!21488 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107353))))

(assert (=> d!21488 (= lt!108305 (lemmaIsPrefixRefl!0 (_2!3076 lt!107353)))))

(declare-fun lt!108315 () Unit!4535)

(declare-fun lt!108307 () Unit!4535)

(assert (=> d!21488 (= lt!108315 lt!108307)))

(assert (=> d!21488 (= lt!108307 (lemmaIsPrefixRefl!0 (_2!3076 lt!107353)))))

(declare-fun lt!108316 () Unit!4535)

(declare-fun lt!108301 () Unit!4535)

(assert (=> d!21488 (= lt!108316 lt!108301)))

(assert (=> d!21488 (isPrefixOf!0 lt!108310 lt!108310)))

(assert (=> d!21488 (= lt!108301 (lemmaIsPrefixRefl!0 lt!108310))))

(declare-fun lt!108302 () Unit!4535)

(declare-fun lt!108306 () Unit!4535)

(assert (=> d!21488 (= lt!108302 lt!108306)))

(assert (=> d!21488 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21488 (= lt!108306 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21488 (= lt!108310 (BitStream!2273 (buf!1706 (_2!3076 lt!107353)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(assert (=> d!21488 (isPrefixOf!0 thiss!1379 (_2!3076 lt!107353))))

(assert (=> d!21488 (= (reader!0 thiss!1379 (_2!3076 lt!107353)) lt!108308)))

(assert (= (and d!21488 c!4975) b!67763))

(assert (= (and d!21488 (not c!4975)) b!67767))

(assert (= (and d!21488 res!56067) b!67766))

(assert (= (and b!67766 res!56064) b!67765))

(assert (= (and b!67765 res!56066) b!67764))

(assert (=> d!21488 m!108019))

(assert (=> d!21488 m!107241))

(assert (=> d!21488 m!108021))

(declare-fun m!108041 () Bool)

(assert (=> d!21488 m!108041))

(declare-fun m!108043 () Bool)

(assert (=> d!21488 m!108043))

(declare-fun m!108045 () Bool)

(assert (=> d!21488 m!108045))

(declare-fun m!108047 () Bool)

(assert (=> d!21488 m!108047))

(assert (=> d!21488 m!107239))

(assert (=> d!21488 m!107275))

(declare-fun m!108049 () Bool)

(assert (=> d!21488 m!108049))

(declare-fun m!108051 () Bool)

(assert (=> d!21488 m!108051))

(declare-fun m!108053 () Bool)

(assert (=> b!67764 m!108053))

(assert (=> b!67764 m!107277))

(assert (=> b!67764 m!107243))

(declare-fun m!108055 () Bool)

(assert (=> b!67765 m!108055))

(assert (=> b!67763 m!107243))

(declare-fun m!108057 () Bool)

(assert (=> b!67763 m!108057))

(declare-fun m!108059 () Bool)

(assert (=> b!67763 m!108059))

(declare-fun m!108061 () Bool)

(assert (=> b!67766 m!108061))

(assert (=> b!67335 d!21488))

(declare-fun d!21490 () Bool)

(assert (=> d!21490 (= (array_inv!1195 srcBuffer!2) (bvsge (size!1325 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13134 d!21490))

(declare-fun d!21492 () Bool)

(assert (=> d!21492 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3385 thiss!1379) (currentByte!3390 thiss!1379) (size!1325 (buf!1706 thiss!1379))))))

(declare-fun bs!5200 () Bool)

(assert (= bs!5200 d!21492))

(assert (=> bs!5200 m!107595))

(assert (=> start!13134 d!21492))

(declare-fun d!21494 () Bool)

(declare-fun size!1330 (List!711) Int)

(assert (=> d!21494 (= (length!339 lt!107351) (size!1330 lt!107351))))

(declare-fun bs!5201 () Bool)

(assert (= bs!5201 d!21494))

(declare-fun m!108063 () Bool)

(assert (=> bs!5201 m!108063))

(assert (=> b!67320 d!21494))

(declare-fun d!21496 () Bool)

(assert (=> d!21496 (= (bitAt!0 (buf!1706 (_2!3076 lt!107353)) lt!107349) (not (= (bvand ((_ sign_extend 24) (select (arr!1895 (buf!1706 (_2!3076 lt!107353))) ((_ extract 31 0) (bvsdiv lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5202 () Bool)

(assert (= bs!5202 d!21496))

(declare-fun m!108065 () Bool)

(assert (=> bs!5202 m!108065))

(declare-fun m!108067 () Bool)

(assert (=> bs!5202 m!108067))

(assert (=> b!67331 d!21496))

(declare-fun d!21498 () Bool)

(assert (=> d!21498 (= (bitAt!0 (buf!1706 (_1!3075 lt!107343)) lt!107349) (not (= (bvand ((_ sign_extend 24) (select (arr!1895 (buf!1706 (_1!3075 lt!107343))) ((_ extract 31 0) (bvsdiv lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5203 () Bool)

(assert (= bs!5203 d!21498))

(declare-fun m!108069 () Bool)

(assert (=> bs!5203 m!108069))

(assert (=> bs!5203 m!108067))

(assert (=> b!67321 d!21498))

(declare-fun d!21500 () Bool)

(assert (=> d!21500 (= (bitAt!0 (buf!1706 (_1!3075 lt!107347)) lt!107349) (not (= (bvand ((_ sign_extend 24) (select (arr!1895 (buf!1706 (_1!3075 lt!107347))) ((_ extract 31 0) (bvsdiv lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107349 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5204 () Bool)

(assert (= bs!5204 d!21500))

(declare-fun m!108071 () Bool)

(assert (=> bs!5204 m!108071))

(assert (=> bs!5204 m!108067))

(assert (=> b!67321 d!21500))

(declare-fun d!21502 () Bool)

(assert (=> d!21502 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 thiss!1379))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5205 () Bool)

(assert (= bs!5205 d!21502))

(assert (=> bs!5205 m!107593))

(assert (=> b!67332 d!21502))

(declare-fun d!21504 () Bool)

(assert (=> d!21504 (= (invariant!0 (currentBit!3385 (_2!3076 lt!107337)) (currentByte!3390 (_2!3076 lt!107337)) (size!1325 (buf!1706 (_2!3076 lt!107337)))) (and (bvsge (currentBit!3385 (_2!3076 lt!107337)) #b00000000000000000000000000000000) (bvslt (currentBit!3385 (_2!3076 lt!107337)) #b00000000000000000000000000001000) (bvsge (currentByte!3390 (_2!3076 lt!107337)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3390 (_2!3076 lt!107337)) (size!1325 (buf!1706 (_2!3076 lt!107337)))) (and (= (currentBit!3385 (_2!3076 lt!107337)) #b00000000000000000000000000000000) (= (currentByte!3390 (_2!3076 lt!107337)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))))

(assert (=> b!67322 d!21504))

(declare-fun d!21506 () Bool)

(declare-fun e!44364 () Bool)

(assert (=> d!21506 e!44364))

(declare-fun res!56077 () Bool)

(assert (=> d!21506 (=> (not res!56077) (not e!44364))))

(declare-fun lt!108327 () (_ BitVec 64))

(declare-fun lt!108331 () (_ BitVec 64))

(declare-fun lt!108329 () (_ BitVec 64))

(assert (=> d!21506 (= res!56077 (= lt!108331 (bvsub lt!108327 lt!108329)))))

(assert (=> d!21506 (or (= (bvand lt!108327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108327 lt!108329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21506 (= lt!108329 (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107337))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107337)))))))

(declare-fun lt!108330 () (_ BitVec 64))

(declare-fun lt!108328 () (_ BitVec 64))

(assert (=> d!21506 (= lt!108327 (bvmul lt!108330 lt!108328))))

(assert (=> d!21506 (or (= lt!108330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!108328 (bvsdiv (bvmul lt!108330 lt!108328) lt!108330)))))

(assert (=> d!21506 (= lt!108328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21506 (= lt!108330 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))))))

(assert (=> d!21506 (= lt!108331 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107337))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107337)))))))

(assert (=> d!21506 (invariant!0 (currentBit!3385 (_2!3076 lt!107337)) (currentByte!3390 (_2!3076 lt!107337)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))

(assert (=> d!21506 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337))) lt!108331)))

(declare-fun b!67778 () Bool)

(declare-fun res!56076 () Bool)

(assert (=> b!67778 (=> (not res!56076) (not e!44364))))

(assert (=> b!67778 (= res!56076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!108331))))

(declare-fun b!67779 () Bool)

(declare-fun lt!108332 () (_ BitVec 64))

(assert (=> b!67779 (= e!44364 (bvsle lt!108331 (bvmul lt!108332 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67779 (or (= lt!108332 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!108332 #b0000000000000000000000000000000000000000000000000000000000001000) lt!108332)))))

(assert (=> b!67779 (= lt!108332 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))))))

(assert (= (and d!21506 res!56077) b!67778))

(assert (= (and b!67778 res!56076) b!67779))

(declare-fun m!108073 () Bool)

(assert (=> d!21506 m!108073))

(assert (=> d!21506 m!107245))

(assert (=> b!67328 d!21506))

(declare-fun d!21508 () Bool)

(assert (=> d!21508 (= (invariant!0 (currentBit!3385 (_2!3076 lt!107353)) (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107353)))) (and (bvsge (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (bvslt (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000001000) (bvsge (currentByte!3390 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107353)))) (and (= (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (= (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107353))))))))))

(assert (=> b!67339 d!21508))

(declare-fun d!21510 () Bool)

(assert (=> d!21510 (= (array_inv!1195 (buf!1706 thiss!1379)) (bvsge (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!67329 d!21510))

(declare-fun b!67801 () Bool)

(declare-fun e!44375 () Bool)

(declare-fun lt!108387 () List!711)

(declare-fun isEmpty!215 (List!711) Bool)

(assert (=> b!67801 (= e!44375 (isEmpty!215 lt!108387))))

(declare-datatypes ((tuple2!5958 0))(
  ( (tuple2!5959 (_1!3090 List!711) (_2!3090 BitStream!2272)) )
))
(declare-fun e!44374 () tuple2!5958)

(declare-fun lt!108386 () (_ BitVec 64))

(declare-fun b!67800 () Bool)

(declare-datatypes ((tuple2!5960 0))(
  ( (tuple2!5961 (_1!3091 Bool) (_2!3091 BitStream!2272)) )
))
(declare-fun lt!108385 () tuple2!5960)

(assert (=> b!67800 (= e!44374 (tuple2!5959 (Cons!707 (_1!3091 lt!108385) (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_2!3091 lt!108385) (bvsub (bvsub to!314 i!635) lt!108386))) (_2!3091 lt!108385)))))

(declare-fun readBit!0 (BitStream!2272) tuple2!5960)

(assert (=> b!67800 (= lt!108385 (readBit!0 (_1!3075 lt!107347)))))

(assert (=> b!67800 (= lt!108386 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67802 () Bool)

(assert (=> b!67802 (= e!44375 (> (length!339 lt!108387) 0))))

(declare-fun b!67799 () Bool)

(assert (=> b!67799 (= e!44374 (tuple2!5959 Nil!708 (_1!3075 lt!107347)))))

(declare-fun d!21512 () Bool)

(assert (=> d!21512 e!44375))

(declare-fun c!4982 () Bool)

(assert (=> d!21512 (= c!4982 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21512 (= lt!108387 (_1!3090 e!44374))))

(declare-fun c!4981 () Bool)

(assert (=> d!21512 (= c!4981 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21512 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21512 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_1!3075 lt!107347) (bvsub to!314 i!635)) lt!108387)))

(assert (= (and d!21512 c!4981) b!67799))

(assert (= (and d!21512 (not c!4981)) b!67800))

(assert (= (and d!21512 c!4982) b!67801))

(assert (= (and d!21512 (not c!4982)) b!67802))

(declare-fun m!108165 () Bool)

(assert (=> b!67801 m!108165))

(declare-fun m!108167 () Bool)

(assert (=> b!67800 m!108167))

(declare-fun m!108169 () Bool)

(assert (=> b!67800 m!108169))

(declare-fun m!108171 () Bool)

(assert (=> b!67802 m!108171))

(assert (=> b!67330 d!21512))

(declare-fun lt!108398 () tuple2!5928)

(declare-fun b!67804 () Bool)

(declare-fun lt!108407 () (_ BitVec 64))

(declare-fun lt!108404 () (_ BitVec 64))

(declare-fun e!44376 () Bool)

(assert (=> b!67804 (= e!44376 (= (_1!3075 lt!108398) (withMovedBitIndex!0 (_2!3075 lt!108398) (bvsub lt!108404 lt!108407))))))

(assert (=> b!67804 (or (= (bvand lt!108404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108404 lt!108407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67804 (= lt!108407 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337))))))

(assert (=> b!67804 (= lt!108404 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(declare-fun b!67805 () Bool)

(declare-fun res!56088 () Bool)

(assert (=> b!67805 (=> (not res!56088) (not e!44376))))

(assert (=> b!67805 (= res!56088 (isPrefixOf!0 (_2!3075 lt!108398) (_2!3076 lt!107337)))))

(declare-fun b!67806 () Bool)

(declare-fun res!56087 () Bool)

(assert (=> b!67806 (=> (not res!56087) (not e!44376))))

(assert (=> b!67806 (= res!56087 (isPrefixOf!0 (_1!3075 lt!108398) thiss!1379))))

(declare-fun b!67807 () Bool)

(declare-fun e!44377 () Unit!4535)

(declare-fun Unit!4561 () Unit!4535)

(assert (=> b!67807 (= e!44377 Unit!4561)))

(declare-fun b!67803 () Bool)

(declare-fun lt!108393 () Unit!4535)

(assert (=> b!67803 (= e!44377 lt!108393)))

(declare-fun lt!108401 () (_ BitVec 64))

(assert (=> b!67803 (= lt!108401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108399 () (_ BitVec 64))

(assert (=> b!67803 (= lt!108399 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(assert (=> b!67803 (= lt!108393 (arrayBitRangesEqSymmetric!0 (buf!1706 thiss!1379) (buf!1706 (_2!3076 lt!107337)) lt!108401 lt!108399))))

(assert (=> b!67803 (arrayBitRangesEq!0 (buf!1706 (_2!3076 lt!107337)) (buf!1706 thiss!1379) lt!108401 lt!108399)))

(declare-fun d!21520 () Bool)

(assert (=> d!21520 e!44376))

(declare-fun res!56089 () Bool)

(assert (=> d!21520 (=> (not res!56089) (not e!44376))))

(assert (=> d!21520 (= res!56089 (isPrefixOf!0 (_1!3075 lt!108398) (_2!3075 lt!108398)))))

(declare-fun lt!108400 () BitStream!2272)

(assert (=> d!21520 (= lt!108398 (tuple2!5929 lt!108400 (_2!3076 lt!107337)))))

(declare-fun lt!108403 () Unit!4535)

(declare-fun lt!108389 () Unit!4535)

(assert (=> d!21520 (= lt!108403 lt!108389)))

(assert (=> d!21520 (isPrefixOf!0 lt!108400 (_2!3076 lt!107337))))

(assert (=> d!21520 (= lt!108389 (lemmaIsPrefixTransitive!0 lt!108400 (_2!3076 lt!107337) (_2!3076 lt!107337)))))

(declare-fun lt!108390 () Unit!4535)

(declare-fun lt!108408 () Unit!4535)

(assert (=> d!21520 (= lt!108390 lt!108408)))

(assert (=> d!21520 (isPrefixOf!0 lt!108400 (_2!3076 lt!107337))))

(assert (=> d!21520 (= lt!108408 (lemmaIsPrefixTransitive!0 lt!108400 thiss!1379 (_2!3076 lt!107337)))))

(declare-fun lt!108402 () Unit!4535)

(assert (=> d!21520 (= lt!108402 e!44377)))

(declare-fun c!4983 () Bool)

(assert (=> d!21520 (= c!4983 (not (= (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!108394 () Unit!4535)

(declare-fun lt!108395 () Unit!4535)

(assert (=> d!21520 (= lt!108394 lt!108395)))

(assert (=> d!21520 (isPrefixOf!0 (_2!3076 lt!107337) (_2!3076 lt!107337))))

(assert (=> d!21520 (= lt!108395 (lemmaIsPrefixRefl!0 (_2!3076 lt!107337)))))

(declare-fun lt!108405 () Unit!4535)

(declare-fun lt!108397 () Unit!4535)

(assert (=> d!21520 (= lt!108405 lt!108397)))

(assert (=> d!21520 (= lt!108397 (lemmaIsPrefixRefl!0 (_2!3076 lt!107337)))))

(declare-fun lt!108406 () Unit!4535)

(declare-fun lt!108391 () Unit!4535)

(assert (=> d!21520 (= lt!108406 lt!108391)))

(assert (=> d!21520 (isPrefixOf!0 lt!108400 lt!108400)))

(assert (=> d!21520 (= lt!108391 (lemmaIsPrefixRefl!0 lt!108400))))

(declare-fun lt!108392 () Unit!4535)

(declare-fun lt!108396 () Unit!4535)

(assert (=> d!21520 (= lt!108392 lt!108396)))

(assert (=> d!21520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21520 (= lt!108396 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21520 (= lt!108400 (BitStream!2273 (buf!1706 (_2!3076 lt!107337)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(assert (=> d!21520 (isPrefixOf!0 thiss!1379 (_2!3076 lt!107337))))

(assert (=> d!21520 (= (reader!0 thiss!1379 (_2!3076 lt!107337)) lt!108398)))

(assert (= (and d!21520 c!4983) b!67803))

(assert (= (and d!21520 (not c!4983)) b!67807))

(assert (= (and d!21520 res!56089) b!67806))

(assert (= (and b!67806 res!56087) b!67805))

(assert (= (and b!67805 res!56088) b!67804))

(declare-fun m!108175 () Bool)

(assert (=> d!21520 m!108175))

(assert (=> d!21520 m!107241))

(declare-fun m!108177 () Bool)

(assert (=> d!21520 m!108177))

(declare-fun m!108179 () Bool)

(assert (=> d!21520 m!108179))

(declare-fun m!108181 () Bool)

(assert (=> d!21520 m!108181))

(declare-fun m!108183 () Bool)

(assert (=> d!21520 m!108183))

(declare-fun m!108185 () Bool)

(assert (=> d!21520 m!108185))

(assert (=> d!21520 m!107239))

(assert (=> d!21520 m!107311))

(declare-fun m!108187 () Bool)

(assert (=> d!21520 m!108187))

(declare-fun m!108189 () Bool)

(assert (=> d!21520 m!108189))

(declare-fun m!108191 () Bool)

(assert (=> b!67804 m!108191))

(assert (=> b!67804 m!107295))

(assert (=> b!67804 m!107243))

(declare-fun m!108193 () Bool)

(assert (=> b!67805 m!108193))

(assert (=> b!67803 m!107243))

(declare-fun m!108195 () Bool)

(assert (=> b!67803 m!108195))

(declare-fun m!108197 () Bool)

(assert (=> b!67803 m!108197))

(declare-fun m!108199 () Bool)

(assert (=> b!67806 m!108199))

(assert (=> b!67330 d!21520))

(declare-fun lt!108424 () (_ BitVec 64))

(declare-fun lt!108418 () tuple2!5928)

(declare-fun b!67809 () Bool)

(declare-fun lt!108427 () (_ BitVec 64))

(declare-fun e!44378 () Bool)

(assert (=> b!67809 (= e!44378 (= (_1!3075 lt!108418) (withMovedBitIndex!0 (_2!3075 lt!108418) (bvsub lt!108424 lt!108427))))))

(assert (=> b!67809 (or (= (bvand lt!108424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!108424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!108424 lt!108427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67809 (= lt!108427 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107337))) (currentByte!3390 (_2!3076 lt!107337)) (currentBit!3385 (_2!3076 lt!107337))))))

(assert (=> b!67809 (= lt!108424 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(declare-fun b!67810 () Bool)

(declare-fun res!56091 () Bool)

(assert (=> b!67810 (=> (not res!56091) (not e!44378))))

(assert (=> b!67810 (= res!56091 (isPrefixOf!0 (_2!3075 lt!108418) (_2!3076 lt!107337)))))

(declare-fun b!67811 () Bool)

(declare-fun res!56090 () Bool)

(assert (=> b!67811 (=> (not res!56090) (not e!44378))))

(assert (=> b!67811 (= res!56090 (isPrefixOf!0 (_1!3075 lt!108418) (_2!3076 lt!107353)))))

(declare-fun b!67812 () Bool)

(declare-fun e!44379 () Unit!4535)

(declare-fun Unit!4563 () Unit!4535)

(assert (=> b!67812 (= e!44379 Unit!4563)))

(declare-fun b!67808 () Bool)

(declare-fun lt!108413 () Unit!4535)

(assert (=> b!67808 (= e!44379 lt!108413)))

(declare-fun lt!108421 () (_ BitVec 64))

(assert (=> b!67808 (= lt!108421 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!108419 () (_ BitVec 64))

(assert (=> b!67808 (= lt!108419 (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(assert (=> b!67808 (= lt!108413 (arrayBitRangesEqSymmetric!0 (buf!1706 (_2!3076 lt!107353)) (buf!1706 (_2!3076 lt!107337)) lt!108421 lt!108419))))

(assert (=> b!67808 (arrayBitRangesEq!0 (buf!1706 (_2!3076 lt!107337)) (buf!1706 (_2!3076 lt!107353)) lt!108421 lt!108419)))

(declare-fun d!21526 () Bool)

(assert (=> d!21526 e!44378))

(declare-fun res!56092 () Bool)

(assert (=> d!21526 (=> (not res!56092) (not e!44378))))

(assert (=> d!21526 (= res!56092 (isPrefixOf!0 (_1!3075 lt!108418) (_2!3075 lt!108418)))))

(declare-fun lt!108420 () BitStream!2272)

(assert (=> d!21526 (= lt!108418 (tuple2!5929 lt!108420 (_2!3076 lt!107337)))))

(declare-fun lt!108423 () Unit!4535)

(declare-fun lt!108409 () Unit!4535)

(assert (=> d!21526 (= lt!108423 lt!108409)))

(assert (=> d!21526 (isPrefixOf!0 lt!108420 (_2!3076 lt!107337))))

(assert (=> d!21526 (= lt!108409 (lemmaIsPrefixTransitive!0 lt!108420 (_2!3076 lt!107337) (_2!3076 lt!107337)))))

(declare-fun lt!108410 () Unit!4535)

(declare-fun lt!108428 () Unit!4535)

(assert (=> d!21526 (= lt!108410 lt!108428)))

(assert (=> d!21526 (isPrefixOf!0 lt!108420 (_2!3076 lt!107337))))

(assert (=> d!21526 (= lt!108428 (lemmaIsPrefixTransitive!0 lt!108420 (_2!3076 lt!107353) (_2!3076 lt!107337)))))

(declare-fun lt!108422 () Unit!4535)

(assert (=> d!21526 (= lt!108422 e!44379)))

(declare-fun c!4984 () Bool)

(assert (=> d!21526 (= c!4984 (not (= (size!1325 (buf!1706 (_2!3076 lt!107353))) #b00000000000000000000000000000000)))))

(declare-fun lt!108414 () Unit!4535)

(declare-fun lt!108415 () Unit!4535)

(assert (=> d!21526 (= lt!108414 lt!108415)))

(assert (=> d!21526 (isPrefixOf!0 (_2!3076 lt!107337) (_2!3076 lt!107337))))

(assert (=> d!21526 (= lt!108415 (lemmaIsPrefixRefl!0 (_2!3076 lt!107337)))))

(declare-fun lt!108425 () Unit!4535)

(declare-fun lt!108417 () Unit!4535)

(assert (=> d!21526 (= lt!108425 lt!108417)))

(assert (=> d!21526 (= lt!108417 (lemmaIsPrefixRefl!0 (_2!3076 lt!107337)))))

(declare-fun lt!108426 () Unit!4535)

(declare-fun lt!108411 () Unit!4535)

(assert (=> d!21526 (= lt!108426 lt!108411)))

(assert (=> d!21526 (isPrefixOf!0 lt!108420 lt!108420)))

(assert (=> d!21526 (= lt!108411 (lemmaIsPrefixRefl!0 lt!108420))))

(declare-fun lt!108412 () Unit!4535)

(declare-fun lt!108416 () Unit!4535)

(assert (=> d!21526 (= lt!108412 lt!108416)))

(assert (=> d!21526 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107353))))

(assert (=> d!21526 (= lt!108416 (lemmaIsPrefixRefl!0 (_2!3076 lt!107353)))))

(assert (=> d!21526 (= lt!108420 (BitStream!2273 (buf!1706 (_2!3076 lt!107337)) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353))))))

(assert (=> d!21526 (isPrefixOf!0 (_2!3076 lt!107353) (_2!3076 lt!107337))))

(assert (=> d!21526 (= (reader!0 (_2!3076 lt!107353) (_2!3076 lt!107337)) lt!108418)))

(assert (= (and d!21526 c!4984) b!67808))

(assert (= (and d!21526 (not c!4984)) b!67812))

(assert (= (and d!21526 res!56092) b!67811))

(assert (= (and b!67811 res!56090) b!67810))

(assert (= (and b!67810 res!56091) b!67809))

(assert (=> d!21526 m!108175))

(assert (=> d!21526 m!108021))

(assert (=> d!21526 m!108177))

(declare-fun m!108201 () Bool)

(assert (=> d!21526 m!108201))

(declare-fun m!108203 () Bool)

(assert (=> d!21526 m!108203))

(declare-fun m!108205 () Bool)

(assert (=> d!21526 m!108205))

(declare-fun m!108207 () Bool)

(assert (=> d!21526 m!108207))

(assert (=> d!21526 m!108019))

(assert (=> d!21526 m!107305))

(declare-fun m!108209 () Bool)

(assert (=> d!21526 m!108209))

(declare-fun m!108211 () Bool)

(assert (=> d!21526 m!108211))

(declare-fun m!108213 () Bool)

(assert (=> b!67809 m!108213))

(assert (=> b!67809 m!107295))

(assert (=> b!67809 m!107277))

(declare-fun m!108215 () Bool)

(assert (=> b!67810 m!108215))

(assert (=> b!67808 m!107277))

(declare-fun m!108217 () Bool)

(assert (=> b!67808 m!108217))

(declare-fun m!108219 () Bool)

(assert (=> b!67808 m!108219))

(declare-fun m!108221 () Bool)

(assert (=> b!67811 m!108221))

(assert (=> b!67330 d!21526))

(declare-fun d!21528 () Bool)

(assert (=> d!21528 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!107350)))

(declare-fun lt!108429 () Unit!4535)

(assert (=> d!21528 (= lt!108429 (choose!9 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!107337)) lt!107350 (BitStream!2273 (buf!1706 (_2!3076 lt!107337)) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353)))))))

(assert (=> d!21528 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3076 lt!107353) (buf!1706 (_2!3076 lt!107337)) lt!107350) lt!108429)))

(declare-fun bs!5208 () Bool)

(assert (= bs!5208 d!21528))

(assert (=> bs!5208 m!107265))

(declare-fun m!108223 () Bool)

(assert (=> bs!5208 m!108223))

(assert (=> b!67330 d!21528))

(declare-fun b!67815 () Bool)

(declare-fun e!44381 () Bool)

(declare-fun lt!108432 () List!711)

(assert (=> b!67815 (= e!44381 (isEmpty!215 lt!108432))))

(declare-fun b!67814 () Bool)

(declare-fun lt!108431 () (_ BitVec 64))

(declare-fun e!44380 () tuple2!5958)

(declare-fun lt!108430 () tuple2!5960)

(assert (=> b!67814 (= e!44380 (tuple2!5959 (Cons!707 (_1!3091 lt!108430) (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_2!3091 lt!108430) (bvsub lt!107350 lt!108431))) (_2!3091 lt!108430)))))

(assert (=> b!67814 (= lt!108430 (readBit!0 (_1!3075 lt!107343)))))

(assert (=> b!67814 (= lt!108431 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67816 () Bool)

(assert (=> b!67816 (= e!44381 (> (length!339 lt!108432) 0))))

(declare-fun b!67813 () Bool)

(assert (=> b!67813 (= e!44380 (tuple2!5959 Nil!708 (_1!3075 lt!107343)))))

(declare-fun d!21530 () Bool)

(assert (=> d!21530 e!44381))

(declare-fun c!4986 () Bool)

(assert (=> d!21530 (= c!4986 (= lt!107350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21530 (= lt!108432 (_1!3090 e!44380))))

(declare-fun c!4985 () Bool)

(assert (=> d!21530 (= c!4985 (= lt!107350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21530 (bvsge lt!107350 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21530 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_1!3075 lt!107343) lt!107350) lt!108432)))

(assert (= (and d!21530 c!4985) b!67813))

(assert (= (and d!21530 (not c!4985)) b!67814))

(assert (= (and d!21530 c!4986) b!67815))

(assert (= (and d!21530 (not c!4986)) b!67816))

(declare-fun m!108225 () Bool)

(assert (=> b!67815 m!108225))

(declare-fun m!108227 () Bool)

(assert (=> b!67814 m!108227))

(declare-fun m!108229 () Bool)

(assert (=> b!67814 m!108229))

(declare-fun m!108231 () Bool)

(assert (=> b!67816 m!108231))

(assert (=> b!67330 d!21530))

(declare-fun d!21532 () Bool)

(assert (=> d!21532 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!107350) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353)))) lt!107350))))

(declare-fun bs!5209 () Bool)

(assert (= bs!5209 d!21532))

(declare-fun m!108233 () Bool)

(assert (=> bs!5209 m!108233))

(assert (=> b!67330 d!21532))

(declare-fun d!21534 () Bool)

(assert (=> d!21534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5210 () Bool)

(assert (= bs!5210 d!21534))

(declare-fun m!108235 () Bool)

(assert (=> bs!5210 m!108235))

(assert (=> b!67330 d!21534))

(declare-fun d!21536 () Bool)

(assert (=> d!21536 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107337)))) ((_ sign_extend 32) (currentByte!3390 thiss!1379)) ((_ sign_extend 32) (currentBit!3385 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!108433 () Unit!4535)

(assert (=> d!21536 (= lt!108433 (choose!9 thiss!1379 (buf!1706 (_2!3076 lt!107337)) (bvsub to!314 i!635) (BitStream!2273 (buf!1706 (_2!3076 lt!107337)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(assert (=> d!21536 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1706 (_2!3076 lt!107337)) (bvsub to!314 i!635)) lt!108433)))

(declare-fun bs!5211 () Bool)

(assert (= bs!5211 d!21536))

(assert (=> bs!5211 m!107263))

(declare-fun m!108237 () Bool)

(assert (=> bs!5211 m!108237))

(assert (=> b!67330 d!21536))

(declare-fun d!21538 () Bool)

(assert (=> d!21538 (= (invariant!0 (currentBit!3385 (_2!3076 lt!107353)) (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107337)))) (and (bvsge (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (bvslt (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000001000) (bvsge (currentByte!3390 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107337)))) (and (= (currentBit!3385 (_2!3076 lt!107353)) #b00000000000000000000000000000000) (= (currentByte!3390 (_2!3076 lt!107353)) (size!1325 (buf!1706 (_2!3076 lt!107337))))))))))

(assert (=> b!67336 d!21538))

(declare-fun d!21540 () Bool)

(declare-fun res!56093 () Bool)

(declare-fun e!44383 () Bool)

(assert (=> d!21540 (=> (not res!56093) (not e!44383))))

(assert (=> d!21540 (= res!56093 (= (size!1325 (buf!1706 thiss!1379)) (size!1325 (buf!1706 (_2!3076 lt!107353)))))))

(assert (=> d!21540 (= (isPrefixOf!0 thiss!1379 (_2!3076 lt!107353)) e!44383)))

(declare-fun b!67817 () Bool)

(declare-fun res!56095 () Bool)

(assert (=> b!67817 (=> (not res!56095) (not e!44383))))

(assert (=> b!67817 (= res!56095 (bvsle (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)) (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!107353))) (currentByte!3390 (_2!3076 lt!107353)) (currentBit!3385 (_2!3076 lt!107353)))))))

(declare-fun b!67818 () Bool)

(declare-fun e!44382 () Bool)

(assert (=> b!67818 (= e!44383 e!44382)))

(declare-fun res!56094 () Bool)

(assert (=> b!67818 (=> res!56094 e!44382)))

(assert (=> b!67818 (= res!56094 (= (size!1325 (buf!1706 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67819 () Bool)

(assert (=> b!67819 (= e!44382 (arrayBitRangesEq!0 (buf!1706 thiss!1379) (buf!1706 (_2!3076 lt!107353)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379))))))

(assert (= (and d!21540 res!56093) b!67817))

(assert (= (and b!67817 res!56095) b!67818))

(assert (= (and b!67818 (not res!56094)) b!67819))

(assert (=> b!67817 m!107243))

(assert (=> b!67817 m!107277))

(assert (=> b!67819 m!107243))

(assert (=> b!67819 m!107243))

(declare-fun m!108239 () Bool)

(assert (=> b!67819 m!108239))

(assert (=> b!67326 d!21540))

(declare-fun d!21542 () Bool)

(assert (=> d!21542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) lt!107350) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353)))) lt!107350))))

(declare-fun bs!5212 () Bool)

(assert (= bs!5212 d!21542))

(assert (=> bs!5212 m!107573))

(assert (=> b!67326 d!21542))

(declare-fun d!21544 () Bool)

(declare-fun e!44390 () Bool)

(assert (=> d!21544 e!44390))

(declare-fun res!56103 () Bool)

(assert (=> d!21544 (=> (not res!56103) (not e!44390))))

(assert (=> d!21544 (= res!56103 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!108448 () Unit!4535)

(declare-fun choose!27 (BitStream!2272 BitStream!2272 (_ BitVec 64) (_ BitVec 64)) Unit!4535)

(assert (=> d!21544 (= lt!108448 (choose!27 thiss!1379 (_2!3076 lt!107353) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21544 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21544 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3076 lt!107353) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108448)))

(declare-fun b!67827 () Bool)

(assert (=> b!67827 (= e!44390 (validate_offset_bits!1 ((_ sign_extend 32) (size!1325 (buf!1706 (_2!3076 lt!107353)))) ((_ sign_extend 32) (currentByte!3390 (_2!3076 lt!107353))) ((_ sign_extend 32) (currentBit!3385 (_2!3076 lt!107353))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21544 res!56103) b!67827))

(declare-fun m!108247 () Bool)

(assert (=> d!21544 m!108247))

(declare-fun m!108249 () Bool)

(assert (=> b!67827 m!108249))

(assert (=> b!67326 d!21544))

(declare-fun b!67845 () Bool)

(declare-fun e!44400 () Bool)

(declare-fun e!44399 () Bool)

(assert (=> b!67845 (= e!44400 e!44399)))

(declare-fun res!56120 () Bool)

(assert (=> b!67845 (=> (not res!56120) (not e!44399))))

(declare-datatypes ((tuple2!5962 0))(
  ( (tuple2!5963 (_1!3092 BitStream!2272) (_2!3092 Bool)) )
))
(declare-fun lt!108483 () tuple2!5962)

(declare-fun lt!108481 () Bool)

(declare-fun lt!108473 () tuple2!5930)

(assert (=> b!67845 (= res!56120 (and (= (_2!3092 lt!108483) lt!108481) (= (_1!3092 lt!108483) (_2!3076 lt!108473))))))

(declare-fun readBitPure!0 (BitStream!2272) tuple2!5962)

(declare-fun readerFrom!0 (BitStream!2272 (_ BitVec 32) (_ BitVec 32)) BitStream!2272)

(assert (=> b!67845 (= lt!108483 (readBitPure!0 (readerFrom!0 (_2!3076 lt!108473) (currentBit!3385 thiss!1379) (currentByte!3390 thiss!1379))))))

(declare-fun b!67846 () Bool)

(declare-fun res!56122 () Bool)

(assert (=> b!67846 (=> (not res!56122) (not e!44400))))

(assert (=> b!67846 (= res!56122 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108473))) (currentByte!3390 (_2!3076 lt!108473)) (currentBit!3385 (_2!3076 lt!108473))) (bvadd (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!67847 () Bool)

(assert (=> b!67847 (= e!44399 (= (bitIndex!0 (size!1325 (buf!1706 (_1!3092 lt!108483))) (currentByte!3390 (_1!3092 lt!108483)) (currentBit!3385 (_1!3092 lt!108483))) (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108473))) (currentByte!3390 (_2!3076 lt!108473)) (currentBit!3385 (_2!3076 lt!108473)))))))

(declare-fun d!21548 () Bool)

(declare-fun e!44401 () Bool)

(assert (=> d!21548 e!44401))

(declare-fun res!56125 () Bool)

(assert (=> d!21548 (=> (not res!56125) (not e!44401))))

(declare-fun lt!108480 () tuple2!5930)

(assert (=> d!21548 (= res!56125 (= (size!1325 (buf!1706 (_2!3076 lt!108480))) (size!1325 (buf!1706 thiss!1379))))))

(declare-fun lt!108479 () (_ BitVec 8))

(declare-fun lt!108476 () array!2866)

(assert (=> d!21548 (= lt!108479 (select (arr!1895 lt!108476) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21548 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1325 lt!108476)))))

(assert (=> d!21548 (= lt!108476 (array!2867 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!108478 () tuple2!5930)

(assert (=> d!21548 (= lt!108480 (tuple2!5931 (_1!3076 lt!108478) (_2!3076 lt!108478)))))

(assert (=> d!21548 (= lt!108478 lt!108473)))

(assert (=> d!21548 e!44400))

(declare-fun res!56123 () Bool)

(assert (=> d!21548 (=> (not res!56123) (not e!44400))))

(assert (=> d!21548 (= res!56123 (= (size!1325 (buf!1706 thiss!1379)) (size!1325 (buf!1706 (_2!3076 lt!108473)))))))

(declare-fun appendBit!0 (BitStream!2272 Bool) tuple2!5930)

(assert (=> d!21548 (= lt!108473 (appendBit!0 thiss!1379 lt!108481))))

(assert (=> d!21548 (= lt!108481 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21548 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21548 (= (appendBitFromByte!0 thiss!1379 (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!108480)))

(declare-fun b!67848 () Bool)

(declare-fun res!56127 () Bool)

(assert (=> b!67848 (=> (not res!56127) (not e!44400))))

(assert (=> b!67848 (= res!56127 (isPrefixOf!0 thiss!1379 (_2!3076 lt!108473)))))

(declare-fun b!67849 () Bool)

(declare-fun e!44402 () Bool)

(assert (=> b!67849 (= e!44401 e!44402)))

(declare-fun res!56121 () Bool)

(assert (=> b!67849 (=> (not res!56121) (not e!44402))))

(declare-fun lt!108475 () tuple2!5962)

(assert (=> b!67849 (= res!56121 (and (= (_2!3092 lt!108475) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!108479)) #b00000000000000000000000000000000))) (= (_1!3092 lt!108475) (_2!3076 lt!108480))))))

(declare-fun lt!108482 () tuple2!5956)

(declare-fun lt!108477 () BitStream!2272)

(assert (=> b!67849 (= lt!108482 (readBits!0 lt!108477 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67849 (= lt!108475 (readBitPure!0 lt!108477))))

(assert (=> b!67849 (= lt!108477 (readerFrom!0 (_2!3076 lt!108480) (currentBit!3385 thiss!1379) (currentByte!3390 thiss!1379)))))

(declare-fun b!67850 () Bool)

(declare-fun res!56126 () Bool)

(assert (=> b!67850 (=> (not res!56126) (not e!44401))))

(assert (=> b!67850 (= res!56126 (isPrefixOf!0 thiss!1379 (_2!3076 lt!108480)))))

(declare-fun b!67851 () Bool)

(assert (=> b!67851 (= e!44402 (= (bitIndex!0 (size!1325 (buf!1706 (_1!3092 lt!108475))) (currentByte!3390 (_1!3092 lt!108475)) (currentBit!3385 (_1!3092 lt!108475))) (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108480))) (currentByte!3390 (_2!3076 lt!108480)) (currentBit!3385 (_2!3076 lt!108480)))))))

(declare-fun b!67852 () Bool)

(declare-fun res!56124 () Bool)

(assert (=> b!67852 (=> (not res!56124) (not e!44401))))

(declare-fun lt!108474 () (_ BitVec 64))

(declare-fun lt!108484 () (_ BitVec 64))

(assert (=> b!67852 (= res!56124 (= (bitIndex!0 (size!1325 (buf!1706 (_2!3076 lt!108480))) (currentByte!3390 (_2!3076 lt!108480)) (currentBit!3385 (_2!3076 lt!108480))) (bvadd lt!108484 lt!108474)))))

(assert (=> b!67852 (or (not (= (bvand lt!108484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!108484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!108484 lt!108474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67852 (= lt!108474 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!67852 (= lt!108484 (bitIndex!0 (size!1325 (buf!1706 thiss!1379)) (currentByte!3390 thiss!1379) (currentBit!3385 thiss!1379)))))

(assert (= (and d!21548 res!56123) b!67846))

(assert (= (and b!67846 res!56122) b!67848))

(assert (= (and b!67848 res!56127) b!67845))

(assert (= (and b!67845 res!56120) b!67847))

(assert (= (and d!21548 res!56125) b!67852))

(assert (= (and b!67852 res!56124) b!67850))

(assert (= (and b!67850 res!56126) b!67849))

(assert (= (and b!67849 res!56121) b!67851))

(declare-fun m!108251 () Bool)

(assert (=> b!67850 m!108251))

(declare-fun m!108253 () Bool)

(assert (=> b!67846 m!108253))

(assert (=> b!67846 m!107243))

(declare-fun m!108255 () Bool)

(assert (=> d!21548 m!108255))

(declare-fun m!108257 () Bool)

(assert (=> d!21548 m!108257))

(declare-fun m!108259 () Bool)

(assert (=> d!21548 m!108259))

(declare-fun m!108261 () Bool)

(assert (=> b!67849 m!108261))

(declare-fun m!108263 () Bool)

(assert (=> b!67849 m!108263))

(declare-fun m!108265 () Bool)

(assert (=> b!67849 m!108265))

(declare-fun m!108267 () Bool)

(assert (=> b!67851 m!108267))

(declare-fun m!108269 () Bool)

(assert (=> b!67851 m!108269))

(declare-fun m!108271 () Bool)

(assert (=> b!67845 m!108271))

(assert (=> b!67845 m!108271))

(declare-fun m!108273 () Bool)

(assert (=> b!67845 m!108273))

(declare-fun m!108275 () Bool)

(assert (=> b!67848 m!108275))

(assert (=> b!67852 m!108269))

(assert (=> b!67852 m!107243))

(declare-fun m!108277 () Bool)

(assert (=> b!67847 m!108277))

(assert (=> b!67847 m!108253))

(assert (=> b!67326 d!21548))

(declare-fun d!21550 () Bool)

(assert (=> d!21550 (= (head!530 (byteArrayBitContentToList!0 (_2!3076 lt!107353) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!826 (byteArrayBitContentToList!0 (_2!3076 lt!107353) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67337 d!21550))

(declare-fun d!21552 () Bool)

(declare-fun c!4989 () Bool)

(assert (=> d!21552 (= c!4989 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44405 () List!711)

(assert (=> d!21552 (= (byteArrayBitContentToList!0 (_2!3076 lt!107353) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44405)))

(declare-fun b!67857 () Bool)

(assert (=> b!67857 (= e!44405 Nil!708)))

(declare-fun b!67858 () Bool)

(assert (=> b!67858 (= e!44405 (Cons!707 (not (= (bvand ((_ sign_extend 24) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3076 lt!107353) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21552 c!4989) b!67857))

(assert (= (and d!21552 (not c!4989)) b!67858))

(assert (=> b!67858 m!107267))

(assert (=> b!67858 m!108259))

(declare-fun m!108279 () Bool)

(assert (=> b!67858 m!108279))

(assert (=> b!67337 d!21552))

(declare-fun d!21554 () Bool)

(assert (=> d!21554 (= (head!530 (bitStreamReadBitsIntoList!0 (_2!3076 lt!107353) (_1!3075 lt!107352) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!826 (bitStreamReadBitsIntoList!0 (_2!3076 lt!107353) (_1!3075 lt!107352) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67337 d!21554))

(declare-fun b!67861 () Bool)

(declare-fun e!44407 () Bool)

(declare-fun lt!108487 () List!711)

(assert (=> b!67861 (= e!44407 (isEmpty!215 lt!108487))))

(declare-fun lt!108485 () tuple2!5960)

(declare-fun lt!108486 () (_ BitVec 64))

(declare-fun e!44406 () tuple2!5958)

(declare-fun b!67860 () Bool)

(assert (=> b!67860 (= e!44406 (tuple2!5959 (Cons!707 (_1!3091 lt!108485) (bitStreamReadBitsIntoList!0 (_2!3076 lt!107353) (_2!3091 lt!108485) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!108486))) (_2!3091 lt!108485)))))

(assert (=> b!67860 (= lt!108485 (readBit!0 (_1!3075 lt!107352)))))

(assert (=> b!67860 (= lt!108486 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67862 () Bool)

(assert (=> b!67862 (= e!44407 (> (length!339 lt!108487) 0))))

(declare-fun b!67859 () Bool)

(assert (=> b!67859 (= e!44406 (tuple2!5959 Nil!708 (_1!3075 lt!107352)))))

(declare-fun d!21556 () Bool)

(assert (=> d!21556 e!44407))

(declare-fun c!4991 () Bool)

(assert (=> d!21556 (= c!4991 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21556 (= lt!108487 (_1!3090 e!44406))))

(declare-fun c!4990 () Bool)

(assert (=> d!21556 (= c!4990 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21556 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21556 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!107353) (_1!3075 lt!107352) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108487)))

(assert (= (and d!21556 c!4990) b!67859))

(assert (= (and d!21556 (not c!4990)) b!67860))

(assert (= (and d!21556 c!4991) b!67861))

(assert (= (and d!21556 (not c!4991)) b!67862))

(declare-fun m!108281 () Bool)

(assert (=> b!67861 m!108281))

(declare-fun m!108283 () Bool)

(assert (=> b!67860 m!108283))

(declare-fun m!108285 () Bool)

(assert (=> b!67860 m!108285))

(declare-fun m!108287 () Bool)

(assert (=> b!67862 m!108287))

(assert (=> b!67337 d!21556))

(declare-fun d!21558 () Bool)

(assert (=> d!21558 (= (head!530 (byteArrayBitContentToList!0 (_2!3076 lt!107337) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!826 (byteArrayBitContentToList!0 (_2!3076 lt!107337) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!67327 d!21558))

(declare-fun d!21560 () Bool)

(declare-fun c!4992 () Bool)

(assert (=> d!21560 (= c!4992 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44408 () List!711)

(assert (=> d!21560 (= (byteArrayBitContentToList!0 (_2!3076 lt!107337) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44408)))

(declare-fun b!67863 () Bool)

(assert (=> b!67863 (= e!44408 Nil!708)))

(declare-fun b!67864 () Bool)

(assert (=> b!67864 (= e!44408 (Cons!707 (not (= (bvand ((_ sign_extend 24) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3076 lt!107337) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21560 c!4992) b!67863))

(assert (= (and d!21560 (not c!4992)) b!67864))

(assert (=> b!67864 m!107267))

(assert (=> b!67864 m!108259))

(declare-fun m!108289 () Bool)

(assert (=> b!67864 m!108289))

(assert (=> b!67327 d!21560))

(declare-fun d!21562 () Bool)

(assert (=> d!21562 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1895 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5213 () Bool)

(assert (= bs!5213 d!21562))

(assert (=> bs!5213 m!107267))

(assert (=> bs!5213 m!108259))

(assert (=> b!67327 d!21562))

(declare-fun d!21564 () Bool)

(assert (=> d!21564 (= (tail!315 lt!107351) (t!1461 lt!107351))))

(assert (=> b!67338 d!21564))

(declare-fun d!21566 () Bool)

(declare-fun e!44411 () Bool)

(assert (=> d!21566 e!44411))

(declare-fun res!56130 () Bool)

(assert (=> d!21566 (=> (not res!56130) (not e!44411))))

(declare-fun lt!108493 () (_ BitVec 64))

(assert (=> d!21566 (= res!56130 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!108493) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21566 (= lt!108493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!108492 () Unit!4535)

(declare-fun choose!42 (BitStream!2272 BitStream!2272 BitStream!2272 BitStream!2272 (_ BitVec 64) List!711) Unit!4535)

(assert (=> d!21566 (= lt!108492 (choose!42 (_2!3076 lt!107337) (_2!3076 lt!107337) (_1!3075 lt!107347) (_1!3075 lt!107343) (bvsub to!314 i!635) lt!107351))))

(assert (=> d!21566 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21566 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3076 lt!107337) (_2!3076 lt!107337) (_1!3075 lt!107347) (_1!3075 lt!107343) (bvsub to!314 i!635) lt!107351) lt!108492)))

(declare-fun b!67867 () Bool)

(assert (=> b!67867 (= e!44411 (= (bitStreamReadBitsIntoList!0 (_2!3076 lt!107337) (_1!3075 lt!107343) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!315 lt!107351)))))

(assert (= (and d!21566 res!56130) b!67867))

(declare-fun m!108291 () Bool)

(assert (=> d!21566 m!108291))

(declare-fun m!108293 () Bool)

(assert (=> b!67867 m!108293))

(assert (=> b!67867 m!107223))

(assert (=> b!67338 d!21566))

(push 1)

(assert (not d!21484))

(assert (not b!67817))

(assert (not d!21566))

(assert (not b!67735))

(assert (not d!21502))

(assert (not b!67819))

(assert (not d!21542))

(assert (not d!21492))

(assert (not b!67803))

(assert (not b!67802))

(assert (not d!21478))

(assert (not d!21486))

(assert (not b!67845))

(assert (not d!21400))

(assert (not b!67847))

(assert (not b!67738))

(assert (not b!67801))

(assert (not b!67810))

(assert (not d!21526))

(assert (not d!21368))

(assert (not b!67860))

(assert (not b!67808))

(assert (not b!67746))

(assert (not b!67744))

(assert (not b!67827))

(assert (not b!67867))

(assert (not b!67814))

(assert (not b!67733))

(assert (not d!21532))

(assert (not d!21544))

(assert (not b!67848))

(assert (not b!67858))

(assert (not b!67816))

(assert (not b!67800))

(assert (not d!21520))

(assert (not b!67764))

(assert (not b!67846))

(assert (not d!21398))

(assert (not b!67765))

(assert (not b!67815))

(assert (not b!67811))

(assert (not d!21528))

(assert (not b!67743))

(assert (not b!67805))

(assert (not b!67734))

(assert (not b!67864))

(assert (not b!67806))

(assert (not b!67804))

(assert (not b!67862))

(assert (not b!67568))

(assert (not d!21394))

(assert (not b!67736))

(assert (not b!67741))

(assert (not d!21536))

(assert (not b!67861))

(assert (not b!67849))

(assert (not b!67737))

(assert (not b!67809))

(assert (not b!67851))

(assert (not b!67850))

(assert (not d!21506))

(assert (not b!67852))

(assert (not b!67566))

(assert (not d!21548))

(assert (not d!21494))

(assert (not d!21534))

(assert (not b!67766))

(assert (not b!67763))

(assert (not d!21488))

(assert (not bm!865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

