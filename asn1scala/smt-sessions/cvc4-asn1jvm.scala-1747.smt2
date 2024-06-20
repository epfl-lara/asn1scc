; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48012 () Bool)

(assert start!48012)

(declare-fun b!228230 () Bool)

(declare-fun e!156361 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11508 0))(
  ( (array!11509 (arr!6033 (Array (_ BitVec 32) (_ BitVec 8))) (size!5049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9194 0))(
  ( (BitStream!9195 (buf!5590 array!11508) (currentByte!10446 (_ BitVec 32)) (currentBit!10441 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17138 0))(
  ( (Unit!17139) )
))
(declare-datatypes ((tuple3!1480 0))(
  ( (tuple3!1481 (_1!10710 Unit!17138) (_2!10710 BitStream!9194) (_3!882 array!11508)) )
))
(declare-fun lt!366075 () tuple3!1480)

(assert (=> b!228230 (= e!156361 (not (bvslt i!761 (size!5049 (_3!882 lt!366075)))))))

(declare-datatypes ((tuple2!19656 0))(
  ( (tuple2!19657 (_1!10711 (_ BitVec 8)) (_2!10711 BitStream!9194)) )
))
(declare-fun lt!366074 () tuple2!19656)

(assert (=> b!228230 (and (= (_1!10711 lt!366074) (select (arr!6033 (_3!882 lt!366075)) i!761)) (= (select (arr!6033 (_3!882 lt!366075)) i!761) (_1!10711 lt!366074)))))

(declare-fun lt!366079 () array!11508)

(declare-fun lt!366071 () Unit!17138)

(declare-fun arrayRangesEqImpliesEq!141 (array!11508 array!11508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17138)

(assert (=> b!228230 (= lt!366071 (arrayRangesEqImpliesEq!141 lt!366079 (_3!882 lt!366075) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11508)

(declare-fun arrayRangesEq!885 (array!11508 array!11508 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228230 (arrayRangesEq!885 arr!308 (_3!882 lt!366075) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366072 () Unit!17138)

(declare-fun arrayRangesEqTransitive!308 (array!11508 array!11508 array!11508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17138)

(assert (=> b!228230 (= lt!366072 (arrayRangesEqTransitive!308 arr!308 lt!366079 (_3!882 lt!366075) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228230 (arrayRangesEq!885 arr!308 lt!366079 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366080 () Unit!17138)

(declare-fun arrayUpdatedAtPrefixLemma!444 (array!11508 (_ BitVec 32) (_ BitVec 8)) Unit!17138)

(assert (=> b!228230 (= lt!366080 (arrayUpdatedAtPrefixLemma!444 arr!308 i!761 (_1!10711 lt!366074)))))

(declare-fun thiss!1870 () BitStream!9194)

(declare-fun lt!366081 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!366077 () (_ BitVec 64))

(declare-fun lt!366073 () (_ BitVec 64))

(declare-fun lt!366078 () (_ BitVec 32))

(assert (=> b!228230 (and (= (bvadd lt!366073 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366078))) lt!366077) (= (bvadd lt!366081 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366077) (= (buf!5590 thiss!1870) (buf!5590 (_2!10710 lt!366075))) (= (size!5049 arr!308) (size!5049 (_3!882 lt!366075))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228230 (= lt!366077 (bitIndex!0 (size!5049 (buf!5590 (_2!10710 lt!366075))) (currentByte!10446 (_2!10710 lt!366075)) (currentBit!10441 (_2!10710 lt!366075))))))

(assert (=> b!228230 (= lt!366073 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366081))))

(assert (=> b!228230 (= lt!366073 (bitIndex!0 (size!5049 (buf!5590 (_2!10711 lt!366074))) (currentByte!10446 (_2!10711 lt!366074)) (currentBit!10441 (_2!10711 lt!366074))))))

(assert (=> b!228230 (= lt!366081 (bitIndex!0 (size!5049 (buf!5590 thiss!1870)) (currentByte!10446 thiss!1870) (currentBit!10441 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9194 array!11508 (_ BitVec 32) (_ BitVec 32)) tuple3!1480)

(assert (=> b!228230 (= lt!366075 (readByteArrayLoop!0 (_2!10711 lt!366074) lt!366079 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228230 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5049 (buf!5590 (_2!10711 lt!366074)))) ((_ sign_extend 32) (currentByte!10446 (_2!10711 lt!366074))) ((_ sign_extend 32) (currentBit!10441 (_2!10711 lt!366074))) lt!366078)))

(assert (=> b!228230 (= lt!366078 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366076 () Unit!17138)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9194 BitStream!9194 (_ BitVec 64) (_ BitVec 32)) Unit!17138)

(assert (=> b!228230 (= lt!366076 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10711 lt!366074) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228230 (= lt!366079 (array!11509 (store (arr!6033 arr!308) i!761 (_1!10711 lt!366074)) (size!5049 arr!308)))))

(declare-fun readByte!0 (BitStream!9194) tuple2!19656)

(assert (=> b!228230 (= lt!366074 (readByte!0 thiss!1870))))

(declare-fun b!228229 () Bool)

(declare-fun res!191450 () Bool)

(assert (=> b!228229 (=> (not res!191450) (not e!156361))))

(assert (=> b!228229 (= res!191450 (bvslt i!761 to!496))))

(declare-fun res!191451 () Bool)

(assert (=> start!48012 (=> (not res!191451) (not e!156361))))

(assert (=> start!48012 (= res!191451 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5049 arr!308))))))

(assert (=> start!48012 e!156361))

(assert (=> start!48012 true))

(declare-fun array_inv!4790 (array!11508) Bool)

(assert (=> start!48012 (array_inv!4790 arr!308)))

(declare-fun e!156364 () Bool)

(declare-fun inv!12 (BitStream!9194) Bool)

(assert (=> start!48012 (and (inv!12 thiss!1870) e!156364)))

(declare-fun b!228231 () Bool)

(assert (=> b!228231 (= e!156364 (array_inv!4790 (buf!5590 thiss!1870)))))

(declare-fun b!228228 () Bool)

(declare-fun res!191452 () Bool)

(assert (=> b!228228 (=> (not res!191452) (not e!156361))))

(assert (=> b!228228 (= res!191452 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5049 (buf!5590 thiss!1870))) ((_ sign_extend 32) (currentByte!10446 thiss!1870)) ((_ sign_extend 32) (currentBit!10441 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48012 res!191451) b!228228))

(assert (= (and b!228228 res!191452) b!228229))

(assert (= (and b!228229 res!191450) b!228230))

(assert (= start!48012 b!228231))

(declare-fun m!351685 () Bool)

(assert (=> b!228230 m!351685))

(declare-fun m!351687 () Bool)

(assert (=> b!228230 m!351687))

(declare-fun m!351689 () Bool)

(assert (=> b!228230 m!351689))

(declare-fun m!351691 () Bool)

(assert (=> b!228230 m!351691))

(declare-fun m!351693 () Bool)

(assert (=> b!228230 m!351693))

(declare-fun m!351695 () Bool)

(assert (=> b!228230 m!351695))

(declare-fun m!351697 () Bool)

(assert (=> b!228230 m!351697))

(declare-fun m!351699 () Bool)

(assert (=> b!228230 m!351699))

(declare-fun m!351701 () Bool)

(assert (=> b!228230 m!351701))

(declare-fun m!351703 () Bool)

(assert (=> b!228230 m!351703))

(declare-fun m!351705 () Bool)

(assert (=> b!228230 m!351705))

(declare-fun m!351707 () Bool)

(assert (=> b!228230 m!351707))

(declare-fun m!351709 () Bool)

(assert (=> b!228230 m!351709))

(declare-fun m!351711 () Bool)

(assert (=> b!228230 m!351711))

(declare-fun m!351713 () Bool)

(assert (=> start!48012 m!351713))

(declare-fun m!351715 () Bool)

(assert (=> start!48012 m!351715))

(declare-fun m!351717 () Bool)

(assert (=> b!228231 m!351717))

(declare-fun m!351719 () Bool)

(assert (=> b!228228 m!351719))

(push 1)

(assert (not b!228230))

(assert (not b!228231))

(assert (not b!228228))

(assert (not start!48012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

