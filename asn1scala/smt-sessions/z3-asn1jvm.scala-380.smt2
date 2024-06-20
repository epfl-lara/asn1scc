; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9166 () Bool)

(assert start!9166)

(declare-fun b!45539 () Bool)

(declare-fun res!38524 () Bool)

(declare-fun e!30333 () Bool)

(assert (=> b!45539 (=> (not res!38524) (not e!30333))))

(declare-datatypes ((array!2271 0))(
  ( (array!2272 (arr!1539 (Array (_ BitVec 32) (_ BitVec 8))) (size!1022 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1788 0))(
  ( (BitStream!1789 (buf!1371 array!2271) (currentByte!2864 (_ BitVec 32)) (currentBit!2859 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1788)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45539 (= res!38524 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45540 () Bool)

(declare-fun e!30330 () Bool)

(assert (=> b!45540 (= e!30333 (not e!30330))))

(declare-fun res!38527 () Bool)

(assert (=> b!45540 (=> res!38527 e!30330)))

(assert (=> b!45540 (= res!38527 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1788 BitStream!1788) Bool)

(assert (=> b!45540 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3234 0))(
  ( (Unit!3235) )
))
(declare-fun lt!69862 () Unit!3234)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1788) Unit!3234)

(assert (=> b!45540 (= lt!69862 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69869 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45540 (= lt!69869 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(declare-fun b!45541 () Bool)

(declare-fun lt!69868 () (_ BitVec 64))

(declare-fun e!30337 () Bool)

(declare-datatypes ((tuple2!4444 0))(
  ( (tuple2!4445 (_1!2315 Unit!3234) (_2!2315 BitStream!1788)) )
))
(declare-fun lt!69863 () tuple2!4444)

(assert (=> b!45541 (= e!30337 (= lt!69868 (bvsub (bvsub (bvadd (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45542 () Bool)

(declare-fun e!30331 () Bool)

(declare-fun e!30329 () Bool)

(assert (=> b!45542 (= e!30331 e!30329)))

(declare-fun res!38529 () Bool)

(assert (=> b!45542 (=> res!38529 e!30329)))

(declare-fun lt!69870 () tuple2!4444)

(assert (=> b!45542 (= res!38529 (not (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69870))))))

(assert (=> b!45542 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69870))))

(declare-fun lt!69866 () Unit!3234)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1788 BitStream!1788 BitStream!1788) Unit!3234)

(assert (=> b!45542 (= lt!69866 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2315 lt!69863) (_2!2315 lt!69870)))))

(declare-fun srcBuffer!2 () array!2271)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1788 array!2271 (_ BitVec 64) (_ BitVec 64)) tuple2!4444)

(assert (=> b!45542 (= lt!69870 (appendBitsMSBFirstLoop!0 (_2!2315 lt!69863) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!30338 () Bool)

(assert (=> b!45542 e!30338))

(declare-fun res!38534 () Bool)

(assert (=> b!45542 (=> (not res!38534) (not e!30338))))

(assert (=> b!45542 (= res!38534 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69865 () Unit!3234)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1788 array!2271 (_ BitVec 64)) Unit!3234)

(assert (=> b!45542 (= lt!69865 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1371 (_2!2315 lt!69863)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4446 0))(
  ( (tuple2!4447 (_1!2316 BitStream!1788) (_2!2316 BitStream!1788)) )
))
(declare-fun lt!69864 () tuple2!4446)

(declare-fun reader!0 (BitStream!1788 BitStream!1788) tuple2!4446)

(assert (=> b!45542 (= lt!69864 (reader!0 thiss!1379 (_2!2315 lt!69863)))))

(declare-fun b!45543 () Bool)

(declare-fun res!38522 () Bool)

(declare-fun e!30327 () Bool)

(assert (=> b!45543 (=> res!38522 e!30327)))

(assert (=> b!45543 (= res!38522 (not (= (size!1022 (buf!1371 thiss!1379)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))

(declare-fun res!38528 () Bool)

(assert (=> start!9166 (=> (not res!38528) (not e!30333))))

(assert (=> start!9166 (= res!38528 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1022 srcBuffer!2))))))))

(assert (=> start!9166 e!30333))

(assert (=> start!9166 true))

(declare-fun array_inv!947 (array!2271) Bool)

(assert (=> start!9166 (array_inv!947 srcBuffer!2)))

(declare-fun e!30335 () Bool)

(declare-fun inv!12 (BitStream!1788) Bool)

(assert (=> start!9166 (and (inv!12 thiss!1379) e!30335)))

(declare-fun b!45544 () Bool)

(declare-fun e!30336 () Bool)

(declare-datatypes ((List!535 0))(
  ( (Nil!532) (Cons!531 (h!650 Bool) (t!1285 List!535)) )
))
(declare-fun lt!69872 () List!535)

(declare-fun length!230 (List!535) Int)

(assert (=> b!45544 (= e!30336 (> (length!230 lt!69872) 0))))

(declare-fun b!45545 () Bool)

(declare-fun res!38523 () Bool)

(assert (=> b!45545 (=> res!38523 e!30327)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45545 (= res!38523 (not (invariant!0 (currentBit!2859 (_2!2315 lt!69870)) (currentByte!2864 (_2!2315 lt!69870)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))

(declare-fun b!45546 () Bool)

(assert (=> b!45546 (= e!30330 e!30331)))

(declare-fun res!38526 () Bool)

(assert (=> b!45546 (=> res!38526 e!30331)))

(assert (=> b!45546 (= res!38526 (not (isPrefixOf!0 thiss!1379 (_2!2315 lt!69863))))))

(declare-fun lt!69859 () (_ BitVec 64))

(assert (=> b!45546 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!69859)))

(assert (=> b!45546 (= lt!69859 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69861 () Unit!3234)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1788 BitStream!1788 (_ BitVec 64) (_ BitVec 64)) Unit!3234)

(assert (=> b!45546 (= lt!69861 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2315 lt!69863) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1788 (_ BitVec 8) (_ BitVec 32)) tuple2!4444)

(assert (=> b!45546 (= lt!69863 (appendBitFromByte!0 thiss!1379 (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45547 () Bool)

(declare-fun e!30328 () Bool)

(assert (=> b!45547 (= e!30327 e!30328)))

(declare-fun res!38533 () Bool)

(assert (=> b!45547 (=> res!38533 e!30328)))

(assert (=> b!45547 (= res!38533 (not (= (size!1022 (buf!1371 (_2!2315 lt!69863))) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))

(assert (=> b!45547 e!30337))

(declare-fun res!38532 () Bool)

(assert (=> b!45547 (=> (not res!38532) (not e!30337))))

(assert (=> b!45547 (= res!38532 (= (size!1022 (buf!1371 (_2!2315 lt!69870))) (size!1022 (buf!1371 thiss!1379))))))

(declare-fun b!45548 () Bool)

(declare-fun res!38535 () Bool)

(assert (=> b!45548 (=> res!38535 e!30328)))

(assert (=> b!45548 (= res!38535 (not (invariant!0 (currentBit!2859 (_2!2315 lt!69863)) (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69863))))))))

(declare-fun b!45549 () Bool)

(assert (=> b!45549 (= e!30328 e!30336)))

(declare-fun res!38531 () Bool)

(assert (=> b!45549 (=> res!38531 e!30336)))

(assert (=> b!45549 (= res!38531 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!69867 () tuple2!4446)

(declare-fun lt!69874 () List!535)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1788 BitStream!1788 (_ BitVec 64)) List!535)

(assert (=> b!45549 (= lt!69874 (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_1!2316 lt!69867) lt!69859))))

(declare-fun lt!69873 () tuple2!4446)

(assert (=> b!45549 (= lt!69872 (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_1!2316 lt!69873) (bvsub to!314 i!635)))))

(assert (=> b!45549 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!69859)))

(declare-fun lt!69860 () Unit!3234)

(assert (=> b!45549 (= lt!69860 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!69870)) lt!69859))))

(assert (=> b!45549 (= lt!69867 (reader!0 (_2!2315 lt!69863) (_2!2315 lt!69870)))))

(assert (=> b!45549 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69871 () Unit!3234)

(assert (=> b!45549 (= lt!69871 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1371 (_2!2315 lt!69870)) (bvsub to!314 i!635)))))

(assert (=> b!45549 (= lt!69873 (reader!0 thiss!1379 (_2!2315 lt!69870)))))

(declare-fun b!45550 () Bool)

(assert (=> b!45550 (= e!30335 (array_inv!947 (buf!1371 thiss!1379)))))

(declare-fun b!45551 () Bool)

(assert (=> b!45551 (= e!30329 e!30327)))

(declare-fun res!38525 () Bool)

(assert (=> b!45551 (=> res!38525 e!30327)))

(assert (=> b!45551 (= res!38525 (not (= lt!69868 (bvsub (bvadd lt!69869 to!314) i!635))))))

(assert (=> b!45551 (= lt!69868 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870))))))

(declare-fun b!45552 () Bool)

(declare-fun res!38530 () Bool)

(assert (=> b!45552 (=> res!38530 e!30328)))

(assert (=> b!45552 (= res!38530 (not (invariant!0 (currentBit!2859 (_2!2315 lt!69863)) (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))

(declare-fun b!45553 () Bool)

(declare-fun head!354 (List!535) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1788 array!2271 (_ BitVec 64) (_ BitVec 64)) List!535)

(assert (=> b!45553 (= e!30338 (= (head!354 (byteArrayBitContentToList!0 (_2!2315 lt!69863) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!354 (bitStreamReadBitsIntoList!0 (_2!2315 lt!69863) (_1!2316 lt!69864) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!9166 res!38528) b!45539))

(assert (= (and b!45539 res!38524) b!45540))

(assert (= (and b!45540 (not res!38527)) b!45546))

(assert (= (and b!45546 (not res!38526)) b!45542))

(assert (= (and b!45542 res!38534) b!45553))

(assert (= (and b!45542 (not res!38529)) b!45551))

(assert (= (and b!45551 (not res!38525)) b!45545))

(assert (= (and b!45545 (not res!38523)) b!45543))

(assert (= (and b!45543 (not res!38522)) b!45547))

(assert (= (and b!45547 res!38532) b!45541))

(assert (= (and b!45547 (not res!38533)) b!45548))

(assert (= (and b!45548 (not res!38535)) b!45552))

(assert (= (and b!45552 (not res!38530)) b!45549))

(assert (= (and b!45549 (not res!38531)) b!45544))

(assert (= start!9166 b!45550))

(declare-fun m!69489 () Bool)

(assert (=> b!45546 m!69489))

(declare-fun m!69491 () Bool)

(assert (=> b!45546 m!69491))

(declare-fun m!69493 () Bool)

(assert (=> b!45546 m!69493))

(declare-fun m!69495 () Bool)

(assert (=> b!45546 m!69495))

(declare-fun m!69497 () Bool)

(assert (=> b!45546 m!69497))

(assert (=> b!45546 m!69493))

(declare-fun m!69499 () Bool)

(assert (=> b!45542 m!69499))

(declare-fun m!69501 () Bool)

(assert (=> b!45542 m!69501))

(declare-fun m!69503 () Bool)

(assert (=> b!45542 m!69503))

(declare-fun m!69505 () Bool)

(assert (=> b!45542 m!69505))

(declare-fun m!69507 () Bool)

(assert (=> b!45542 m!69507))

(declare-fun m!69509 () Bool)

(assert (=> b!45542 m!69509))

(declare-fun m!69511 () Bool)

(assert (=> b!45542 m!69511))

(declare-fun m!69513 () Bool)

(assert (=> b!45551 m!69513))

(declare-fun m!69515 () Bool)

(assert (=> b!45545 m!69515))

(declare-fun m!69517 () Bool)

(assert (=> b!45548 m!69517))

(declare-fun m!69519 () Bool)

(assert (=> start!9166 m!69519))

(declare-fun m!69521 () Bool)

(assert (=> start!9166 m!69521))

(declare-fun m!69523 () Bool)

(assert (=> b!45539 m!69523))

(declare-fun m!69525 () Bool)

(assert (=> b!45553 m!69525))

(assert (=> b!45553 m!69525))

(declare-fun m!69527 () Bool)

(assert (=> b!45553 m!69527))

(declare-fun m!69529 () Bool)

(assert (=> b!45553 m!69529))

(assert (=> b!45553 m!69529))

(declare-fun m!69531 () Bool)

(assert (=> b!45553 m!69531))

(declare-fun m!69533 () Bool)

(assert (=> b!45541 m!69533))

(declare-fun m!69535 () Bool)

(assert (=> b!45550 m!69535))

(declare-fun m!69537 () Bool)

(assert (=> b!45540 m!69537))

(declare-fun m!69539 () Bool)

(assert (=> b!45540 m!69539))

(declare-fun m!69541 () Bool)

(assert (=> b!45540 m!69541))

(declare-fun m!69543 () Bool)

(assert (=> b!45552 m!69543))

(declare-fun m!69545 () Bool)

(assert (=> b!45549 m!69545))

(declare-fun m!69547 () Bool)

(assert (=> b!45549 m!69547))

(declare-fun m!69549 () Bool)

(assert (=> b!45549 m!69549))

(declare-fun m!69551 () Bool)

(assert (=> b!45549 m!69551))

(declare-fun m!69553 () Bool)

(assert (=> b!45549 m!69553))

(declare-fun m!69555 () Bool)

(assert (=> b!45549 m!69555))

(declare-fun m!69557 () Bool)

(assert (=> b!45549 m!69557))

(declare-fun m!69559 () Bool)

(assert (=> b!45549 m!69559))

(declare-fun m!69561 () Bool)

(assert (=> b!45544 m!69561))

(check-sat (not b!45551) (not b!45542) (not b!45544) (not b!45548) (not b!45539) (not b!45552) (not b!45545) (not b!45541) (not b!45546) (not b!45540) (not start!9166) (not b!45553) (not b!45550) (not b!45549))
(check-sat)
(get-model)

(declare-fun d!13212 () Bool)

(assert (=> d!13212 (= (invariant!0 (currentBit!2859 (_2!2315 lt!69863)) (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69863)))) (and (bvsge (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (bvslt (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000001000) (bvsge (currentByte!2864 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69863)))) (and (= (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (= (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69863))))))))))

(assert (=> b!45548 d!13212))

(declare-fun d!13214 () Bool)

(declare-fun res!38586 () Bool)

(declare-fun e!30379 () Bool)

(assert (=> d!13214 (=> (not res!38586) (not e!30379))))

(assert (=> d!13214 (= res!38586 (= (size!1022 (buf!1371 thiss!1379)) (size!1022 (buf!1371 (_2!2315 lt!69863)))))))

(assert (=> d!13214 (= (isPrefixOf!0 thiss!1379 (_2!2315 lt!69863)) e!30379)))

(declare-fun b!45605 () Bool)

(declare-fun res!38584 () Bool)

(assert (=> b!45605 (=> (not res!38584) (not e!30379))))

(assert (=> b!45605 (= res!38584 (bvsle (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)) (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863)))))))

(declare-fun b!45606 () Bool)

(declare-fun e!30380 () Bool)

(assert (=> b!45606 (= e!30379 e!30380)))

(declare-fun res!38585 () Bool)

(assert (=> b!45606 (=> res!38585 e!30380)))

(assert (=> b!45606 (= res!38585 (= (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45607 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2271 array!2271 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45607 (= e!30380 (arrayBitRangesEq!0 (buf!1371 thiss!1379) (buf!1371 (_2!2315 lt!69863)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(assert (= (and d!13214 res!38586) b!45605))

(assert (= (and b!45605 res!38584) b!45606))

(assert (= (and b!45606 (not res!38585)) b!45607))

(assert (=> b!45605 m!69541))

(assert (=> b!45605 m!69533))

(assert (=> b!45607 m!69541))

(assert (=> b!45607 m!69541))

(declare-fun m!69637 () Bool)

(assert (=> b!45607 m!69637))

(assert (=> b!45546 d!13214))

(declare-fun d!13216 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13216 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!69859) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863)))) lt!69859))))

(declare-fun bs!3505 () Bool)

(assert (= bs!3505 d!13216))

(declare-fun m!69639 () Bool)

(assert (=> bs!3505 m!69639))

(assert (=> b!45546 d!13216))

(declare-fun d!13218 () Bool)

(declare-fun e!30383 () Bool)

(assert (=> d!13218 e!30383))

(declare-fun res!38589 () Bool)

(assert (=> d!13218 (=> (not res!38589) (not e!30383))))

(assert (=> d!13218 (= res!38589 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!69925 () Unit!3234)

(declare-fun choose!27 (BitStream!1788 BitStream!1788 (_ BitVec 64) (_ BitVec 64)) Unit!3234)

(assert (=> d!13218 (= lt!69925 (choose!27 thiss!1379 (_2!2315 lt!69863) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13218 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13218 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2315 lt!69863) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!69925)))

(declare-fun b!45610 () Bool)

(assert (=> b!45610 (= e!30383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13218 res!38589) b!45610))

(declare-fun m!69641 () Bool)

(assert (=> d!13218 m!69641))

(declare-fun m!69643 () Bool)

(assert (=> b!45610 m!69643))

(assert (=> b!45546 d!13218))

(declare-fun d!13220 () Bool)

(declare-fun e!30395 () Bool)

(assert (=> d!13220 e!30395))

(declare-fun res!38607 () Bool)

(assert (=> d!13220 (=> (not res!38607) (not e!30395))))

(declare-fun lt!69956 () tuple2!4444)

(assert (=> d!13220 (= res!38607 (= (size!1022 (buf!1371 (_2!2315 lt!69956))) (size!1022 (buf!1371 thiss!1379))))))

(declare-fun lt!69960 () (_ BitVec 8))

(declare-fun lt!69957 () array!2271)

(assert (=> d!13220 (= lt!69960 (select (arr!1539 lt!69957) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13220 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1022 lt!69957)))))

(assert (=> d!13220 (= lt!69957 (array!2272 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!69961 () tuple2!4444)

(assert (=> d!13220 (= lt!69956 (tuple2!4445 (_1!2315 lt!69961) (_2!2315 lt!69961)))))

(declare-fun lt!69955 () tuple2!4444)

(assert (=> d!13220 (= lt!69961 lt!69955)))

(declare-fun e!30394 () Bool)

(assert (=> d!13220 e!30394))

(declare-fun res!38606 () Bool)

(assert (=> d!13220 (=> (not res!38606) (not e!30394))))

(assert (=> d!13220 (= res!38606 (= (size!1022 (buf!1371 thiss!1379)) (size!1022 (buf!1371 (_2!2315 lt!69955)))))))

(declare-fun lt!69959 () Bool)

(declare-fun appendBit!0 (BitStream!1788 Bool) tuple2!4444)

(assert (=> d!13220 (= lt!69955 (appendBit!0 thiss!1379 lt!69959))))

(assert (=> d!13220 (= lt!69959 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13220 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13220 (= (appendBitFromByte!0 thiss!1379 (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!69956)))

(declare-fun b!45628 () Bool)

(declare-fun res!38608 () Bool)

(assert (=> b!45628 (=> (not res!38608) (not e!30395))))

(assert (=> b!45628 (= res!38608 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69956)))))

(declare-fun b!45629 () Bool)

(declare-fun res!38609 () Bool)

(assert (=> b!45629 (=> (not res!38609) (not e!30394))))

(assert (=> b!45629 (= res!38609 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69955)))))

(declare-fun b!45630 () Bool)

(declare-fun e!30392 () Bool)

(assert (=> b!45630 (= e!30395 e!30392)))

(declare-fun res!38613 () Bool)

(assert (=> b!45630 (=> (not res!38613) (not e!30392))))

(declare-datatypes ((tuple2!4452 0))(
  ( (tuple2!4453 (_1!2319 BitStream!1788) (_2!2319 Bool)) )
))
(declare-fun lt!69951 () tuple2!4452)

(assert (=> b!45630 (= res!38613 (and (= (_2!2319 lt!69951) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!69960)) #b00000000000000000000000000000000))) (= (_1!2319 lt!69951) (_2!2315 lt!69956))))))

(declare-datatypes ((tuple2!4454 0))(
  ( (tuple2!4455 (_1!2320 array!2271) (_2!2320 BitStream!1788)) )
))
(declare-fun lt!69958 () tuple2!4454)

(declare-fun lt!69952 () BitStream!1788)

(declare-fun readBits!0 (BitStream!1788 (_ BitVec 64)) tuple2!4454)

(assert (=> b!45630 (= lt!69958 (readBits!0 lt!69952 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1788) tuple2!4452)

(assert (=> b!45630 (= lt!69951 (readBitPure!0 lt!69952))))

(declare-fun readerFrom!0 (BitStream!1788 (_ BitVec 32) (_ BitVec 32)) BitStream!1788)

(assert (=> b!45630 (= lt!69952 (readerFrom!0 (_2!2315 lt!69956) (currentBit!2859 thiss!1379) (currentByte!2864 thiss!1379)))))

(declare-fun b!45631 () Bool)

(declare-fun res!38610 () Bool)

(assert (=> b!45631 (=> (not res!38610) (not e!30394))))

(assert (=> b!45631 (= res!38610 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69955))) (currentByte!2864 (_2!2315 lt!69955)) (currentBit!2859 (_2!2315 lt!69955))) (bvadd (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45632 () Bool)

(declare-fun res!38612 () Bool)

(assert (=> b!45632 (=> (not res!38612) (not e!30395))))

(declare-fun lt!69954 () (_ BitVec 64))

(declare-fun lt!69953 () (_ BitVec 64))

(assert (=> b!45632 (= res!38612 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69956))) (currentByte!2864 (_2!2315 lt!69956)) (currentBit!2859 (_2!2315 lt!69956))) (bvadd lt!69953 lt!69954)))))

(assert (=> b!45632 (or (not (= (bvand lt!69953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69954 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!69953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!69953 lt!69954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45632 (= lt!69954 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!45632 (= lt!69953 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(declare-fun b!45633 () Bool)

(declare-fun e!30393 () Bool)

(assert (=> b!45633 (= e!30394 e!30393)))

(declare-fun res!38611 () Bool)

(assert (=> b!45633 (=> (not res!38611) (not e!30393))))

(declare-fun lt!69950 () tuple2!4452)

(assert (=> b!45633 (= res!38611 (and (= (_2!2319 lt!69950) lt!69959) (= (_1!2319 lt!69950) (_2!2315 lt!69955))))))

(assert (=> b!45633 (= lt!69950 (readBitPure!0 (readerFrom!0 (_2!2315 lt!69955) (currentBit!2859 thiss!1379) (currentByte!2864 thiss!1379))))))

(declare-fun b!45634 () Bool)

(assert (=> b!45634 (= e!30393 (= (bitIndex!0 (size!1022 (buf!1371 (_1!2319 lt!69950))) (currentByte!2864 (_1!2319 lt!69950)) (currentBit!2859 (_1!2319 lt!69950))) (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69955))) (currentByte!2864 (_2!2315 lt!69955)) (currentBit!2859 (_2!2315 lt!69955)))))))

(declare-fun b!45635 () Bool)

(assert (=> b!45635 (= e!30392 (= (bitIndex!0 (size!1022 (buf!1371 (_1!2319 lt!69951))) (currentByte!2864 (_1!2319 lt!69951)) (currentBit!2859 (_1!2319 lt!69951))) (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69956))) (currentByte!2864 (_2!2315 lt!69956)) (currentBit!2859 (_2!2315 lt!69956)))))))

(assert (= (and d!13220 res!38606) b!45631))

(assert (= (and b!45631 res!38610) b!45629))

(assert (= (and b!45629 res!38609) b!45633))

(assert (= (and b!45633 res!38611) b!45634))

(assert (= (and d!13220 res!38607) b!45632))

(assert (= (and b!45632 res!38612) b!45628))

(assert (= (and b!45628 res!38608) b!45630))

(assert (= (and b!45630 res!38613) b!45635))

(declare-fun m!69645 () Bool)

(assert (=> b!45630 m!69645))

(declare-fun m!69647 () Bool)

(assert (=> b!45630 m!69647))

(declare-fun m!69649 () Bool)

(assert (=> b!45630 m!69649))

(declare-fun m!69651 () Bool)

(assert (=> b!45628 m!69651))

(declare-fun m!69653 () Bool)

(assert (=> b!45634 m!69653))

(declare-fun m!69655 () Bool)

(assert (=> b!45634 m!69655))

(declare-fun m!69657 () Bool)

(assert (=> b!45635 m!69657))

(declare-fun m!69659 () Bool)

(assert (=> b!45635 m!69659))

(declare-fun m!69661 () Bool)

(assert (=> b!45629 m!69661))

(declare-fun m!69663 () Bool)

(assert (=> d!13220 m!69663))

(declare-fun m!69665 () Bool)

(assert (=> d!13220 m!69665))

(declare-fun m!69667 () Bool)

(assert (=> d!13220 m!69667))

(assert (=> b!45632 m!69659))

(assert (=> b!45632 m!69541))

(declare-fun m!69669 () Bool)

(assert (=> b!45633 m!69669))

(assert (=> b!45633 m!69669))

(declare-fun m!69671 () Bool)

(assert (=> b!45633 m!69671))

(assert (=> b!45631 m!69655))

(assert (=> b!45631 m!69541))

(assert (=> b!45546 d!13220))

(declare-fun d!13222 () Bool)

(declare-fun res!38616 () Bool)

(declare-fun e!30396 () Bool)

(assert (=> d!13222 (=> (not res!38616) (not e!30396))))

(assert (=> d!13222 (= res!38616 (= (size!1022 (buf!1371 thiss!1379)) (size!1022 (buf!1371 thiss!1379))))))

(assert (=> d!13222 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30396)))

(declare-fun b!45636 () Bool)

(declare-fun res!38614 () Bool)

(assert (=> b!45636 (=> (not res!38614) (not e!30396))))

(assert (=> b!45636 (= res!38614 (bvsle (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)) (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(declare-fun b!45637 () Bool)

(declare-fun e!30397 () Bool)

(assert (=> b!45637 (= e!30396 e!30397)))

(declare-fun res!38615 () Bool)

(assert (=> b!45637 (=> res!38615 e!30397)))

(assert (=> b!45637 (= res!38615 (= (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45638 () Bool)

(assert (=> b!45638 (= e!30397 (arrayBitRangesEq!0 (buf!1371 thiss!1379) (buf!1371 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(assert (= (and d!13222 res!38616) b!45636))

(assert (= (and b!45636 res!38614) b!45637))

(assert (= (and b!45637 (not res!38615)) b!45638))

(assert (=> b!45636 m!69541))

(assert (=> b!45636 m!69541))

(assert (=> b!45638 m!69541))

(assert (=> b!45638 m!69541))

(declare-fun m!69673 () Bool)

(assert (=> b!45638 m!69673))

(assert (=> b!45540 d!13222))

(declare-fun d!13224 () Bool)

(assert (=> d!13224 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69964 () Unit!3234)

(declare-fun choose!11 (BitStream!1788) Unit!3234)

(assert (=> d!13224 (= lt!69964 (choose!11 thiss!1379))))

(assert (=> d!13224 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!69964)))

(declare-fun bs!3507 () Bool)

(assert (= bs!3507 d!13224))

(assert (=> bs!3507 m!69537))

(declare-fun m!69675 () Bool)

(assert (=> bs!3507 m!69675))

(assert (=> b!45540 d!13224))

(declare-fun d!13226 () Bool)

(declare-fun e!30400 () Bool)

(assert (=> d!13226 e!30400))

(declare-fun res!38622 () Bool)

(assert (=> d!13226 (=> (not res!38622) (not e!30400))))

(declare-fun lt!69981 () (_ BitVec 64))

(declare-fun lt!69982 () (_ BitVec 64))

(declare-fun lt!69979 () (_ BitVec 64))

(assert (=> d!13226 (= res!38622 (= lt!69982 (bvsub lt!69979 lt!69981)))))

(assert (=> d!13226 (or (= (bvand lt!69979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69979 lt!69981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13226 (= lt!69981 (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379))))))

(declare-fun lt!69977 () (_ BitVec 64))

(declare-fun lt!69980 () (_ BitVec 64))

(assert (=> d!13226 (= lt!69979 (bvmul lt!69977 lt!69980))))

(assert (=> d!13226 (or (= lt!69977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!69980 (bvsdiv (bvmul lt!69977 lt!69980) lt!69977)))))

(assert (=> d!13226 (= lt!69980 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13226 (= lt!69977 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))))))

(assert (=> d!13226 (= lt!69982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2864 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2859 thiss!1379))))))

(assert (=> d!13226 (invariant!0 (currentBit!2859 thiss!1379) (currentByte!2864 thiss!1379) (size!1022 (buf!1371 thiss!1379)))))

(assert (=> d!13226 (= (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)) lt!69982)))

(declare-fun b!45643 () Bool)

(declare-fun res!38621 () Bool)

(assert (=> b!45643 (=> (not res!38621) (not e!30400))))

(assert (=> b!45643 (= res!38621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!69982))))

(declare-fun b!45644 () Bool)

(declare-fun lt!69978 () (_ BitVec 64))

(assert (=> b!45644 (= e!30400 (bvsle lt!69982 (bvmul lt!69978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45644 (or (= lt!69978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!69978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!69978)))))

(assert (=> b!45644 (= lt!69978 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))))))

(assert (= (and d!13226 res!38622) b!45643))

(assert (= (and b!45643 res!38621) b!45644))

(declare-fun m!69677 () Bool)

(assert (=> d!13226 m!69677))

(declare-fun m!69679 () Bool)

(assert (=> d!13226 m!69679))

(assert (=> b!45540 d!13226))

(declare-fun d!13228 () Bool)

(declare-fun e!30401 () Bool)

(assert (=> d!13228 e!30401))

(declare-fun res!38624 () Bool)

(assert (=> d!13228 (=> (not res!38624) (not e!30401))))

(declare-fun lt!69987 () (_ BitVec 64))

(declare-fun lt!69988 () (_ BitVec 64))

(declare-fun lt!69985 () (_ BitVec 64))

(assert (=> d!13228 (= res!38624 (= lt!69988 (bvsub lt!69985 lt!69987)))))

(assert (=> d!13228 (or (= (bvand lt!69985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!69987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!69985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!69985 lt!69987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13228 (= lt!69987 (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69870))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69870)))))))

(declare-fun lt!69983 () (_ BitVec 64))

(declare-fun lt!69986 () (_ BitVec 64))

(assert (=> d!13228 (= lt!69985 (bvmul lt!69983 lt!69986))))

(assert (=> d!13228 (or (= lt!69983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!69986 (bvsdiv (bvmul lt!69983 lt!69986) lt!69983)))))

(assert (=> d!13228 (= lt!69986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13228 (= lt!69983 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))))))

(assert (=> d!13228 (= lt!69988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69870))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69870)))))))

(assert (=> d!13228 (invariant!0 (currentBit!2859 (_2!2315 lt!69870)) (currentByte!2864 (_2!2315 lt!69870)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))

(assert (=> d!13228 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870))) lt!69988)))

(declare-fun b!45645 () Bool)

(declare-fun res!38623 () Bool)

(assert (=> b!45645 (=> (not res!38623) (not e!30401))))

(assert (=> b!45645 (= res!38623 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!69988))))

(declare-fun b!45646 () Bool)

(declare-fun lt!69984 () (_ BitVec 64))

(assert (=> b!45646 (= e!30401 (bvsle lt!69988 (bvmul lt!69984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45646 (or (= lt!69984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!69984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!69984)))))

(assert (=> b!45646 (= lt!69984 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))))))

(assert (= (and d!13228 res!38624) b!45645))

(assert (= (and b!45645 res!38623) b!45646))

(declare-fun m!69681 () Bool)

(assert (=> d!13228 m!69681))

(assert (=> d!13228 m!69515))

(assert (=> b!45551 d!13228))

(declare-fun d!13230 () Bool)

(assert (=> d!13230 (= (array_inv!947 (buf!1371 thiss!1379)) (bvsge (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!45550 d!13230))

(declare-fun d!13232 () Bool)

(assert (=> d!13232 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 thiss!1379))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3508 () Bool)

(assert (= bs!3508 d!13232))

(assert (=> bs!3508 m!69677))

(assert (=> b!45539 d!13232))

(declare-fun d!13234 () Bool)

(assert (=> d!13234 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3509 () Bool)

(assert (= bs!3509 d!13234))

(declare-fun m!69683 () Bool)

(assert (=> bs!3509 m!69683))

(assert (=> b!45549 d!13234))

(declare-fun d!13236 () Bool)

(assert (=> d!13236 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69991 () Unit!3234)

(declare-fun choose!9 (BitStream!1788 array!2271 (_ BitVec 64) BitStream!1788) Unit!3234)

(assert (=> d!13236 (= lt!69991 (choose!9 thiss!1379 (buf!1371 (_2!2315 lt!69870)) (bvsub to!314 i!635) (BitStream!1789 (buf!1371 (_2!2315 lt!69870)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(assert (=> d!13236 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1371 (_2!2315 lt!69870)) (bvsub to!314 i!635)) lt!69991)))

(declare-fun bs!3510 () Bool)

(assert (= bs!3510 d!13236))

(assert (=> bs!3510 m!69545))

(declare-fun m!69685 () Bool)

(assert (=> bs!3510 m!69685))

(assert (=> b!45549 d!13236))

(declare-fun b!45675 () Bool)

(declare-fun e!30416 () Unit!3234)

(declare-fun lt!70054 () Unit!3234)

(assert (=> b!45675 (= e!30416 lt!70054)))

(declare-fun lt!70053 () (_ BitVec 64))

(assert (=> b!45675 (= lt!70053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70043 () (_ BitVec 64))

(assert (=> b!45675 (= lt!70043 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2271 array!2271 (_ BitVec 64) (_ BitVec 64)) Unit!3234)

(assert (=> b!45675 (= lt!70054 (arrayBitRangesEqSymmetric!0 (buf!1371 thiss!1379) (buf!1371 (_2!2315 lt!69870)) lt!70053 lt!70043))))

(assert (=> b!45675 (arrayBitRangesEq!0 (buf!1371 (_2!2315 lt!69870)) (buf!1371 thiss!1379) lt!70053 lt!70043)))

(declare-fun b!45676 () Bool)

(declare-fun Unit!3238 () Unit!3234)

(assert (=> b!45676 (= e!30416 Unit!3238)))

(declare-fun b!45677 () Bool)

(declare-fun res!38632 () Bool)

(declare-fun e!30415 () Bool)

(assert (=> b!45677 (=> (not res!38632) (not e!30415))))

(declare-fun lt!70044 () tuple2!4446)

(assert (=> b!45677 (= res!38632 (isPrefixOf!0 (_1!2316 lt!70044) thiss!1379))))

(declare-fun d!13238 () Bool)

(assert (=> d!13238 e!30415))

(declare-fun res!38633 () Bool)

(assert (=> d!13238 (=> (not res!38633) (not e!30415))))

(assert (=> d!13238 (= res!38633 (isPrefixOf!0 (_1!2316 lt!70044) (_2!2316 lt!70044)))))

(declare-fun lt!70049 () BitStream!1788)

(assert (=> d!13238 (= lt!70044 (tuple2!4447 lt!70049 (_2!2315 lt!69870)))))

(declare-fun lt!70047 () Unit!3234)

(declare-fun lt!70059 () Unit!3234)

(assert (=> d!13238 (= lt!70047 lt!70059)))

(assert (=> d!13238 (isPrefixOf!0 lt!70049 (_2!2315 lt!69870))))

(assert (=> d!13238 (= lt!70059 (lemmaIsPrefixTransitive!0 lt!70049 (_2!2315 lt!69870) (_2!2315 lt!69870)))))

(declare-fun lt!70051 () Unit!3234)

(declare-fun lt!70060 () Unit!3234)

(assert (=> d!13238 (= lt!70051 lt!70060)))

(assert (=> d!13238 (isPrefixOf!0 lt!70049 (_2!2315 lt!69870))))

(assert (=> d!13238 (= lt!70060 (lemmaIsPrefixTransitive!0 lt!70049 thiss!1379 (_2!2315 lt!69870)))))

(declare-fun lt!70045 () Unit!3234)

(assert (=> d!13238 (= lt!70045 e!30416)))

(declare-fun c!3060 () Bool)

(assert (=> d!13238 (= c!3060 (not (= (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!70057 () Unit!3234)

(declare-fun lt!70046 () Unit!3234)

(assert (=> d!13238 (= lt!70057 lt!70046)))

(assert (=> d!13238 (isPrefixOf!0 (_2!2315 lt!69870) (_2!2315 lt!69870))))

(assert (=> d!13238 (= lt!70046 (lemmaIsPrefixRefl!0 (_2!2315 lt!69870)))))

(declare-fun lt!70052 () Unit!3234)

(declare-fun lt!70042 () Unit!3234)

(assert (=> d!13238 (= lt!70052 lt!70042)))

(assert (=> d!13238 (= lt!70042 (lemmaIsPrefixRefl!0 (_2!2315 lt!69870)))))

(declare-fun lt!70055 () Unit!3234)

(declare-fun lt!70050 () Unit!3234)

(assert (=> d!13238 (= lt!70055 lt!70050)))

(assert (=> d!13238 (isPrefixOf!0 lt!70049 lt!70049)))

(assert (=> d!13238 (= lt!70050 (lemmaIsPrefixRefl!0 lt!70049))))

(declare-fun lt!70041 () Unit!3234)

(declare-fun lt!70058 () Unit!3234)

(assert (=> d!13238 (= lt!70041 lt!70058)))

(assert (=> d!13238 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13238 (= lt!70058 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13238 (= lt!70049 (BitStream!1789 (buf!1371 (_2!2315 lt!69870)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(assert (=> d!13238 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69870))))

(assert (=> d!13238 (= (reader!0 thiss!1379 (_2!2315 lt!69870)) lt!70044)))

(declare-fun b!45678 () Bool)

(declare-fun lt!70056 () (_ BitVec 64))

(declare-fun lt!70048 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1788 (_ BitVec 64)) BitStream!1788)

(assert (=> b!45678 (= e!30415 (= (_1!2316 lt!70044) (withMovedBitIndex!0 (_2!2316 lt!70044) (bvsub lt!70056 lt!70048))))))

(assert (=> b!45678 (or (= (bvand lt!70056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70056 lt!70048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45678 (= lt!70048 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870))))))

(assert (=> b!45678 (= lt!70056 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(declare-fun b!45679 () Bool)

(declare-fun res!38631 () Bool)

(assert (=> b!45679 (=> (not res!38631) (not e!30415))))

(assert (=> b!45679 (= res!38631 (isPrefixOf!0 (_2!2316 lt!70044) (_2!2315 lt!69870)))))

(assert (= (and d!13238 c!3060) b!45675))

(assert (= (and d!13238 (not c!3060)) b!45676))

(assert (= (and d!13238 res!38633) b!45677))

(assert (= (and b!45677 res!38632) b!45679))

(assert (= (and b!45679 res!38631) b!45678))

(declare-fun m!69701 () Bool)

(assert (=> b!45677 m!69701))

(assert (=> b!45675 m!69541))

(declare-fun m!69703 () Bool)

(assert (=> b!45675 m!69703))

(declare-fun m!69705 () Bool)

(assert (=> b!45675 m!69705))

(declare-fun m!69707 () Bool)

(assert (=> b!45679 m!69707))

(declare-fun m!69709 () Bool)

(assert (=> b!45678 m!69709))

(assert (=> b!45678 m!69513))

(assert (=> b!45678 m!69541))

(declare-fun m!69711 () Bool)

(assert (=> d!13238 m!69711))

(declare-fun m!69713 () Bool)

(assert (=> d!13238 m!69713))

(assert (=> d!13238 m!69537))

(declare-fun m!69715 () Bool)

(assert (=> d!13238 m!69715))

(declare-fun m!69717 () Bool)

(assert (=> d!13238 m!69717))

(assert (=> d!13238 m!69539))

(declare-fun m!69719 () Bool)

(assert (=> d!13238 m!69719))

(assert (=> d!13238 m!69503))

(declare-fun m!69721 () Bool)

(assert (=> d!13238 m!69721))

(declare-fun m!69723 () Bool)

(assert (=> d!13238 m!69723))

(declare-fun m!69725 () Bool)

(assert (=> d!13238 m!69725))

(assert (=> b!45549 d!13238))

(declare-fun d!13256 () Bool)

(declare-fun e!30425 () Bool)

(assert (=> d!13256 e!30425))

(declare-fun c!3066 () Bool)

(assert (=> d!13256 (= c!3066 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70087 () List!535)

(declare-datatypes ((tuple2!4456 0))(
  ( (tuple2!4457 (_1!2321 List!535) (_2!2321 BitStream!1788)) )
))
(declare-fun e!30424 () tuple2!4456)

(assert (=> d!13256 (= lt!70087 (_1!2321 e!30424))))

(declare-fun c!3065 () Bool)

(assert (=> d!13256 (= c!3065 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13256 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13256 (= (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_1!2316 lt!69873) (bvsub to!314 i!635)) lt!70087)))

(declare-fun b!45697 () Bool)

(assert (=> b!45697 (= e!30425 (> (length!230 lt!70087) 0))))

(declare-fun b!45696 () Bool)

(declare-fun isEmpty!131 (List!535) Bool)

(assert (=> b!45696 (= e!30425 (isEmpty!131 lt!70087))))

(declare-fun lt!70085 () (_ BitVec 64))

(declare-fun b!45695 () Bool)

(declare-datatypes ((tuple2!4458 0))(
  ( (tuple2!4459 (_1!2322 Bool) (_2!2322 BitStream!1788)) )
))
(declare-fun lt!70086 () tuple2!4458)

(assert (=> b!45695 (= e!30424 (tuple2!4457 (Cons!531 (_1!2322 lt!70086) (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_2!2322 lt!70086) (bvsub (bvsub to!314 i!635) lt!70085))) (_2!2322 lt!70086)))))

(declare-fun readBit!0 (BitStream!1788) tuple2!4458)

(assert (=> b!45695 (= lt!70086 (readBit!0 (_1!2316 lt!69873)))))

(assert (=> b!45695 (= lt!70085 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45694 () Bool)

(assert (=> b!45694 (= e!30424 (tuple2!4457 Nil!532 (_1!2316 lt!69873)))))

(assert (= (and d!13256 c!3065) b!45694))

(assert (= (and d!13256 (not c!3065)) b!45695))

(assert (= (and d!13256 c!3066) b!45696))

(assert (= (and d!13256 (not c!3066)) b!45697))

(declare-fun m!69729 () Bool)

(assert (=> b!45697 m!69729))

(declare-fun m!69731 () Bool)

(assert (=> b!45696 m!69731))

(declare-fun m!69733 () Bool)

(assert (=> b!45695 m!69733))

(declare-fun m!69735 () Bool)

(assert (=> b!45695 m!69735))

(assert (=> b!45549 d!13256))

(declare-fun b!45698 () Bool)

(declare-fun e!30427 () Unit!3234)

(declare-fun lt!70101 () Unit!3234)

(assert (=> b!45698 (= e!30427 lt!70101)))

(declare-fun lt!70100 () (_ BitVec 64))

(assert (=> b!45698 (= lt!70100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70090 () (_ BitVec 64))

(assert (=> b!45698 (= lt!70090 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(assert (=> b!45698 (= lt!70101 (arrayBitRangesEqSymmetric!0 (buf!1371 (_2!2315 lt!69863)) (buf!1371 (_2!2315 lt!69870)) lt!70100 lt!70090))))

(assert (=> b!45698 (arrayBitRangesEq!0 (buf!1371 (_2!2315 lt!69870)) (buf!1371 (_2!2315 lt!69863)) lt!70100 lt!70090)))

(declare-fun b!45699 () Bool)

(declare-fun Unit!3239 () Unit!3234)

(assert (=> b!45699 (= e!30427 Unit!3239)))

(declare-fun b!45700 () Bool)

(declare-fun res!38641 () Bool)

(declare-fun e!30426 () Bool)

(assert (=> b!45700 (=> (not res!38641) (not e!30426))))

(declare-fun lt!70091 () tuple2!4446)

(assert (=> b!45700 (= res!38641 (isPrefixOf!0 (_1!2316 lt!70091) (_2!2315 lt!69863)))))

(declare-fun d!13262 () Bool)

(assert (=> d!13262 e!30426))

(declare-fun res!38642 () Bool)

(assert (=> d!13262 (=> (not res!38642) (not e!30426))))

(assert (=> d!13262 (= res!38642 (isPrefixOf!0 (_1!2316 lt!70091) (_2!2316 lt!70091)))))

(declare-fun lt!70096 () BitStream!1788)

(assert (=> d!13262 (= lt!70091 (tuple2!4447 lt!70096 (_2!2315 lt!69870)))))

(declare-fun lt!70094 () Unit!3234)

(declare-fun lt!70106 () Unit!3234)

(assert (=> d!13262 (= lt!70094 lt!70106)))

(assert (=> d!13262 (isPrefixOf!0 lt!70096 (_2!2315 lt!69870))))

(assert (=> d!13262 (= lt!70106 (lemmaIsPrefixTransitive!0 lt!70096 (_2!2315 lt!69870) (_2!2315 lt!69870)))))

(declare-fun lt!70098 () Unit!3234)

(declare-fun lt!70107 () Unit!3234)

(assert (=> d!13262 (= lt!70098 lt!70107)))

(assert (=> d!13262 (isPrefixOf!0 lt!70096 (_2!2315 lt!69870))))

(assert (=> d!13262 (= lt!70107 (lemmaIsPrefixTransitive!0 lt!70096 (_2!2315 lt!69863) (_2!2315 lt!69870)))))

(declare-fun lt!70092 () Unit!3234)

(assert (=> d!13262 (= lt!70092 e!30427)))

(declare-fun c!3067 () Bool)

(assert (=> d!13262 (= c!3067 (not (= (size!1022 (buf!1371 (_2!2315 lt!69863))) #b00000000000000000000000000000000)))))

(declare-fun lt!70104 () Unit!3234)

(declare-fun lt!70093 () Unit!3234)

(assert (=> d!13262 (= lt!70104 lt!70093)))

(assert (=> d!13262 (isPrefixOf!0 (_2!2315 lt!69870) (_2!2315 lt!69870))))

(assert (=> d!13262 (= lt!70093 (lemmaIsPrefixRefl!0 (_2!2315 lt!69870)))))

(declare-fun lt!70099 () Unit!3234)

(declare-fun lt!70089 () Unit!3234)

(assert (=> d!13262 (= lt!70099 lt!70089)))

(assert (=> d!13262 (= lt!70089 (lemmaIsPrefixRefl!0 (_2!2315 lt!69870)))))

(declare-fun lt!70102 () Unit!3234)

(declare-fun lt!70097 () Unit!3234)

(assert (=> d!13262 (= lt!70102 lt!70097)))

(assert (=> d!13262 (isPrefixOf!0 lt!70096 lt!70096)))

(assert (=> d!13262 (= lt!70097 (lemmaIsPrefixRefl!0 lt!70096))))

(declare-fun lt!70088 () Unit!3234)

(declare-fun lt!70105 () Unit!3234)

(assert (=> d!13262 (= lt!70088 lt!70105)))

(assert (=> d!13262 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69863))))

(assert (=> d!13262 (= lt!70105 (lemmaIsPrefixRefl!0 (_2!2315 lt!69863)))))

(assert (=> d!13262 (= lt!70096 (BitStream!1789 (buf!1371 (_2!2315 lt!69870)) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(assert (=> d!13262 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69870))))

(assert (=> d!13262 (= (reader!0 (_2!2315 lt!69863) (_2!2315 lt!69870)) lt!70091)))

(declare-fun b!45701 () Bool)

(declare-fun lt!70095 () (_ BitVec 64))

(declare-fun lt!70103 () (_ BitVec 64))

(assert (=> b!45701 (= e!30426 (= (_1!2316 lt!70091) (withMovedBitIndex!0 (_2!2316 lt!70091) (bvsub lt!70103 lt!70095))))))

(assert (=> b!45701 (or (= (bvand lt!70103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70103 lt!70095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45701 (= lt!70095 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870))))))

(assert (=> b!45701 (= lt!70103 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(declare-fun b!45702 () Bool)

(declare-fun res!38640 () Bool)

(assert (=> b!45702 (=> (not res!38640) (not e!30426))))

(assert (=> b!45702 (= res!38640 (isPrefixOf!0 (_2!2316 lt!70091) (_2!2315 lt!69870)))))

(assert (= (and d!13262 c!3067) b!45698))

(assert (= (and d!13262 (not c!3067)) b!45699))

(assert (= (and d!13262 res!38642) b!45700))

(assert (= (and b!45700 res!38641) b!45702))

(assert (= (and b!45702 res!38640) b!45701))

(declare-fun m!69737 () Bool)

(assert (=> b!45700 m!69737))

(assert (=> b!45698 m!69533))

(declare-fun m!69739 () Bool)

(assert (=> b!45698 m!69739))

(declare-fun m!69741 () Bool)

(assert (=> b!45698 m!69741))

(declare-fun m!69743 () Bool)

(assert (=> b!45702 m!69743))

(declare-fun m!69745 () Bool)

(assert (=> b!45701 m!69745))

(assert (=> b!45701 m!69513))

(assert (=> b!45701 m!69533))

(declare-fun m!69747 () Bool)

(assert (=> d!13262 m!69747))

(declare-fun m!69749 () Bool)

(assert (=> d!13262 m!69749))

(declare-fun m!69751 () Bool)

(assert (=> d!13262 m!69751))

(declare-fun m!69753 () Bool)

(assert (=> d!13262 m!69753))

(declare-fun m!69755 () Bool)

(assert (=> d!13262 m!69755))

(declare-fun m!69757 () Bool)

(assert (=> d!13262 m!69757))

(assert (=> d!13262 m!69719))

(assert (=> d!13262 m!69499))

(declare-fun m!69759 () Bool)

(assert (=> d!13262 m!69759))

(declare-fun m!69761 () Bool)

(assert (=> d!13262 m!69761))

(assert (=> d!13262 m!69725))

(assert (=> b!45549 d!13262))

(declare-fun d!13264 () Bool)

(assert (=> d!13264 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!69859) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863)))) lt!69859))))

(declare-fun bs!3512 () Bool)

(assert (= bs!3512 d!13264))

(declare-fun m!69763 () Bool)

(assert (=> bs!3512 m!69763))

(assert (=> b!45549 d!13264))

(declare-fun d!13266 () Bool)

(assert (=> d!13266 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69870)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!69859)))

(declare-fun lt!70108 () Unit!3234)

(assert (=> d!13266 (= lt!70108 (choose!9 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!69870)) lt!69859 (BitStream!1789 (buf!1371 (_2!2315 lt!69870)) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863)))))))

(assert (=> d!13266 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!69870)) lt!69859) lt!70108)))

(declare-fun bs!3513 () Bool)

(assert (= bs!3513 d!13266))

(assert (=> bs!3513 m!69557))

(declare-fun m!69765 () Bool)

(assert (=> bs!3513 m!69765))

(assert (=> b!45549 d!13266))

(declare-fun d!13268 () Bool)

(declare-fun e!30429 () Bool)

(assert (=> d!13268 e!30429))

(declare-fun c!3069 () Bool)

(assert (=> d!13268 (= c!3069 (= lt!69859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70111 () List!535)

(declare-fun e!30428 () tuple2!4456)

(assert (=> d!13268 (= lt!70111 (_1!2321 e!30428))))

(declare-fun c!3068 () Bool)

(assert (=> d!13268 (= c!3068 (= lt!69859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13268 (bvsge lt!69859 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13268 (= (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_1!2316 lt!69867) lt!69859) lt!70111)))

(declare-fun b!45706 () Bool)

(assert (=> b!45706 (= e!30429 (> (length!230 lt!70111) 0))))

(declare-fun b!45705 () Bool)

(assert (=> b!45705 (= e!30429 (isEmpty!131 lt!70111))))

(declare-fun lt!70109 () (_ BitVec 64))

(declare-fun lt!70110 () tuple2!4458)

(declare-fun b!45704 () Bool)

(assert (=> b!45704 (= e!30428 (tuple2!4457 (Cons!531 (_1!2322 lt!70110) (bitStreamReadBitsIntoList!0 (_2!2315 lt!69870) (_2!2322 lt!70110) (bvsub lt!69859 lt!70109))) (_2!2322 lt!70110)))))

(assert (=> b!45704 (= lt!70110 (readBit!0 (_1!2316 lt!69867)))))

(assert (=> b!45704 (= lt!70109 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45703 () Bool)

(assert (=> b!45703 (= e!30428 (tuple2!4457 Nil!532 (_1!2316 lt!69867)))))

(assert (= (and d!13268 c!3068) b!45703))

(assert (= (and d!13268 (not c!3068)) b!45704))

(assert (= (and d!13268 c!3069) b!45705))

(assert (= (and d!13268 (not c!3069)) b!45706))

(declare-fun m!69767 () Bool)

(assert (=> b!45706 m!69767))

(declare-fun m!69769 () Bool)

(assert (=> b!45705 m!69769))

(declare-fun m!69771 () Bool)

(assert (=> b!45704 m!69771))

(declare-fun m!69773 () Bool)

(assert (=> b!45704 m!69773))

(assert (=> b!45549 d!13268))

(declare-fun d!13270 () Bool)

(declare-fun res!38645 () Bool)

(declare-fun e!30430 () Bool)

(assert (=> d!13270 (=> (not res!38645) (not e!30430))))

(assert (=> d!13270 (= res!38645 (= (size!1022 (buf!1371 thiss!1379)) (size!1022 (buf!1371 (_2!2315 lt!69870)))))))

(assert (=> d!13270 (= (isPrefixOf!0 thiss!1379 (_2!2315 lt!69870)) e!30430)))

(declare-fun b!45707 () Bool)

(declare-fun res!38643 () Bool)

(assert (=> b!45707 (=> (not res!38643) (not e!30430))))

(assert (=> b!45707 (= res!38643 (bvsle (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)) (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870)))))))

(declare-fun b!45708 () Bool)

(declare-fun e!30431 () Bool)

(assert (=> b!45708 (= e!30430 e!30431)))

(declare-fun res!38644 () Bool)

(assert (=> b!45708 (=> res!38644 e!30431)))

(assert (=> b!45708 (= res!38644 (= (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45709 () Bool)

(assert (=> b!45709 (= e!30431 (arrayBitRangesEq!0 (buf!1371 thiss!1379) (buf!1371 (_2!2315 lt!69870)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(assert (= (and d!13270 res!38645) b!45707))

(assert (= (and b!45707 res!38643) b!45708))

(assert (= (and b!45708 (not res!38644)) b!45709))

(assert (=> b!45707 m!69541))

(assert (=> b!45707 m!69513))

(assert (=> b!45709 m!69541))

(assert (=> b!45709 m!69541))

(declare-fun m!69775 () Bool)

(assert (=> b!45709 m!69775))

(assert (=> b!45542 d!13270))

(declare-fun b!45873 () Bool)

(declare-fun e!30510 () tuple2!4444)

(declare-fun lt!70572 () tuple2!4444)

(declare-fun Unit!3240 () Unit!3234)

(assert (=> b!45873 (= e!30510 (tuple2!4445 Unit!3240 (_2!2315 lt!70572)))))

(declare-fun lt!70569 () tuple2!4444)

(assert (=> b!45873 (= lt!70569 (appendBitFromByte!0 (_2!2315 lt!69863) (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!70600 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70600 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70610 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70610 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70583 () Unit!3234)

(assert (=> b!45873 (= lt!70583 (validateOffsetBitsIneqLemma!0 (_2!2315 lt!69863) (_2!2315 lt!70569) lt!70600 lt!70610))))

(assert (=> b!45873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!70569)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!70569))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!70569))) (bvsub lt!70600 lt!70610))))

(declare-fun lt!70590 () Unit!3234)

(assert (=> b!45873 (= lt!70590 lt!70583)))

(declare-fun lt!70598 () tuple2!4446)

(assert (=> b!45873 (= lt!70598 (reader!0 (_2!2315 lt!69863) (_2!2315 lt!70569)))))

(declare-fun lt!70589 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70589 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70603 () Unit!3234)

(assert (=> b!45873 (= lt!70603 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!70569)) lt!70589))))

(assert (=> b!45873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!70569)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!70589)))

(declare-fun lt!70580 () Unit!3234)

(assert (=> b!45873 (= lt!70580 lt!70603)))

(assert (=> b!45873 (= (head!354 (byteArrayBitContentToList!0 (_2!2315 lt!70569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!354 (bitStreamReadBitsIntoList!0 (_2!2315 lt!70569) (_1!2316 lt!70598) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70571 () Unit!3234)

(declare-fun Unit!3241 () Unit!3234)

(assert (=> b!45873 (= lt!70571 Unit!3241)))

(assert (=> b!45873 (= lt!70572 (appendBitsMSBFirstLoop!0 (_2!2315 lt!70569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!70579 () Unit!3234)

(assert (=> b!45873 (= lt!70579 (lemmaIsPrefixTransitive!0 (_2!2315 lt!69863) (_2!2315 lt!70569) (_2!2315 lt!70572)))))

(assert (=> b!45873 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!70572))))

(declare-fun lt!70576 () Unit!3234)

(assert (=> b!45873 (= lt!70576 lt!70579)))

(assert (=> b!45873 (= (size!1022 (buf!1371 (_2!2315 lt!70572))) (size!1022 (buf!1371 (_2!2315 lt!69863))))))

(declare-fun lt!70612 () Unit!3234)

(declare-fun Unit!3242 () Unit!3234)

(assert (=> b!45873 (= lt!70612 Unit!3242)))

(assert (=> b!45873 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!70572))) (currentByte!2864 (_2!2315 lt!70572)) (currentBit!2859 (_2!2315 lt!70572))) (bvsub (bvadd (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70574 () Unit!3234)

(declare-fun Unit!3243 () Unit!3234)

(assert (=> b!45873 (= lt!70574 Unit!3243)))

(assert (=> b!45873 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!70572))) (currentByte!2864 (_2!2315 lt!70572)) (currentBit!2859 (_2!2315 lt!70572))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!70569))) (currentByte!2864 (_2!2315 lt!70569)) (currentBit!2859 (_2!2315 lt!70569))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70597 () Unit!3234)

(declare-fun Unit!3244 () Unit!3234)

(assert (=> b!45873 (= lt!70597 Unit!3244)))

(declare-fun lt!70595 () tuple2!4446)

(declare-fun call!550 () tuple2!4446)

(assert (=> b!45873 (= lt!70595 call!550)))

(declare-fun lt!70587 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70587 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70585 () Unit!3234)

(assert (=> b!45873 (= lt!70585 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!70572)) lt!70587))))

(assert (=> b!45873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!70572)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!70587)))

(declare-fun lt!70581 () Unit!3234)

(assert (=> b!45873 (= lt!70581 lt!70585)))

(declare-fun lt!70604 () tuple2!4446)

(assert (=> b!45873 (= lt!70604 (reader!0 (_2!2315 lt!70569) (_2!2315 lt!70572)))))

(declare-fun lt!70596 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70596 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70611 () Unit!3234)

(assert (=> b!45873 (= lt!70611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!70569) (buf!1371 (_2!2315 lt!70572)) lt!70596))))

(assert (=> b!45873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!70572)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!70569))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!70569))) lt!70596)))

(declare-fun lt!70575 () Unit!3234)

(assert (=> b!45873 (= lt!70575 lt!70611)))

(declare-fun lt!70599 () List!535)

(assert (=> b!45873 (= lt!70599 (byteArrayBitContentToList!0 (_2!2315 lt!70572) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70602 () List!535)

(assert (=> b!45873 (= lt!70602 (byteArrayBitContentToList!0 (_2!2315 lt!70572) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70586 () List!535)

(assert (=> b!45873 (= lt!70586 (bitStreamReadBitsIntoList!0 (_2!2315 lt!70572) (_1!2316 lt!70595) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70605 () List!535)

(assert (=> b!45873 (= lt!70605 (bitStreamReadBitsIntoList!0 (_2!2315 lt!70572) (_1!2316 lt!70604) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70591 () (_ BitVec 64))

(assert (=> b!45873 (= lt!70591 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70584 () Unit!3234)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1788 BitStream!1788 BitStream!1788 BitStream!1788 (_ BitVec 64) List!535) Unit!3234)

(assert (=> b!45873 (= lt!70584 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2315 lt!70572) (_2!2315 lt!70572) (_1!2316 lt!70595) (_1!2316 lt!70604) lt!70591 lt!70586))))

(declare-fun tail!220 (List!535) List!535)

(assert (=> b!45873 (= (bitStreamReadBitsIntoList!0 (_2!2315 lt!70572) (_1!2316 lt!70604) (bvsub lt!70591 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!220 lt!70586))))

(declare-fun lt!70607 () Unit!3234)

(assert (=> b!45873 (= lt!70607 lt!70584)))

(declare-fun lt!70570 () Unit!3234)

(declare-fun lt!70578 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2271 array!2271 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3234)

(assert (=> b!45873 (= lt!70570 (arrayBitRangesEqImpliesEq!0 (buf!1371 (_2!2315 lt!70569)) (buf!1371 (_2!2315 lt!70572)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!70578 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!70569))) (currentByte!2864 (_2!2315 lt!70569)) (currentBit!2859 (_2!2315 lt!70569)))))))

(declare-fun bitAt!0 (array!2271 (_ BitVec 64)) Bool)

(assert (=> b!45873 (= (bitAt!0 (buf!1371 (_2!2315 lt!70569)) lt!70578) (bitAt!0 (buf!1371 (_2!2315 lt!70572)) lt!70578))))

(declare-fun lt!70609 () Unit!3234)

(assert (=> b!45873 (= lt!70609 lt!70570)))

(declare-fun b!45874 () Bool)

(declare-fun res!38758 () Bool)

(declare-fun e!30512 () Bool)

(assert (=> b!45874 (=> (not res!38758) (not e!30512))))

(declare-fun lt!70593 () tuple2!4444)

(assert (=> b!45874 (= res!38758 (= (size!1022 (buf!1371 (_2!2315 lt!70593))) (size!1022 (buf!1371 (_2!2315 lt!69863)))))))

(declare-fun lt!70601 () tuple2!4446)

(declare-fun b!45875 () Bool)

(assert (=> b!45875 (= e!30512 (= (bitStreamReadBitsIntoList!0 (_2!2315 lt!70593) (_1!2316 lt!70601) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2315 lt!70593) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45875 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45875 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70608 () Unit!3234)

(declare-fun lt!70592 () Unit!3234)

(assert (=> b!45875 (= lt!70608 lt!70592)))

(declare-fun lt!70573 () (_ BitVec 64))

(assert (=> b!45875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!70593)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!70573)))

(assert (=> b!45875 (= lt!70592 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2315 lt!69863) (buf!1371 (_2!2315 lt!70593)) lt!70573))))

(declare-fun e!30511 () Bool)

(assert (=> b!45875 e!30511))

(declare-fun res!38759 () Bool)

(assert (=> b!45875 (=> (not res!38759) (not e!30511))))

(assert (=> b!45875 (= res!38759 (and (= (size!1022 (buf!1371 (_2!2315 lt!69863))) (size!1022 (buf!1371 (_2!2315 lt!70593)))) (bvsge lt!70573 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45875 (= lt!70573 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45875 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45875 (= lt!70601 (reader!0 (_2!2315 lt!69863) (_2!2315 lt!70593)))))

(declare-fun b!45877 () Bool)

(declare-fun res!38760 () Bool)

(assert (=> b!45877 (=> (not res!38760) (not e!30512))))

(assert (=> b!45877 (= res!38760 (= (size!1022 (buf!1371 (_2!2315 lt!69863))) (size!1022 (buf!1371 (_2!2315 lt!70593)))))))

(declare-fun bm!547 () Bool)

(declare-fun c!3095 () Bool)

(assert (=> bm!547 (= call!550 (reader!0 (_2!2315 lt!69863) (ite c!3095 (_2!2315 lt!70572) (_2!2315 lt!69863))))))

(declare-fun b!45878 () Bool)

(declare-fun res!38761 () Bool)

(assert (=> b!45878 (=> (not res!38761) (not e!30512))))

(assert (=> b!45878 (= res!38761 (invariant!0 (currentBit!2859 (_2!2315 lt!70593)) (currentByte!2864 (_2!2315 lt!70593)) (size!1022 (buf!1371 (_2!2315 lt!70593)))))))

(declare-fun b!45879 () Bool)

(declare-fun Unit!3245 () Unit!3234)

(assert (=> b!45879 (= e!30510 (tuple2!4445 Unit!3245 (_2!2315 lt!69863)))))

(assert (=> b!45879 (= (size!1022 (buf!1371 (_2!2315 lt!69863))) (size!1022 (buf!1371 (_2!2315 lt!69863))))))

(declare-fun lt!70594 () Unit!3234)

(declare-fun Unit!3246 () Unit!3234)

(assert (=> b!45879 (= lt!70594 Unit!3246)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1788 array!2271 array!2271 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45879 (checkByteArrayBitContent!0 (_2!2315 lt!69863) srcBuffer!2 (_1!2320 (readBits!0 (_1!2316 call!550) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!45880 () Bool)

(declare-fun res!38763 () Bool)

(assert (=> b!45880 (=> (not res!38763) (not e!30512))))

(assert (=> b!45880 (= res!38763 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!70593)))))

(declare-fun d!13272 () Bool)

(assert (=> d!13272 e!30512))

(declare-fun res!38762 () Bool)

(assert (=> d!13272 (=> (not res!38762) (not e!30512))))

(declare-fun lt!70582 () (_ BitVec 64))

(assert (=> d!13272 (= res!38762 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!70593))) (currentByte!2864 (_2!2315 lt!70593)) (currentBit!2859 (_2!2315 lt!70593))) (bvsub lt!70582 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13272 (or (= (bvand lt!70582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70582 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70606 () (_ BitVec 64))

(assert (=> d!13272 (= lt!70582 (bvadd lt!70606 to!314))))

(assert (=> d!13272 (or (not (= (bvand lt!70606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!70606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!70606 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13272 (= lt!70606 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(assert (=> d!13272 (= lt!70593 e!30510)))

(assert (=> d!13272 (= c!3095 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!70588 () Unit!3234)

(declare-fun lt!70577 () Unit!3234)

(assert (=> d!13272 (= lt!70588 lt!70577)))

(assert (=> d!13272 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69863))))

(assert (=> d!13272 (= lt!70577 (lemmaIsPrefixRefl!0 (_2!2315 lt!69863)))))

(assert (=> d!13272 (= lt!70578 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(assert (=> d!13272 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13272 (= (appendBitsMSBFirstLoop!0 (_2!2315 lt!69863) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!70593)))

(declare-fun b!45876 () Bool)

(assert (=> b!45876 (= e!30511 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863))) lt!70573))))

(assert (= (and d!13272 c!3095) b!45873))

(assert (= (and d!13272 (not c!3095)) b!45879))

(assert (= (or b!45873 b!45879) bm!547))

(assert (= (and d!13272 res!38762) b!45878))

(assert (= (and b!45878 res!38761) b!45877))

(assert (= (and b!45877 res!38760) b!45880))

(assert (= (and b!45880 res!38763) b!45874))

(assert (= (and b!45874 res!38758) b!45875))

(assert (= (and b!45875 res!38759) b!45876))

(declare-fun m!69985 () Bool)

(assert (=> b!45879 m!69985))

(declare-fun m!69991 () Bool)

(assert (=> b!45879 m!69991))

(declare-fun m!69993 () Bool)

(assert (=> b!45873 m!69993))

(declare-fun m!69995 () Bool)

(assert (=> b!45873 m!69995))

(declare-fun m!70001 () Bool)

(assert (=> b!45873 m!70001))

(declare-fun m!70007 () Bool)

(assert (=> b!45873 m!70007))

(declare-fun m!70011 () Bool)

(assert (=> b!45873 m!70011))

(declare-fun m!70013 () Bool)

(assert (=> b!45873 m!70013))

(declare-fun m!70017 () Bool)

(assert (=> b!45873 m!70017))

(declare-fun m!70019 () Bool)

(assert (=> b!45873 m!70019))

(declare-fun m!70021 () Bool)

(assert (=> b!45873 m!70021))

(assert (=> b!45873 m!70013))

(declare-fun m!70027 () Bool)

(assert (=> b!45873 m!70027))

(assert (=> b!45873 m!70007))

(declare-fun m!70033 () Bool)

(assert (=> b!45873 m!70033))

(declare-fun m!70037 () Bool)

(assert (=> b!45873 m!70037))

(assert (=> b!45873 m!69995))

(declare-fun m!70043 () Bool)

(assert (=> b!45873 m!70043))

(declare-fun m!70045 () Bool)

(assert (=> b!45873 m!70045))

(declare-fun m!70049 () Bool)

(assert (=> b!45873 m!70049))

(declare-fun m!70053 () Bool)

(assert (=> b!45873 m!70053))

(declare-fun m!70057 () Bool)

(assert (=> b!45873 m!70057))

(declare-fun m!70061 () Bool)

(assert (=> b!45873 m!70061))

(declare-fun m!70065 () Bool)

(assert (=> b!45873 m!70065))

(assert (=> b!45873 m!69533))

(declare-fun m!70071 () Bool)

(assert (=> b!45873 m!70071))

(assert (=> b!45873 m!70071))

(declare-fun m!70077 () Bool)

(assert (=> b!45873 m!70077))

(declare-fun m!70081 () Bool)

(assert (=> b!45873 m!70081))

(declare-fun m!70083 () Bool)

(assert (=> b!45873 m!70083))

(declare-fun m!70085 () Bool)

(assert (=> b!45873 m!70085))

(declare-fun m!70087 () Bool)

(assert (=> b!45873 m!70087))

(declare-fun m!70089 () Bool)

(assert (=> b!45873 m!70089))

(declare-fun m!70091 () Bool)

(assert (=> b!45873 m!70091))

(declare-fun m!70093 () Bool)

(assert (=> b!45873 m!70093))

(declare-fun m!70095 () Bool)

(assert (=> b!45873 m!70095))

(declare-fun m!70099 () Bool)

(assert (=> b!45873 m!70099))

(declare-fun m!70101 () Bool)

(assert (=> b!45873 m!70101))

(declare-fun m!70103 () Bool)

(assert (=> bm!547 m!70103))

(declare-fun m!70105 () Bool)

(assert (=> b!45875 m!70105))

(declare-fun m!70107 () Bool)

(assert (=> b!45875 m!70107))

(declare-fun m!70109 () Bool)

(assert (=> b!45875 m!70109))

(declare-fun m!70111 () Bool)

(assert (=> b!45875 m!70111))

(declare-fun m!70113 () Bool)

(assert (=> b!45875 m!70113))

(declare-fun m!70115 () Bool)

(assert (=> b!45878 m!70115))

(declare-fun m!70117 () Bool)

(assert (=> b!45880 m!70117))

(declare-fun m!70119 () Bool)

(assert (=> d!13272 m!70119))

(assert (=> d!13272 m!69533))

(assert (=> d!13272 m!69751))

(assert (=> d!13272 m!69757))

(declare-fun m!70121 () Bool)

(assert (=> b!45876 m!70121))

(assert (=> b!45542 d!13272))

(declare-fun d!13354 () Bool)

(declare-fun res!38766 () Bool)

(declare-fun e!30513 () Bool)

(assert (=> d!13354 (=> (not res!38766) (not e!30513))))

(assert (=> d!13354 (= res!38766 (= (size!1022 (buf!1371 (_2!2315 lt!69863))) (size!1022 (buf!1371 (_2!2315 lt!69870)))))))

(assert (=> d!13354 (= (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69870)) e!30513)))

(declare-fun b!45881 () Bool)

(declare-fun res!38764 () Bool)

(assert (=> b!45881 (=> (not res!38764) (not e!30513))))

(assert (=> b!45881 (= res!38764 (bvsle (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))) (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69870))) (currentByte!2864 (_2!2315 lt!69870)) (currentBit!2859 (_2!2315 lt!69870)))))))

(declare-fun b!45882 () Bool)

(declare-fun e!30514 () Bool)

(assert (=> b!45882 (= e!30513 e!30514)))

(declare-fun res!38765 () Bool)

(assert (=> b!45882 (=> res!38765 e!30514)))

(assert (=> b!45882 (= res!38765 (= (size!1022 (buf!1371 (_2!2315 lt!69863))) #b00000000000000000000000000000000))))

(declare-fun b!45883 () Bool)

(assert (=> b!45883 (= e!30514 (arrayBitRangesEq!0 (buf!1371 (_2!2315 lt!69863)) (buf!1371 (_2!2315 lt!69870)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863)))))))

(assert (= (and d!13354 res!38766) b!45881))

(assert (= (and b!45881 res!38764) b!45882))

(assert (= (and b!45882 (not res!38765)) b!45883))

(assert (=> b!45881 m!69533))

(assert (=> b!45881 m!69513))

(assert (=> b!45883 m!69533))

(assert (=> b!45883 m!69533))

(declare-fun m!70125 () Bool)

(assert (=> b!45883 m!70125))

(assert (=> b!45542 d!13354))

(declare-fun d!13358 () Bool)

(assert (=> d!13358 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69870))))

(declare-fun lt!70640 () Unit!3234)

(declare-fun choose!30 (BitStream!1788 BitStream!1788 BitStream!1788) Unit!3234)

(assert (=> d!13358 (= lt!70640 (choose!30 thiss!1379 (_2!2315 lt!69863) (_2!2315 lt!69870)))))

(assert (=> d!13358 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69863))))

(assert (=> d!13358 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2315 lt!69863) (_2!2315 lt!69870)) lt!70640)))

(declare-fun bs!3532 () Bool)

(assert (= bs!3532 d!13358))

(assert (=> bs!3532 m!69503))

(declare-fun m!70165 () Bool)

(assert (=> bs!3532 m!70165))

(assert (=> bs!3532 m!69489))

(assert (=> b!45542 d!13358))

(declare-fun d!13368 () Bool)

(assert (=> d!13368 (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70661 () Unit!3234)

(assert (=> d!13368 (= lt!70661 (choose!9 thiss!1379 (buf!1371 (_2!2315 lt!69863)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1789 (buf!1371 (_2!2315 lt!69863)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379))))))

(assert (=> d!13368 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1371 (_2!2315 lt!69863)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70661)))

(declare-fun bs!3534 () Bool)

(assert (= bs!3534 d!13368))

(assert (=> bs!3534 m!69509))

(declare-fun m!70169 () Bool)

(assert (=> bs!3534 m!70169))

(assert (=> b!45542 d!13368))

(declare-fun b!45898 () Bool)

(declare-fun e!30522 () Unit!3234)

(declare-fun lt!70675 () Unit!3234)

(assert (=> b!45898 (= e!30522 lt!70675)))

(declare-fun lt!70674 () (_ BitVec 64))

(assert (=> b!45898 (= lt!70674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70664 () (_ BitVec 64))

(assert (=> b!45898 (= lt!70664 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(assert (=> b!45898 (= lt!70675 (arrayBitRangesEqSymmetric!0 (buf!1371 thiss!1379) (buf!1371 (_2!2315 lt!69863)) lt!70674 lt!70664))))

(assert (=> b!45898 (arrayBitRangesEq!0 (buf!1371 (_2!2315 lt!69863)) (buf!1371 thiss!1379) lt!70674 lt!70664)))

(declare-fun b!45899 () Bool)

(declare-fun Unit!3248 () Unit!3234)

(assert (=> b!45899 (= e!30522 Unit!3248)))

(declare-fun b!45900 () Bool)

(declare-fun res!38774 () Bool)

(declare-fun e!30521 () Bool)

(assert (=> b!45900 (=> (not res!38774) (not e!30521))))

(declare-fun lt!70665 () tuple2!4446)

(assert (=> b!45900 (= res!38774 (isPrefixOf!0 (_1!2316 lt!70665) thiss!1379))))

(declare-fun d!13372 () Bool)

(assert (=> d!13372 e!30521))

(declare-fun res!38775 () Bool)

(assert (=> d!13372 (=> (not res!38775) (not e!30521))))

(assert (=> d!13372 (= res!38775 (isPrefixOf!0 (_1!2316 lt!70665) (_2!2316 lt!70665)))))

(declare-fun lt!70670 () BitStream!1788)

(assert (=> d!13372 (= lt!70665 (tuple2!4447 lt!70670 (_2!2315 lt!69863)))))

(declare-fun lt!70668 () Unit!3234)

(declare-fun lt!70680 () Unit!3234)

(assert (=> d!13372 (= lt!70668 lt!70680)))

(assert (=> d!13372 (isPrefixOf!0 lt!70670 (_2!2315 lt!69863))))

(assert (=> d!13372 (= lt!70680 (lemmaIsPrefixTransitive!0 lt!70670 (_2!2315 lt!69863) (_2!2315 lt!69863)))))

(declare-fun lt!70672 () Unit!3234)

(declare-fun lt!70681 () Unit!3234)

(assert (=> d!13372 (= lt!70672 lt!70681)))

(assert (=> d!13372 (isPrefixOf!0 lt!70670 (_2!2315 lt!69863))))

(assert (=> d!13372 (= lt!70681 (lemmaIsPrefixTransitive!0 lt!70670 thiss!1379 (_2!2315 lt!69863)))))

(declare-fun lt!70666 () Unit!3234)

(assert (=> d!13372 (= lt!70666 e!30522)))

(declare-fun c!3100 () Bool)

(assert (=> d!13372 (= c!3100 (not (= (size!1022 (buf!1371 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!70678 () Unit!3234)

(declare-fun lt!70667 () Unit!3234)

(assert (=> d!13372 (= lt!70678 lt!70667)))

(assert (=> d!13372 (isPrefixOf!0 (_2!2315 lt!69863) (_2!2315 lt!69863))))

(assert (=> d!13372 (= lt!70667 (lemmaIsPrefixRefl!0 (_2!2315 lt!69863)))))

(declare-fun lt!70673 () Unit!3234)

(declare-fun lt!70663 () Unit!3234)

(assert (=> d!13372 (= lt!70673 lt!70663)))

(assert (=> d!13372 (= lt!70663 (lemmaIsPrefixRefl!0 (_2!2315 lt!69863)))))

(declare-fun lt!70676 () Unit!3234)

(declare-fun lt!70671 () Unit!3234)

(assert (=> d!13372 (= lt!70676 lt!70671)))

(assert (=> d!13372 (isPrefixOf!0 lt!70670 lt!70670)))

(assert (=> d!13372 (= lt!70671 (lemmaIsPrefixRefl!0 lt!70670))))

(declare-fun lt!70662 () Unit!3234)

(declare-fun lt!70679 () Unit!3234)

(assert (=> d!13372 (= lt!70662 lt!70679)))

(assert (=> d!13372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13372 (= lt!70679 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13372 (= lt!70670 (BitStream!1789 (buf!1371 (_2!2315 lt!69863)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(assert (=> d!13372 (isPrefixOf!0 thiss!1379 (_2!2315 lt!69863))))

(assert (=> d!13372 (= (reader!0 thiss!1379 (_2!2315 lt!69863)) lt!70665)))

(declare-fun b!45901 () Bool)

(declare-fun lt!70677 () (_ BitVec 64))

(declare-fun lt!70669 () (_ BitVec 64))

(assert (=> b!45901 (= e!30521 (= (_1!2316 lt!70665) (withMovedBitIndex!0 (_2!2316 lt!70665) (bvsub lt!70677 lt!70669))))))

(assert (=> b!45901 (or (= (bvand lt!70677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70677 lt!70669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45901 (= lt!70669 (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))))))

(assert (=> b!45901 (= lt!70677 (bitIndex!0 (size!1022 (buf!1371 thiss!1379)) (currentByte!2864 thiss!1379) (currentBit!2859 thiss!1379)))))

(declare-fun b!45902 () Bool)

(declare-fun res!38773 () Bool)

(assert (=> b!45902 (=> (not res!38773) (not e!30521))))

(assert (=> b!45902 (= res!38773 (isPrefixOf!0 (_2!2316 lt!70665) (_2!2315 lt!69863)))))

(assert (= (and d!13372 c!3100) b!45898))

(assert (= (and d!13372 (not c!3100)) b!45899))

(assert (= (and d!13372 res!38775) b!45900))

(assert (= (and b!45900 res!38774) b!45902))

(assert (= (and b!45902 res!38773) b!45901))

(declare-fun m!70191 () Bool)

(assert (=> b!45900 m!70191))

(assert (=> b!45898 m!69541))

(declare-fun m!70195 () Bool)

(assert (=> b!45898 m!70195))

(declare-fun m!70197 () Bool)

(assert (=> b!45898 m!70197))

(declare-fun m!70199 () Bool)

(assert (=> b!45902 m!70199))

(declare-fun m!70201 () Bool)

(assert (=> b!45901 m!70201))

(assert (=> b!45901 m!69533))

(assert (=> b!45901 m!69541))

(declare-fun m!70205 () Bool)

(assert (=> d!13372 m!70205))

(declare-fun m!70207 () Bool)

(assert (=> d!13372 m!70207))

(assert (=> d!13372 m!69537))

(declare-fun m!70209 () Bool)

(assert (=> d!13372 m!70209))

(declare-fun m!70211 () Bool)

(assert (=> d!13372 m!70211))

(assert (=> d!13372 m!69539))

(assert (=> d!13372 m!69751))

(assert (=> d!13372 m!69489))

(declare-fun m!70213 () Bool)

(assert (=> d!13372 m!70213))

(declare-fun m!70215 () Bool)

(assert (=> d!13372 m!70215))

(assert (=> d!13372 m!69757))

(assert (=> b!45542 d!13372))

(declare-fun d!13378 () Bool)

(assert (=> d!13378 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 thiss!1379)) ((_ sign_extend 32) (currentBit!2859 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3536 () Bool)

(assert (= bs!3536 d!13378))

(declare-fun m!70224 () Bool)

(assert (=> bs!3536 m!70224))

(assert (=> b!45542 d!13378))

(declare-fun d!13382 () Bool)

(assert (=> d!13382 (= (array_inv!947 srcBuffer!2) (bvsge (size!1022 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9166 d!13382))

(declare-fun d!13384 () Bool)

(assert (=> d!13384 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2859 thiss!1379) (currentByte!2864 thiss!1379) (size!1022 (buf!1371 thiss!1379))))))

(declare-fun bs!3537 () Bool)

(assert (= bs!3537 d!13384))

(assert (=> bs!3537 m!69679))

(assert (=> start!9166 d!13384))

(declare-fun d!13388 () Bool)

(assert (=> d!13388 (= (head!354 (byteArrayBitContentToList!0 (_2!2315 lt!69863) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!650 (byteArrayBitContentToList!0 (_2!2315 lt!69863) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45553 d!13388))

(declare-fun d!13394 () Bool)

(declare-fun c!3105 () Bool)

(assert (=> d!13394 (= c!3105 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30533 () List!535)

(assert (=> d!13394 (= (byteArrayBitContentToList!0 (_2!2315 lt!69863) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30533)))

(declare-fun b!45919 () Bool)

(assert (=> b!45919 (= e!30533 Nil!532)))

(declare-fun b!45920 () Bool)

(assert (=> b!45920 (= e!30533 (Cons!531 (not (= (bvand ((_ sign_extend 24) (select (arr!1539 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2315 lt!69863) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13394 c!3105) b!45919))

(assert (= (and d!13394 (not c!3105)) b!45920))

(assert (=> b!45920 m!69493))

(assert (=> b!45920 m!69667))

(declare-fun m!70235 () Bool)

(assert (=> b!45920 m!70235))

(assert (=> b!45553 d!13394))

(declare-fun d!13398 () Bool)

(assert (=> d!13398 (= (head!354 (bitStreamReadBitsIntoList!0 (_2!2315 lt!69863) (_1!2316 lt!69864) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!650 (bitStreamReadBitsIntoList!0 (_2!2315 lt!69863) (_1!2316 lt!69864) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45553 d!13398))

(declare-fun d!13400 () Bool)

(declare-fun e!30535 () Bool)

(assert (=> d!13400 e!30535))

(declare-fun c!3107 () Bool)

(assert (=> d!13400 (= c!3107 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70696 () List!535)

(declare-fun e!30534 () tuple2!4456)

(assert (=> d!13400 (= lt!70696 (_1!2321 e!30534))))

(declare-fun c!3106 () Bool)

(assert (=> d!13400 (= c!3106 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13400 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13400 (= (bitStreamReadBitsIntoList!0 (_2!2315 lt!69863) (_1!2316 lt!69864) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70696)))

(declare-fun b!45924 () Bool)

(assert (=> b!45924 (= e!30535 (> (length!230 lt!70696) 0))))

(declare-fun b!45923 () Bool)

(assert (=> b!45923 (= e!30535 (isEmpty!131 lt!70696))))

(declare-fun b!45922 () Bool)

(declare-fun lt!70695 () tuple2!4458)

(declare-fun lt!70694 () (_ BitVec 64))

(assert (=> b!45922 (= e!30534 (tuple2!4457 (Cons!531 (_1!2322 lt!70695) (bitStreamReadBitsIntoList!0 (_2!2315 lt!69863) (_2!2322 lt!70695) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!70694))) (_2!2322 lt!70695)))))

(assert (=> b!45922 (= lt!70695 (readBit!0 (_1!2316 lt!69864)))))

(assert (=> b!45922 (= lt!70694 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45921 () Bool)

(assert (=> b!45921 (= e!30534 (tuple2!4457 Nil!532 (_1!2316 lt!69864)))))

(assert (= (and d!13400 c!3106) b!45921))

(assert (= (and d!13400 (not c!3106)) b!45922))

(assert (= (and d!13400 c!3107) b!45923))

(assert (= (and d!13400 (not c!3107)) b!45924))

(declare-fun m!70237 () Bool)

(assert (=> b!45924 m!70237))

(declare-fun m!70239 () Bool)

(assert (=> b!45923 m!70239))

(declare-fun m!70241 () Bool)

(assert (=> b!45922 m!70241))

(declare-fun m!70243 () Bool)

(assert (=> b!45922 m!70243))

(assert (=> b!45553 d!13400))

(declare-fun d!13402 () Bool)

(assert (=> d!13402 (= (invariant!0 (currentBit!2859 (_2!2315 lt!69863)) (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69870)))) (and (bvsge (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (bvslt (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000001000) (bvsge (currentByte!2864 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69870)))) (and (= (currentBit!2859 (_2!2315 lt!69863)) #b00000000000000000000000000000000) (= (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))))

(assert (=> b!45552 d!13402))

(declare-fun d!13404 () Bool)

(declare-fun e!30536 () Bool)

(assert (=> d!13404 e!30536))

(declare-fun res!38785 () Bool)

(assert (=> d!13404 (=> (not res!38785) (not e!30536))))

(declare-fun lt!70701 () (_ BitVec 64))

(declare-fun lt!70699 () (_ BitVec 64))

(declare-fun lt!70702 () (_ BitVec 64))

(assert (=> d!13404 (= res!38785 (= lt!70702 (bvsub lt!70699 lt!70701)))))

(assert (=> d!13404 (or (= (bvand lt!70699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70699 lt!70701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13404 (= lt!70701 (remainingBits!0 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))) ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863)))))))

(declare-fun lt!70697 () (_ BitVec 64))

(declare-fun lt!70700 () (_ BitVec 64))

(assert (=> d!13404 (= lt!70699 (bvmul lt!70697 lt!70700))))

(assert (=> d!13404 (or (= lt!70697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70700 (bvsdiv (bvmul lt!70697 lt!70700) lt!70697)))))

(assert (=> d!13404 (= lt!70700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13404 (= lt!70697 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))))))

(assert (=> d!13404 (= lt!70702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2864 (_2!2315 lt!69863))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2859 (_2!2315 lt!69863)))))))

(assert (=> d!13404 (invariant!0 (currentBit!2859 (_2!2315 lt!69863)) (currentByte!2864 (_2!2315 lt!69863)) (size!1022 (buf!1371 (_2!2315 lt!69863))))))

(assert (=> d!13404 (= (bitIndex!0 (size!1022 (buf!1371 (_2!2315 lt!69863))) (currentByte!2864 (_2!2315 lt!69863)) (currentBit!2859 (_2!2315 lt!69863))) lt!70702)))

(declare-fun b!45925 () Bool)

(declare-fun res!38784 () Bool)

(assert (=> b!45925 (=> (not res!38784) (not e!30536))))

(assert (=> b!45925 (= res!38784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70702))))

(declare-fun b!45926 () Bool)

(declare-fun lt!70698 () (_ BitVec 64))

(assert (=> b!45926 (= e!30536 (bvsle lt!70702 (bvmul lt!70698 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45926 (or (= lt!70698 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70698 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70698)))))

(assert (=> b!45926 (= lt!70698 ((_ sign_extend 32) (size!1022 (buf!1371 (_2!2315 lt!69863)))))))

(assert (= (and d!13404 res!38785) b!45925))

(assert (= (and b!45925 res!38784) b!45926))

(assert (=> d!13404 m!69639))

(assert (=> d!13404 m!69517))

(assert (=> b!45541 d!13404))

(declare-fun d!13406 () Bool)

(assert (=> d!13406 (= (invariant!0 (currentBit!2859 (_2!2315 lt!69870)) (currentByte!2864 (_2!2315 lt!69870)) (size!1022 (buf!1371 (_2!2315 lt!69870)))) (and (bvsge (currentBit!2859 (_2!2315 lt!69870)) #b00000000000000000000000000000000) (bvslt (currentBit!2859 (_2!2315 lt!69870)) #b00000000000000000000000000001000) (bvsge (currentByte!2864 (_2!2315 lt!69870)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2864 (_2!2315 lt!69870)) (size!1022 (buf!1371 (_2!2315 lt!69870)))) (and (= (currentBit!2859 (_2!2315 lt!69870)) #b00000000000000000000000000000000) (= (currentByte!2864 (_2!2315 lt!69870)) (size!1022 (buf!1371 (_2!2315 lt!69870))))))))))

(assert (=> b!45545 d!13406))

(declare-fun d!13408 () Bool)

(declare-fun size!1025 (List!535) Int)

(assert (=> d!13408 (= (length!230 lt!69872) (size!1025 lt!69872))))

(declare-fun bs!3539 () Bool)

(assert (= bs!3539 d!13408))

(declare-fun m!70245 () Bool)

(assert (=> bs!3539 m!70245))

(assert (=> b!45544 d!13408))

(check-sat (not d!13378) (not b!45678) (not b!45610) (not b!45697) (not d!13358) (not d!13226) (not d!13228) (not b!45707) (not b!45900) (not b!45675) (not b!45898) (not b!45636) (not b!45876) (not b!45633) (not b!45628) (not d!13404) (not b!45635) (not d!13236) (not b!45629) (not b!45630) (not b!45698) (not d!13368) (not b!45705) (not b!45634) (not b!45883) (not b!45605) (not d!13266) (not b!45638) (not b!45924) (not b!45709) (not d!13238) (not d!13220) (not d!13262) (not b!45631) (not d!13234) (not b!45878) (not d!13408) (not b!45902) (not b!45704) (not b!45922) (not b!45875) (not d!13384) (not d!13232) (not d!13372) (not d!13216) (not b!45677) (not b!45632) (not b!45607) (not b!45873) (not b!45706) (not b!45881) (not b!45696) (not b!45702) (not d!13218) (not b!45695) (not d!13272) (not d!13224) (not b!45700) (not b!45923) (not b!45679) (not b!45701) (not b!45880) (not b!45920) (not d!13264) (not bm!547) (not b!45879) (not b!45901))
