; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25148 () Bool)

(assert start!25148)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun b!127326 () Bool)

(declare-datatypes ((array!5773 0))(
  ( (array!5774 (arr!3229 (Array (_ BitVec 32) (_ BitVec 8))) (size!2612 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4548 0))(
  ( (BitStream!4549 (buf!3000 array!5773) (currentByte!5745 (_ BitVec 32)) (currentBit!5740 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10720 0))(
  ( (tuple2!10721 (_1!5648 BitStream!4548) (_2!5648 array!5773)) )
))
(declare-fun lt!198752 () tuple2!10720)

(declare-fun arr!227 () array!5773)

(declare-fun e!84050 () Bool)

(declare-fun arrayRangesEq!96 (array!5773 array!5773 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127326 (= e!84050 (not (arrayRangesEq!96 arr!227 (_2!5648 lt!198752) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127327 () Bool)

(declare-fun e!84043 () Bool)

(declare-fun e!84044 () Bool)

(assert (=> b!127327 (= e!84043 (not e!84044))))

(declare-fun res!105549 () Bool)

(assert (=> b!127327 (=> res!105549 e!84044)))

(declare-fun thiss!1614 () BitStream!4548)

(declare-datatypes ((Unit!7827 0))(
  ( (Unit!7828) )
))
(declare-datatypes ((tuple2!10722 0))(
  ( (tuple2!10723 (_1!5649 Unit!7827) (_2!5649 BitStream!4548)) )
))
(declare-fun lt!198750 () tuple2!10722)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127327 (= res!105549 (not (= (bitIndex!0 (size!2612 (buf!3000 (_2!5649 lt!198750))) (currentByte!5745 (_2!5649 lt!198750)) (currentBit!5740 (_2!5649 lt!198750))) (bvadd (bitIndex!0 (size!2612 (buf!3000 thiss!1614)) (currentByte!5745 thiss!1614) (currentBit!5740 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun e!84046 () Bool)

(assert (=> b!127327 e!84046))

(declare-fun res!105552 () Bool)

(assert (=> b!127327 (=> (not res!105552) (not e!84046))))

(assert (=> b!127327 (= res!105552 (= (size!2612 (buf!3000 thiss!1614)) (size!2612 (buf!3000 (_2!5649 lt!198750)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4548 array!5773 (_ BitVec 32) (_ BitVec 32)) tuple2!10722)

(assert (=> b!127327 (= lt!198750 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun res!105555 () Bool)

(assert (=> start!25148 (=> (not res!105555) (not e!84043))))

(assert (=> start!25148 (= res!105555 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2612 arr!227))))))

(assert (=> start!25148 e!84043))

(assert (=> start!25148 true))

(declare-fun array_inv!2401 (array!5773) Bool)

(assert (=> start!25148 (array_inv!2401 arr!227)))

(declare-fun e!84048 () Bool)

(declare-fun inv!12 (BitStream!4548) Bool)

(assert (=> start!25148 (and (inv!12 thiss!1614) e!84048)))

(declare-fun b!127328 () Bool)

(declare-fun e!84047 () Bool)

(assert (=> b!127328 (= e!84047 (not e!84050))))

(declare-fun res!105551 () Bool)

(assert (=> b!127328 (=> res!105551 e!84050)))

(declare-datatypes ((tuple2!10724 0))(
  ( (tuple2!10725 (_1!5650 BitStream!4548) (_2!5650 BitStream!4548)) )
))
(declare-fun lt!198755 () tuple2!10724)

(assert (=> b!127328 (= res!105551 (or (not (= (size!2612 (_2!5648 lt!198752)) (size!2612 arr!227))) (not (= (_1!5648 lt!198752) (_2!5650 lt!198755)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4548 array!5773 (_ BitVec 32) (_ BitVec 32)) tuple2!10720)

(assert (=> b!127328 (= lt!198752 (readByteArrayLoopPure!0 (_1!5650 lt!198755) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198754 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127328 (validate_offset_bits!1 ((_ sign_extend 32) (size!2612 (buf!3000 (_2!5649 lt!198750)))) ((_ sign_extend 32) (currentByte!5745 thiss!1614)) ((_ sign_extend 32) (currentBit!5740 thiss!1614)) lt!198754)))

(declare-fun lt!198751 () Unit!7827)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4548 array!5773 (_ BitVec 64)) Unit!7827)

(assert (=> b!127328 (= lt!198751 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3000 (_2!5649 lt!198750)) lt!198754))))

(declare-fun reader!0 (BitStream!4548 BitStream!4548) tuple2!10724)

(assert (=> b!127328 (= lt!198755 (reader!0 thiss!1614 (_2!5649 lt!198750)))))

(declare-fun b!127329 () Bool)

(declare-fun res!105553 () Bool)

(assert (=> b!127329 (=> (not res!105553) (not e!84047))))

(declare-fun isPrefixOf!0 (BitStream!4548 BitStream!4548) Bool)

(assert (=> b!127329 (= res!105553 (isPrefixOf!0 thiss!1614 (_2!5649 lt!198750)))))

(declare-fun b!127330 () Bool)

(assert (=> b!127330 (= e!84048 (array_inv!2401 (buf!3000 thiss!1614)))))

(declare-fun b!127331 () Bool)

(declare-fun res!105550 () Bool)

(assert (=> b!127331 (=> (not res!105550) (not e!84043))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127331 (= res!105550 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2612 (buf!3000 thiss!1614))) ((_ sign_extend 32) (currentByte!5745 thiss!1614)) ((_ sign_extend 32) (currentBit!5740 thiss!1614)) noOfBytes!1))))

(declare-fun b!127332 () Bool)

(declare-fun res!105554 () Bool)

(assert (=> b!127332 (=> res!105554 e!84044)))

(assert (=> b!127332 (= res!105554 (not (isPrefixOf!0 thiss!1614 (_2!5649 lt!198750))))))

(declare-fun b!127333 () Bool)

(assert (=> b!127333 (= e!84046 e!84047)))

(declare-fun res!105556 () Bool)

(assert (=> b!127333 (=> (not res!105556) (not e!84047))))

(assert (=> b!127333 (= res!105556 (= (bitIndex!0 (size!2612 (buf!3000 (_2!5649 lt!198750))) (currentByte!5745 (_2!5649 lt!198750)) (currentBit!5740 (_2!5649 lt!198750))) (bvadd (bitIndex!0 (size!2612 (buf!3000 thiss!1614)) (currentByte!5745 thiss!1614) (currentBit!5740 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198754))))))

(assert (=> b!127333 (= lt!198754 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127334 () Bool)

(assert (=> b!127334 (= e!84044 true)))

(declare-fun lt!198753 () tuple2!10724)

(assert (=> b!127334 (= lt!198753 (reader!0 thiss!1614 (_2!5649 lt!198750)))))

(assert (= (and start!25148 res!105555) b!127331))

(assert (= (and b!127331 res!105550) b!127327))

(assert (= (and b!127327 res!105552) b!127333))

(assert (= (and b!127333 res!105556) b!127329))

(assert (= (and b!127329 res!105553) b!127328))

(assert (= (and b!127328 (not res!105551)) b!127326))

(assert (= (and b!127327 (not res!105549)) b!127332))

(assert (= (and b!127332 (not res!105554)) b!127334))

(assert (= start!25148 b!127330))

(declare-fun m!193025 () Bool)

(assert (=> b!127329 m!193025))

(declare-fun m!193027 () Bool)

(assert (=> b!127328 m!193027))

(declare-fun m!193029 () Bool)

(assert (=> b!127328 m!193029))

(declare-fun m!193031 () Bool)

(assert (=> b!127328 m!193031))

(declare-fun m!193033 () Bool)

(assert (=> b!127328 m!193033))

(declare-fun m!193035 () Bool)

(assert (=> b!127326 m!193035))

(assert (=> b!127332 m!193025))

(declare-fun m!193037 () Bool)

(assert (=> b!127331 m!193037))

(assert (=> b!127334 m!193033))

(declare-fun m!193039 () Bool)

(assert (=> b!127333 m!193039))

(declare-fun m!193041 () Bool)

(assert (=> b!127333 m!193041))

(declare-fun m!193043 () Bool)

(assert (=> b!127330 m!193043))

(assert (=> b!127327 m!193039))

(assert (=> b!127327 m!193041))

(declare-fun m!193045 () Bool)

(assert (=> b!127327 m!193045))

(declare-fun m!193047 () Bool)

(assert (=> start!25148 m!193047))

(declare-fun m!193049 () Bool)

(assert (=> start!25148 m!193049))

(check-sat (not b!127333) (not b!127330) (not b!127334) (not b!127332) (not start!25148) (not b!127327) (not b!127326) (not b!127331) (not b!127329) (not b!127328))
