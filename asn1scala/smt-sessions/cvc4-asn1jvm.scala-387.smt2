; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10008 () Bool)

(assert start!10008)

(declare-fun b!50398 () Bool)

(declare-fun res!42175 () Bool)

(declare-fun e!33279 () Bool)

(assert (=> b!50398 (=> res!42175 e!33279)))

(declare-datatypes ((List!557 0))(
  ( (Nil!554) (Cons!553 (h!672 Bool) (t!1307 List!557)) )
))
(declare-fun lt!78189 () List!557)

(declare-fun length!252 (List!557) Int)

(assert (=> b!50398 (= res!42175 (<= (length!252 lt!78189) 0))))

(declare-fun res!42173 () Bool)

(declare-fun e!33276 () Bool)

(assert (=> start!10008 (=> (not res!42173) (not e!33276))))

(declare-datatypes ((array!2330 0))(
  ( (array!2331 (arr!1588 (Array (_ BitVec 32) (_ BitVec 8))) (size!1059 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2330)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10008 (= res!42173 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1059 srcBuffer!2))))))))

(assert (=> start!10008 e!33276))

(assert (=> start!10008 true))

(declare-fun array_inv!969 (array!2330) Bool)

(assert (=> start!10008 (array_inv!969 srcBuffer!2)))

