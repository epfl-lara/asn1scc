; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47664 () Bool)

(assert start!47664)

(declare-fun b!226943 () Bool)

(declare-fun e!155209 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!362145 () (_ BitVec 64))

(declare-fun lt!362142 () (_ BitVec 64))

(assert (=> b!226943 (= e!155209 (not (= (bvadd lt!362142 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362145)))))

(declare-fun lt!362147 () (_ BitVec 64))

(declare-fun lt!362148 () (_ BitVec 32))

(assert (=> b!226943 (= (bvadd lt!362147 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362148))) lt!362145)))

(declare-datatypes ((array!11370 0))(
  ( (array!11371 (arr!5958 (Array (_ BitVec 32) (_ BitVec 8))) (size!4986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9068 0))(
  ( (BitStream!9069 (buf!5527 array!11370) (currentByte!10359 (_ BitVec 32)) (currentBit!10354 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16882 0))(
  ( (Unit!16883) )
))
(declare-datatypes ((tuple3!1354 0))(
  ( (tuple3!1355 (_1!10560 Unit!16882) (_2!10560 BitStream!9068) (_3!819 array!11370)) )
))
(declare-fun lt!362146 () tuple3!1354)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226943 (= lt!362145 (bitIndex!0 (size!4986 (buf!5527 (_2!10560 lt!362146))) (currentByte!10359 (_2!10560 lt!362146)) (currentBit!10354 (_2!10560 lt!362146))))))

(assert (=> b!226943 (= lt!362147 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362142))))

(declare-datatypes ((tuple2!19482 0))(
  ( (tuple2!19483 (_1!10561 (_ BitVec 8)) (_2!10561 BitStream!9068)) )
))
(declare-fun lt!362143 () tuple2!19482)

(assert (=> b!226943 (= lt!362147 (bitIndex!0 (size!4986 (buf!5527 (_2!10561 lt!362143))) (currentByte!10359 (_2!10561 lt!362143)) (currentBit!10354 (_2!10561 lt!362143))))))

(declare-fun thiss!1870 () BitStream!9068)

(assert (=> b!226943 (= lt!362142 (bitIndex!0 (size!4986 (buf!5527 thiss!1870)) (currentByte!10359 thiss!1870) (currentBit!10354 thiss!1870)))))

(declare-fun arr!308 () array!11370)

(declare-fun readByteArrayLoop!0 (BitStream!9068 array!11370 (_ BitVec 32) (_ BitVec 32)) tuple3!1354)

(assert (=> b!226943 (= lt!362146 (readByteArrayLoop!0 (_2!10561 lt!362143) (array!11371 (store (arr!5958 arr!308) i!761 (_1!10561 lt!362143)) (size!4986 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226943 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4986 (buf!5527 (_2!10561 lt!362143)))) ((_ sign_extend 32) (currentByte!10359 (_2!10561 lt!362143))) ((_ sign_extend 32) (currentBit!10354 (_2!10561 lt!362143))) lt!362148)))

(assert (=> b!226943 (= lt!362148 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362144 () Unit!16882)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9068 BitStream!9068 (_ BitVec 64) (_ BitVec 32)) Unit!16882)

(assert (=> b!226943 (= lt!362144 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10561 lt!362143) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9068) tuple2!19482)

(assert (=> b!226943 (= lt!362143 (readByte!0 thiss!1870))))

(declare-fun res!190413 () Bool)

(assert (=> start!47664 (=> (not res!190413) (not e!155209))))

(assert (=> start!47664 (= res!190413 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4986 arr!308))))))

(assert (=> start!47664 e!155209))

(assert (=> start!47664 true))

(declare-fun array_inv!4727 (array!11370) Bool)

(assert (=> start!47664 (array_inv!4727 arr!308)))

(declare-fun e!155208 () Bool)

(declare-fun inv!12 (BitStream!9068) Bool)

(assert (=> start!47664 (and (inv!12 thiss!1870) e!155208)))

(declare-fun b!226941 () Bool)

(declare-fun res!190414 () Bool)

(assert (=> b!226941 (=> (not res!190414) (not e!155209))))

(assert (=> b!226941 (= res!190414 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4986 (buf!5527 thiss!1870))) ((_ sign_extend 32) (currentByte!10359 thiss!1870)) ((_ sign_extend 32) (currentBit!10354 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226944 () Bool)

(assert (=> b!226944 (= e!155208 (array_inv!4727 (buf!5527 thiss!1870)))))

(declare-fun b!226942 () Bool)

(declare-fun res!190412 () Bool)

(assert (=> b!226942 (=> (not res!190412) (not e!155209))))

(assert (=> b!226942 (= res!190412 (bvslt i!761 to!496))))

(assert (= (and start!47664 res!190413) b!226941))

(assert (= (and b!226941 res!190414) b!226942))

(assert (= (and b!226942 res!190412) b!226943))

(assert (= start!47664 b!226944))

(declare-fun m!348769 () Bool)

(assert (=> b!226943 m!348769))

(declare-fun m!348771 () Bool)

(assert (=> b!226943 m!348771))

(declare-fun m!348773 () Bool)

(assert (=> b!226943 m!348773))

(declare-fun m!348775 () Bool)

(assert (=> b!226943 m!348775))

(declare-fun m!348777 () Bool)

(assert (=> b!226943 m!348777))

(declare-fun m!348779 () Bool)

(assert (=> b!226943 m!348779))

(declare-fun m!348781 () Bool)

(assert (=> b!226943 m!348781))

(declare-fun m!348783 () Bool)

(assert (=> b!226943 m!348783))

(declare-fun m!348785 () Bool)

(assert (=> start!47664 m!348785))

(declare-fun m!348787 () Bool)

(assert (=> start!47664 m!348787))

(declare-fun m!348789 () Bool)

(assert (=> b!226941 m!348789))

(declare-fun m!348791 () Bool)

(assert (=> b!226944 m!348791))

(push 1)

(assert (not b!226943))

(assert (not start!47664))

(assert (not b!226944))

(assert (not b!226941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

