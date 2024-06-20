; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46704 () Bool)

(assert start!46704)

(declare-fun b!224004 () Bool)

(declare-fun res!188037 () Bool)

(declare-fun e!152546 () Bool)

(assert (=> b!224004 (=> (not res!188037) (not e!152546))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!224004 (= res!188037 (bvslt i!761 to!496))))

(declare-fun b!224005 () Bool)

(assert (=> b!224005 (= e!152546 (not true))))

(declare-datatypes ((array!11020 0))(
  ( (array!11021 (arr!5781 (Array (_ BitVec 32) (_ BitVec 8))) (size!4833 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11020)

(declare-fun lt!355218 () array!11020)

(declare-fun arrayRangesEq!729 (array!11020 array!11020 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224005 (arrayRangesEq!729 arr!308 lt!355218 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((BitStream!8768 0))(
  ( (BitStream!8769 (buf!5377 array!11020) (currentByte!10105 (_ BitVec 32)) (currentBit!10100 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19154 0))(
  ( (tuple2!19155 (_1!10315 (_ BitVec 8)) (_2!10315 BitStream!8768)) )
))
(declare-fun lt!355224 () tuple2!19154)

(declare-datatypes ((Unit!16335 0))(
  ( (Unit!16336) )
))
(declare-fun lt!355220 () Unit!16335)

(declare-fun arrayUpdatedAtPrefixLemma!321 (array!11020 (_ BitVec 32) (_ BitVec 8)) Unit!16335)

(assert (=> b!224005 (= lt!355220 (arrayUpdatedAtPrefixLemma!321 arr!308 i!761 (_1!10315 lt!355224)))))

(declare-fun lt!355223 () (_ BitVec 64))

(declare-datatypes ((tuple3!1192 0))(
  ( (tuple3!1193 (_1!10316 Unit!16335) (_2!10316 BitStream!8768) (_3!738 array!11020)) )
))
(declare-fun lt!355217 () tuple3!1192)

(declare-fun lt!355222 () (_ BitVec 64))

(declare-fun lt!355221 () (_ BitVec 32))

(declare-fun lt!355216 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!8768)

(assert (=> b!224005 (and (= (bvadd lt!355222 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355221))) lt!355216) (= (bvadd lt!355223 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355216) (= (buf!5377 thiss!1870) (buf!5377 (_2!10316 lt!355217))) (= (size!4833 arr!308) (size!4833 (_3!738 lt!355217))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224005 (= lt!355216 (bitIndex!0 (size!4833 (buf!5377 (_2!10316 lt!355217))) (currentByte!10105 (_2!10316 lt!355217)) (currentBit!10100 (_2!10316 lt!355217))))))

(assert (=> b!224005 (= lt!355222 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355223))))

(assert (=> b!224005 (= lt!355222 (bitIndex!0 (size!4833 (buf!5377 (_2!10315 lt!355224))) (currentByte!10105 (_2!10315 lt!355224)) (currentBit!10100 (_2!10315 lt!355224))))))

(assert (=> b!224005 (= lt!355223 (bitIndex!0 (size!4833 (buf!5377 thiss!1870)) (currentByte!10105 thiss!1870) (currentBit!10100 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8768 array!11020 (_ BitVec 32) (_ BitVec 32)) tuple3!1192)

(assert (=> b!224005 (= lt!355217 (readByteArrayLoop!0 (_2!10315 lt!355224) lt!355218 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224005 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4833 (buf!5377 (_2!10315 lt!355224)))) ((_ sign_extend 32) (currentByte!10105 (_2!10315 lt!355224))) ((_ sign_extend 32) (currentBit!10100 (_2!10315 lt!355224))) lt!355221)))

(assert (=> b!224005 (= lt!355221 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355219 () Unit!16335)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8768 BitStream!8768 (_ BitVec 64) (_ BitVec 32)) Unit!16335)

(assert (=> b!224005 (= lt!355219 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10315 lt!355224) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224005 (= lt!355218 (array!11021 (store (arr!5781 arr!308) i!761 (_1!10315 lt!355224)) (size!4833 arr!308)))))

(declare-fun readByte!0 (BitStream!8768) tuple2!19154)

(assert (=> b!224005 (= lt!355224 (readByte!0 thiss!1870))))

(declare-fun b!224003 () Bool)

(declare-fun res!188035 () Bool)

(assert (=> b!224003 (=> (not res!188035) (not e!152546))))

(assert (=> b!224003 (= res!188035 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4833 (buf!5377 thiss!1870))) ((_ sign_extend 32) (currentByte!10105 thiss!1870)) ((_ sign_extend 32) (currentBit!10100 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224006 () Bool)

(declare-fun e!152545 () Bool)

(declare-fun array_inv!4574 (array!11020) Bool)

(assert (=> b!224006 (= e!152545 (array_inv!4574 (buf!5377 thiss!1870)))))

(declare-fun res!188036 () Bool)

(assert (=> start!46704 (=> (not res!188036) (not e!152546))))

(assert (=> start!46704 (= res!188036 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4833 arr!308))))))

(assert (=> start!46704 e!152546))

(assert (=> start!46704 true))

(assert (=> start!46704 (array_inv!4574 arr!308)))

(declare-fun inv!12 (BitStream!8768) Bool)

(assert (=> start!46704 (and (inv!12 thiss!1870) e!152545)))

(assert (= (and start!46704 res!188036) b!224003))

(assert (= (and b!224003 res!188035) b!224004))

(assert (= (and b!224004 res!188037) b!224005))

(assert (= start!46704 b!224006))

(declare-fun m!343507 () Bool)

(assert (=> b!224005 m!343507))

(declare-fun m!343509 () Bool)

(assert (=> b!224005 m!343509))

(declare-fun m!343511 () Bool)

(assert (=> b!224005 m!343511))

(declare-fun m!343513 () Bool)

(assert (=> b!224005 m!343513))

(declare-fun m!343515 () Bool)

(assert (=> b!224005 m!343515))

(declare-fun m!343517 () Bool)

(assert (=> b!224005 m!343517))

(declare-fun m!343519 () Bool)

(assert (=> b!224005 m!343519))

(declare-fun m!343521 () Bool)

(assert (=> b!224005 m!343521))

(declare-fun m!343523 () Bool)

(assert (=> b!224005 m!343523))

(declare-fun m!343525 () Bool)

(assert (=> b!224005 m!343525))

(declare-fun m!343527 () Bool)

(assert (=> b!224003 m!343527))

(declare-fun m!343529 () Bool)

(assert (=> b!224006 m!343529))

(declare-fun m!343531 () Bool)

(assert (=> start!46704 m!343531))

(declare-fun m!343533 () Bool)

(assert (=> start!46704 m!343533))

(push 1)

(assert (not b!224005))

(assert (not b!224006))

(assert (not b!224003))

(assert (not start!46704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

