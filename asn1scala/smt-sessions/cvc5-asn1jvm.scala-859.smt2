; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24942 () Bool)

(assert start!24942)

(declare-fun b!126106 () Bool)

(declare-fun e!83025 () Bool)

(declare-datatypes ((array!5693 0))(
  ( (array!5694 (arr!3180 (Array (_ BitVec 32) (_ BitVec 8))) (size!2575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4474 0))(
  ( (BitStream!4475 (buf!2957 array!5693) (currentByte!5690 (_ BitVec 32)) (currentBit!5685 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4474)

(declare-fun array_inv!2364 (array!5693) Bool)

(assert (=> b!126106 (= e!83025 (array_inv!2364 (buf!2957 thiss!1614)))))

(declare-fun b!126107 () Bool)

(declare-fun e!83026 () Bool)

(declare-fun e!83030 () Bool)

(assert (=> b!126107 (= e!83026 (not e!83030))))

(declare-fun res!104479 () Bool)

(assert (=> b!126107 (=> res!104479 e!83030)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((Unit!7753 0))(
  ( (Unit!7754) )
))
(declare-datatypes ((tuple2!10516 0))(
  ( (tuple2!10517 (_1!5540 Unit!7753) (_2!5540 BitStream!4474)) )
))
(declare-fun lt!197347 () tuple2!10516)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126107 (= res!104479 (not (= (bitIndex!0 (size!2575 (buf!2957 (_2!5540 lt!197347))) (currentByte!5690 (_2!5540 lt!197347)) (currentBit!5685 (_2!5540 lt!197347))) (bvadd (bitIndex!0 (size!2575 (buf!2957 thiss!1614)) (currentByte!5690 thiss!1614) (currentBit!5685 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!83027 () Bool)

(assert (=> b!126107 e!83027))

(declare-fun res!104482 () Bool)

(assert (=> b!126107 (=> (not res!104482) (not e!83027))))

(assert (=> b!126107 (= res!104482 (= (size!2575 (buf!2957 thiss!1614)) (size!2575 (buf!2957 (_2!5540 lt!197347)))))))

(declare-fun arr!227 () array!5693)

(declare-fun appendByteArrayLoop!0 (BitStream!4474 array!5693 (_ BitVec 32) (_ BitVec 32)) tuple2!10516)

(assert (=> b!126107 (= lt!197347 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126108 () Bool)

(assert (=> b!126108 (= e!83030 true)))

(declare-fun lt!197346 () Bool)

(declare-fun isPrefixOf!0 (BitStream!4474 BitStream!4474) Bool)

(assert (=> b!126108 (= lt!197346 (isPrefixOf!0 thiss!1614 (_2!5540 lt!197347)))))

(declare-fun res!104481 () Bool)

(assert (=> start!24942 (=> (not res!104481) (not e!83026))))

(assert (=> start!24942 (= res!104481 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2575 arr!227))))))

(assert (=> start!24942 e!83026))

(assert (=> start!24942 true))

(assert (=> start!24942 (array_inv!2364 arr!227)))

(declare-fun inv!12 (BitStream!4474) Bool)

(assert (=> start!24942 (and (inv!12 thiss!1614) e!83025)))

(declare-fun b!126109 () Bool)

(declare-fun e!83023 () Bool)

(declare-fun e!83028 () Bool)

(assert (=> b!126109 (= e!83023 (not e!83028))))

(declare-fun res!104477 () Bool)

(assert (=> b!126109 (=> res!104477 e!83028)))

(declare-datatypes ((tuple2!10518 0))(
  ( (tuple2!10519 (_1!5541 BitStream!4474) (_2!5541 array!5693)) )
))
(declare-fun lt!197343 () tuple2!10518)

(declare-datatypes ((tuple2!10520 0))(
  ( (tuple2!10521 (_1!5542 BitStream!4474) (_2!5542 BitStream!4474)) )
))
(declare-fun lt!197344 () tuple2!10520)

(assert (=> b!126109 (= res!104477 (or (not (= (size!2575 (_2!5541 lt!197343)) (size!2575 arr!227))) (not (= (_1!5541 lt!197343) (_2!5542 lt!197344)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4474 array!5693 (_ BitVec 32) (_ BitVec 32)) tuple2!10518)

(assert (=> b!126109 (= lt!197343 (readByteArrayLoopPure!0 (_1!5542 lt!197344) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197348 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126109 (validate_offset_bits!1 ((_ sign_extend 32) (size!2575 (buf!2957 (_2!5540 lt!197347)))) ((_ sign_extend 32) (currentByte!5690 thiss!1614)) ((_ sign_extend 32) (currentBit!5685 thiss!1614)) lt!197348)))

(declare-fun lt!197345 () Unit!7753)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4474 array!5693 (_ BitVec 64)) Unit!7753)

(assert (=> b!126109 (= lt!197345 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2957 (_2!5540 lt!197347)) lt!197348))))

(declare-fun reader!0 (BitStream!4474 BitStream!4474) tuple2!10520)

(assert (=> b!126109 (= lt!197344 (reader!0 thiss!1614 (_2!5540 lt!197347)))))

(declare-fun b!126110 () Bool)

(declare-fun res!104476 () Bool)

(assert (=> b!126110 (=> (not res!104476) (not e!83023))))

(assert (=> b!126110 (= res!104476 (isPrefixOf!0 thiss!1614 (_2!5540 lt!197347)))))

(declare-fun b!126111 () Bool)

(declare-fun res!104478 () Bool)

(assert (=> b!126111 (=> (not res!104478) (not e!83026))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126111 (= res!104478 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2575 (buf!2957 thiss!1614))) ((_ sign_extend 32) (currentByte!5690 thiss!1614)) ((_ sign_extend 32) (currentBit!5685 thiss!1614)) noOfBytes!1))))

(declare-fun b!126112 () Bool)

(declare-fun arrayRangesEq!62 (array!5693 array!5693 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126112 (= e!83028 (not (arrayRangesEq!62 arr!227 (_2!5541 lt!197343) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126113 () Bool)

(assert (=> b!126113 (= e!83027 e!83023)))

(declare-fun res!104480 () Bool)

(assert (=> b!126113 (=> (not res!104480) (not e!83023))))

(assert (=> b!126113 (= res!104480 (= (bitIndex!0 (size!2575 (buf!2957 (_2!5540 lt!197347))) (currentByte!5690 (_2!5540 lt!197347)) (currentBit!5685 (_2!5540 lt!197347))) (bvadd (bitIndex!0 (size!2575 (buf!2957 thiss!1614)) (currentByte!5690 thiss!1614) (currentBit!5685 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!197348))))))

(assert (=> b!126113 (= lt!197348 ((_ sign_extend 32) noOfBytes!1))))

(assert (= (and start!24942 res!104481) b!126111))

(assert (= (and b!126111 res!104478) b!126107))

(assert (= (and b!126107 res!104482) b!126113))

(assert (= (and b!126113 res!104480) b!126110))

(assert (= (and b!126110 res!104476) b!126109))

(assert (= (and b!126109 (not res!104477)) b!126112))

(assert (= (and b!126107 (not res!104479)) b!126108))

(assert (= start!24942 b!126106))

(declare-fun m!191601 () Bool)

(assert (=> b!126110 m!191601))

(declare-fun m!191603 () Bool)

(assert (=> b!126107 m!191603))

(declare-fun m!191605 () Bool)

(assert (=> b!126107 m!191605))

(declare-fun m!191607 () Bool)

(assert (=> b!126107 m!191607))

(declare-fun m!191609 () Bool)

(assert (=> start!24942 m!191609))

(declare-fun m!191611 () Bool)

(assert (=> start!24942 m!191611))

(declare-fun m!191613 () Bool)

(assert (=> b!126112 m!191613))

(assert (=> b!126113 m!191603))

(assert (=> b!126113 m!191605))

(declare-fun m!191615 () Bool)

(assert (=> b!126106 m!191615))

(assert (=> b!126108 m!191601))

(declare-fun m!191617 () Bool)

(assert (=> b!126109 m!191617))

(declare-fun m!191619 () Bool)

(assert (=> b!126109 m!191619))

(declare-fun m!191621 () Bool)

(assert (=> b!126109 m!191621))

(declare-fun m!191623 () Bool)

(assert (=> b!126109 m!191623))

(declare-fun m!191625 () Bool)

(assert (=> b!126111 m!191625))

(push 1)

(assert (not start!24942))

(assert (not b!126109))

(assert (not b!126112))

(assert (not b!126111))

(assert (not b!126110))

(assert (not b!126108))

(assert (not b!126113))

(assert (not b!126106))

(assert (not b!126107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

