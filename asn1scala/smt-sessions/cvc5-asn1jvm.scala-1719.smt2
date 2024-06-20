; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47492 () Bool)

(assert start!47492)

(declare-fun b!226340 () Bool)

(declare-fun e!154700 () Bool)

(declare-fun lt!360201 () (_ BitVec 32))

(declare-fun lt!360197 () (_ BitVec 32))

(assert (=> b!226340 (= e!154700 (not (or (= lt!360201 #b00000000000000000000000000000000) (= lt!360201 (bvand lt!360197 #b10000000000000000000000000000000)))))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!226340 (= lt!360201 (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000))))

(declare-datatypes ((array!11315 0))(
  ( (array!11316 (arr!5926 (Array (_ BitVec 32) (_ BitVec 8))) (size!4963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9022 0))(
  ( (BitStream!9023 (buf!5504 array!11315) (currentByte!10318 (_ BitVec 32)) (currentBit!10313 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19400 0))(
  ( (tuple2!19401 (_1!10496 (_ BitVec 8)) (_2!10496 BitStream!9022)) )
))
(declare-fun lt!360200 () tuple2!19400)

(declare-fun thiss!1870 () BitStream!9022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226340 (= (bitIndex!0 (size!4963 (buf!5504 (_2!10496 lt!360200))) (currentByte!10318 (_2!10496 lt!360200)) (currentBit!10313 (_2!10496 lt!360200))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4963 (buf!5504 thiss!1870)) (currentByte!10318 thiss!1870) (currentBit!10313 thiss!1870))))))

(declare-datatypes ((Unit!16737 0))(
  ( (Unit!16738) )
))
(declare-datatypes ((tuple3!1308 0))(
  ( (tuple3!1309 (_1!10497 Unit!16737) (_2!10497 BitStream!9022) (_3!796 array!11315)) )
))
(declare-fun lt!360198 () tuple3!1308)

(declare-fun arr!308 () array!11315)

(declare-fun readByteArrayLoop!0 (BitStream!9022 array!11315 (_ BitVec 32) (_ BitVec 32)) tuple3!1308)

(assert (=> b!226340 (= lt!360198 (readByteArrayLoop!0 (_2!10496 lt!360200) (array!11316 (store (arr!5926 arr!308) i!761 (_1!10496 lt!360200)) (size!4963 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226340 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4963 (buf!5504 (_2!10496 lt!360200)))) ((_ sign_extend 32) (currentByte!10318 (_2!10496 lt!360200))) ((_ sign_extend 32) (currentBit!10313 (_2!10496 lt!360200))) lt!360197)))

(assert (=> b!226340 (= lt!360197 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360199 () Unit!16737)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9022 BitStream!9022 (_ BitVec 64) (_ BitVec 32)) Unit!16737)

(assert (=> b!226340 (= lt!360199 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10496 lt!360200) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9022) tuple2!19400)

(assert (=> b!226340 (= lt!360200 (readByte!0 thiss!1870))))

(declare-fun b!226338 () Bool)

(declare-fun res!189923 () Bool)

(assert (=> b!226338 (=> (not res!189923) (not e!154700))))

(assert (=> b!226338 (= res!189923 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4963 (buf!5504 thiss!1870))) ((_ sign_extend 32) (currentByte!10318 thiss!1870)) ((_ sign_extend 32) (currentBit!10313 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189925 () Bool)

(assert (=> start!47492 (=> (not res!189925) (not e!154700))))

(assert (=> start!47492 (= res!189925 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4963 arr!308))))))

(assert (=> start!47492 e!154700))

(assert (=> start!47492 true))

(declare-fun array_inv!4704 (array!11315) Bool)

(assert (=> start!47492 (array_inv!4704 arr!308)))

(declare-fun e!154699 () Bool)

(declare-fun inv!12 (BitStream!9022) Bool)

(assert (=> start!47492 (and (inv!12 thiss!1870) e!154699)))

(declare-fun b!226341 () Bool)

(assert (=> b!226341 (= e!154699 (array_inv!4704 (buf!5504 thiss!1870)))))

(declare-fun b!226339 () Bool)

(declare-fun res!189924 () Bool)

(assert (=> b!226339 (=> (not res!189924) (not e!154700))))

(assert (=> b!226339 (= res!189924 (bvslt i!761 to!496))))

(assert (= (and start!47492 res!189925) b!226338))

(assert (= (and b!226338 res!189923) b!226339))

(assert (= (and b!226339 res!189924) b!226340))

(assert (= start!47492 b!226341))

(declare-fun m!347653 () Bool)

(assert (=> b!226340 m!347653))

(declare-fun m!347655 () Bool)

(assert (=> b!226340 m!347655))

(declare-fun m!347657 () Bool)

(assert (=> b!226340 m!347657))

(declare-fun m!347659 () Bool)

(assert (=> b!226340 m!347659))

(declare-fun m!347661 () Bool)

(assert (=> b!226340 m!347661))

(declare-fun m!347663 () Bool)

(assert (=> b!226340 m!347663))

(declare-fun m!347665 () Bool)

(assert (=> b!226340 m!347665))

(declare-fun m!347667 () Bool)

(assert (=> b!226338 m!347667))

(declare-fun m!347669 () Bool)

(assert (=> start!47492 m!347669))

(declare-fun m!347671 () Bool)

(assert (=> start!47492 m!347671))

(declare-fun m!347673 () Bool)

(assert (=> b!226341 m!347673))

(push 1)

(assert (not start!47492))

(assert (not b!226341))

(assert (not b!226340))

(assert (not b!226338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

