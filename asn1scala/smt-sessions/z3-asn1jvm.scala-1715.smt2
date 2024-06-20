; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47386 () Bool)

(assert start!47386)

(declare-fun res!189670 () Bool)

(declare-fun e!154440 () Bool)

(assert (=> start!47386 (=> (not res!189670) (not e!154440))))

(declare-datatypes ((array!11287 0))(
  ( (array!11288 (arr!5909 (Array (_ BitVec 32) (_ BitVec 8))) (size!4952 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11287)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47386 (= res!189670 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4952 arr!308))))))

(assert (=> start!47386 e!154440))

(assert (=> start!47386 true))

(declare-fun array_inv!4693 (array!11287) Bool)

(assert (=> start!47386 (array_inv!4693 arr!308)))

(declare-datatypes ((BitStream!9000 0))(
  ( (BitStream!9001 (buf!5493 array!11287) (currentByte!10295 (_ BitVec 32)) (currentBit!10290 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9000)

(declare-fun e!154441 () Bool)

(declare-fun inv!12 (BitStream!9000) Bool)

(assert (=> start!47386 (and (inv!12 thiss!1870) e!154441)))

(declare-fun b!226023 () Bool)

(assert (=> b!226023 (= e!154441 (array_inv!4693 (buf!5493 thiss!1870)))))

(declare-fun b!226021 () Bool)

(declare-fun res!189668 () Bool)

(assert (=> b!226021 (=> (not res!189668) (not e!154440))))

(assert (=> b!226021 (= res!189668 (bvslt i!761 to!496))))

(declare-fun b!226020 () Bool)

(declare-fun res!189669 () Bool)

(assert (=> b!226020 (=> (not res!189669) (not e!154440))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226020 (= res!189669 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4952 (buf!5493 thiss!1870))) ((_ sign_extend 32) (currentByte!10295 thiss!1870)) ((_ sign_extend 32) (currentBit!10290 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226022 () Bool)

(assert (=> b!226022 (= e!154440 (not (bvslt (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) (bvsub to!496 i!761))))))

(declare-datatypes ((tuple2!19354 0))(
  ( (tuple2!19355 (_1!10464 (_ BitVec 8)) (_2!10464 BitStream!9000)) )
))
(declare-fun lt!359126 () tuple2!19354)

(assert (=> b!226022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4952 (buf!5493 (_2!10464 lt!359126)))) ((_ sign_extend 32) (currentByte!10295 (_2!10464 lt!359126))) ((_ sign_extend 32) (currentBit!10290 (_2!10464 lt!359126))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16649 0))(
  ( (Unit!16650) )
))
(declare-fun lt!359127 () Unit!16649)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9000 BitStream!9000 (_ BitVec 64) (_ BitVec 32)) Unit!16649)

(assert (=> b!226022 (= lt!359127 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10464 lt!359126) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9000) tuple2!19354)

(assert (=> b!226022 (= lt!359126 (readByte!0 thiss!1870))))

(assert (= (and start!47386 res!189670) b!226020))

(assert (= (and b!226020 res!189669) b!226021))

(assert (= (and b!226021 res!189668) b!226022))

(assert (= start!47386 b!226023))

(declare-fun m!347061 () Bool)

(assert (=> start!47386 m!347061))

(declare-fun m!347063 () Bool)

(assert (=> start!47386 m!347063))

(declare-fun m!347065 () Bool)

(assert (=> b!226023 m!347065))

(declare-fun m!347067 () Bool)

(assert (=> b!226020 m!347067))

(declare-fun m!347069 () Bool)

(assert (=> b!226022 m!347069))

(declare-fun m!347071 () Bool)

(assert (=> b!226022 m!347071))

(declare-fun m!347073 () Bool)

(assert (=> b!226022 m!347073))

(check-sat (not b!226020) (not start!47386) (not b!226022) (not b!226023))
(check-sat)
