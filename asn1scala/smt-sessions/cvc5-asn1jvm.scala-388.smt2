; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10010 () Bool)

(assert start!10010)

(declare-fun b!50455 () Bool)

(declare-fun res!42243 () Bool)

(declare-fun e!33320 () Bool)

(assert (=> b!50455 (=> res!42243 e!33320)))

(declare-datatypes ((List!558 0))(
  ( (Nil!555) (Cons!554 (h!673 Bool) (t!1308 List!558)) )
))
(declare-fun lt!78273 () List!558)

(declare-fun length!253 (List!558) Int)

(assert (=> b!50455 (= res!42243 (<= (length!253 lt!78273) 0))))

(declare-fun b!50456 () Bool)

(declare-fun e!33318 () Bool)

(declare-fun e!33325 () Bool)

(assert (=> b!50456 (= e!33318 e!33325)))

(declare-fun res!42237 () Bool)

(assert (=> b!50456 (=> res!42237 e!33325)))

(declare-datatypes ((array!2332 0))(
  ( (array!2333 (arr!1589 (Array (_ BitVec 32) (_ BitVec 8))) (size!1060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1834 0))(
  ( (BitStream!1835 (buf!1415 array!2332) (currentByte!2938 (_ BitVec 32)) (currentBit!2933 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3495 0))(
  ( (Unit!3496) )
))
(declare-datatypes ((tuple2!4656 0))(
  ( (tuple2!4657 (_1!2433 Unit!3495) (_2!2433 BitStream!1834)) )
))
(declare-fun lt!78255 () tuple2!4656)

(declare-fun lt!78272 () tuple2!4656)

(declare-fun isPrefixOf!0 (BitStream!1834 BitStream!1834) Bool)

(assert (=> b!50456 (= res!42237 (not (isPrefixOf!0 (_2!2433 lt!78255) (_2!2433 lt!78272))))))

(declare-fun thiss!1379 () BitStream!1834)

(assert (=> b!50456 (isPrefixOf!0 thiss!1379 (_2!2433 lt!78272))))

(declare-fun lt!78269 () Unit!3495)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1834 BitStream!1834 BitStream!1834) Unit!3495)

(assert (=> b!50456 (= lt!78269 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2433 lt!78255) (_2!2433 lt!78272)))))

(declare-fun srcBuffer!2 () array!2332)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1834 array!2332 (_ BitVec 64) (_ BitVec 64)) tuple2!4656)

