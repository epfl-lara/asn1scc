; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47932 () Bool)

(assert start!47932)

(declare-fun b!228009 () Bool)

(declare-fun res!191268 () Bool)

(declare-fun e!156177 () Bool)

(assert (=> b!228009 (=> (not res!191268) (not e!156177))))

(declare-datatypes ((array!11491 0))(
  ( (array!11492 (arr!6023 (Array (_ BitVec 32) (_ BitVec 8))) (size!5042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9180 0))(
  ( (BitStream!9181 (buf!5583 array!11491) (currentByte!10433 (_ BitVec 32)) (currentBit!10428 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9180)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228009 (= res!191268 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5042 (buf!5583 thiss!1870))) ((_ sign_extend 32) (currentByte!10433 thiss!1870)) ((_ sign_extend 32) (currentBit!10428 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228011 () Bool)

(declare-fun lt!365297 () (_ BitVec 64))

(assert (=> b!228011 (= e!156177 (not (or (= lt!365297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!365297) lt!365297)))))))

(declare-datatypes ((tuple2!19630 0))(
  ( (tuple2!19631 (_1!10690 (_ BitVec 8)) (_2!10690 BitStream!9180)) )
))
(declare-fun lt!365298 () tuple2!19630)

(declare-datatypes ((Unit!17091 0))(
  ( (Unit!17092) )
))
(declare-datatypes ((tuple3!1466 0))(
  ( (tuple3!1467 (_1!10691 Unit!17091) (_2!10691 BitStream!9180) (_3!875 array!11491)) )
))
(declare-fun lt!365293 () tuple3!1466)

(assert (=> b!228011 (and (= (_1!10690 lt!365298) (select (arr!6023 (_3!875 lt!365293)) i!761)) (= (select (arr!6023 (_3!875 lt!365293)) i!761) (_1!10690 lt!365298)))))

(declare-fun lt!365292 () Unit!17091)

(declare-fun lt!365295 () array!11491)

(declare-fun arrayRangesEqImpliesEq!134 (array!11491 array!11491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17091)

(assert (=> b!228011 (= lt!365292 (arrayRangesEqImpliesEq!134 lt!365295 (_3!875 lt!365293) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11491)

(declare-fun arrayRangesEq!878 (array!11491 array!11491 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228011 (arrayRangesEq!878 arr!308 (_3!875 lt!365293) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365291 () Unit!17091)

(declare-fun arrayRangesEqTransitive!301 (array!11491 array!11491 array!11491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17091)

(assert (=> b!228011 (= lt!365291 (arrayRangesEqTransitive!301 arr!308 lt!365295 (_3!875 lt!365293) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228011 (arrayRangesEq!878 arr!308 lt!365295 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365294 () Unit!17091)

(declare-fun arrayUpdatedAtPrefixLemma!437 (array!11491 (_ BitVec 32) (_ BitVec 8)) Unit!17091)

(assert (=> b!228011 (= lt!365294 (arrayUpdatedAtPrefixLemma!437 arr!308 i!761 (_1!10690 lt!365298)))))

(assert (=> b!228011 (= lt!365297 ((_ sign_extend 32) (bvsub to!496 i!761)))))

(declare-fun lt!365288 () (_ BitVec 64))

(declare-fun lt!365290 () (_ BitVec 64))

(declare-fun lt!365287 () (_ BitVec 32))

(declare-fun lt!365289 () (_ BitVec 64))

(assert (=> b!228011 (and (= (bvadd lt!365289 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365287))) lt!365288) (= (bvadd lt!365290 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365288) (= (buf!5583 thiss!1870) (buf!5583 (_2!10691 lt!365293))) (= (size!5042 arr!308) (size!5042 (_3!875 lt!365293))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228011 (= lt!365288 (bitIndex!0 (size!5042 (buf!5583 (_2!10691 lt!365293))) (currentByte!10433 (_2!10691 lt!365293)) (currentBit!10428 (_2!10691 lt!365293))))))

(assert (=> b!228011 (= lt!365289 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365290))))

(assert (=> b!228011 (= lt!365289 (bitIndex!0 (size!5042 (buf!5583 (_2!10690 lt!365298))) (currentByte!10433 (_2!10690 lt!365298)) (currentBit!10428 (_2!10690 lt!365298))))))

(assert (=> b!228011 (= lt!365290 (bitIndex!0 (size!5042 (buf!5583 thiss!1870)) (currentByte!10433 thiss!1870) (currentBit!10428 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9180 array!11491 (_ BitVec 32) (_ BitVec 32)) tuple3!1466)

(assert (=> b!228011 (= lt!365293 (readByteArrayLoop!0 (_2!10690 lt!365298) lt!365295 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228011 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5042 (buf!5583 (_2!10690 lt!365298)))) ((_ sign_extend 32) (currentByte!10433 (_2!10690 lt!365298))) ((_ sign_extend 32) (currentBit!10428 (_2!10690 lt!365298))) lt!365287)))

(assert (=> b!228011 (= lt!365287 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365296 () Unit!17091)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9180 BitStream!9180 (_ BitVec 64) (_ BitVec 32)) Unit!17091)

(assert (=> b!228011 (= lt!365296 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10690 lt!365298) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228011 (= lt!365295 (array!11492 (store (arr!6023 arr!308) i!761 (_1!10690 lt!365298)) (size!5042 arr!308)))))

(declare-fun readByte!0 (BitStream!9180) tuple2!19630)

(assert (=> b!228011 (= lt!365298 (readByte!0 thiss!1870))))

(declare-fun b!228010 () Bool)

(declare-fun res!191269 () Bool)

(assert (=> b!228010 (=> (not res!191269) (not e!156177))))

(assert (=> b!228010 (= res!191269 (bvslt i!761 to!496))))

(declare-fun b!228012 () Bool)

(declare-fun e!156175 () Bool)

(declare-fun array_inv!4783 (array!11491) Bool)

(assert (=> b!228012 (= e!156175 (array_inv!4783 (buf!5583 thiss!1870)))))

(declare-fun res!191267 () Bool)

(assert (=> start!47932 (=> (not res!191267) (not e!156177))))

(assert (=> start!47932 (= res!191267 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5042 arr!308))))))

(assert (=> start!47932 e!156177))

(assert (=> start!47932 true))

(assert (=> start!47932 (array_inv!4783 arr!308)))

(declare-fun inv!12 (BitStream!9180) Bool)

(assert (=> start!47932 (and (inv!12 thiss!1870) e!156175)))

(assert (= (and start!47932 res!191267) b!228009))

(assert (= (and b!228009 res!191268) b!228010))

(assert (= (and b!228010 res!191269) b!228011))

(assert (= start!47932 b!228012))

(declare-fun m!351175 () Bool)

(assert (=> b!228009 m!351175))

(declare-fun m!351177 () Bool)

(assert (=> b!228011 m!351177))

(declare-fun m!351179 () Bool)

(assert (=> b!228011 m!351179))

(declare-fun m!351181 () Bool)

(assert (=> b!228011 m!351181))

(declare-fun m!351183 () Bool)

(assert (=> b!228011 m!351183))

(declare-fun m!351185 () Bool)

(assert (=> b!228011 m!351185))

(declare-fun m!351187 () Bool)

(assert (=> b!228011 m!351187))

(declare-fun m!351189 () Bool)

(assert (=> b!228011 m!351189))

(declare-fun m!351191 () Bool)

(assert (=> b!228011 m!351191))

(declare-fun m!351193 () Bool)

(assert (=> b!228011 m!351193))

(declare-fun m!351195 () Bool)

(assert (=> b!228011 m!351195))

(declare-fun m!351197 () Bool)

(assert (=> b!228011 m!351197))

(declare-fun m!351199 () Bool)

(assert (=> b!228011 m!351199))

(declare-fun m!351201 () Bool)

(assert (=> b!228011 m!351201))

(declare-fun m!351203 () Bool)

(assert (=> b!228011 m!351203))

(declare-fun m!351205 () Bool)

(assert (=> b!228012 m!351205))

(declare-fun m!351207 () Bool)

(assert (=> start!47932 m!351207))

(declare-fun m!351209 () Bool)

(assert (=> start!47932 m!351209))

(check-sat (not b!228009) (not start!47932) (not b!228012) (not b!228011))
(check-sat)
