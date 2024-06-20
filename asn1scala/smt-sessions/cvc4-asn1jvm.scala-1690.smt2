; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46938 () Bool)

(assert start!46938)

(declare-fun res!188682 () Bool)

(declare-fun e!153287 () Bool)

(assert (=> start!46938 (=> (not res!188682) (not e!153287))))

(declare-datatypes ((array!11116 0))(
  ( (array!11117 (arr!5832 (Array (_ BitVec 32) (_ BitVec 8))) (size!4878 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11116)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46938 (= res!188682 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4878 arr!308))))))

(assert (=> start!46938 e!153287))

(assert (=> start!46938 true))

(declare-fun array_inv!4619 (array!11116) Bool)

(assert (=> start!46938 (array_inv!4619 arr!308)))

(declare-datatypes ((BitStream!8858 0))(
  ( (BitStream!8859 (buf!5422 array!11116) (currentByte!10168 (_ BitVec 32)) (currentBit!10163 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8858)

(declare-fun e!153289 () Bool)

(declare-fun inv!12 (BitStream!8858) Bool)

(assert (=> start!46938 (and (inv!12 thiss!1870) e!153289)))

(declare-fun b!224814 () Bool)

(declare-fun res!188681 () Bool)

(assert (=> b!224814 (=> (not res!188681) (not e!153287))))

(assert (=> b!224814 (= res!188681 (bvslt i!761 to!496))))

(declare-fun b!224813 () Bool)

(declare-fun res!188680 () Bool)

(assert (=> b!224813 (=> (not res!188680) (not e!153287))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224813 (= res!188680 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4878 (buf!5422 thiss!1870))) ((_ sign_extend 32) (currentByte!10168 thiss!1870)) ((_ sign_extend 32) (currentBit!10163 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224815 () Bool)

(assert (=> b!224815 (= e!153287 (not (bvsle i!761 (size!4878 arr!308))))))

(declare-datatypes ((tuple2!19266 0))(
  ( (tuple2!19267 (_1!10416 (_ BitVec 8)) (_2!10416 BitStream!8858)) )
))
(declare-fun lt!357659 () tuple2!19266)

(declare-datatypes ((Unit!16480 0))(
  ( (Unit!16481) )
))
(declare-datatypes ((tuple3!1282 0))(
  ( (tuple3!1283 (_1!10417 Unit!16480) (_2!10417 BitStream!8858) (_3!783 array!11116)) )
))
(declare-fun lt!357657 () tuple3!1282)

(assert (=> b!224815 (and (= (_1!10416 lt!357659) (select (arr!5832 (_3!783 lt!357657)) i!761)) (= (select (arr!5832 (_3!783 lt!357657)) i!761) (_1!10416 lt!357659)))))

(declare-fun lt!357663 () Unit!16480)

(declare-fun lt!357655 () array!11116)

(declare-fun arrayRangesEqImpliesEq!96 (array!11116 array!11116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16480)

(assert (=> b!224815 (= lt!357663 (arrayRangesEqImpliesEq!96 lt!357655 (_3!783 lt!357657) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!774 (array!11116 array!11116 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224815 (arrayRangesEq!774 arr!308 (_3!783 lt!357657) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357653 () Unit!16480)

(declare-fun arrayRangesEqTransitive!245 (array!11116 array!11116 array!11116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16480)

(assert (=> b!224815 (= lt!357653 (arrayRangesEqTransitive!245 arr!308 lt!357655 (_3!783 lt!357657) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224815 (arrayRangesEq!774 arr!308 lt!357655 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357658 () Unit!16480)

(declare-fun arrayUpdatedAtPrefixLemma!366 (array!11116 (_ BitVec 32) (_ BitVec 8)) Unit!16480)

(assert (=> b!224815 (= lt!357658 (arrayUpdatedAtPrefixLemma!366 arr!308 i!761 (_1!10416 lt!357659)))))

(declare-fun lt!357662 () (_ BitVec 64))

(declare-fun lt!357661 () (_ BitVec 32))

(declare-fun lt!357660 () (_ BitVec 64))

(declare-fun lt!357654 () (_ BitVec 64))

(assert (=> b!224815 (and (= (bvadd lt!357662 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357661))) lt!357654) (= (bvadd lt!357660 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357654) (= (buf!5422 thiss!1870) (buf!5422 (_2!10417 lt!357657))) (= (size!4878 arr!308) (size!4878 (_3!783 lt!357657))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224815 (= lt!357654 (bitIndex!0 (size!4878 (buf!5422 (_2!10417 lt!357657))) (currentByte!10168 (_2!10417 lt!357657)) (currentBit!10163 (_2!10417 lt!357657))))))

(assert (=> b!224815 (= lt!357662 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357660))))

(assert (=> b!224815 (= lt!357662 (bitIndex!0 (size!4878 (buf!5422 (_2!10416 lt!357659))) (currentByte!10168 (_2!10416 lt!357659)) (currentBit!10163 (_2!10416 lt!357659))))))

(assert (=> b!224815 (= lt!357660 (bitIndex!0 (size!4878 (buf!5422 thiss!1870)) (currentByte!10168 thiss!1870) (currentBit!10163 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8858 array!11116 (_ BitVec 32) (_ BitVec 32)) tuple3!1282)

(assert (=> b!224815 (= lt!357657 (readByteArrayLoop!0 (_2!10416 lt!357659) lt!357655 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224815 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4878 (buf!5422 (_2!10416 lt!357659)))) ((_ sign_extend 32) (currentByte!10168 (_2!10416 lt!357659))) ((_ sign_extend 32) (currentBit!10163 (_2!10416 lt!357659))) lt!357661)))

(assert (=> b!224815 (= lt!357661 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357656 () Unit!16480)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8858 BitStream!8858 (_ BitVec 64) (_ BitVec 32)) Unit!16480)

(assert (=> b!224815 (= lt!357656 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10416 lt!357659) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224815 (= lt!357655 (array!11117 (store (arr!5832 arr!308) i!761 (_1!10416 lt!357659)) (size!4878 arr!308)))))

(declare-fun readByte!0 (BitStream!8858) tuple2!19266)

(assert (=> b!224815 (= lt!357659 (readByte!0 thiss!1870))))

(declare-fun b!224816 () Bool)

(assert (=> b!224816 (= e!153289 (array_inv!4619 (buf!5422 thiss!1870)))))

(assert (= (and start!46938 res!188682) b!224813))

(assert (= (and b!224813 res!188680) b!224814))

(assert (= (and b!224814 res!188681) b!224815))

(assert (= start!46938 b!224816))

(declare-fun m!345491 () Bool)

(assert (=> start!46938 m!345491))

(declare-fun m!345493 () Bool)

(assert (=> start!46938 m!345493))

(declare-fun m!345495 () Bool)

(assert (=> b!224813 m!345495))

(declare-fun m!345497 () Bool)

(assert (=> b!224815 m!345497))

(declare-fun m!345499 () Bool)

(assert (=> b!224815 m!345499))

(declare-fun m!345501 () Bool)

(assert (=> b!224815 m!345501))

(declare-fun m!345503 () Bool)

(assert (=> b!224815 m!345503))

(declare-fun m!345505 () Bool)

(assert (=> b!224815 m!345505))

(declare-fun m!345507 () Bool)

(assert (=> b!224815 m!345507))

(declare-fun m!345509 () Bool)

(assert (=> b!224815 m!345509))

(declare-fun m!345511 () Bool)

(assert (=> b!224815 m!345511))

(declare-fun m!345513 () Bool)

(assert (=> b!224815 m!345513))

(declare-fun m!345515 () Bool)

(assert (=> b!224815 m!345515))

(declare-fun m!345517 () Bool)

(assert (=> b!224815 m!345517))

(declare-fun m!345519 () Bool)

(assert (=> b!224815 m!345519))

(declare-fun m!345521 () Bool)

(assert (=> b!224815 m!345521))

(declare-fun m!345523 () Bool)

(assert (=> b!224815 m!345523))

(declare-fun m!345525 () Bool)

(assert (=> b!224816 m!345525))

(push 1)

(assert (not b!224813))

(assert (not b!224816))

(assert (not b!224815))

(assert (not start!46938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

