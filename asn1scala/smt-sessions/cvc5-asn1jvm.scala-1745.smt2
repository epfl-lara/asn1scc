; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47930 () Bool)

(assert start!47930)

(declare-fun b!228000 () Bool)

(declare-fun e!156163 () Bool)

(declare-datatypes ((array!11489 0))(
  ( (array!11490 (arr!6022 (Array (_ BitVec 32) (_ BitVec 8))) (size!5041 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9178 0))(
  ( (BitStream!9179 (buf!5582 array!11489) (currentByte!10432 (_ BitVec 32)) (currentBit!10427 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9178)

(declare-fun array_inv!4782 (array!11489) Bool)

(assert (=> b!228000 (= e!156163 (array_inv!4782 (buf!5582 thiss!1870)))))

(declare-fun b!227998 () Bool)

(declare-fun res!191258 () Bool)

(declare-fun e!156166 () Bool)

(assert (=> b!227998 (=> (not res!191258) (not e!156166))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227998 (= res!191258 (bvslt i!761 to!496))))

(declare-fun b!227997 () Bool)

(declare-fun res!191260 () Bool)

(assert (=> b!227997 (=> (not res!191260) (not e!156166))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227997 (= res!191260 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5041 (buf!5582 thiss!1870))) ((_ sign_extend 32) (currentByte!10432 thiss!1870)) ((_ sign_extend 32) (currentBit!10427 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227999 () Bool)

(declare-fun lt!365256 () (_ BitVec 64))

(assert (=> b!227999 (= e!156166 (not (or (= lt!365256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!365256) lt!365256)))))))

(declare-datatypes ((tuple2!19628 0))(
  ( (tuple2!19629 (_1!10688 (_ BitVec 8)) (_2!10688 BitStream!9178)) )
))
(declare-fun lt!365260 () tuple2!19628)

(declare-datatypes ((Unit!17089 0))(
  ( (Unit!17090) )
))
(declare-datatypes ((tuple3!1464 0))(
  ( (tuple3!1465 (_1!10689 Unit!17089) (_2!10689 BitStream!9178) (_3!874 array!11489)) )
))
(declare-fun lt!365261 () tuple3!1464)

(assert (=> b!227999 (and (= (_1!10688 lt!365260) (select (arr!6022 (_3!874 lt!365261)) i!761)) (= (select (arr!6022 (_3!874 lt!365261)) i!761) (_1!10688 lt!365260)))))

(declare-fun lt!365253 () array!11489)

(declare-fun lt!365251 () Unit!17089)

(declare-fun arrayRangesEqImpliesEq!133 (array!11489 array!11489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17089)

(assert (=> b!227999 (= lt!365251 (arrayRangesEqImpliesEq!133 lt!365253 (_3!874 lt!365261) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11489)

(declare-fun arrayRangesEq!877 (array!11489 array!11489 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227999 (arrayRangesEq!877 arr!308 (_3!874 lt!365261) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365254 () Unit!17089)

(declare-fun arrayRangesEqTransitive!300 (array!11489 array!11489 array!11489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17089)

(assert (=> b!227999 (= lt!365254 (arrayRangesEqTransitive!300 arr!308 lt!365253 (_3!874 lt!365261) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227999 (arrayRangesEq!877 arr!308 lt!365253 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365262 () Unit!17089)

(declare-fun arrayUpdatedAtPrefixLemma!436 (array!11489 (_ BitVec 32) (_ BitVec 8)) Unit!17089)

(assert (=> b!227999 (= lt!365262 (arrayUpdatedAtPrefixLemma!436 arr!308 i!761 (_1!10688 lt!365260)))))

(assert (=> b!227999 (= lt!365256 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun lt!365259 () (_ BitVec 64))

(declare-fun lt!365258 () (_ BitVec 32))

(declare-fun lt!365252 () (_ BitVec 64))

(declare-fun lt!365255 () (_ BitVec 64))

(assert (=> b!227999 (and (= (bvadd lt!365252 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365258))) lt!365259) (= (bvadd lt!365255 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365259) (= (buf!5582 thiss!1870) (buf!5582 (_2!10689 lt!365261))) (= (size!5041 arr!308) (size!5041 (_3!874 lt!365261))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227999 (= lt!365259 (bitIndex!0 (size!5041 (buf!5582 (_2!10689 lt!365261))) (currentByte!10432 (_2!10689 lt!365261)) (currentBit!10427 (_2!10689 lt!365261))))))

(assert (=> b!227999 (= lt!365252 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365255))))

(assert (=> b!227999 (= lt!365252 (bitIndex!0 (size!5041 (buf!5582 (_2!10688 lt!365260))) (currentByte!10432 (_2!10688 lt!365260)) (currentBit!10427 (_2!10688 lt!365260))))))

(assert (=> b!227999 (= lt!365255 (bitIndex!0 (size!5041 (buf!5582 thiss!1870)) (currentByte!10432 thiss!1870) (currentBit!10427 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9178 array!11489 (_ BitVec 32) (_ BitVec 32)) tuple3!1464)

(assert (=> b!227999 (= lt!365261 (readByteArrayLoop!0 (_2!10688 lt!365260) lt!365253 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5041 (buf!5582 (_2!10688 lt!365260)))) ((_ sign_extend 32) (currentByte!10432 (_2!10688 lt!365260))) ((_ sign_extend 32) (currentBit!10427 (_2!10688 lt!365260))) lt!365258)))

(assert (=> b!227999 (= lt!365258 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365257 () Unit!17089)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9178 BitStream!9178 (_ BitVec 64) (_ BitVec 32)) Unit!17089)

(assert (=> b!227999 (= lt!365257 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10688 lt!365260) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227999 (= lt!365253 (array!11490 (store (arr!6022 arr!308) i!761 (_1!10688 lt!365260)) (size!5041 arr!308)))))

(declare-fun readByte!0 (BitStream!9178) tuple2!19628)

(assert (=> b!227999 (= lt!365260 (readByte!0 thiss!1870))))

(declare-fun res!191259 () Bool)

(assert (=> start!47930 (=> (not res!191259) (not e!156166))))

(assert (=> start!47930 (= res!191259 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5041 arr!308))))))

(assert (=> start!47930 e!156166))

(assert (=> start!47930 true))

(assert (=> start!47930 (array_inv!4782 arr!308)))

(declare-fun inv!12 (BitStream!9178) Bool)

(assert (=> start!47930 (and (inv!12 thiss!1870) e!156163)))

(assert (= (and start!47930 res!191259) b!227997))

(assert (= (and b!227997 res!191260) b!227998))

(assert (= (and b!227998 res!191258) b!227999))

(assert (= start!47930 b!228000))

(declare-fun m!351139 () Bool)

(assert (=> b!228000 m!351139))

(declare-fun m!351141 () Bool)

(assert (=> b!227997 m!351141))

(declare-fun m!351143 () Bool)

(assert (=> b!227999 m!351143))

(declare-fun m!351145 () Bool)

(assert (=> b!227999 m!351145))

(declare-fun m!351147 () Bool)

(assert (=> b!227999 m!351147))

(declare-fun m!351149 () Bool)

(assert (=> b!227999 m!351149))

(declare-fun m!351151 () Bool)

(assert (=> b!227999 m!351151))

(declare-fun m!351153 () Bool)

(assert (=> b!227999 m!351153))

(declare-fun m!351155 () Bool)

(assert (=> b!227999 m!351155))

(declare-fun m!351157 () Bool)

(assert (=> b!227999 m!351157))

(declare-fun m!351159 () Bool)

(assert (=> b!227999 m!351159))

(declare-fun m!351161 () Bool)

(assert (=> b!227999 m!351161))

(declare-fun m!351163 () Bool)

(assert (=> b!227999 m!351163))

(declare-fun m!351165 () Bool)

(assert (=> b!227999 m!351165))

(declare-fun m!351167 () Bool)

(assert (=> b!227999 m!351167))

(declare-fun m!351169 () Bool)

(assert (=> b!227999 m!351169))

(declare-fun m!351171 () Bool)

(assert (=> start!47930 m!351171))

(declare-fun m!351173 () Bool)

(assert (=> start!47930 m!351173))

(push 1)

(assert (not b!227997))

(assert (not b!227999))

(assert (not start!47930))

(assert (not b!228000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