(declare-datatypes ((BitStream!1832 0))(
  ( (BitStream!1833 (buf!1414 array!2330) (currentByte!2937 (_ BitVec 32)) (currentBit!2932 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1832)

(declare-fun e!33278 () Bool)

(declare-fun inv!12 (BitStream!1832) Bool)

(assert (=> start!10008 (and (inv!12 thiss!1379) e!33278)))

(declare-fun b!50399 () Bool)

(declare-fun e!33277 () Bool)

(declare-fun e!33281 () Bool)

(assert (=> b!50399 (= e!33277 e!33281)))

(declare-fun res!42177 () Bool)

(assert (=> b!50399 (=> res!42177 e!33281)))

(declare-datatypes ((Unit!3493 0))(
  ( (Unit!3494) )
))
(declare-datatypes ((tuple2!4652 0))(
  ( (tuple2!4653 (_1!2431 Unit!3493) (_2!2431 BitStream!1832)) )
))
(declare-fun lt!78205 () tuple2!4652)

(declare-fun lt!78199 () tuple2!4652)

(assert (=> b!50399 (= res!42177 (not (= (size!1059 (buf!1414 (_2!2431 lt!78205))) (size!1059 (buf!1414 (_2!2431 lt!78199))))))))

(declare-fun e!33285 () Bool)

(assert (=> b!50399 e!33285))

(declare-fun res!42183 () Bool)

(assert (=> b!50399 (=> (not res!42183) (not e!33285))))

(assert (=> b!50399 (= res!42183 (= (size!1059 (buf!1414 (_2!2431 lt!78199))) (size!1059 (buf!1414 thiss!1379))))))

(declare-fun b!50400 () Bool)

(declare-fun res!42186 () Bool)

(assert (=> b!50400 (=> (not res!42186) (not e!33276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50400 (= res!42186 (validate_offset_bits!1 ((_ sign_extend 32) (size!1059 (buf!1414 thiss!1379))) ((_ sign_extend 32) (currentByte!2937 thiss!1379)) ((_ sign_extend 32) (currentBit!2932 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50401 () Bool)

(assert (=> b!50401 (= e!33281 e!33279)))

(declare-fun res!42182 () Bool)

(assert (=> b!50401 (=> res!42182 e!33279)))

(assert (=> b!50401 (= res!42182 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78192 () (_ BitVec 64))

(declare-datatypes ((tuple2!4654 0))(
  ( (tuple2!4655 (_1!2432 BitStream!1832) (_2!2432 BitStream!1832)) )
))
(declare-fun lt!78202 () tuple2!4654)

(declare-fun lt!78191 () List!557)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1832 BitStream!1832 (_ BitVec 64)) List!557)

(assert (=> b!50401 (= lt!78191 (bitStreamReadBitsIntoList!0 (_2!2431 lt!78199) (_1!2432 lt!78202) lt!78192))))

(declare-fun lt!78193 () tuple2!4654)

(assert (=> b!50401 (= lt!78189 (bitStreamReadBitsIntoList!0 (_2!2431 lt!78199) (_1!2432 lt!78193) (bvsub to!314 i!635)))))

(assert (=> b!50401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1059 (buf!1414 (_2!2431 lt!78199)))) ((_ sign_extend 32) (currentByte!2937 (_2!2431 lt!78205))) ((_ sign_extend 32) (currentBit!2932 (_2!2431 lt!78205))) lt!78192)))

(declare-fun lt!78196 () Unit!3493)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1832 array!2330 (_ BitVec 64)) Unit!3493)

(assert (=> b!50401 (= lt!78196 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2431 lt!78205) (buf!1414 (_2!2431 lt!78199)) lt!78192))))

(declare-fun reader!0 (BitStream!1832 BitStream!1832) tuple2!4654)

(assert (=> b!50401 (= lt!78202 (reader!0 (_2!2431 lt!78205) (_2!2431 lt!78199)))))

(assert (=> b!50401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1059 (buf!1414 (_2!2431 lt!78199)))) ((_ sign_extend 32) (currentByte!2937 thiss!1379)) ((_ sign_extend 32) (currentBit!2932 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78198 () Unit!3493)

(assert (=> b!50401 (= lt!78198 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1414 (_2!2431 lt!78199)) (bvsub to!314 i!635)))))

(assert (=> b!50401 (= lt!78193 (reader!0 thiss!1379 (_2!2431 lt!78199)))))

(declare-fun b!50402 () Bool)

(declare-fun res!42180 () Bool)

(assert (=> b!50402 (=> res!42180 e!33281)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50402 (= res!42180 (not (invariant!0 (currentBit!2932 (_2!2431 lt!78205)) (currentByte!2937 (_2!2431 lt!78205)) (size!1059 (buf!1414 (_2!2431 lt!78199))))))))

(declare-fun b!50403 () Bool)

(declare-fun e!33283 () Bool)

(declare-fun e!33280 () Bool)

(assert (=> b!50403 (= e!33283 e!33280)))

(declare-fun res!42178 () Bool)

(assert (=> b!50403 (=> res!42178 e!33280)))

(declare-fun isPrefixOf!0 (BitStream!1832 BitStream!1832) Bool)

(assert (=> b!50403 (= res!42178 (not (isPrefixOf!0 thiss!1379 (_2!2431 lt!78205))))))

(assert (=> b!50403 (validate_offset_bits!1 ((_ sign_extend 32) (size!1059 (buf!1414 (_2!2431 lt!78205)))) ((_ sign_extend 32) (currentByte!2937 (_2!2431 lt!78205))) ((_ sign_extend 32) (currentBit!2932 (_2!2431 lt!78205))) lt!78192)))

(assert (=> b!50403 (= lt!78192 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78201 () Unit!3493)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1832 BitStream!1832 (_ BitVec 64) (_ BitVec 64)) Unit!3493)

(assert (=> b!50403 (= lt!78201 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2431 lt!78205) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1832 (_ BitVec 8) (_ BitVec 32)) tuple2!4652)

(assert (=> b!50403 (= lt!78205 (appendBitFromByte!0 thiss!1379 (select (arr!1588 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50404 () Bool)

(declare-fun lt!78190 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50404 (= e!33285 (= lt!78190 (bvsub (bvsub (bvadd (bitIndex!0 (size!1059 (buf!1414 (_2!2431 lt!78205))) (currentByte!2937 (_2!2431 lt!78205)) (currentBit!2932 (_2!2431 lt!78205))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!50405 () Bool)

(declare-fun e!33282 () Bool)

(assert (=> b!50405 (= e!33280 e!33282)))

(declare-fun res!42172 () Bool)

(assert (=> b!50405 (=> res!42172 e!33282)))

(assert (=> b!50405 (= res!42172 (not (isPrefixOf!0 (_2!2431 lt!78205) (_2!2431 lt!78199))))))

(assert (=> b!50405 (isPrefixOf!0 thiss!1379 (_2!2431 lt!78199))))

(declare-fun lt!78197 () Unit!3493)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1832 BitStream!1832 BitStream!1832) Unit!3493)

(assert (=> b!50405 (= lt!78197 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2431 lt!78205) (_2!2431 lt!78199)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1832 array!2330 (_ BitVec 64) (_ BitVec 64)) tuple2!4652)

(assert (=> b!50405 (= lt!78199 (appendBitsMSBFirstLoop!0 (_2!2431 lt!78205) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33284 () Bool)

(assert (=> b!50405 e!33284))

(declare-fun res!42174 () Bool)

(assert (=> b!50405 (=> (not res!42174) (not e!33284))))

(assert (=> b!50405 (= res!42174 (validate_offset_bits!1 ((_ sign_extend 32) (size!1059 (buf!1414 (_2!2431 lt!78205)))) ((_ sign_extend 32) (currentByte!2937 thiss!1379)) ((_ sign_extend 32) (currentBit!2932 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78195 () Unit!3493)

(assert (=> b!50405 (= lt!78195 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1414 (_2!2431 lt!78205)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78203 () tuple2!4654)

(assert (=> b!50405 (= lt!78203 (reader!0 thiss!1379 (_2!2431 lt!78205)))))

(declare-fun b!50406 () Bool)

(assert (=> b!50406 (= e!33282 e!33277)))

(declare-fun res!42179 () Bool)

(assert (=> b!50406 (=> res!42179 e!33277)))

(declare-fun lt!78204 () (_ BitVec 64))

(assert (=> b!50406 (= res!42179 (not (= lt!78190 (bvsub (bvadd lt!78204 to!314) i!635))))))

(assert (=> b!50406 (= lt!78190 (bitIndex!0 (size!1059 (buf!1414 (_2!2431 lt!78199))) (currentByte!2937 (_2!2431 lt!78199)) (currentBit!2932 (_2!2431 lt!78199))))))

(declare-fun b!50407 () Bool)

(assert (=> b!50407 (= e!33279 true)))

(declare-fun tail!243 (List!557) List!557)

(assert (=> b!50407 (= lt!78191 (tail!243 lt!78189))))

(declare-fun lt!78200 () Unit!3493)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1832 BitStream!1832 BitStream!1832 BitStream!1832 (_ BitVec 64) List!557) Unit!3493)

(assert (=> b!50407 (= lt!78200 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2431 lt!78199) (_2!2431 lt!78199) (_1!2432 lt!78193) (_1!2432 lt!78202) (bvsub to!314 i!635) lt!78189))))

(declare-fun b!50408 () Bool)

(declare-fun res!42181 () Bool)

(assert (=> b!50408 (=> res!42181 e!33277)))

(assert (=> b!50408 (= res!42181 (not (invariant!0 (currentBit!2932 (_2!2431 lt!78199)) (currentByte!2937 (_2!2431 lt!78199)) (size!1059 (buf!1414 (_2!2431 lt!78199))))))))

(declare-fun b!50409 () Bool)

(declare-fun res!42176 () Bool)

(assert (=> b!50409 (=> res!42176 e!33281)))

(assert (=> b!50409 (= res!42176 (not (invariant!0 (currentBit!2932 (_2!2431 lt!78205)) (currentByte!2937 (_2!2431 lt!78205)) (size!1059 (buf!1414 (_2!2431 lt!78205))))))))

(declare-fun b!50410 () Bool)

(declare-fun head!376 (List!557) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1832 array!2330 (_ BitVec 64) (_ BitVec 64)) List!557)

(assert (=> b!50410 (= e!33284 (= (head!376 (byteArrayBitContentToList!0 (_2!2431 lt!78205) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!376 (bitStreamReadBitsIntoList!0 (_2!2431 lt!78205) (_1!2432 lt!78203) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50411 () Bool)

(assert (=> b!50411 (= e!33278 (array_inv!969 (buf!1414 thiss!1379)))))

(declare-fun b!50412 () Bool)

(assert (=> b!50412 (= e!33276 (not e!33283))))

(declare-fun res!42184 () Bool)

(assert (=> b!50412 (=> res!42184 e!33283)))

(assert (=> b!50412 (= res!42184 (bvsge i!635 to!314))))

(assert (=> b!50412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78194 () Unit!3493)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1832) Unit!3493)

(assert (=> b!50412 (= lt!78194 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50412 (= lt!78204 (bitIndex!0 (size!1059 (buf!1414 thiss!1379)) (currentByte!2937 thiss!1379) (currentBit!2932 thiss!1379)))))

(declare-fun b!50413 () Bool)

(declare-fun res!42185 () Bool)

(assert (=> b!50413 (=> res!42185 e!33277)))

(assert (=> b!50413 (= res!42185 (not (= (size!1059 (buf!1414 thiss!1379)) (size!1059 (buf!1414 (_2!2431 lt!78199))))))))

(assert (= (and start!10008 res!42173) b!50400))

(assert (= (and b!50400 res!42186) b!50412))

(assert (= (and b!50412 (not res!42184)) b!50403))

(assert (= (and b!50403 (not res!42178)) b!50405))

(assert (= (and b!50405 res!42174) b!50410))

(assert (= (and b!50405 (not res!42172)) b!50406))

(assert (= (and b!50406 (not res!42179)) b!50408))

(assert (= (and b!50408 (not res!42181)) b!50413))

(assert (= (and b!50413 (not res!42185)) b!50399))

(assert (= (and b!50399 res!42183) b!50404))

(assert (= (and b!50399 (not res!42177)) b!50409))

(assert (= (and b!50409 (not res!42176)) b!50402))

(assert (= (and b!50402 (not res!42180)) b!50401))

(assert (= (and b!50401 (not res!42182)) b!50398))

(assert (= (and b!50398 (not res!42175)) b!50407))

(assert (= start!10008 b!50411))

(declare-fun m!79293 () Bool)

(assert (=> b!50398 m!79293))

(declare-fun m!79295 () Bool)

(assert (=> b!50407 m!79295))

(declare-fun m!79297 () Bool)

(assert (=> b!50407 m!79297))

(declare-fun m!79299 () Bool)

(assert (=> b!50406 m!79299))

(declare-fun m!79301 () Bool)

(assert (=> b!50412 m!79301))

(declare-fun m!79303 () Bool)

(assert (=> b!50412 m!79303))

(declare-fun m!79305 () Bool)

(assert (=> b!50412 m!79305))

(declare-fun m!79307 () Bool)

(assert (=> b!50402 m!79307))

(declare-fun m!79309 () Bool)

(assert (=> b!50411 m!79309))

(declare-fun m!79311 () Bool)

(assert (=> b!50408 m!79311))

(declare-fun m!79313 () Bool)

(assert (=> start!10008 m!79313))

(declare-fun m!79315 () Bool)

(assert (=> start!10008 m!79315))

(declare-fun m!79317 () Bool)

(assert (=> b!50409 m!79317))

(declare-fun m!79319 () Bool)

(assert (=> b!50401 m!79319))

(declare-fun m!79321 () Bool)

(assert (=> b!50401 m!79321))

(declare-fun m!79323 () Bool)

(assert (=> b!50401 m!79323))

(declare-fun m!79325 () Bool)

(assert (=> b!50401 m!79325))

(declare-fun m!79327 () Bool)

(assert (=> b!50401 m!79327))

(declare-fun m!79329 () Bool)

(assert (=> b!50401 m!79329))

(declare-fun m!79331 () Bool)

(assert (=> b!50401 m!79331))

(declare-fun m!79333 () Bool)

(assert (=> b!50401 m!79333))

(declare-fun m!79335 () Bool)

(assert (=> b!50405 m!79335))

(declare-fun m!79337 () Bool)

(assert (=> b!50405 m!79337))

(declare-fun m!79339 () Bool)

(assert (=> b!50405 m!79339))

(declare-fun m!79341 () Bool)

(assert (=> b!50405 m!79341))

(declare-fun m!79343 () Bool)

(assert (=> b!50405 m!79343))

(declare-fun m!79345 () Bool)

(assert (=> b!50405 m!79345))

(declare-fun m!79347 () Bool)

(assert (=> b!50405 m!79347))

(declare-fun m!79349 () Bool)

(assert (=> b!50404 m!79349))

(declare-fun m!79351 () Bool)

(assert (=> b!50410 m!79351))

(assert (=> b!50410 m!79351))

(declare-fun m!79353 () Bool)

(assert (=> b!50410 m!79353))

(declare-fun m!79355 () Bool)

(assert (=> b!50410 m!79355))

(assert (=> b!50410 m!79355))

(declare-fun m!79357 () Bool)

(assert (=> b!50410 m!79357))

(declare-fun m!79359 () Bool)

(assert (=> b!50403 m!79359))

(declare-fun m!79361 () Bool)

(assert (=> b!50403 m!79361))

(declare-fun m!79363 () Bool)

(assert (=> b!50403 m!79363))

(declare-fun m!79365 () Bool)

(assert (=> b!50403 m!79365))

(declare-fun m!79367 () Bool)

(assert (=> b!50403 m!79367))

(assert (=> b!50403 m!79363))

(declare-fun m!79369 () Bool)

(assert (=> b!50400 m!79369))

(push 1)

(assert (not b!50405))

(assert (not b!50403))

(assert (not b!50402))

(assert (not b!50412))

(assert (not b!50401))

(assert (not b!50398))

(assert (not b!50410))

(assert (not b!50411))

(assert (not b!50408))

(assert (not b!50407))

(assert (not b!50406))

(assert (not start!10008))

(assert (not b!50400))

(assert (not b!50409))

(assert (not b!50404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

