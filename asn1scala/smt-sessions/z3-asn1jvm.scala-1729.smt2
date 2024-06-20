; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47722 () Bool)

(assert start!47722)

(declare-fun res!190572 () Bool)

(declare-fun e!155373 () Bool)

(assert (=> start!47722 (=> (not res!190572) (not e!155373))))

(declare-datatypes ((array!11389 0))(
  ( (array!11390 (arr!5969 (Array (_ BitVec 32) (_ BitVec 8))) (size!4994 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11389)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47722 (= res!190572 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4994 arr!308))))))

(assert (=> start!47722 e!155373))

(assert (=> start!47722 true))

(declare-fun array_inv!4735 (array!11389) Bool)

(assert (=> start!47722 (array_inv!4735 arr!308)))

(declare-datatypes ((BitStream!9084 0))(
  ( (BitStream!9085 (buf!5535 array!11389) (currentByte!10373 (_ BitVec 32)) (currentBit!10368 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9084)

(declare-fun e!155371 () Bool)

(declare-fun inv!12 (BitStream!9084) Bool)

(assert (=> start!47722 (and (inv!12 thiss!1870) e!155371)))

(declare-fun b!227140 () Bool)

(declare-fun res!190573 () Bool)

(assert (=> b!227140 (=> (not res!190573) (not e!155373))))

(assert (=> b!227140 (= res!190573 (bvslt i!761 to!496))))

(declare-fun b!227141 () Bool)

(assert (=> b!227141 (= e!155373 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-fun lt!362830 () array!11389)

(declare-fun arrayRangesEq!830 (array!11389 array!11389 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227141 (arrayRangesEq!830 arr!308 lt!362830 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19510 0))(
  ( (tuple2!19511 (_1!10582 (_ BitVec 8)) (_2!10582 BitStream!9084)) )
))
(declare-fun lt!362829 () tuple2!19510)

(declare-datatypes ((Unit!16931 0))(
  ( (Unit!16932) )
))
(declare-fun lt!362831 () Unit!16931)

(declare-fun arrayUpdatedAtPrefixLemma!389 (array!11389 (_ BitVec 32) (_ BitVec 8)) Unit!16931)

(assert (=> b!227141 (= lt!362831 (arrayUpdatedAtPrefixLemma!389 arr!308 i!761 (_1!10582 lt!362829)))))

(declare-fun lt!362824 () (_ BitVec 64))

(declare-fun lt!362832 () (_ BitVec 64))

(declare-fun lt!362827 () (_ BitVec 32))

(declare-datatypes ((tuple3!1370 0))(
  ( (tuple3!1371 (_1!10583 Unit!16931) (_2!10583 BitStream!9084) (_3!827 array!11389)) )
))
(declare-fun lt!362826 () tuple3!1370)

(declare-fun lt!362828 () (_ BitVec 64))

(assert (=> b!227141 (and (= (bvadd lt!362828 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362827))) lt!362832) (= (bvadd lt!362824 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362832) (= (buf!5535 thiss!1870) (buf!5535 (_2!10583 lt!362826))) (= (size!4994 arr!308) (size!4994 (_3!827 lt!362826))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227141 (= lt!362832 (bitIndex!0 (size!4994 (buf!5535 (_2!10583 lt!362826))) (currentByte!10373 (_2!10583 lt!362826)) (currentBit!10368 (_2!10583 lt!362826))))))

(assert (=> b!227141 (= lt!362828 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362824))))

(assert (=> b!227141 (= lt!362828 (bitIndex!0 (size!4994 (buf!5535 (_2!10582 lt!362829))) (currentByte!10373 (_2!10582 lt!362829)) (currentBit!10368 (_2!10582 lt!362829))))))

(assert (=> b!227141 (= lt!362824 (bitIndex!0 (size!4994 (buf!5535 thiss!1870)) (currentByte!10373 thiss!1870) (currentBit!10368 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9084 array!11389 (_ BitVec 32) (_ BitVec 32)) tuple3!1370)

(assert (=> b!227141 (= lt!362826 (readByteArrayLoop!0 (_2!10582 lt!362829) lt!362830 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227141 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4994 (buf!5535 (_2!10582 lt!362829)))) ((_ sign_extend 32) (currentByte!10373 (_2!10582 lt!362829))) ((_ sign_extend 32) (currentBit!10368 (_2!10582 lt!362829))) lt!362827)))

(assert (=> b!227141 (= lt!362827 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362825 () Unit!16931)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9084 BitStream!9084 (_ BitVec 64) (_ BitVec 32)) Unit!16931)

(assert (=> b!227141 (= lt!362825 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10582 lt!362829) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227141 (= lt!362830 (array!11390 (store (arr!5969 arr!308) i!761 (_1!10582 lt!362829)) (size!4994 arr!308)))))

(declare-fun readByte!0 (BitStream!9084) tuple2!19510)

(assert (=> b!227141 (= lt!362829 (readByte!0 thiss!1870))))

(declare-fun b!227139 () Bool)

(declare-fun res!190571 () Bool)

(assert (=> b!227139 (=> (not res!190571) (not e!155373))))

(assert (=> b!227139 (= res!190571 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4994 (buf!5535 thiss!1870))) ((_ sign_extend 32) (currentByte!10373 thiss!1870)) ((_ sign_extend 32) (currentBit!10368 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227142 () Bool)

(assert (=> b!227142 (= e!155371 (array_inv!4735 (buf!5535 thiss!1870)))))

(assert (= (and start!47722 res!190572) b!227139))

(assert (= (and b!227139 res!190571) b!227140))

(assert (= (and b!227140 res!190573) b!227141))

(assert (= start!47722 b!227142))

(declare-fun m!349163 () Bool)

(assert (=> start!47722 m!349163))

(declare-fun m!349165 () Bool)

(assert (=> start!47722 m!349165))

(declare-fun m!349167 () Bool)

(assert (=> b!227141 m!349167))

(declare-fun m!349169 () Bool)

(assert (=> b!227141 m!349169))

(declare-fun m!349171 () Bool)

(assert (=> b!227141 m!349171))

(declare-fun m!349173 () Bool)

(assert (=> b!227141 m!349173))

(declare-fun m!349175 () Bool)

(assert (=> b!227141 m!349175))

(declare-fun m!349177 () Bool)

(assert (=> b!227141 m!349177))

(declare-fun m!349179 () Bool)

(assert (=> b!227141 m!349179))

(declare-fun m!349181 () Bool)

(assert (=> b!227141 m!349181))

(declare-fun m!349183 () Bool)

(assert (=> b!227141 m!349183))

(declare-fun m!349185 () Bool)

(assert (=> b!227141 m!349185))

(declare-fun m!349187 () Bool)

(assert (=> b!227139 m!349187))

(declare-fun m!349189 () Bool)

(assert (=> b!227142 m!349189))

(check-sat (not b!227142) (not b!227141) (not start!47722) (not b!227139))
(check-sat)
