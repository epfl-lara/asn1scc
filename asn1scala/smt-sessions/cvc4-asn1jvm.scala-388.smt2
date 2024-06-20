; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10014 () Bool)

(assert start!10014)

(declare-datatypes ((array!2336 0))(
  ( (array!2337 (arr!1591 (Array (_ BitVec 32) (_ BitVec 8))) (size!1062 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2336)

(declare-fun b!50574 () Bool)

(declare-datatypes ((BitStream!1838 0))(
  ( (BitStream!1839 (buf!1417 array!2336) (currentByte!2940 (_ BitVec 32)) (currentBit!2935 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3499 0))(
  ( (Unit!3500) )
))
(declare-datatypes ((tuple2!4664 0))(
  ( (tuple2!4665 (_1!2437 Unit!3499) (_2!2437 BitStream!1838)) )
))
(declare-fun lt!78399 () tuple2!4664)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!33421 () Bool)

(declare-datatypes ((tuple2!4666 0))(
  ( (tuple2!4667 (_1!2438 BitStream!1838) (_2!2438 BitStream!1838)) )
))
(declare-fun lt!78403 () tuple2!4666)

(declare-datatypes ((List!560 0))(
  ( (Nil!557) (Cons!556 (h!675 Bool) (t!1310 List!560)) )
))
(declare-fun head!379 (List!560) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1838 array!2336 (_ BitVec 64) (_ BitVec 64)) List!560)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1838 BitStream!1838 (_ BitVec 64)) List!560)

(assert (=> b!50574 (= e!33421 (= (head!379 (byteArrayBitContentToList!0 (_2!2437 lt!78399) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!379 (bitStreamReadBitsIntoList!0 (_2!2437 lt!78399) (_1!2438 lt!78403) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50575 () Bool)

(declare-fun e!33420 () Bool)

(declare-fun thiss!1379 () BitStream!1838)

(declare-fun array_inv!972 (array!2336) Bool)

(assert (=> b!50575 (= e!33420 (array_inv!972 (buf!1417 thiss!1379)))))

(declare-fun b!50576 () Bool)

(declare-fun e!33415 () Bool)

(declare-fun e!33408 () Bool)

(assert (=> b!50576 (= e!33415 e!33408)))

(declare-fun res!42347 () Bool)

(assert (=> b!50576 (=> res!42347 e!33408)))

(declare-fun lt!78392 () List!560)

(declare-fun lt!78408 () List!560)

(assert (=> b!50576 (= res!42347 (not (= lt!78392 lt!78408)))))

(assert (=> b!50576 (= lt!78408 lt!78392)))

(declare-fun lt!78404 () List!560)

(declare-fun tail!246 (List!560) List!560)

(assert (=> b!50576 (= lt!78392 (tail!246 lt!78404))))

(declare-fun lt!78390 () tuple2!4666)

(declare-fun lt!78412 () tuple2!4666)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!78409 () tuple2!4664)

(declare-fun lt!78393 () Unit!3499)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1838 BitStream!1838 BitStream!1838 BitStream!1838 (_ BitVec 64) List!560) Unit!3499)

(assert (=> b!50576 (= lt!78393 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2437 lt!78409) (_2!2437 lt!78409) (_1!2438 lt!78390) (_1!2438 lt!78412) (bvsub to!314 i!635) lt!78404))))

(declare-fun b!50577 () Bool)

(declare-fun e!33422 () Bool)

(assert (=> b!50577 (= e!33422 e!33415)))

(declare-fun res!42357 () Bool)

(assert (=> b!50577 (=> res!42357 e!33415)))

(assert (=> b!50577 (= res!42357 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78394 () (_ BitVec 64))

(assert (=> b!50577 (= lt!78408 (bitStreamReadBitsIntoList!0 (_2!2437 lt!78409) (_1!2438 lt!78412) lt!78394))))

(assert (=> b!50577 (= lt!78404 (bitStreamReadBitsIntoList!0 (_2!2437 lt!78409) (_1!2438 lt!78390) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50577 (validate_offset_bits!1 ((_ sign_extend 32) (size!1062 (buf!1417 (_2!2437 lt!78409)))) ((_ sign_extend 32) (currentByte!2940 (_2!2437 lt!78399))) ((_ sign_extend 32) (currentBit!2935 (_2!2437 lt!78399))) lt!78394)))

(declare-fun lt!78396 () Unit!3499)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1838 array!2336 (_ BitVec 64)) Unit!3499)

(assert (=> b!50577 (= lt!78396 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2437 lt!78399) (buf!1417 (_2!2437 lt!78409)) lt!78394))))

(declare-fun reader!0 (BitStream!1838 BitStream!1838) tuple2!4666)

(assert (=> b!50577 (= lt!78412 (reader!0 (_2!2437 lt!78399) (_2!2437 lt!78409)))))

(assert (=> b!50577 (validate_offset_bits!1 ((_ sign_extend 32) (size!1062 (buf!1417 (_2!2437 lt!78409)))) ((_ sign_extend 32) (currentByte!2940 thiss!1379)) ((_ sign_extend 32) (currentBit!2935 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78402 () Unit!3499)

(assert (=> b!50577 (= lt!78402 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1417 (_2!2437 lt!78409)) (bvsub to!314 i!635)))))

(assert (=> b!50577 (= lt!78390 (reader!0 thiss!1379 (_2!2437 lt!78409)))))

(declare-fun b!50578 () Bool)

(declare-fun e!33411 () Bool)

(declare-fun e!33417 () Bool)

(assert (=> b!50578 (= e!33411 e!33417)))

(declare-fun res!42348 () Bool)

(assert (=> b!50578 (=> res!42348 e!33417)))

(declare-fun isPrefixOf!0 (BitStream!1838 BitStream!1838) Bool)

(assert (=> b!50578 (= res!42348 (not (isPrefixOf!0 thiss!1379 (_2!2437 lt!78399))))))

(assert (=> b!50578 (validate_offset_bits!1 ((_ sign_extend 32) (size!1062 (buf!1417 (_2!2437 lt!78399)))) ((_ sign_extend 32) (currentByte!2940 (_2!2437 lt!78399))) ((_ sign_extend 32) (currentBit!2935 (_2!2437 lt!78399))) lt!78394)))

(assert (=> b!50578 (= lt!78394 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78398 () Unit!3499)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1838 BitStream!1838 (_ BitVec 64) (_ BitVec 64)) Unit!3499)

(assert (=> b!50578 (= lt!78398 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2437 lt!78399) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1838 (_ BitVec 8) (_ BitVec 32)) tuple2!4664)

(assert (=> b!50578 (= lt!78399 (appendBitFromByte!0 thiss!1379 (select (arr!1591 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50579 () Bool)

(declare-fun e!33409 () Bool)

(declare-fun e!33419 () Bool)

(assert (=> b!50579 (= e!33409 e!33419)))

(declare-fun res!42343 () Bool)

(assert (=> b!50579 (=> res!42343 e!33419)))

(declare-fun lt!78406 () (_ BitVec 64))

(declare-fun lt!78401 () (_ BitVec 64))

(assert (=> b!50579 (= res!42343 (not (= lt!78401 (bvsub (bvadd lt!78406 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50579 (= lt!78401 (bitIndex!0 (size!1062 (buf!1417 (_2!2437 lt!78409))) (currentByte!2940 (_2!2437 lt!78409)) (currentBit!2935 (_2!2437 lt!78409))))))

(declare-fun b!50580 () Bool)

(declare-fun res!42349 () Bool)

(assert (=> b!50580 (=> res!42349 e!33419)))

(assert (=> b!50580 (= res!42349 (not (= (size!1062 (buf!1417 thiss!1379)) (size!1062 (buf!1417 (_2!2437 lt!78409))))))))

(declare-fun res!42350 () Bool)

(declare-fun e!33410 () Bool)

(assert (=> start!10014 (=> (not res!42350) (not e!33410))))

(assert (=> start!10014 (= res!42350 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1062 srcBuffer!2))))))))

(assert (=> start!10014 e!33410))

(assert (=> start!10014 true))

(assert (=> start!10014 (array_inv!972 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1838) Bool)

(assert (=> start!10014 (and (inv!12 thiss!1379) e!33420)))

(declare-fun b!50581 () Bool)

(assert (=> b!50581 (= e!33419 e!33422)))

(declare-fun res!42351 () Bool)

(assert (=> b!50581 (=> res!42351 e!33422)))

(assert (=> b!50581 (= res!42351 (not (= (size!1062 (buf!1417 (_2!2437 lt!78399))) (size!1062 (buf!1417 (_2!2437 lt!78409))))))))

(declare-fun lt!78407 () (_ BitVec 64))

(assert (=> b!50581 (= lt!78401 (bvsub (bvsub (bvadd lt!78407 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50581 (= lt!78407 (bitIndex!0 (size!1062 (buf!1417 (_2!2437 lt!78399))) (currentByte!2940 (_2!2437 lt!78399)) (currentBit!2935 (_2!2437 lt!78399))))))

(assert (=> b!50581 (= (size!1062 (buf!1417 (_2!2437 lt!78409))) (size!1062 (buf!1417 thiss!1379)))))

(declare-fun b!50582 () Bool)

(declare-fun res!42356 () Bool)

(assert (=> b!50582 (=> (not res!42356) (not e!33410))))

(assert (=> b!50582 (= res!42356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1062 (buf!1417 thiss!1379))) ((_ sign_extend 32) (currentByte!2940 thiss!1379)) ((_ sign_extend 32) (currentBit!2935 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50583 () Bool)

(declare-fun res!42354 () Bool)

(assert (=> b!50583 (=> res!42354 e!33419)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50583 (= res!42354 (not (invariant!0 (currentBit!2935 (_2!2437 lt!78409)) (currentByte!2940 (_2!2437 lt!78409)) (size!1062 (buf!1417 (_2!2437 lt!78409))))))))

(declare-fun b!50584 () Bool)

(assert (=> b!50584 (= e!33417 e!33409)))

(declare-fun res!42341 () Bool)

(assert (=> b!50584 (=> res!42341 e!33409)))

(assert (=> b!50584 (= res!42341 (not (isPrefixOf!0 (_2!2437 lt!78399) (_2!2437 lt!78409))))))

(assert (=> b!50584 (isPrefixOf!0 thiss!1379 (_2!2437 lt!78409))))

(declare-fun lt!78410 () Unit!3499)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1838 BitStream!1838 BitStream!1838) Unit!3499)

(assert (=> b!50584 (= lt!78410 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2437 lt!78399) (_2!2437 lt!78409)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1838 array!2336 (_ BitVec 64) (_ BitVec 64)) tuple2!4664)

(assert (=> b!50584 (= lt!78409 (appendBitsMSBFirstLoop!0 (_2!2437 lt!78399) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50584 e!33421))

(declare-fun res!42355 () Bool)

(assert (=> b!50584 (=> (not res!42355) (not e!33421))))

(assert (=> b!50584 (= res!42355 (validate_offset_bits!1 ((_ sign_extend 32) (size!1062 (buf!1417 (_2!2437 lt!78399)))) ((_ sign_extend 32) (currentByte!2940 thiss!1379)) ((_ sign_extend 32) (currentBit!2935 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78397 () Unit!3499)

(assert (=> b!50584 (= lt!78397 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1417 (_2!2437 lt!78399)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50584 (= lt!78403 (reader!0 thiss!1379 (_2!2437 lt!78399)))))

(declare-fun b!50585 () Bool)

(assert (=> b!50585 (= e!33410 (not e!33411))))

(declare-fun res!42339 () Bool)

(assert (=> b!50585 (=> res!42339 e!33411)))

(assert (=> b!50585 (= res!42339 (bvsge i!635 to!314))))

(assert (=> b!50585 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78411 () Unit!3499)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1838) Unit!3499)

(assert (=> b!50585 (= lt!78411 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50585 (= lt!78406 (bitIndex!0 (size!1062 (buf!1417 thiss!1379)) (currentByte!2940 thiss!1379) (currentBit!2935 thiss!1379)))))

(declare-fun b!50586 () Bool)

(declare-fun e!33416 () Bool)

(assert (=> b!50586 (= e!33408 e!33416)))

(declare-fun res!42352 () Bool)

(assert (=> b!50586 (=> res!42352 e!33416)))

(declare-fun lt!78400 () Bool)

(declare-fun bitAt!0 (array!2336 (_ BitVec 64)) Bool)

(assert (=> b!50586 (= res!42352 (not (= lt!78400 (bitAt!0 (buf!1417 (_1!2438 lt!78412)) lt!78406))))))

(assert (=> b!50586 (= lt!78400 (bitAt!0 (buf!1417 (_1!2438 lt!78390)) lt!78406))))

(declare-fun b!50587 () Bool)

(declare-fun e!33413 () Bool)

(declare-fun e!33418 () Bool)

(assert (=> b!50587 (= e!33413 e!33418)))

(declare-fun res!42345 () Bool)

(assert (=> b!50587 (=> res!42345 e!33418)))

(declare-fun lt!78391 () Bool)

(declare-fun lt!78405 () Bool)

(assert (=> b!50587 (= res!42345 (not (= lt!78391 lt!78405)))))

(assert (=> b!50587 (= lt!78391 (bitAt!0 (buf!1417 (_2!2437 lt!78399)) lt!78406))))

(declare-fun b!50588 () Bool)

(assert (=> b!50588 (= e!33418 true)))

(assert (=> b!50588 (= lt!78391 (bitAt!0 (buf!1417 (_2!2437 lt!78409)) lt!78406))))

(declare-fun lt!78395 () Unit!3499)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2336 array!2336 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3499)

(assert (=> b!50588 (= lt!78395 (arrayBitRangesEqImpliesEq!0 (buf!1417 (_2!2437 lt!78399)) (buf!1417 (_2!2437 lt!78409)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78406 lt!78407))))

(declare-fun b!50589 () Bool)

(assert (=> b!50589 (= e!33416 e!33413)))

(declare-fun res!42340 () Bool)

(assert (=> b!50589 (=> res!42340 e!33413)))

(assert (=> b!50589 (= res!42340 (not (= (head!379 (byteArrayBitContentToList!0 (_2!2437 lt!78409) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78405)))))

(assert (=> b!50589 (= lt!78405 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50590 () Bool)

(declare-fun res!42342 () Bool)

(assert (=> b!50590 (=> res!42342 e!33422)))

(assert (=> b!50590 (= res!42342 (not (invariant!0 (currentBit!2935 (_2!2437 lt!78399)) (currentByte!2940 (_2!2437 lt!78399)) (size!1062 (buf!1417 (_2!2437 lt!78399))))))))

(declare-fun b!50591 () Bool)

(declare-fun res!42344 () Bool)

(assert (=> b!50591 (=> res!42344 e!33415)))

(declare-fun length!255 (List!560) Int)

(assert (=> b!50591 (= res!42344 (<= (length!255 lt!78404) 0))))

(declare-fun b!50592 () Bool)

(declare-fun res!42346 () Bool)

(assert (=> b!50592 (=> res!42346 e!33422)))

(assert (=> b!50592 (= res!42346 (not (invariant!0 (currentBit!2935 (_2!2437 lt!78399)) (currentByte!2940 (_2!2437 lt!78399)) (size!1062 (buf!1417 (_2!2437 lt!78409))))))))

(declare-fun b!50593 () Bool)

(declare-fun res!42353 () Bool)

(assert (=> b!50593 (=> res!42353 e!33416)))

(assert (=> b!50593 (= res!42353 (not (= (head!379 lt!78404) lt!78400)))))

(assert (= (and start!10014 res!42350) b!50582))

(assert (= (and b!50582 res!42356) b!50585))

(assert (= (and b!50585 (not res!42339)) b!50578))

(assert (= (and b!50578 (not res!42348)) b!50584))

(assert (= (and b!50584 res!42355) b!50574))

(assert (= (and b!50584 (not res!42341)) b!50579))

(assert (= (and b!50579 (not res!42343)) b!50583))

(assert (= (and b!50583 (not res!42354)) b!50580))

(assert (= (and b!50580 (not res!42349)) b!50581))

(assert (= (and b!50581 (not res!42351)) b!50590))

(assert (= (and b!50590 (not res!42342)) b!50592))

(assert (= (and b!50592 (not res!42346)) b!50577))

(assert (= (and b!50577 (not res!42357)) b!50591))

(assert (= (and b!50591 (not res!42344)) b!50576))

(assert (= (and b!50576 (not res!42347)) b!50586))

(assert (= (and b!50586 (not res!42352)) b!50593))

(assert (= (and b!50593 (not res!42353)) b!50589))

(assert (= (and b!50589 (not res!42340)) b!50587))

(assert (= (and b!50587 (not res!42345)) b!50588))

(assert (= start!10014 b!50575))

(declare-fun m!79563 () Bool)

(assert (=> b!50587 m!79563))

(declare-fun m!79565 () Bool)

(assert (=> b!50590 m!79565))

(declare-fun m!79567 () Bool)

(assert (=> start!10014 m!79567))

(declare-fun m!79569 () Bool)

(assert (=> start!10014 m!79569))

(declare-fun m!79571 () Bool)

(assert (=> b!50585 m!79571))

(declare-fun m!79573 () Bool)

(assert (=> b!50585 m!79573))

(declare-fun m!79575 () Bool)

(assert (=> b!50585 m!79575))

(declare-fun m!79577 () Bool)

(assert (=> b!50582 m!79577))

(declare-fun m!79579 () Bool)

(assert (=> b!50591 m!79579))

(declare-fun m!79581 () Bool)

(assert (=> b!50576 m!79581))

(declare-fun m!79583 () Bool)

(assert (=> b!50576 m!79583))

(declare-fun m!79585 () Bool)

(assert (=> b!50581 m!79585))

(declare-fun m!79587 () Bool)

(assert (=> b!50593 m!79587))

(declare-fun m!79589 () Bool)

(assert (=> b!50578 m!79589))

(declare-fun m!79591 () Bool)

(assert (=> b!50578 m!79591))

(declare-fun m!79593 () Bool)

(assert (=> b!50578 m!79593))

(declare-fun m!79595 () Bool)

(assert (=> b!50578 m!79595))

(assert (=> b!50578 m!79591))

(declare-fun m!79597 () Bool)

(assert (=> b!50578 m!79597))

(declare-fun m!79599 () Bool)

(assert (=> b!50579 m!79599))

(declare-fun m!79601 () Bool)

(assert (=> b!50574 m!79601))

(assert (=> b!50574 m!79601))

(declare-fun m!79603 () Bool)

(assert (=> b!50574 m!79603))

(declare-fun m!79605 () Bool)

(assert (=> b!50574 m!79605))

(assert (=> b!50574 m!79605))

(declare-fun m!79607 () Bool)

(assert (=> b!50574 m!79607))

(declare-fun m!79609 () Bool)

(assert (=> b!50586 m!79609))

(declare-fun m!79611 () Bool)

(assert (=> b!50586 m!79611))

(declare-fun m!79613 () Bool)

(assert (=> b!50583 m!79613))

(declare-fun m!79615 () Bool)

(assert (=> b!50575 m!79615))

(declare-fun m!79617 () Bool)

(assert (=> b!50589 m!79617))

(assert (=> b!50589 m!79617))

(declare-fun m!79619 () Bool)

(assert (=> b!50589 m!79619))

(declare-fun m!79621 () Bool)

(assert (=> b!50589 m!79621))

(declare-fun m!79623 () Bool)

(assert (=> b!50592 m!79623))

(declare-fun m!79625 () Bool)

(assert (=> b!50588 m!79625))

(declare-fun m!79627 () Bool)

(assert (=> b!50588 m!79627))

(declare-fun m!79629 () Bool)

(assert (=> b!50577 m!79629))

(declare-fun m!79631 () Bool)

(assert (=> b!50577 m!79631))

(declare-fun m!79633 () Bool)

(assert (=> b!50577 m!79633))

(declare-fun m!79635 () Bool)

(assert (=> b!50577 m!79635))

(declare-fun m!79637 () Bool)

(assert (=> b!50577 m!79637))

(declare-fun m!79639 () Bool)

(assert (=> b!50577 m!79639))

(declare-fun m!79641 () Bool)

(assert (=> b!50577 m!79641))

(declare-fun m!79643 () Bool)

(assert (=> b!50577 m!79643))

(declare-fun m!79645 () Bool)

(assert (=> b!50584 m!79645))

(declare-fun m!79647 () Bool)

(assert (=> b!50584 m!79647))

(declare-fun m!79649 () Bool)

(assert (=> b!50584 m!79649))

(declare-fun m!79651 () Bool)

(assert (=> b!50584 m!79651))

(declare-fun m!79653 () Bool)

(assert (=> b!50584 m!79653))

(declare-fun m!79655 () Bool)

(assert (=> b!50584 m!79655))

(declare-fun m!79657 () Bool)

(assert (=> b!50584 m!79657))

(push 1)

(assert (not b!50589))

(assert (not b!50579))

(assert (not b!50577))

(assert (not b!50591))

(assert (not b!50586))

(assert (not b!50575))

(assert (not b!50581))

(assert (not start!10014))

(assert (not b!50593))

(assert (not b!50590))

(assert (not b!50574))

(assert (not b!50585))

(assert (not b!50584))

(assert (not b!50588))

(assert (not b!50576))

(assert (not b!50583))

(assert (not b!50582))

(assert (not b!50592))

(assert (not b!50587))

(assert (not b!50578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

