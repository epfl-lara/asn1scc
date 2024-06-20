; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46282 () Bool)

(assert start!46282)

(declare-fun b!222929 () Bool)

(declare-fun e!151664 () Bool)

(declare-fun e!151667 () Bool)

(assert (=> b!222929 (= e!151664 (not e!151667))))

(declare-fun res!187152 () Bool)

(assert (=> b!222929 (=> res!187152 e!151667)))

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!222929 (= res!187152 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-datatypes ((array!10940 0))(
  ( (array!10941 (arr!5732 (Array (_ BitVec 32) (_ BitVec 8))) (size!4802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8706 0))(
  ( (BitStream!8707 (buf!5346 array!10940) (currentByte!10016 (_ BitVec 32)) (currentBit!10011 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19024 0))(
  ( (tuple2!19025 (_1!10221 (_ BitVec 8)) (_2!10221 BitStream!8706)) )
))
(declare-fun lt!351488 () tuple2!19024)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222929 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4802 (buf!5346 (_2!10221 lt!351488)))) ((_ sign_extend 32) (currentByte!10016 (_2!10221 lt!351488))) ((_ sign_extend 32) (currentBit!10011 (_2!10221 lt!351488))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16041 0))(
  ( (Unit!16042) )
))
(declare-fun lt!351487 () Unit!16041)

(declare-fun thiss!1870 () BitStream!8706)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8706 BitStream!8706 (_ BitVec 64) (_ BitVec 32)) Unit!16041)

(assert (=> b!222929 (= lt!351487 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10221 lt!351488) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8706) tuple2!19024)

(assert (=> b!222929 (= lt!351488 (readByte!0 thiss!1870))))

(declare-fun b!222930 () Bool)

(declare-fun res!187155 () Bool)

(assert (=> b!222930 (=> (not res!187155) (not e!151664))))

(assert (=> b!222930 (= res!187155 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4802 (buf!5346 thiss!1870))) ((_ sign_extend 32) (currentByte!10016 thiss!1870)) ((_ sign_extend 32) (currentBit!10011 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222931 () Bool)

(declare-fun res!187154 () Bool)

(assert (=> b!222931 (=> (not res!187154) (not e!151664))))

(assert (=> b!222931 (= res!187154 (bvslt i!761 to!496))))

(declare-fun b!222932 () Bool)

(assert (=> b!222932 (= e!151667 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4802 (buf!5346 (_2!10221 lt!351488)))) ((_ sign_extend 32) (currentByte!10016 (_2!10221 lt!351488))) ((_ sign_extend 32) (currentBit!10011 (_2!10221 lt!351488))) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun b!222933 () Bool)

(declare-fun e!151663 () Bool)

(declare-fun array_inv!4543 (array!10940) Bool)

(assert (=> b!222933 (= e!151663 (array_inv!4543 (buf!5346 thiss!1870)))))

(declare-fun res!187153 () Bool)

(assert (=> start!46282 (=> (not res!187153) (not e!151664))))

(declare-fun arr!308 () array!10940)

(assert (=> start!46282 (= res!187153 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4802 arr!308))))))

(assert (=> start!46282 e!151664))

(assert (=> start!46282 true))

(assert (=> start!46282 (array_inv!4543 arr!308)))

(declare-fun inv!12 (BitStream!8706) Bool)

(assert (=> start!46282 (and (inv!12 thiss!1870) e!151663)))

(assert (= (and start!46282 res!187153) b!222930))

(assert (= (and b!222930 res!187155) b!222931))

(assert (= (and b!222931 res!187154) b!222929))

(assert (= (and b!222929 (not res!187152)) b!222932))

(assert (= start!46282 b!222933))

(declare-fun m!341177 () Bool)

(assert (=> b!222930 m!341177))

(declare-fun m!341179 () Bool)

(assert (=> start!46282 m!341179))

(declare-fun m!341181 () Bool)

(assert (=> start!46282 m!341181))

(declare-fun m!341183 () Bool)

(assert (=> b!222932 m!341183))

(declare-fun m!341185 () Bool)

(assert (=> b!222933 m!341185))

(declare-fun m!341187 () Bool)

(assert (=> b!222929 m!341187))

(declare-fun m!341189 () Bool)

(assert (=> b!222929 m!341189))

(declare-fun m!341191 () Bool)

(assert (=> b!222929 m!341191))

(check-sat (not b!222933) (not b!222930) (not start!46282) (not b!222932) (not b!222929))
(check-sat)
