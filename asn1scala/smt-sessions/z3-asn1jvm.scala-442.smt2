; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11846 () Bool)

(assert start!11846)

(declare-fun b!59370 () Bool)

(declare-fun res!49404 () Bool)

(declare-fun e!39500 () Bool)

(assert (=> b!59370 (=> res!49404 e!39500)))

(declare-datatypes ((array!2703 0))(
  ( (array!2704 (arr!1791 (Array (_ BitVec 32) (_ BitVec 8))) (size!1227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2142 0))(
  ( (BitStream!2143 (buf!1608 array!2703) (currentByte!3226 (_ BitVec 32)) (currentBit!3221 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2142)

(declare-datatypes ((Unit!4077 0))(
  ( (Unit!4078) )
))
(declare-datatypes ((tuple2!5406 0))(
  ( (tuple2!5407 (_1!2814 Unit!4077) (_2!2814 BitStream!2142)) )
))
(declare-fun lt!93178 () tuple2!5406)

(assert (=> b!59370 (= res!49404 (not (= (size!1227 (buf!1608 thiss!1379)) (size!1227 (buf!1608 (_2!2814 lt!93178))))))))

(declare-fun b!59371 () Bool)

(declare-fun res!49401 () Bool)

(declare-fun e!39496 () Bool)

(assert (=> b!59371 (=> (not res!49401) (not e!39496))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59371 (= res!49401 (validate_offset_bits!1 ((_ sign_extend 32) (size!1227 (buf!1608 thiss!1379))) ((_ sign_extend 32) (currentByte!3226 thiss!1379)) ((_ sign_extend 32) (currentBit!3221 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59372 () Bool)

(declare-fun res!49409 () Bool)

(declare-fun e!39495 () Bool)

(assert (=> b!59372 (=> res!49409 e!39495)))

(declare-fun lt!93176 () tuple2!5406)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59372 (= res!49409 (not (invariant!0 (currentBit!3221 (_2!2814 lt!93176)) (currentByte!3226 (_2!2814 lt!93176)) (size!1227 (buf!1608 (_2!2814 lt!93178))))))))

(declare-fun b!59373 () Bool)

(declare-fun e!39494 () Bool)

(assert (=> b!59373 (= e!39494 e!39500)))

(declare-fun res!49412 () Bool)

(assert (=> b!59373 (=> res!49412 e!39500)))

(declare-fun lt!93167 () (_ BitVec 64))

(declare-fun lt!93175 () (_ BitVec 64))

(assert (=> b!59373 (= res!49412 (not (= lt!93175 (bvsub (bvadd lt!93167 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59373 (= lt!93175 (bitIndex!0 (size!1227 (buf!1608 (_2!2814 lt!93178))) (currentByte!3226 (_2!2814 lt!93178)) (currentBit!3221 (_2!2814 lt!93178))))))

(declare-fun b!59374 () Bool)

(declare-fun res!49410 () Bool)

(assert (=> b!59374 (=> res!49410 e!39495)))

(assert (=> b!59374 (= res!49410 (not (invariant!0 (currentBit!3221 (_2!2814 lt!93176)) (currentByte!3226 (_2!2814 lt!93176)) (size!1227 (buf!1608 (_2!2814 lt!93176))))))))

(declare-fun b!59375 () Bool)

(declare-fun e!39497 () Bool)

(assert (=> b!59375 (= e!39496 (not e!39497))))

(declare-fun res!49405 () Bool)

(assert (=> b!59375 (=> res!49405 e!39497)))

(assert (=> b!59375 (= res!49405 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2142 BitStream!2142) Bool)

(assert (=> b!59375 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93170 () Unit!4077)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2142) Unit!4077)

(assert (=> b!59375 (= lt!93170 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59375 (= lt!93167 (bitIndex!0 (size!1227 (buf!1608 thiss!1379)) (currentByte!3226 thiss!1379) (currentBit!3221 thiss!1379)))))

(declare-fun b!59376 () Bool)

(declare-fun res!49403 () Bool)

(assert (=> b!59376 (=> res!49403 e!39500)))

(assert (=> b!59376 (= res!49403 (not (invariant!0 (currentBit!3221 (_2!2814 lt!93178)) (currentByte!3226 (_2!2814 lt!93178)) (size!1227 (buf!1608 (_2!2814 lt!93178))))))))

(declare-fun b!59377 () Bool)

(assert (=> b!59377 (= e!39495 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93166 () (_ BitVec 64))

(assert (=> b!59377 (validate_offset_bits!1 ((_ sign_extend 32) (size!1227 (buf!1608 (_2!2814 lt!93178)))) ((_ sign_extend 32) (currentByte!3226 (_2!2814 lt!93176))) ((_ sign_extend 32) (currentBit!3221 (_2!2814 lt!93176))) lt!93166)))

(declare-fun lt!93171 () Unit!4077)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2142 array!2703 (_ BitVec 64)) Unit!4077)

(assert (=> b!59377 (= lt!93171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2814 lt!93176) (buf!1608 (_2!2814 lt!93178)) lt!93166))))

(declare-datatypes ((tuple2!5408 0))(
  ( (tuple2!5409 (_1!2815 BitStream!2142) (_2!2815 BitStream!2142)) )
))
(declare-fun lt!93165 () tuple2!5408)

(declare-fun reader!0 (BitStream!2142 BitStream!2142) tuple2!5408)

(assert (=> b!59377 (= lt!93165 (reader!0 (_2!2814 lt!93176) (_2!2814 lt!93178)))))

(assert (=> b!59377 (validate_offset_bits!1 ((_ sign_extend 32) (size!1227 (buf!1608 (_2!2814 lt!93178)))) ((_ sign_extend 32) (currentByte!3226 thiss!1379)) ((_ sign_extend 32) (currentBit!3221 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93168 () Unit!4077)

(assert (=> b!59377 (= lt!93168 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1608 (_2!2814 lt!93178)) (bvsub to!314 i!635)))))

(declare-fun lt!93174 () tuple2!5408)

(assert (=> b!59377 (= lt!93174 (reader!0 thiss!1379 (_2!2814 lt!93178)))))

(declare-fun b!59378 () Bool)

(declare-fun e!39499 () Bool)

(assert (=> b!59378 (= e!39499 e!39494)))

(declare-fun res!49413 () Bool)

(assert (=> b!59378 (=> res!49413 e!39494)))

(assert (=> b!59378 (= res!49413 (not (isPrefixOf!0 (_2!2814 lt!93176) (_2!2814 lt!93178))))))

(assert (=> b!59378 (isPrefixOf!0 thiss!1379 (_2!2814 lt!93178))))

(declare-fun lt!93169 () Unit!4077)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2142 BitStream!2142 BitStream!2142) Unit!4077)

(assert (=> b!59378 (= lt!93169 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2814 lt!93176) (_2!2814 lt!93178)))))

(declare-fun srcBuffer!2 () array!2703)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2142 array!2703 (_ BitVec 64) (_ BitVec 64)) tuple2!5406)

(assert (=> b!59378 (= lt!93178 (appendBitsMSBFirstLoop!0 (_2!2814 lt!93176) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39491 () Bool)

(assert (=> b!59378 e!39491))

(declare-fun res!49402 () Bool)

(assert (=> b!59378 (=> (not res!49402) (not e!39491))))

(assert (=> b!59378 (= res!49402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1227 (buf!1608 (_2!2814 lt!93176)))) ((_ sign_extend 32) (currentByte!3226 thiss!1379)) ((_ sign_extend 32) (currentBit!3221 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93172 () Unit!4077)

(assert (=> b!59378 (= lt!93172 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1608 (_2!2814 lt!93176)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93173 () tuple2!5408)

(assert (=> b!59378 (= lt!93173 (reader!0 thiss!1379 (_2!2814 lt!93176)))))

(declare-fun b!59379 () Bool)

(declare-fun e!39490 () Bool)

(declare-fun array_inv!1130 (array!2703) Bool)

(assert (=> b!59379 (= e!39490 (array_inv!1130 (buf!1608 thiss!1379)))))

(declare-fun b!59381 () Bool)

(assert (=> b!59381 (= e!39497 e!39499)))

(declare-fun res!49411 () Bool)

(assert (=> b!59381 (=> res!49411 e!39499)))

(assert (=> b!59381 (= res!49411 (not (isPrefixOf!0 thiss!1379 (_2!2814 lt!93176))))))

(assert (=> b!59381 (validate_offset_bits!1 ((_ sign_extend 32) (size!1227 (buf!1608 (_2!2814 lt!93176)))) ((_ sign_extend 32) (currentByte!3226 (_2!2814 lt!93176))) ((_ sign_extend 32) (currentBit!3221 (_2!2814 lt!93176))) lt!93166)))

(assert (=> b!59381 (= lt!93166 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93177 () Unit!4077)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2142 BitStream!2142 (_ BitVec 64) (_ BitVec 64)) Unit!4077)

(assert (=> b!59381 (= lt!93177 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2814 lt!93176) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2142 (_ BitVec 8) (_ BitVec 32)) tuple2!5406)

(assert (=> b!59381 (= lt!93176 (appendBitFromByte!0 thiss!1379 (select (arr!1791 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59382 () Bool)

(declare-datatypes ((List!646 0))(
  ( (Nil!643) (Cons!642 (h!761 Bool) (t!1396 List!646)) )
))
(declare-fun head!465 (List!646) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2142 array!2703 (_ BitVec 64) (_ BitVec 64)) List!646)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2142 BitStream!2142 (_ BitVec 64)) List!646)

(assert (=> b!59382 (= e!39491 (= (head!465 (byteArrayBitContentToList!0 (_2!2814 lt!93176) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!465 (bitStreamReadBitsIntoList!0 (_2!2814 lt!93176) (_1!2815 lt!93173) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59383 () Bool)

(assert (=> b!59383 (= e!39500 e!39495)))

(declare-fun res!49408 () Bool)

(assert (=> b!59383 (=> res!49408 e!39495)))

(assert (=> b!59383 (= res!49408 (not (= (size!1227 (buf!1608 (_2!2814 lt!93176))) (size!1227 (buf!1608 (_2!2814 lt!93178))))))))

(declare-fun e!39493 () Bool)

(assert (=> b!59383 e!39493))

(declare-fun res!49406 () Bool)

(assert (=> b!59383 (=> (not res!49406) (not e!39493))))

(assert (=> b!59383 (= res!49406 (= (size!1227 (buf!1608 (_2!2814 lt!93178))) (size!1227 (buf!1608 thiss!1379))))))

(declare-fun b!59380 () Bool)

(assert (=> b!59380 (= e!39493 (= lt!93175 (bvsub (bvsub (bvadd (bitIndex!0 (size!1227 (buf!1608 (_2!2814 lt!93176))) (currentByte!3226 (_2!2814 lt!93176)) (currentBit!3221 (_2!2814 lt!93176))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!49407 () Bool)

(assert (=> start!11846 (=> (not res!49407) (not e!39496))))

(assert (=> start!11846 (= res!49407 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1227 srcBuffer!2))))))))

(assert (=> start!11846 e!39496))

(assert (=> start!11846 true))

(assert (=> start!11846 (array_inv!1130 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2142) Bool)

(assert (=> start!11846 (and (inv!12 thiss!1379) e!39490)))

(assert (= (and start!11846 res!49407) b!59371))

(assert (= (and b!59371 res!49401) b!59375))

(assert (= (and b!59375 (not res!49405)) b!59381))

(assert (= (and b!59381 (not res!49411)) b!59378))

(assert (= (and b!59378 res!49402) b!59382))

(assert (= (and b!59378 (not res!49413)) b!59373))

(assert (= (and b!59373 (not res!49412)) b!59376))

(assert (= (and b!59376 (not res!49403)) b!59370))

(assert (= (and b!59370 (not res!49404)) b!59383))

(assert (= (and b!59383 res!49406) b!59380))

(assert (= (and b!59383 (not res!49408)) b!59374))

(assert (= (and b!59374 (not res!49410)) b!59372))

(assert (= (and b!59372 (not res!49409)) b!59377))

(assert (= start!11846 b!59379))

(declare-fun m!93489 () Bool)

(assert (=> b!59382 m!93489))

(assert (=> b!59382 m!93489))

(declare-fun m!93491 () Bool)

(assert (=> b!59382 m!93491))

(declare-fun m!93493 () Bool)

(assert (=> b!59382 m!93493))

(assert (=> b!59382 m!93493))

(declare-fun m!93495 () Bool)

(assert (=> b!59382 m!93495))

(declare-fun m!93497 () Bool)

(assert (=> b!59373 m!93497))

(declare-fun m!93499 () Bool)

(assert (=> b!59372 m!93499))

(declare-fun m!93501 () Bool)

(assert (=> b!59379 m!93501))

(declare-fun m!93503 () Bool)

(assert (=> b!59381 m!93503))

(declare-fun m!93505 () Bool)

(assert (=> b!59381 m!93505))

(declare-fun m!93507 () Bool)

(assert (=> b!59381 m!93507))

(declare-fun m!93509 () Bool)

(assert (=> b!59381 m!93509))

(declare-fun m!93511 () Bool)

(assert (=> b!59381 m!93511))

(assert (=> b!59381 m!93505))

(declare-fun m!93513 () Bool)

(assert (=> b!59380 m!93513))

(declare-fun m!93515 () Bool)

(assert (=> b!59376 m!93515))

(declare-fun m!93517 () Bool)

(assert (=> b!59375 m!93517))

(declare-fun m!93519 () Bool)

(assert (=> b!59375 m!93519))

(declare-fun m!93521 () Bool)

(assert (=> b!59375 m!93521))

(declare-fun m!93523 () Bool)

(assert (=> start!11846 m!93523))

(declare-fun m!93525 () Bool)

(assert (=> start!11846 m!93525))

(declare-fun m!93527 () Bool)

(assert (=> b!59374 m!93527))

(declare-fun m!93529 () Bool)

(assert (=> b!59377 m!93529))

(declare-fun m!93531 () Bool)

(assert (=> b!59377 m!93531))

(declare-fun m!93533 () Bool)

(assert (=> b!59377 m!93533))

(declare-fun m!93535 () Bool)

(assert (=> b!59377 m!93535))

(declare-fun m!93537 () Bool)

(assert (=> b!59377 m!93537))

(declare-fun m!93539 () Bool)

(assert (=> b!59377 m!93539))

(declare-fun m!93541 () Bool)

(assert (=> b!59378 m!93541))

(declare-fun m!93543 () Bool)

(assert (=> b!59378 m!93543))

(declare-fun m!93545 () Bool)

(assert (=> b!59378 m!93545))

(declare-fun m!93547 () Bool)

(assert (=> b!59378 m!93547))

(declare-fun m!93549 () Bool)

(assert (=> b!59378 m!93549))

(declare-fun m!93551 () Bool)

(assert (=> b!59378 m!93551))

(declare-fun m!93553 () Bool)

(assert (=> b!59378 m!93553))

(declare-fun m!93555 () Bool)

(assert (=> b!59371 m!93555))

(check-sat (not b!59371) (not b!59374) (not b!59377) (not b!59375) (not b!59379) (not b!59372) (not b!59380) (not b!59376) (not start!11846) (not b!59378) (not b!59382) (not b!59381) (not b!59373))
(check-sat)