(assert (=> b!50456 (= lt!78272 (appendBitsMSBFirstLoop!0 (_2!2433 lt!78255) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33328 () Bool)

(assert (=> b!50456 e!33328))

(declare-fun res!42226 () Bool)

(assert (=> b!50456 (=> (not res!42226) (not e!33328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50456 (= res!42226 (validate_offset_bits!1 ((_ sign_extend 32) (size!1060 (buf!1415 (_2!2433 lt!78255)))) ((_ sign_extend 32) (currentByte!2938 thiss!1379)) ((_ sign_extend 32) (currentBit!2933 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78261 () Unit!3495)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1834 array!2332 (_ BitVec 64)) Unit!3495)

(assert (=> b!50456 (= lt!78261 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1415 (_2!2433 lt!78255)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4658 0))(
  ( (tuple2!4659 (_1!2434 BitStream!1834) (_2!2434 BitStream!1834)) )
))
(declare-fun lt!78267 () tuple2!4658)

(declare-fun reader!0 (BitStream!1834 BitStream!1834) tuple2!4658)

(assert (=> b!50456 (= lt!78267 (reader!0 thiss!1379 (_2!2433 lt!78255)))))

(declare-fun b!50457 () Bool)

(declare-fun e!33329 () Bool)

(assert (=> b!50457 (= e!33320 e!33329)))

(declare-fun res!42230 () Bool)

(assert (=> b!50457 (=> res!42230 e!33329)))

(declare-fun lt!78270 () List!558)

(declare-fun lt!78254 () List!558)

(assert (=> b!50457 (= res!42230 (not (= lt!78270 lt!78254)))))

(assert (=> b!50457 (= lt!78254 lt!78270)))

(declare-fun tail!244 (List!558) List!558)

(assert (=> b!50457 (= lt!78270 (tail!244 lt!78273))))

(declare-fun lt!78263 () tuple2!4658)

(declare-fun lt!78266 () tuple2!4658)

(declare-fun lt!78265 () Unit!3495)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1834 BitStream!1834 BitStream!1834 BitStream!1834 (_ BitVec 64) List!558) Unit!3495)

(assert (=> b!50457 (= lt!78265 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2433 lt!78272) (_2!2433 lt!78272) (_1!2434 lt!78266) (_1!2434 lt!78263) (bvsub to!314 i!635) lt!78273))))

(declare-fun b!50458 () Bool)

(declare-fun res!42231 () Bool)

(declare-fun e!33331 () Bool)

(assert (=> b!50458 (=> res!42231 e!33331)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50458 (= res!42231 (not (invariant!0 (currentBit!2933 (_2!2433 lt!78255)) (currentByte!2938 (_2!2433 lt!78255)) (size!1060 (buf!1415 (_2!2433 lt!78272))))))))

(declare-fun b!50459 () Bool)

(declare-fun e!33321 () Bool)

(declare-fun e!33332 () Bool)

(assert (=> b!50459 (= e!33321 e!33332)))

(declare-fun res!42227 () Bool)

(assert (=> b!50459 (=> res!42227 e!33332)))

(declare-fun lt!78258 () Bool)

(declare-fun lt!78264 () Bool)

(assert (=> b!50459 (= res!42227 (not (= lt!78258 lt!78264)))))

(declare-fun lt!78253 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2332 (_ BitVec 64)) Bool)

(assert (=> b!50459 (= lt!78258 (bitAt!0 (buf!1415 (_2!2433 lt!78255)) lt!78253))))

(declare-fun b!50460 () Bool)

(declare-fun e!33323 () Bool)

(assert (=> b!50460 (= e!33323 e!33331)))

(declare-fun res!42235 () Bool)

(assert (=> b!50460 (=> res!42235 e!33331)))

(assert (=> b!50460 (= res!42235 (not (= (size!1060 (buf!1415 (_2!2433 lt!78255))) (size!1060 (buf!1415 (_2!2433 lt!78272))))))))

(declare-fun lt!78271 () (_ BitVec 64))

(declare-fun lt!78260 () (_ BitVec 64))

(assert (=> b!50460 (= lt!78271 (bvsub (bvsub (bvadd lt!78260 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50460 (= lt!78260 (bitIndex!0 (size!1060 (buf!1415 (_2!2433 lt!78255))) (currentByte!2938 (_2!2433 lt!78255)) (currentBit!2933 (_2!2433 lt!78255))))))

(assert (=> b!50460 (= (size!1060 (buf!1415 (_2!2433 lt!78272))) (size!1060 (buf!1415 thiss!1379)))))

(declare-fun b!50461 () Bool)

(declare-fun e!33319 () Bool)

(declare-fun e!33327 () Bool)

(assert (=> b!50461 (= e!33319 (not e!33327))))

(declare-fun res!42229 () Bool)

(assert (=> b!50461 (=> res!42229 e!33327)))

(assert (=> b!50461 (= res!42229 (bvsge i!635 to!314))))

(assert (=> b!50461 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78274 () Unit!3495)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1834) Unit!3495)

(assert (=> b!50461 (= lt!78274 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50461 (= lt!78253 (bitIndex!0 (size!1060 (buf!1415 thiss!1379)) (currentByte!2938 thiss!1379) (currentBit!2933 thiss!1379)))))

(declare-fun b!50462 () Bool)

(declare-fun res!42232 () Bool)

(declare-fun e!33326 () Bool)

(assert (=> b!50462 (=> res!42232 e!33326)))

(declare-fun lt!78262 () Bool)

(declare-fun head!377 (List!558) Bool)

(assert (=> b!50462 (= res!42232 (not (= (head!377 lt!78273) lt!78262)))))

(declare-fun b!50463 () Bool)

(assert (=> b!50463 (= e!33332 true)))

(assert (=> b!50463 (= lt!78258 (bitAt!0 (buf!1415 (_2!2433 lt!78272)) lt!78253))))

(declare-fun lt!78268 () Unit!3495)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2332 array!2332 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3495)

(assert (=> b!50463 (= lt!78268 (arrayBitRangesEqImpliesEq!0 (buf!1415 (_2!2433 lt!78255)) (buf!1415 (_2!2433 lt!78272)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78253 lt!78260))))

(declare-fun b!50464 () Bool)

(assert (=> b!50464 (= e!33325 e!33323)))

(declare-fun res!42239 () Bool)

(assert (=> b!50464 (=> res!42239 e!33323)))

(assert (=> b!50464 (= res!42239 (not (= lt!78271 (bvsub (bvadd lt!78253 to!314) i!635))))))

(assert (=> b!50464 (= lt!78271 (bitIndex!0 (size!1060 (buf!1415 (_2!2433 lt!78272))) (currentByte!2938 (_2!2433 lt!78272)) (currentBit!2933 (_2!2433 lt!78272))))))

(declare-fun b!50465 () Bool)

(assert (=> b!50465 (= e!33331 e!33320)))

(declare-fun res!42241 () Bool)

(assert (=> b!50465 (=> res!42241 e!33320)))

(assert (=> b!50465 (= res!42241 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78259 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1834 BitStream!1834 (_ BitVec 64)) List!558)

(assert (=> b!50465 (= lt!78254 (bitStreamReadBitsIntoList!0 (_2!2433 lt!78272) (_1!2434 lt!78263) lt!78259))))

(assert (=> b!50465 (= lt!78273 (bitStreamReadBitsIntoList!0 (_2!2433 lt!78272) (_1!2434 lt!78266) (bvsub to!314 i!635)))))

(assert (=> b!50465 (validate_offset_bits!1 ((_ sign_extend 32) (size!1060 (buf!1415 (_2!2433 lt!78272)))) ((_ sign_extend 32) (currentByte!2938 (_2!2433 lt!78255))) ((_ sign_extend 32) (currentBit!2933 (_2!2433 lt!78255))) lt!78259)))

(declare-fun lt!78256 () Unit!3495)

(assert (=> b!50465 (= lt!78256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2433 lt!78255) (buf!1415 (_2!2433 lt!78272)) lt!78259))))

(assert (=> b!50465 (= lt!78263 (reader!0 (_2!2433 lt!78255) (_2!2433 lt!78272)))))

(assert (=> b!50465 (validate_offset_bits!1 ((_ sign_extend 32) (size!1060 (buf!1415 (_2!2433 lt!78272)))) ((_ sign_extend 32) (currentByte!2938 thiss!1379)) ((_ sign_extend 32) (currentBit!2933 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78252 () Unit!3495)

(assert (=> b!50465 (= lt!78252 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1415 (_2!2433 lt!78272)) (bvsub to!314 i!635)))))

(assert (=> b!50465 (= lt!78266 (reader!0 thiss!1379 (_2!2433 lt!78272)))))

(declare-fun b!50466 () Bool)

(assert (=> b!50466 (= e!33326 e!33321)))

(declare-fun res!42228 () Bool)

(assert (=> b!50466 (=> res!42228 e!33321)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1834 array!2332 (_ BitVec 64) (_ BitVec 64)) List!558)

(assert (=> b!50466 (= res!42228 (not (= (head!377 (byteArrayBitContentToList!0 (_2!2433 lt!78272) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78264)))))

(assert (=> b!50466 (= lt!78264 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50467 () Bool)

(declare-fun res!42238 () Bool)

(assert (=> b!50467 (=> res!42238 e!33331)))

(assert (=> b!50467 (= res!42238 (not (invariant!0 (currentBit!2933 (_2!2433 lt!78255)) (currentByte!2938 (_2!2433 lt!78255)) (size!1060 (buf!1415 (_2!2433 lt!78255))))))))

(declare-fun b!50468 () Bool)

(declare-fun e!33322 () Bool)

(declare-fun array_inv!970 (array!2332) Bool)

(assert (=> b!50468 (= e!33322 (array_inv!970 (buf!1415 thiss!1379)))))

(declare-fun b!50469 () Bool)

(assert (=> b!50469 (= e!33327 e!33318)))

(declare-fun res!42242 () Bool)

(assert (=> b!50469 (=> res!42242 e!33318)))

(assert (=> b!50469 (= res!42242 (not (isPrefixOf!0 thiss!1379 (_2!2433 lt!78255))))))

(assert (=> b!50469 (validate_offset_bits!1 ((_ sign_extend 32) (size!1060 (buf!1415 (_2!2433 lt!78255)))) ((_ sign_extend 32) (currentByte!2938 (_2!2433 lt!78255))) ((_ sign_extend 32) (currentBit!2933 (_2!2433 lt!78255))) lt!78259)))

(assert (=> b!50469 (= lt!78259 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78257 () Unit!3495)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1834 BitStream!1834 (_ BitVec 64) (_ BitVec 64)) Unit!3495)

(assert (=> b!50469 (= lt!78257 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2433 lt!78255) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1834 (_ BitVec 8) (_ BitVec 32)) tuple2!4656)

(assert (=> b!50469 (= lt!78255 (appendBitFromByte!0 thiss!1379 (select (arr!1589 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50454 () Bool)

(declare-fun res!42225 () Bool)

(assert (=> b!50454 (=> res!42225 e!33323)))

(assert (=> b!50454 (= res!42225 (not (invariant!0 (currentBit!2933 (_2!2433 lt!78272)) (currentByte!2938 (_2!2433 lt!78272)) (size!1060 (buf!1415 (_2!2433 lt!78272))))))))

(declare-fun res!42236 () Bool)

(assert (=> start!10010 (=> (not res!42236) (not e!33319))))

(assert (=> start!10010 (= res!42236 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1060 srcBuffer!2))))))))

(assert (=> start!10010 e!33319))

(assert (=> start!10010 true))

(assert (=> start!10010 (array_inv!970 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1834) Bool)

(assert (=> start!10010 (and (inv!12 thiss!1379) e!33322)))

(declare-fun b!50470 () Bool)

(declare-fun res!42240 () Bool)

(assert (=> b!50470 (=> (not res!42240) (not e!33319))))

(assert (=> b!50470 (= res!42240 (validate_offset_bits!1 ((_ sign_extend 32) (size!1060 (buf!1415 thiss!1379))) ((_ sign_extend 32) (currentByte!2938 thiss!1379)) ((_ sign_extend 32) (currentBit!2933 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50471 () Bool)

(assert (=> b!50471 (= e!33328 (= (head!377 (byteArrayBitContentToList!0 (_2!2433 lt!78255) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!377 (bitStreamReadBitsIntoList!0 (_2!2433 lt!78255) (_1!2434 lt!78267) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50472 () Bool)

(declare-fun res!42234 () Bool)

(assert (=> b!50472 (=> res!42234 e!33323)))

(assert (=> b!50472 (= res!42234 (not (= (size!1060 (buf!1415 thiss!1379)) (size!1060 (buf!1415 (_2!2433 lt!78272))))))))

(declare-fun b!50473 () Bool)

(assert (=> b!50473 (= e!33329 e!33326)))

(declare-fun res!42233 () Bool)

(assert (=> b!50473 (=> res!42233 e!33326)))

(assert (=> b!50473 (= res!42233 (not (= lt!78262 (bitAt!0 (buf!1415 (_1!2434 lt!78263)) lt!78253))))))

(assert (=> b!50473 (= lt!78262 (bitAt!0 (buf!1415 (_1!2434 lt!78266)) lt!78253))))

(assert (= (and start!10010 res!42236) b!50470))

(assert (= (and b!50470 res!42240) b!50461))

(assert (= (and b!50461 (not res!42229)) b!50469))

(assert (= (and b!50469 (not res!42242)) b!50456))

(assert (= (and b!50456 res!42226) b!50471))

(assert (= (and b!50456 (not res!42237)) b!50464))

(assert (= (and b!50464 (not res!42239)) b!50454))

(assert (= (and b!50454 (not res!42225)) b!50472))

(assert (= (and b!50472 (not res!42234)) b!50460))

(assert (= (and b!50460 (not res!42235)) b!50467))

(assert (= (and b!50467 (not res!42238)) b!50458))

(assert (= (and b!50458 (not res!42231)) b!50465))

(assert (= (and b!50465 (not res!42241)) b!50455))

(assert (= (and b!50455 (not res!42243)) b!50457))

(assert (= (and b!50457 (not res!42230)) b!50473))

(assert (= (and b!50473 (not res!42233)) b!50462))

(assert (= (and b!50462 (not res!42232)) b!50466))

(assert (= (and b!50466 (not res!42228)) b!50459))

(assert (= (and b!50459 (not res!42227)) b!50463))

(assert (= start!10010 b!50468))

(declare-fun m!79371 () Bool)

(assert (=> b!50454 m!79371))

(declare-fun m!79373 () Bool)

(assert (=> b!50459 m!79373))

(declare-fun m!79375 () Bool)

(assert (=> b!50471 m!79375))

(assert (=> b!50471 m!79375))

(declare-fun m!79377 () Bool)

(assert (=> b!50471 m!79377))

(declare-fun m!79379 () Bool)

(assert (=> b!50471 m!79379))

(assert (=> b!50471 m!79379))

(declare-fun m!79381 () Bool)

(assert (=> b!50471 m!79381))

(declare-fun m!79383 () Bool)

(assert (=> start!10010 m!79383))

(declare-fun m!79385 () Bool)

(assert (=> start!10010 m!79385))

(declare-fun m!79387 () Bool)

(assert (=> b!50465 m!79387))

(declare-fun m!79389 () Bool)

(assert (=> b!50465 m!79389))

(declare-fun m!79391 () Bool)

(assert (=> b!50465 m!79391))

(declare-fun m!79393 () Bool)

(assert (=> b!50465 m!79393))

(declare-fun m!79395 () Bool)

(assert (=> b!50465 m!79395))

(declare-fun m!79397 () Bool)

(assert (=> b!50465 m!79397))

(declare-fun m!79399 () Bool)

(assert (=> b!50465 m!79399))

(declare-fun m!79401 () Bool)

(assert (=> b!50465 m!79401))

(declare-fun m!79403 () Bool)

(assert (=> b!50456 m!79403))

(declare-fun m!79405 () Bool)

(assert (=> b!50456 m!79405))

(declare-fun m!79407 () Bool)

(assert (=> b!50456 m!79407))

(declare-fun m!79409 () Bool)

(assert (=> b!50456 m!79409))

(declare-fun m!79411 () Bool)

(assert (=> b!50456 m!79411))

(declare-fun m!79413 () Bool)

(assert (=> b!50456 m!79413))

(declare-fun m!79415 () Bool)

(assert (=> b!50456 m!79415))

(declare-fun m!79417 () Bool)

(assert (=> b!50468 m!79417))

(declare-fun m!79419 () Bool)

(assert (=> b!50469 m!79419))

(declare-fun m!79421 () Bool)

(assert (=> b!50469 m!79421))

(declare-fun m!79423 () Bool)

(assert (=> b!50469 m!79423))

(declare-fun m!79425 () Bool)

(assert (=> b!50469 m!79425))

(assert (=> b!50469 m!79421))

(declare-fun m!79427 () Bool)

(assert (=> b!50469 m!79427))

(declare-fun m!79429 () Bool)

(assert (=> b!50464 m!79429))

(declare-fun m!79431 () Bool)

(assert (=> b!50467 m!79431))

(declare-fun m!79433 () Bool)

(assert (=> b!50470 m!79433))

(declare-fun m!79435 () Bool)

(assert (=> b!50466 m!79435))

(assert (=> b!50466 m!79435))

(declare-fun m!79437 () Bool)

(assert (=> b!50466 m!79437))

(declare-fun m!79439 () Bool)

(assert (=> b!50466 m!79439))

(declare-fun m!79441 () Bool)

(assert (=> b!50473 m!79441))

(declare-fun m!79443 () Bool)

(assert (=> b!50473 m!79443))

(declare-fun m!79445 () Bool)

(assert (=> b!50458 m!79445))

(declare-fun m!79447 () Bool)

(assert (=> b!50455 m!79447))

(declare-fun m!79449 () Bool)

(assert (=> b!50463 m!79449))

(declare-fun m!79451 () Bool)

(assert (=> b!50463 m!79451))

(declare-fun m!79453 () Bool)

(assert (=> b!50457 m!79453))

(declare-fun m!79455 () Bool)

(assert (=> b!50457 m!79455))

(declare-fun m!79457 () Bool)

(assert (=> b!50460 m!79457))

(declare-fun m!79459 () Bool)

(assert (=> b!50462 m!79459))

(declare-fun m!79461 () Bool)

(assert (=> b!50461 m!79461))

(declare-fun m!79463 () Bool)

(assert (=> b!50461 m!79463))

(declare-fun m!79465 () Bool)

(assert (=> b!50461 m!79465))

(push 1)

