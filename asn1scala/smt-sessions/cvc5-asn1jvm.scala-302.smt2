; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5984 () Bool)

(assert start!5984)

(declare-fun b!27408 () Bool)

(declare-fun res!23713 () Bool)

(declare-fun e!18526 () Bool)

(assert (=> b!27408 (=> res!23713 e!18526)))

(declare-datatypes ((array!1721 0))(
  ( (array!1722 (arr!1205 (Array (_ BitVec 32) (_ BitVec 8))) (size!743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1318 0))(
  ( (BitStream!1319 (buf!1070 array!1721) (currentByte!2395 (_ BitVec 32)) (currentBit!2390 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2189 0))(
  ( (Unit!2190) )
))
(declare-datatypes ((tuple2!3002 0))(
  ( (tuple2!3003 (_1!1588 Unit!2189) (_2!1588 BitStream!1318)) )
))
(declare-fun lt!38968 () tuple2!3002)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27408 (= res!23713 (not (invariant!0 (currentBit!2390 (_2!1588 lt!38968)) (currentByte!2395 (_2!1588 lt!38968)) (size!743 (buf!1070 (_2!1588 lt!38968))))))))

(declare-fun b!27409 () Bool)

(declare-fun e!18522 () Bool)

(declare-fun e!18524 () Bool)

(assert (=> b!27409 (= e!18522 (not e!18524))))

(declare-fun res!23720 () Bool)

(assert (=> b!27409 (=> res!23720 e!18524)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!27409 (= res!23720 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1318)

(declare-fun isPrefixOf!0 (BitStream!1318 BitStream!1318) Bool)

(assert (=> b!27409 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38963 () Unit!2189)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1318) Unit!2189)

(assert (=> b!27409 (= lt!38963 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38960 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27409 (= lt!38960 (bitIndex!0 (size!743 (buf!1070 thiss!1379)) (currentByte!2395 thiss!1379) (currentBit!2390 thiss!1379)))))

(declare-fun b!27410 () Bool)

(declare-fun res!23715 () Bool)

(declare-fun e!18531 () Bool)

(assert (=> b!27410 (=> res!23715 e!18531)))

(declare-fun lt!38973 () tuple2!3002)

(assert (=> b!27410 (= res!23715 (not (invariant!0 (currentBit!2390 (_2!1588 lt!38973)) (currentByte!2395 (_2!1588 lt!38973)) (size!743 (buf!1070 (_2!1588 lt!38973))))))))

(declare-fun b!27411 () Bool)

(declare-fun e!18530 () Bool)

(assert (=> b!27411 (= e!18530 true)))

(declare-fun lt!38972 () (_ BitVec 64))

(declare-datatypes ((tuple2!3004 0))(
  ( (tuple2!3005 (_1!1589 BitStream!1318) (_2!1589 BitStream!1318)) )
))
(declare-fun lt!38964 () tuple2!3004)

(assert (=> b!27411 (= lt!38972 (bitIndex!0 (size!743 (buf!1070 (_1!1589 lt!38964))) (currentByte!2395 (_1!1589 lt!38964)) (currentBit!2390 (_1!1589 lt!38964))))))

(declare-fun lt!38961 () (_ BitVec 64))

(declare-fun lt!38967 () tuple2!3004)

(assert (=> b!27411 (= lt!38961 (bitIndex!0 (size!743 (buf!1070 (_1!1589 lt!38967))) (currentByte!2395 (_1!1589 lt!38967)) (currentBit!2390 (_1!1589 lt!38967))))))

(declare-fun b!27412 () Bool)

(declare-fun res!23714 () Bool)

(assert (=> b!27412 (=> (not res!23714) (not e!18522))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27412 (= res!23714 (validate_offset_bits!1 ((_ sign_extend 32) (size!743 (buf!1070 thiss!1379))) ((_ sign_extend 32) (currentByte!2395 thiss!1379)) ((_ sign_extend 32) (currentBit!2390 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27413 () Bool)

(declare-fun e!18527 () Bool)

(declare-fun e!18521 () Bool)

(assert (=> b!27413 (= e!18527 e!18521)))

(declare-fun res!23717 () Bool)

(assert (=> b!27413 (=> res!23717 e!18521)))

(assert (=> b!27413 (= res!23717 (not (isPrefixOf!0 (_2!1588 lt!38968) (_2!1588 lt!38973))))))

(assert (=> b!27413 (isPrefixOf!0 thiss!1379 (_2!1588 lt!38973))))

(declare-fun lt!38966 () Unit!2189)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1318 BitStream!1318 BitStream!1318) Unit!2189)

(assert (=> b!27413 (= lt!38966 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1588 lt!38968) (_2!1588 lt!38973)))))

(declare-fun srcBuffer!2 () array!1721)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1318 array!1721 (_ BitVec 64) (_ BitVec 64)) tuple2!3002)

(assert (=> b!27413 (= lt!38973 (appendBitsMSBFirstLoop!0 (_2!1588 lt!38968) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18532 () Bool)

(assert (=> b!27413 e!18532))

(declare-fun res!23706 () Bool)

(assert (=> b!27413 (=> (not res!23706) (not e!18532))))

(assert (=> b!27413 (= res!23706 (validate_offset_bits!1 ((_ sign_extend 32) (size!743 (buf!1070 (_2!1588 lt!38968)))) ((_ sign_extend 32) (currentByte!2395 thiss!1379)) ((_ sign_extend 32) (currentBit!2390 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38962 () Unit!2189)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1318 array!1721 (_ BitVec 64)) Unit!2189)

(assert (=> b!27413 (= lt!38962 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1070 (_2!1588 lt!38968)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38974 () tuple2!3004)

(declare-fun reader!0 (BitStream!1318 BitStream!1318) tuple2!3004)

(assert (=> b!27413 (= lt!38974 (reader!0 thiss!1379 (_2!1588 lt!38968)))))

(declare-fun b!27414 () Bool)

(declare-datatypes ((List!360 0))(
  ( (Nil!357) (Cons!356 (h!475 Bool) (t!1110 List!360)) )
))
(declare-fun head!197 (List!360) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1318 array!1721 (_ BitVec 64) (_ BitVec 64)) List!360)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1318 BitStream!1318 (_ BitVec 64)) List!360)

(assert (=> b!27414 (= e!18532 (= (head!197 (byteArrayBitContentToList!0 (_2!1588 lt!38968) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!197 (bitStreamReadBitsIntoList!0 (_2!1588 lt!38968) (_1!1589 lt!38974) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27415 () Bool)

(declare-fun res!23707 () Bool)

(assert (=> b!27415 (=> res!23707 e!18530)))

(assert (=> b!27415 (= res!23707 (not (isPrefixOf!0 (_1!1589 lt!38964) (_2!1588 lt!38973))))))

(declare-fun b!27416 () Bool)

(assert (=> b!27416 (= e!18526 e!18530)))

(declare-fun res!23718 () Bool)

(assert (=> b!27416 (=> res!23718 e!18530)))

(assert (=> b!27416 (= res!23718 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38958 () (_ BitVec 64))

(declare-fun lt!38970 () List!360)

(assert (=> b!27416 (= lt!38970 (bitStreamReadBitsIntoList!0 (_2!1588 lt!38973) (_1!1589 lt!38964) lt!38958))))

(declare-fun lt!38971 () List!360)

(assert (=> b!27416 (= lt!38971 (bitStreamReadBitsIntoList!0 (_2!1588 lt!38973) (_1!1589 lt!38967) (bvsub to!314 i!635)))))

(assert (=> b!27416 (validate_offset_bits!1 ((_ sign_extend 32) (size!743 (buf!1070 (_2!1588 lt!38973)))) ((_ sign_extend 32) (currentByte!2395 (_2!1588 lt!38968))) ((_ sign_extend 32) (currentBit!2390 (_2!1588 lt!38968))) lt!38958)))

(declare-fun lt!38969 () Unit!2189)

(assert (=> b!27416 (= lt!38969 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1588 lt!38968) (buf!1070 (_2!1588 lt!38973)) lt!38958))))

(assert (=> b!27416 (= lt!38964 (reader!0 (_2!1588 lt!38968) (_2!1588 lt!38973)))))

(assert (=> b!27416 (validate_offset_bits!1 ((_ sign_extend 32) (size!743 (buf!1070 (_2!1588 lt!38973)))) ((_ sign_extend 32) (currentByte!2395 thiss!1379)) ((_ sign_extend 32) (currentBit!2390 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38957 () Unit!2189)

(assert (=> b!27416 (= lt!38957 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1070 (_2!1588 lt!38973)) (bvsub to!314 i!635)))))

(assert (=> b!27416 (= lt!38967 (reader!0 thiss!1379 (_2!1588 lt!38973)))))

(declare-fun b!27417 () Bool)

(declare-fun e!18529 () Bool)

(declare-fun array_inv!712 (array!1721) Bool)

(assert (=> b!27417 (= e!18529 (array_inv!712 (buf!1070 thiss!1379)))))

(declare-fun lt!38965 () (_ BitVec 64))

(declare-fun b!27418 () Bool)

(declare-fun e!18528 () Bool)

(assert (=> b!27418 (= e!18528 (= lt!38965 (bvsub (bvsub (bvadd (bitIndex!0 (size!743 (buf!1070 (_2!1588 lt!38968))) (currentByte!2395 (_2!1588 lt!38968)) (currentBit!2390 (_2!1588 lt!38968))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27419 () Bool)

(assert (=> b!27419 (= e!18521 e!18531)))

(declare-fun res!23710 () Bool)

(assert (=> b!27419 (=> res!23710 e!18531)))

(assert (=> b!27419 (= res!23710 (not (= lt!38965 (bvsub (bvadd lt!38960 to!314) i!635))))))

(assert (=> b!27419 (= lt!38965 (bitIndex!0 (size!743 (buf!1070 (_2!1588 lt!38973))) (currentByte!2395 (_2!1588 lt!38973)) (currentBit!2390 (_2!1588 lt!38973))))))

(declare-fun b!27420 () Bool)

(declare-fun res!23722 () Bool)

(assert (=> b!27420 (=> res!23722 e!18530)))

(declare-fun length!86 (List!360) Int)

(assert (=> b!27420 (= res!23722 (<= (length!86 lt!38971) 0))))

(declare-fun b!27421 () Bool)

(assert (=> b!27421 (= e!18531 e!18526)))

(declare-fun res!23716 () Bool)

(assert (=> b!27421 (=> res!23716 e!18526)))

(assert (=> b!27421 (= res!23716 (not (= (size!743 (buf!1070 (_2!1588 lt!38968))) (size!743 (buf!1070 (_2!1588 lt!38973))))))))

(assert (=> b!27421 e!18528))

(declare-fun res!23709 () Bool)

(assert (=> b!27421 (=> (not res!23709) (not e!18528))))

(assert (=> b!27421 (= res!23709 (= (size!743 (buf!1070 (_2!1588 lt!38973))) (size!743 (buf!1070 thiss!1379))))))

(declare-fun b!27422 () Bool)

(declare-fun res!23712 () Bool)

(assert (=> b!27422 (=> res!23712 e!18530)))

(assert (=> b!27422 (= res!23712 (or (not (= (buf!1070 (_1!1589 lt!38967)) (buf!1070 (_1!1589 lt!38964)))) (not (= (buf!1070 (_1!1589 lt!38967)) (buf!1070 (_2!1588 lt!38973)))) (bvsge lt!38965 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27423 () Bool)

(assert (=> b!27423 (= e!18524 e!18527)))

(declare-fun res!23724 () Bool)

(assert (=> b!27423 (=> res!23724 e!18527)))

(assert (=> b!27423 (= res!23724 (not (isPrefixOf!0 thiss!1379 (_2!1588 lt!38968))))))

(assert (=> b!27423 (validate_offset_bits!1 ((_ sign_extend 32) (size!743 (buf!1070 (_2!1588 lt!38968)))) ((_ sign_extend 32) (currentByte!2395 (_2!1588 lt!38968))) ((_ sign_extend 32) (currentBit!2390 (_2!1588 lt!38968))) lt!38958)))

(assert (=> b!27423 (= lt!38958 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38959 () Unit!2189)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1318 BitStream!1318 (_ BitVec 64) (_ BitVec 64)) Unit!2189)

(assert (=> b!27423 (= lt!38959 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1588 lt!38968) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1318 (_ BitVec 8) (_ BitVec 32)) tuple2!3002)

(assert (=> b!27423 (= lt!38968 (appendBitFromByte!0 thiss!1379 (select (arr!1205 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27424 () Bool)

(declare-fun res!23721 () Bool)

(assert (=> b!27424 (=> res!23721 e!18526)))

(assert (=> b!27424 (= res!23721 (not (invariant!0 (currentBit!2390 (_2!1588 lt!38968)) (currentByte!2395 (_2!1588 lt!38968)) (size!743 (buf!1070 (_2!1588 lt!38973))))))))

(declare-fun b!27425 () Bool)

(declare-fun res!23723 () Bool)

(assert (=> b!27425 (=> res!23723 e!18530)))

(assert (=> b!27425 (= res!23723 (not (isPrefixOf!0 (_1!1589 lt!38967) (_1!1589 lt!38964))))))

(declare-fun b!27426 () Bool)

(declare-fun res!23711 () Bool)

(assert (=> b!27426 (=> res!23711 e!18531)))

(assert (=> b!27426 (= res!23711 (not (= (size!743 (buf!1070 thiss!1379)) (size!743 (buf!1070 (_2!1588 lt!38973))))))))

(declare-fun res!23719 () Bool)

(assert (=> start!5984 (=> (not res!23719) (not e!18522))))

(assert (=> start!5984 (= res!23719 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!743 srcBuffer!2))))))))

(assert (=> start!5984 e!18522))

(assert (=> start!5984 true))

(assert (=> start!5984 (array_inv!712 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1318) Bool)

(assert (=> start!5984 (and (inv!12 thiss!1379) e!18529)))

(declare-fun b!27427 () Bool)

(declare-fun res!23708 () Bool)

(assert (=> b!27427 (=> res!23708 e!18530)))

(assert (=> b!27427 (= res!23708 (not (isPrefixOf!0 (_1!1589 lt!38967) (_2!1588 lt!38973))))))

(assert (= (and start!5984 res!23719) b!27412))

(assert (= (and b!27412 res!23714) b!27409))

(assert (= (and b!27409 (not res!23720)) b!27423))

(assert (= (and b!27423 (not res!23724)) b!27413))

(assert (= (and b!27413 res!23706) b!27414))

(assert (= (and b!27413 (not res!23717)) b!27419))

(assert (= (and b!27419 (not res!23710)) b!27410))

(assert (= (and b!27410 (not res!23715)) b!27426))

(assert (= (and b!27426 (not res!23711)) b!27421))

(assert (= (and b!27421 res!23709) b!27418))

(assert (= (and b!27421 (not res!23716)) b!27408))

(assert (= (and b!27408 (not res!23713)) b!27424))

(assert (= (and b!27424 (not res!23721)) b!27416))

(assert (= (and b!27416 (not res!23718)) b!27420))

(assert (= (and b!27420 (not res!23722)) b!27427))

(assert (= (and b!27427 (not res!23708)) b!27415))

(assert (= (and b!27415 (not res!23707)) b!27425))

(assert (= (and b!27425 (not res!23723)) b!27422))

(assert (= (and b!27422 (not res!23712)) b!27411))

(assert (= start!5984 b!27417))

(declare-fun m!39273 () Bool)

(assert (=> b!27419 m!39273))

(declare-fun m!39275 () Bool)

(assert (=> b!27427 m!39275))

(declare-fun m!39277 () Bool)

(assert (=> b!27414 m!39277))

(assert (=> b!27414 m!39277))

(declare-fun m!39279 () Bool)

(assert (=> b!27414 m!39279))

(declare-fun m!39281 () Bool)

(assert (=> b!27414 m!39281))

(assert (=> b!27414 m!39281))

(declare-fun m!39283 () Bool)

(assert (=> b!27414 m!39283))

(declare-fun m!39285 () Bool)

(assert (=> b!27409 m!39285))

(declare-fun m!39287 () Bool)

(assert (=> b!27409 m!39287))

(declare-fun m!39289 () Bool)

(assert (=> b!27409 m!39289))

(declare-fun m!39291 () Bool)

(assert (=> b!27415 m!39291))

(declare-fun m!39293 () Bool)

(assert (=> b!27424 m!39293))

(declare-fun m!39295 () Bool)

(assert (=> b!27411 m!39295))

(declare-fun m!39297 () Bool)

(assert (=> b!27411 m!39297))

(declare-fun m!39299 () Bool)

(assert (=> b!27425 m!39299))

(declare-fun m!39301 () Bool)

(assert (=> b!27418 m!39301))

(declare-fun m!39303 () Bool)

(assert (=> b!27412 m!39303))

(declare-fun m!39305 () Bool)

(assert (=> b!27410 m!39305))

(declare-fun m!39307 () Bool)

(assert (=> b!27420 m!39307))

(declare-fun m!39309 () Bool)

(assert (=> b!27413 m!39309))

(declare-fun m!39311 () Bool)

(assert (=> b!27413 m!39311))

(declare-fun m!39313 () Bool)

(assert (=> b!27413 m!39313))

(declare-fun m!39315 () Bool)

(assert (=> b!27413 m!39315))

(declare-fun m!39317 () Bool)

(assert (=> b!27413 m!39317))

(declare-fun m!39319 () Bool)

(assert (=> b!27413 m!39319))

(declare-fun m!39321 () Bool)

(assert (=> b!27413 m!39321))

(declare-fun m!39323 () Bool)

(assert (=> b!27423 m!39323))

(declare-fun m!39325 () Bool)

(assert (=> b!27423 m!39325))

(assert (=> b!27423 m!39323))

(declare-fun m!39327 () Bool)

(assert (=> b!27423 m!39327))

(declare-fun m!39329 () Bool)

(assert (=> b!27423 m!39329))

(declare-fun m!39331 () Bool)

(assert (=> b!27423 m!39331))

(declare-fun m!39333 () Bool)

(assert (=> b!27417 m!39333))

(declare-fun m!39335 () Bool)

(assert (=> b!27408 m!39335))

(declare-fun m!39337 () Bool)

(assert (=> start!5984 m!39337))

(declare-fun m!39339 () Bool)

(assert (=> start!5984 m!39339))

(declare-fun m!39341 () Bool)

(assert (=> b!27416 m!39341))

(declare-fun m!39343 () Bool)

(assert (=> b!27416 m!39343))

(declare-fun m!39345 () Bool)

(assert (=> b!27416 m!39345))

(declare-fun m!39347 () Bool)

(assert (=> b!27416 m!39347))

(declare-fun m!39349 () Bool)

(assert (=> b!27416 m!39349))

(declare-fun m!39351 () Bool)

(assert (=> b!27416 m!39351))

(declare-fun m!39353 () Bool)

(assert (=> b!27416 m!39353))

(declare-fun m!39355 () Bool)

(assert (=> b!27416 m!39355))

(push 1)

