; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47490 () Bool)

(assert start!47490)

(declare-fun b!226326 () Bool)

(declare-fun res!189915 () Bool)

(declare-fun e!154688 () Bool)

(assert (=> b!226326 (=> (not res!189915) (not e!154688))))

(declare-datatypes ((array!11313 0))(
  ( (array!11314 (arr!5925 (Array (_ BitVec 32) (_ BitVec 8))) (size!4962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9020 0))(
  ( (BitStream!9021 (buf!5503 array!11313) (currentByte!10317 (_ BitVec 32)) (currentBit!10312 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9020)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226326 (= res!189915 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4962 (buf!5503 thiss!1870))) ((_ sign_extend 32) (currentByte!10317 thiss!1870)) ((_ sign_extend 32) (currentBit!10312 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189916 () Bool)

(assert (=> start!47490 (=> (not res!189916) (not e!154688))))

(declare-fun arr!308 () array!11313)

(assert (=> start!47490 (= res!189916 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4962 arr!308))))))

(assert (=> start!47490 e!154688))

(assert (=> start!47490 true))

(declare-fun array_inv!4703 (array!11313) Bool)

(assert (=> start!47490 (array_inv!4703 arr!308)))

(declare-fun e!154687 () Bool)

(declare-fun inv!12 (BitStream!9020) Bool)

(assert (=> start!47490 (and (inv!12 thiss!1870) e!154687)))

(declare-fun b!226329 () Bool)

(assert (=> b!226329 (= e!154687 (array_inv!4703 (buf!5503 thiss!1870)))))

(declare-fun b!226327 () Bool)

(declare-fun res!189914 () Bool)

(assert (=> b!226327 (=> (not res!189914) (not e!154688))))

(assert (=> b!226327 (= res!189914 (bvslt i!761 to!496))))

(declare-fun b!226328 () Bool)

(assert (=> b!226328 (= e!154688 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19398 0))(
  ( (tuple2!19399 (_1!10494 (_ BitVec 8)) (_2!10494 BitStream!9020)) )
))
(declare-fun lt!360185 () tuple2!19398)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226328 (= (bitIndex!0 (size!4962 (buf!5503 (_2!10494 lt!360185))) (currentByte!10317 (_2!10494 lt!360185)) (currentBit!10312 (_2!10494 lt!360185))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4962 (buf!5503 thiss!1870)) (currentByte!10317 thiss!1870) (currentBit!10312 thiss!1870))))))

(declare-datatypes ((Unit!16735 0))(
  ( (Unit!16736) )
))
(declare-datatypes ((tuple3!1306 0))(
  ( (tuple3!1307 (_1!10495 Unit!16735) (_2!10495 BitStream!9020) (_3!795 array!11313)) )
))
(declare-fun lt!360184 () tuple3!1306)

(declare-fun readByteArrayLoop!0 (BitStream!9020 array!11313 (_ BitVec 32) (_ BitVec 32)) tuple3!1306)

(assert (=> b!226328 (= lt!360184 (readByteArrayLoop!0 (_2!10494 lt!360185) (array!11314 (store (arr!5925 arr!308) i!761 (_1!10494 lt!360185)) (size!4962 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226328 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4962 (buf!5503 (_2!10494 lt!360185)))) ((_ sign_extend 32) (currentByte!10317 (_2!10494 lt!360185))) ((_ sign_extend 32) (currentBit!10312 (_2!10494 lt!360185))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360186 () Unit!16735)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9020 BitStream!9020 (_ BitVec 64) (_ BitVec 32)) Unit!16735)

(assert (=> b!226328 (= lt!360186 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10494 lt!360185) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9020) tuple2!19398)

(assert (=> b!226328 (= lt!360185 (readByte!0 thiss!1870))))

(assert (= (and start!47490 res!189916) b!226326))

(assert (= (and b!226326 res!189915) b!226327))

(assert (= (and b!226327 res!189914) b!226328))

(assert (= start!47490 b!226329))

(declare-fun m!347631 () Bool)

(assert (=> b!226326 m!347631))

(declare-fun m!347633 () Bool)

(assert (=> start!47490 m!347633))

(declare-fun m!347635 () Bool)

(assert (=> start!47490 m!347635))

(declare-fun m!347637 () Bool)

(assert (=> b!226329 m!347637))

(declare-fun m!347639 () Bool)

(assert (=> b!226328 m!347639))

(declare-fun m!347641 () Bool)

(assert (=> b!226328 m!347641))

(declare-fun m!347643 () Bool)

(assert (=> b!226328 m!347643))

(declare-fun m!347645 () Bool)

(assert (=> b!226328 m!347645))

(declare-fun m!347647 () Bool)

(assert (=> b!226328 m!347647))

(declare-fun m!347649 () Bool)

(assert (=> b!226328 m!347649))

(declare-fun m!347651 () Bool)

(assert (=> b!226328 m!347651))

(push 1)

(assert (not b!226326))

(assert (not start!47490))

(assert (not b!226329))

(assert (not b!226328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

