; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47840 () Bool)

(assert start!47840)

(declare-fun b!227670 () Bool)

(declare-fun e!155866 () Bool)

(declare-datatypes ((array!11456 0))(
  ( (array!11457 (arr!6004 (Array (_ BitVec 32) (_ BitVec 8))) (size!5026 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9148 0))(
  ( (BitStream!9149 (buf!5567 array!11456) (currentByte!10411 (_ BitVec 32)) (currentBit!10406 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9148)

(declare-fun array_inv!4767 (array!11456) Bool)

(assert (=> b!227670 (= e!155866 (array_inv!4767 (buf!5567 thiss!1870)))))

(declare-fun b!227668 () Bool)

(declare-fun res!190989 () Bool)

(declare-fun e!155868 () Bool)

(assert (=> b!227668 (=> (not res!190989) (not e!155868))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227668 (= res!190989 (bvslt i!761 to!496))))

(declare-fun res!190990 () Bool)

(assert (=> start!47840 (=> (not res!190990) (not e!155868))))

(declare-fun arr!308 () array!11456)

(assert (=> start!47840 (= res!190990 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5026 arr!308))))))

(assert (=> start!47840 e!155868))

(assert (=> start!47840 true))

(assert (=> start!47840 (array_inv!4767 arr!308)))

(declare-fun inv!12 (BitStream!9148) Bool)

(assert (=> start!47840 (and (inv!12 thiss!1870) e!155866)))

(declare-fun b!227669 () Bool)

(assert (=> b!227669 (= e!155868 (not (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5026 arr!308)) (bvslt i!761 (bvadd #b00000000000000000000000000000001 i!761)))))))

(declare-datatypes ((Unit!17026 0))(
  ( (Unit!17027) )
))
(declare-datatypes ((tuple3!1434 0))(
  ( (tuple3!1435 (_1!10652 Unit!17026) (_2!10652 BitStream!9148) (_3!859 array!11456)) )
))
(declare-fun lt!364254 () tuple3!1434)

(declare-fun arrayRangesEq!862 (array!11456 array!11456 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227669 (arrayRangesEq!862 arr!308 (_3!859 lt!364254) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364256 () array!11456)

(declare-fun lt!364248 () Unit!17026)

(declare-fun arrayRangesEqTransitive!285 (array!11456 array!11456 array!11456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17026)

(assert (=> b!227669 (= lt!364248 (arrayRangesEqTransitive!285 arr!308 lt!364256 (_3!859 lt!364254) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227669 (arrayRangesEq!862 arr!308 lt!364256 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19586 0))(
  ( (tuple2!19587 (_1!10653 (_ BitVec 8)) (_2!10653 BitStream!9148)) )
))
(declare-fun lt!364250 () tuple2!19586)

(declare-fun lt!364249 () Unit!17026)

(declare-fun arrayUpdatedAtPrefixLemma!421 (array!11456 (_ BitVec 32) (_ BitVec 8)) Unit!17026)

(assert (=> b!227669 (= lt!364249 (arrayUpdatedAtPrefixLemma!421 arr!308 i!761 (_1!10653 lt!364250)))))

(declare-fun lt!364253 () (_ BitVec 64))

(declare-fun lt!364252 () (_ BitVec 64))

(declare-fun lt!364255 () (_ BitVec 32))

(declare-fun lt!364257 () (_ BitVec 64))

(assert (=> b!227669 (and (= (bvadd lt!364252 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364255))) lt!364257) (= (bvadd lt!364253 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364257) (= (buf!5567 thiss!1870) (buf!5567 (_2!10652 lt!364254))) (= (size!5026 arr!308) (size!5026 (_3!859 lt!364254))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227669 (= lt!364257 (bitIndex!0 (size!5026 (buf!5567 (_2!10652 lt!364254))) (currentByte!10411 (_2!10652 lt!364254)) (currentBit!10406 (_2!10652 lt!364254))))))

(assert (=> b!227669 (= lt!364252 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364253))))

(assert (=> b!227669 (= lt!364252 (bitIndex!0 (size!5026 (buf!5567 (_2!10653 lt!364250))) (currentByte!10411 (_2!10653 lt!364250)) (currentBit!10406 (_2!10653 lt!364250))))))

(assert (=> b!227669 (= lt!364253 (bitIndex!0 (size!5026 (buf!5567 thiss!1870)) (currentByte!10411 thiss!1870) (currentBit!10406 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9148 array!11456 (_ BitVec 32) (_ BitVec 32)) tuple3!1434)

(assert (=> b!227669 (= lt!364254 (readByteArrayLoop!0 (_2!10653 lt!364250) lt!364256 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227669 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5026 (buf!5567 (_2!10653 lt!364250)))) ((_ sign_extend 32) (currentByte!10411 (_2!10653 lt!364250))) ((_ sign_extend 32) (currentBit!10406 (_2!10653 lt!364250))) lt!364255)))

(assert (=> b!227669 (= lt!364255 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364251 () Unit!17026)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9148 BitStream!9148 (_ BitVec 64) (_ BitVec 32)) Unit!17026)

(assert (=> b!227669 (= lt!364251 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10653 lt!364250) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227669 (= lt!364256 (array!11457 (store (arr!6004 arr!308) i!761 (_1!10653 lt!364250)) (size!5026 arr!308)))))

(declare-fun readByte!0 (BitStream!9148) tuple2!19586)

(assert (=> b!227669 (= lt!364250 (readByte!0 thiss!1870))))

(declare-fun b!227667 () Bool)

(declare-fun res!190988 () Bool)

(assert (=> b!227667 (=> (not res!190988) (not e!155868))))

(assert (=> b!227667 (= res!190988 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5026 (buf!5567 thiss!1870))) ((_ sign_extend 32) (currentByte!10411 thiss!1870)) ((_ sign_extend 32) (currentBit!10406 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47840 res!190990) b!227667))

(assert (= (and b!227667 res!190988) b!227668))

(assert (= (and b!227668 res!190989) b!227669))

(assert (= start!47840 b!227670))

(declare-fun m!350365 () Bool)

(assert (=> b!227670 m!350365))

(declare-fun m!350367 () Bool)

(assert (=> start!47840 m!350367))

(declare-fun m!350369 () Bool)

(assert (=> start!47840 m!350369))

(declare-fun m!350371 () Bool)

(assert (=> b!227669 m!350371))

(declare-fun m!350373 () Bool)

(assert (=> b!227669 m!350373))

(declare-fun m!350375 () Bool)

(assert (=> b!227669 m!350375))

(declare-fun m!350377 () Bool)

(assert (=> b!227669 m!350377))

(declare-fun m!350379 () Bool)

(assert (=> b!227669 m!350379))

(declare-fun m!350381 () Bool)

(assert (=> b!227669 m!350381))

(declare-fun m!350383 () Bool)

(assert (=> b!227669 m!350383))

(declare-fun m!350385 () Bool)

(assert (=> b!227669 m!350385))

(declare-fun m!350387 () Bool)

(assert (=> b!227669 m!350387))

(declare-fun m!350389 () Bool)

(assert (=> b!227669 m!350389))

(declare-fun m!350391 () Bool)

(assert (=> b!227669 m!350391))

(declare-fun m!350393 () Bool)

(assert (=> b!227669 m!350393))

(declare-fun m!350395 () Bool)

(assert (=> b!227667 m!350395))

(push 1)

(assert (not b!227667))

(assert (not start!47840))

(assert (not b!227670))

(assert (not b!227669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

