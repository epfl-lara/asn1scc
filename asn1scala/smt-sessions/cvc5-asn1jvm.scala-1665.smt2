; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46280 () Bool)

(assert start!46280)

(declare-fun b!222915 () Bool)

(declare-fun e!151651 () Bool)

(declare-datatypes ((array!10938 0))(
  ( (array!10939 (arr!5731 (Array (_ BitVec 32) (_ BitVec 8))) (size!4801 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8704 0))(
  ( (BitStream!8705 (buf!5345 array!10938) (currentByte!10015 (_ BitVec 32)) (currentBit!10010 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8704)

(declare-fun array_inv!4542 (array!10938) Bool)

(assert (=> b!222915 (= e!151651 (array_inv!4542 (buf!5345 thiss!1870)))))

(declare-fun b!222916 () Bool)

(declare-fun res!187143 () Bool)

(declare-fun e!151649 () Bool)

(assert (=> b!222916 (=> (not res!187143) (not e!151649))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222916 (= res!187143 (bvslt i!761 to!496))))

(declare-fun b!222917 () Bool)

(declare-fun e!151650 () Bool)

(assert (=> b!222917 (= e!151649 (not e!151650))))

(declare-fun res!187140 () Bool)

(assert (=> b!222917 (=> res!187140 e!151650)))

(assert (=> b!222917 (= res!187140 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-datatypes ((tuple2!19022 0))(
  ( (tuple2!19023 (_1!10220 (_ BitVec 8)) (_2!10220 BitStream!8704)) )
))
(declare-fun lt!351481 () tuple2!19022)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222917 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4801 (buf!5345 (_2!10220 lt!351481)))) ((_ sign_extend 32) (currentByte!10015 (_2!10220 lt!351481))) ((_ sign_extend 32) (currentBit!10010 (_2!10220 lt!351481))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16039 0))(
  ( (Unit!16040) )
))
(declare-fun lt!351482 () Unit!16039)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8704 BitStream!8704 (_ BitVec 64) (_ BitVec 32)) Unit!16039)

(assert (=> b!222917 (= lt!351482 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10220 lt!351481) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8704) tuple2!19022)

(assert (=> b!222917 (= lt!351481 (readByte!0 thiss!1870))))

(declare-fun b!222918 () Bool)

(assert (=> b!222918 (= e!151650 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4801 (buf!5345 (_2!10220 lt!351481)))) ((_ sign_extend 32) (currentByte!10015 (_2!10220 lt!351481))) ((_ sign_extend 32) (currentBit!10010 (_2!10220 lt!351481))) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun b!222914 () Bool)

(declare-fun res!187142 () Bool)

(assert (=> b!222914 (=> (not res!187142) (not e!151649))))

(assert (=> b!222914 (= res!187142 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4801 (buf!5345 thiss!1870))) ((_ sign_extend 32) (currentByte!10015 thiss!1870)) ((_ sign_extend 32) (currentBit!10010 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187141 () Bool)

(assert (=> start!46280 (=> (not res!187141) (not e!151649))))

(declare-fun arr!308 () array!10938)

(assert (=> start!46280 (= res!187141 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4801 arr!308))))))

(assert (=> start!46280 e!151649))

(assert (=> start!46280 true))

(assert (=> start!46280 (array_inv!4542 arr!308)))

(declare-fun inv!12 (BitStream!8704) Bool)

(assert (=> start!46280 (and (inv!12 thiss!1870) e!151651)))

(assert (= (and start!46280 res!187141) b!222914))

(assert (= (and b!222914 res!187142) b!222916))

(assert (= (and b!222916 res!187143) b!222917))

(assert (= (and b!222917 (not res!187140)) b!222918))

(assert (= start!46280 b!222915))

(declare-fun m!341161 () Bool)

(assert (=> start!46280 m!341161))

(declare-fun m!341163 () Bool)

(assert (=> start!46280 m!341163))

(declare-fun m!341165 () Bool)

(assert (=> b!222914 m!341165))

(declare-fun m!341167 () Bool)

(assert (=> b!222918 m!341167))

(declare-fun m!341169 () Bool)

(assert (=> b!222917 m!341169))

(declare-fun m!341171 () Bool)

(assert (=> b!222917 m!341171))

(declare-fun m!341173 () Bool)

(assert (=> b!222917 m!341173))

(declare-fun m!341175 () Bool)

(assert (=> b!222915 m!341175))

(push 1)

(assert (not b!222917))

(assert (not b!222914))

(assert (not b!222918))

(assert (not b!222915))

(assert (not start!46280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

