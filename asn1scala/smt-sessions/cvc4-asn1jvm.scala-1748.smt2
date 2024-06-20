; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48018 () Bool)

(assert start!48018)

(declare-fun b!228266 () Bool)

(declare-fun e!156398 () Bool)

(declare-datatypes ((array!11514 0))(
  ( (array!11515 (arr!6036 (Array (_ BitVec 32) (_ BitVec 8))) (size!5052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9200 0))(
  ( (BitStream!9201 (buf!5593 array!11514) (currentByte!10449 (_ BitVec 32)) (currentBit!10444 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9200)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((Unit!17144 0))(
  ( (Unit!17145) )
))
(declare-datatypes ((tuple3!1486 0))(
  ( (tuple3!1487 (_1!10718 Unit!17144) (_2!10718 BitStream!9200) (_3!885 array!11514)) )
))
(declare-fun lt!366179 () tuple3!1486)

(declare-datatypes ((tuple2!19666 0))(
  ( (tuple2!19667 (_1!10719 BitStream!9200) (_2!10719 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9200) tuple2!19666)

(assert (=> b!228266 (= e!156398 (not (= (select (arr!6036 (_3!885 lt!366179)) i!761) (_2!10719 (readBytePure!0 thiss!1870)))))))

(declare-datatypes ((tuple2!19668 0))(
  ( (tuple2!19669 (_1!10720 (_ BitVec 8)) (_2!10720 BitStream!9200)) )
))
(declare-fun lt!366180 () tuple2!19668)

(assert (=> b!228266 (and (= (_1!10720 lt!366180) (select (arr!6036 (_3!885 lt!366179)) i!761)) (= (select (arr!6036 (_3!885 lt!366179)) i!761) (_1!10720 lt!366180)))))

(declare-fun lt!366172 () Unit!17144)

(declare-fun lt!366176 () array!11514)

(declare-fun arrayRangesEqImpliesEq!144 (array!11514 array!11514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> b!228266 (= lt!366172 (arrayRangesEqImpliesEq!144 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11514)

(declare-fun arrayRangesEq!888 (array!11514 array!11514 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228266 (arrayRangesEq!888 arr!308 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366177 () Unit!17144)

(declare-fun arrayRangesEqTransitive!311 (array!11514 array!11514 array!11514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> b!228266 (= lt!366177 (arrayRangesEqTransitive!311 arr!308 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228266 (arrayRangesEq!888 arr!308 lt!366176 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366173 () Unit!17144)

(declare-fun arrayUpdatedAtPrefixLemma!447 (array!11514 (_ BitVec 32) (_ BitVec 8)) Unit!17144)

(assert (=> b!228266 (= lt!366173 (arrayUpdatedAtPrefixLemma!447 arr!308 i!761 (_1!10720 lt!366180)))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!366174 () (_ BitVec 64))

(declare-fun lt!366178 () (_ BitVec 64))

(declare-fun lt!366175 () (_ BitVec 32))

(declare-fun lt!366171 () (_ BitVec 64))

(assert (=> b!228266 (and (= (bvadd lt!366174 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366175))) lt!366171) (= (bvadd lt!366178 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366171) (= (buf!5593 thiss!1870) (buf!5593 (_2!10718 lt!366179))) (= (size!5052 arr!308) (size!5052 (_3!885 lt!366179))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228266 (= lt!366171 (bitIndex!0 (size!5052 (buf!5593 (_2!10718 lt!366179))) (currentByte!10449 (_2!10718 lt!366179)) (currentBit!10444 (_2!10718 lt!366179))))))

(assert (=> b!228266 (= lt!366174 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366178))))

(assert (=> b!228266 (= lt!366174 (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366180))) (currentByte!10449 (_2!10720 lt!366180)) (currentBit!10444 (_2!10720 lt!366180))))))

(assert (=> b!228266 (= lt!366178 (bitIndex!0 (size!5052 (buf!5593 thiss!1870)) (currentByte!10449 thiss!1870) (currentBit!10444 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9200 array!11514 (_ BitVec 32) (_ BitVec 32)) tuple3!1486)

(assert (=> b!228266 (= lt!366179 (readByteArrayLoop!0 (_2!10720 lt!366180) lt!366176 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228266 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180))) lt!366175)))

(assert (=> b!228266 (= lt!366175 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366170 () Unit!17144)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9200 BitStream!9200 (_ BitVec 64) (_ BitVec 32)) Unit!17144)

(assert (=> b!228266 (= lt!366170 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10720 lt!366180) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228266 (= lt!366176 (array!11515 (store (arr!6036 arr!308) i!761 (_1!10720 lt!366180)) (size!5052 arr!308)))))

(declare-fun readByte!0 (BitStream!9200) tuple2!19668)

(assert (=> b!228266 (= lt!366180 (readByte!0 thiss!1870))))

(declare-fun b!228267 () Bool)

(declare-fun e!156400 () Bool)

(declare-fun array_inv!4793 (array!11514) Bool)

(assert (=> b!228267 (= e!156400 (array_inv!4793 (buf!5593 thiss!1870)))))

(declare-fun res!191477 () Bool)

(assert (=> start!48018 (=> (not res!191477) (not e!156398))))

(assert (=> start!48018 (= res!191477 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5052 arr!308))))))

(assert (=> start!48018 e!156398))

(assert (=> start!48018 true))

(assert (=> start!48018 (array_inv!4793 arr!308)))

(declare-fun inv!12 (BitStream!9200) Bool)

(assert (=> start!48018 (and (inv!12 thiss!1870) e!156400)))

(declare-fun b!228265 () Bool)

(declare-fun res!191478 () Bool)

(assert (=> b!228265 (=> (not res!191478) (not e!156398))))

(assert (=> b!228265 (= res!191478 (bvslt i!761 to!496))))

(declare-fun b!228264 () Bool)

(declare-fun res!191479 () Bool)

(assert (=> b!228264 (=> (not res!191479) (not e!156398))))

(assert (=> b!228264 (= res!191479 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))) ((_ sign_extend 32) (currentByte!10449 thiss!1870)) ((_ sign_extend 32) (currentBit!10444 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48018 res!191477) b!228264))

(assert (= (and b!228264 res!191479) b!228265))

(assert (= (and b!228265 res!191478) b!228266))

(assert (= start!48018 b!228267))

(declare-fun m!351797 () Bool)

(assert (=> b!228266 m!351797))

(declare-fun m!351799 () Bool)

(assert (=> b!228266 m!351799))

(declare-fun m!351801 () Bool)

(assert (=> b!228266 m!351801))

(declare-fun m!351803 () Bool)

(assert (=> b!228266 m!351803))

(declare-fun m!351805 () Bool)

(assert (=> b!228266 m!351805))

(declare-fun m!351807 () Bool)

(assert (=> b!228266 m!351807))

(declare-fun m!351809 () Bool)

(assert (=> b!228266 m!351809))

(declare-fun m!351811 () Bool)

(assert (=> b!228266 m!351811))

(declare-fun m!351813 () Bool)

(assert (=> b!228266 m!351813))

(declare-fun m!351815 () Bool)

(assert (=> b!228266 m!351815))

(declare-fun m!351817 () Bool)

(assert (=> b!228266 m!351817))

(declare-fun m!351819 () Bool)

(assert (=> b!228266 m!351819))

(declare-fun m!351821 () Bool)

(assert (=> b!228266 m!351821))

(declare-fun m!351823 () Bool)

(assert (=> b!228266 m!351823))

(declare-fun m!351825 () Bool)

(assert (=> b!228266 m!351825))

(declare-fun m!351827 () Bool)

(assert (=> b!228267 m!351827))

(declare-fun m!351829 () Bool)

(assert (=> start!48018 m!351829))

(declare-fun m!351831 () Bool)

(assert (=> start!48018 m!351831))

(declare-fun m!351833 () Bool)

(assert (=> b!228264 m!351833))

(push 1)

(assert (not b!228264))

(assert (not start!48018))

(assert (not b!228266))

(assert (not b!228267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77453 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77453 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))) ((_ sign_extend 32) (currentByte!10449 thiss!1870)) ((_ sign_extend 32) (currentBit!10444 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))) ((_ sign_extend 32) (currentByte!10449 thiss!1870)) ((_ sign_extend 32) (currentBit!10444 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18941 () Bool)

(assert (= bs!18941 d!77453))

(declare-fun m!351845 () Bool)

(assert (=> bs!18941 m!351845))

(assert (=> b!228264 d!77453))

(declare-fun d!77455 () Bool)

(assert (=> d!77455 (= (array_inv!4793 arr!308) (bvsge (size!5052 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!48018 d!77455))

(declare-fun d!77457 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77457 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10444 thiss!1870) (currentByte!10449 thiss!1870) (size!5052 (buf!5593 thiss!1870))))))

(declare-fun bs!18942 () Bool)

(assert (= bs!18942 d!77457))

(declare-fun m!351847 () Bool)

(assert (=> bs!18942 m!351847))

(assert (=> start!48018 d!77457))

(declare-fun d!77459 () Bool)

(declare-fun e!156409 () Bool)

(assert (=> d!77459 e!156409))

(declare-fun res!191492 () Bool)

(assert (=> d!77459 (=> (not res!191492) (not e!156409))))

(declare-fun lt!366193 () (_ BitVec 64))

(declare-fun lt!366195 () (_ BitVec 64))

(declare-fun lt!366194 () (_ BitVec 64))

(assert (=> d!77459 (= res!191492 (= lt!366194 (bvsub lt!366193 lt!366195)))))

(assert (=> d!77459 (or (= (bvand lt!366193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366193 lt!366195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77459 (= lt!366195 (remainingBits!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10718 lt!366179)))) ((_ sign_extend 32) (currentByte!10449 (_2!10718 lt!366179))) ((_ sign_extend 32) (currentBit!10444 (_2!10718 lt!366179)))))))

(declare-fun lt!366197 () (_ BitVec 64))

(declare-fun lt!366198 () (_ BitVec 64))

(assert (=> d!77459 (= lt!366193 (bvmul lt!366197 lt!366198))))

(assert (=> d!77459 (or (= lt!366197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366198 (bvsdiv (bvmul lt!366197 lt!366198) lt!366197)))))

(assert (=> d!77459 (= lt!366198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77459 (= lt!366197 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10718 lt!366179)))))))

(assert (=> d!77459 (= lt!366194 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10449 (_2!10718 lt!366179))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10444 (_2!10718 lt!366179)))))))

(assert (=> d!77459 (invariant!0 (currentBit!10444 (_2!10718 lt!366179)) (currentByte!10449 (_2!10718 lt!366179)) (size!5052 (buf!5593 (_2!10718 lt!366179))))))

(assert (=> d!77459 (= (bitIndex!0 (size!5052 (buf!5593 (_2!10718 lt!366179))) (currentByte!10449 (_2!10718 lt!366179)) (currentBit!10444 (_2!10718 lt!366179))) lt!366194)))

(declare-fun b!228278 () Bool)

(declare-fun res!191491 () Bool)

(assert (=> b!228278 (=> (not res!191491) (not e!156409))))

(assert (=> b!228278 (= res!191491 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366194))))

(declare-fun b!228279 () Bool)

(declare-fun lt!366196 () (_ BitVec 64))

(assert (=> b!228279 (= e!156409 (bvsle lt!366194 (bvmul lt!366196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228279 (or (= lt!366196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366196)))))

(assert (=> b!228279 (= lt!366196 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10718 lt!366179)))))))

(assert (= (and d!77459 res!191492) b!228278))

(assert (= (and b!228278 res!191491) b!228279))

(declare-fun m!351849 () Bool)

(assert (=> d!77459 m!351849))

(declare-fun m!351851 () Bool)

(assert (=> d!77459 m!351851))

(assert (=> b!228266 d!77459))

(declare-fun d!77461 () Bool)

(declare-fun lt!366261 () (_ BitVec 8))

(declare-fun lt!366260 () (_ BitVec 8))

(assert (=> d!77461 (= lt!366261 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6036 (buf!5593 thiss!1870)) (currentByte!10449 thiss!1870))) ((_ sign_extend 24) lt!366260))))))

(assert (=> d!77461 (= lt!366260 ((_ extract 7 0) (currentBit!10444 thiss!1870)))))

(declare-fun e!156426 () Bool)

(assert (=> d!77461 e!156426))

(declare-fun res!191513 () Bool)

(assert (=> d!77461 (=> (not res!191513) (not e!156426))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77461 (= res!191513 (validate_offset_bits!1 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))) ((_ sign_extend 32) (currentByte!10449 thiss!1870)) ((_ sign_extend 32) (currentBit!10444 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19672 0))(
  ( (tuple2!19673 (_1!10722 Unit!17144) (_2!10722 (_ BitVec 8))) )
))
(declare-fun Unit!17157 () Unit!17144)

(declare-fun Unit!17158 () Unit!17144)

(assert (=> d!77461 (= (readByte!0 thiss!1870) (tuple2!19669 (_2!10722 (ite (bvsgt ((_ sign_extend 24) lt!366260) #b00000000000000000000000000000000) (tuple2!19673 Unit!17157 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366261) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6036 (buf!5593 thiss!1870)) (bvadd (currentByte!10449 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366260)))))))) (tuple2!19673 Unit!17158 lt!366261))) (BitStream!9201 (buf!5593 thiss!1870) (bvadd (currentByte!10449 thiss!1870) #b00000000000000000000000000000001) (currentBit!10444 thiss!1870))))))

(declare-fun b!228299 () Bool)

(declare-fun e!156427 () Bool)

(assert (=> b!228299 (= e!156426 e!156427)))

(declare-fun res!191514 () Bool)

(assert (=> b!228299 (=> (not res!191514) (not e!156427))))

(declare-fun lt!366264 () tuple2!19668)

(assert (=> b!228299 (= res!191514 (= (buf!5593 (_2!10720 lt!366264)) (buf!5593 thiss!1870)))))

(declare-fun lt!366262 () (_ BitVec 8))

(declare-fun lt!366263 () (_ BitVec 8))

(declare-fun Unit!17159 () Unit!17144)

(declare-fun Unit!17160 () Unit!17144)

(assert (=> b!228299 (= lt!366264 (tuple2!19669 (_2!10722 (ite (bvsgt ((_ sign_extend 24) lt!366263) #b00000000000000000000000000000000) (tuple2!19673 Unit!17159 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366262) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6036 (buf!5593 thiss!1870)) (bvadd (currentByte!10449 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366263)))))))) (tuple2!19673 Unit!17160 lt!366262))) (BitStream!9201 (buf!5593 thiss!1870) (bvadd (currentByte!10449 thiss!1870) #b00000000000000000000000000000001) (currentBit!10444 thiss!1870))))))

(assert (=> b!228299 (= lt!366262 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6036 (buf!5593 thiss!1870)) (currentByte!10449 thiss!1870))) ((_ sign_extend 24) lt!366263))))))

(assert (=> b!228299 (= lt!366263 ((_ extract 7 0) (currentBit!10444 thiss!1870)))))

(declare-fun lt!366258 () (_ BitVec 64))

(declare-fun b!228300 () Bool)

(declare-fun lt!366259 () (_ BitVec 64))

(assert (=> b!228300 (= e!156427 (= (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366264))) (currentByte!10449 (_2!10720 lt!366264)) (currentBit!10444 (_2!10720 lt!366264))) (bvadd lt!366259 lt!366258)))))

(assert (=> b!228300 (or (not (= (bvand lt!366259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366258 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366259 lt!366258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228300 (= lt!366258 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228300 (= lt!366259 (bitIndex!0 (size!5052 (buf!5593 thiss!1870)) (currentByte!10449 thiss!1870) (currentBit!10444 thiss!1870)))))

(assert (= (and d!77461 res!191513) b!228299))

(assert (= (and b!228299 res!191514) b!228300))

(declare-fun m!351869 () Bool)

(assert (=> d!77461 m!351869))

(declare-fun m!351871 () Bool)

(assert (=> d!77461 m!351871))

(declare-fun m!351873 () Bool)

(assert (=> d!77461 m!351873))

(assert (=> b!228299 m!351873))

(assert (=> b!228299 m!351869))

(declare-fun m!351875 () Bool)

(assert (=> b!228300 m!351875))

(assert (=> b!228300 m!351815))

(assert (=> b!228266 d!77461))

(declare-fun d!77471 () Bool)

(declare-fun e!156428 () Bool)

(assert (=> d!77471 e!156428))

(declare-fun res!191516 () Bool)

(assert (=> d!77471 (=> (not res!191516) (not e!156428))))

(declare-fun lt!366265 () (_ BitVec 64))

(declare-fun lt!366267 () (_ BitVec 64))

(declare-fun lt!366269 () (_ BitVec 64))

(assert (=> d!77471 (= res!191516 (= lt!366267 (bvsub lt!366265 lt!366269)))))

(assert (=> d!77471 (or (= (bvand lt!366265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366269 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366265 lt!366269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77471 (= lt!366269 (remainingBits!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180)))))))

(declare-fun lt!366271 () (_ BitVec 64))

(declare-fun lt!366272 () (_ BitVec 64))

(assert (=> d!77471 (= lt!366265 (bvmul lt!366271 lt!366272))))

(assert (=> d!77471 (or (= lt!366271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366272 (bvsdiv (bvmul lt!366271 lt!366272) lt!366271)))))

(assert (=> d!77471 (= lt!366272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77471 (= lt!366271 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))))))

(assert (=> d!77471 (= lt!366267 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180)))))))

(assert (=> d!77471 (invariant!0 (currentBit!10444 (_2!10720 lt!366180)) (currentByte!10449 (_2!10720 lt!366180)) (size!5052 (buf!5593 (_2!10720 lt!366180))))))

(assert (=> d!77471 (= (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366180))) (currentByte!10449 (_2!10720 lt!366180)) (currentBit!10444 (_2!10720 lt!366180))) lt!366267)))

(declare-fun b!228301 () Bool)

(declare-fun res!191515 () Bool)

(assert (=> b!228301 (=> (not res!191515) (not e!156428))))

(assert (=> b!228301 (= res!191515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366267))))

(declare-fun b!228302 () Bool)

(declare-fun lt!366270 () (_ BitVec 64))

(assert (=> b!228302 (= e!156428 (bvsle lt!366267 (bvmul lt!366270 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228302 (or (= lt!366270 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366270 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366270)))))

(assert (=> b!228302 (= lt!366270 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))))))

(assert (= (and d!77471 res!191516) b!228301))

(assert (= (and b!228301 res!191515) b!228302))

(declare-fun m!351877 () Bool)

(assert (=> d!77471 m!351877))

(declare-fun m!351879 () Bool)

(assert (=> d!77471 m!351879))

(assert (=> b!228266 d!77471))

(declare-fun d!77473 () Bool)

(declare-fun lt!366276 () tuple2!19668)

(assert (=> d!77473 (= lt!366276 (readByte!0 thiss!1870))))

(assert (=> d!77473 (= (readBytePure!0 thiss!1870) (tuple2!19667 (_2!10720 lt!366276) (_1!10720 lt!366276)))))

(declare-fun bs!18945 () Bool)

(assert (= bs!18945 d!77473))

(assert (=> bs!18945 m!351797))

(assert (=> b!228266 d!77473))

(declare-fun d!77477 () Bool)

(declare-fun res!191521 () Bool)

(declare-fun e!156433 () Bool)

(assert (=> d!77477 (=> res!191521 e!156433)))

(assert (=> d!77477 (= res!191521 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77477 (= (arrayRangesEq!888 arr!308 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761) e!156433)))

(declare-fun b!228307 () Bool)

(declare-fun e!156434 () Bool)

(assert (=> b!228307 (= e!156433 e!156434)))

(declare-fun res!191522 () Bool)

(assert (=> b!228307 (=> (not res!191522) (not e!156434))))

(assert (=> b!228307 (= res!191522 (= (select (arr!6036 arr!308) #b00000000000000000000000000000000) (select (arr!6036 (_3!885 lt!366179)) #b00000000000000000000000000000000)))))

(declare-fun b!228308 () Bool)

(assert (=> b!228308 (= e!156434 (arrayRangesEq!888 arr!308 (_3!885 lt!366179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77477 (not res!191521)) b!228307))

(assert (= (and b!228307 res!191522) b!228308))

(declare-fun m!351883 () Bool)

(assert (=> b!228307 m!351883))

(declare-fun m!351885 () Bool)

(assert (=> b!228307 m!351885))

(declare-fun m!351887 () Bool)

(assert (=> b!228308 m!351887))

(assert (=> b!228266 d!77477))

(declare-fun d!77480 () Bool)

(declare-fun e!156435 () Bool)

(assert (=> d!77480 e!156435))

(declare-fun res!191524 () Bool)

(assert (=> d!77480 (=> (not res!191524) (not e!156435))))

(declare-fun lt!366277 () (_ BitVec 64))

(declare-fun lt!366278 () (_ BitVec 64))

(declare-fun lt!366279 () (_ BitVec 64))

(assert (=> d!77480 (= res!191524 (= lt!366278 (bvsub lt!366277 lt!366279)))))

(assert (=> d!77480 (or (= (bvand lt!366277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366277 lt!366279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77480 (= lt!366279 (remainingBits!0 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))) ((_ sign_extend 32) (currentByte!10449 thiss!1870)) ((_ sign_extend 32) (currentBit!10444 thiss!1870))))))

(declare-fun lt!366281 () (_ BitVec 64))

(declare-fun lt!366282 () (_ BitVec 64))

(assert (=> d!77480 (= lt!366277 (bvmul lt!366281 lt!366282))))

(assert (=> d!77480 (or (= lt!366281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366282 (bvsdiv (bvmul lt!366281 lt!366282) lt!366281)))))

(assert (=> d!77480 (= lt!366282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77480 (= lt!366281 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))))))

(assert (=> d!77480 (= lt!366278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10449 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10444 thiss!1870))))))

(assert (=> d!77480 (invariant!0 (currentBit!10444 thiss!1870) (currentByte!10449 thiss!1870) (size!5052 (buf!5593 thiss!1870)))))

(assert (=> d!77480 (= (bitIndex!0 (size!5052 (buf!5593 thiss!1870)) (currentByte!10449 thiss!1870) (currentBit!10444 thiss!1870)) lt!366278)))

(declare-fun b!228309 () Bool)

(declare-fun res!191523 () Bool)

(assert (=> b!228309 (=> (not res!191523) (not e!156435))))

(assert (=> b!228309 (= res!191523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366278))))

(declare-fun b!228310 () Bool)

(declare-fun lt!366280 () (_ BitVec 64))

(assert (=> b!228310 (= e!156435 (bvsle lt!366278 (bvmul lt!366280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228310 (or (= lt!366280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366280)))))

(assert (=> b!228310 (= lt!366280 ((_ sign_extend 32) (size!5052 (buf!5593 thiss!1870))))))

(assert (= (and d!77480 res!191524) b!228309))

(assert (= (and b!228309 res!191523) b!228310))

(assert (=> d!77480 m!351845))

(assert (=> d!77480 m!351847))

(assert (=> b!228266 d!77480))

(declare-fun d!77482 () Bool)

(declare-fun e!156443 () Bool)

(assert (=> d!77482 e!156443))

(declare-fun res!191534 () Bool)

(assert (=> d!77482 (=> (not res!191534) (not e!156443))))

(assert (=> d!77482 (= res!191534 (and (or (let ((rhs!4027 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4027 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4027) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77483 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77483 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77483 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4026 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4026 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4026) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!366314 () Unit!17144)

(declare-fun choose!57 (BitStream!9200 BitStream!9200 (_ BitVec 64) (_ BitVec 32)) Unit!17144)

(assert (=> d!77482 (= lt!366314 (choose!57 thiss!1870 (_2!10720 lt!366180) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77482 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10720 lt!366180) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!366314)))

(declare-fun b!228320 () Bool)

(declare-fun lt!366315 () (_ BitVec 32))

(assert (=> b!228320 (= e!156443 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180))) (bvsub (bvsub to!496 i!761) lt!366315)))))

(assert (=> b!228320 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!366315 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!366315) #b10000000000000000000000000000000)))))

(declare-fun lt!366313 () (_ BitVec 64))

(assert (=> b!228320 (= lt!366315 ((_ extract 31 0) lt!366313))))

(assert (=> b!228320 (and (bvslt lt!366313 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!366313 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228320 (= lt!366313 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77482 res!191534) b!228320))

(declare-fun m!351901 () Bool)

(assert (=> d!77482 m!351901))

(declare-fun m!351903 () Bool)

(assert (=> b!228320 m!351903))

(assert (=> b!228266 d!77482))

(declare-fun d!77495 () Bool)

(assert (=> d!77495 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5052 lt!366176)) (bvslt i!761 (size!5052 (_3!885 lt!366179))) (= (select (arr!6036 lt!366176) i!761) (select (arr!6036 (_3!885 lt!366179)) i!761)))))

(declare-fun lt!366318 () Unit!17144)

(declare-fun choose!339 (array!11514 array!11514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> d!77495 (= lt!366318 (choose!339 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77495 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77495 (= (arrayRangesEqImpliesEq!144 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366318)))

(declare-fun bs!18948 () Bool)

(assert (= bs!18948 d!77495))

(declare-fun m!351905 () Bool)

(assert (=> bs!18948 m!351905))

(assert (=> bs!18948 m!351807))

(declare-fun m!351907 () Bool)

(assert (=> bs!18948 m!351907))

(assert (=> b!228266 d!77495))

(declare-fun d!77497 () Bool)

(declare-fun e!156446 () Bool)

(assert (=> d!77497 e!156446))

(declare-fun res!191537 () Bool)

(assert (=> d!77497 (=> (not res!191537) (not e!156446))))

(assert (=> d!77497 (= res!191537 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5052 arr!308))))))

(declare-fun lt!366321 () Unit!17144)

(declare-fun choose!340 (array!11514 (_ BitVec 32) (_ BitVec 8)) Unit!17144)

(assert (=> d!77497 (= lt!366321 (choose!340 arr!308 i!761 (_1!10720 lt!366180)))))

(assert (=> d!77497 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5052 arr!308)))))

(assert (=> d!77497 (= (arrayUpdatedAtPrefixLemma!447 arr!308 i!761 (_1!10720 lt!366180)) lt!366321)))

(declare-fun b!228323 () Bool)

(assert (=> b!228323 (= e!156446 (arrayRangesEq!888 arr!308 (array!11515 (store (arr!6036 arr!308) i!761 (_1!10720 lt!366180)) (size!5052 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77497 res!191537) b!228323))

(declare-fun m!351909 () Bool)

(assert (=> d!77497 m!351909))

(assert (=> b!228323 m!351821))

(declare-fun m!351911 () Bool)

(assert (=> b!228323 m!351911))

(assert (=> b!228266 d!77497))

(declare-fun d!77499 () Bool)

(assert (=> d!77499 (arrayRangesEq!888 arr!308 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366324 () Unit!17144)

(declare-fun choose!341 (array!11514 array!11514 array!11514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> d!77499 (= lt!366324 (choose!341 arr!308 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77499 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77499 (= (arrayRangesEqTransitive!311 arr!308 lt!366176 (_3!885 lt!366179) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366324)))

(declare-fun bs!18949 () Bool)

(assert (= bs!18949 d!77499))

(assert (=> bs!18949 m!351799))

(declare-fun m!351913 () Bool)

(assert (=> bs!18949 m!351913))

(assert (=> b!228266 d!77499))

(declare-fun d!77501 () Bool)

(assert (=> d!77501 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180))) lt!366175) (bvsle ((_ sign_extend 32) lt!366175) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366180)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366180))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366180)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18950 () Bool)

(assert (= bs!18950 d!77501))

(assert (=> bs!18950 m!351877))

(assert (=> b!228266 d!77501))

(declare-fun b!228396 () Bool)

(declare-fun res!191595 () Bool)

(declare-fun e!156498 () Bool)

(assert (=> b!228396 (=> (not res!191595) (not e!156498))))

(declare-fun lt!366689 () tuple3!1486)

(assert (=> b!228396 (= res!191595 (and (= (buf!5593 (_2!10720 lt!366180)) (buf!5593 (_2!10718 lt!366689))) (= (size!5052 lt!366176) (size!5052 (_3!885 lt!366689)))))))

(declare-fun e!156500 () Bool)

(declare-fun b!228397 () Bool)

(assert (=> b!228397 (= e!156500 (= (select (arr!6036 (_3!885 lt!366689)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10719 (readBytePure!0 (_2!10720 lt!366180)))))))

(assert (=> b!228397 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5052 (_3!885 lt!366689))))))

(declare-fun lt!366697 () array!11514)

(declare-fun c!11239 () Bool)

(declare-fun lt!366699 () array!11514)

(declare-fun lt!366711 () (_ BitVec 32))

(declare-fun lt!366695 () (_ BitVec 32))

(declare-fun lt!366703 () (_ BitVec 32))

(declare-fun call!3936 () Bool)

(declare-fun bm!3931 () Bool)

(declare-fun lt!366708 () tuple3!1486)

(assert (=> bm!3931 (= call!3936 (arrayRangesEq!888 (ite c!11239 lt!366176 lt!366697) (ite c!11239 (_3!885 lt!366708) lt!366699) (ite c!11239 lt!366711 lt!366703) (ite c!11239 (bvadd #b00000000000000000000000000000001 i!761) lt!366695)))))

(declare-fun bm!3932 () Bool)

(declare-fun lt!366691 () tuple2!19668)

(declare-fun call!3934 () Bool)

(assert (=> bm!3932 (= call!3934 (arrayRangesEq!888 lt!366176 (ite c!11239 (array!11515 (store (arr!6036 lt!366176) (bvadd #b00000000000000000000000000000001 i!761) (_1!10720 lt!366691)) (size!5052 lt!366176)) lt!366176) #b00000000000000000000000000000000 (ite c!11239 (bvadd #b00000000000000000000000000000001 i!761) (size!5052 lt!366176))))))

(declare-fun b!228398 () Bool)

(assert (=> b!228398 (= e!156498 (arrayRangesEq!888 lt!366176 (_3!885 lt!366689) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!228399 () Bool)

(declare-fun e!156499 () tuple3!1486)

(declare-fun lt!366696 () Unit!17144)

(assert (=> b!228399 (= e!156499 (tuple3!1487 lt!366696 (_2!10720 lt!366180) lt!366176))))

(declare-fun call!3935 () (_ BitVec 64))

(assert (=> b!228399 (= call!3935 call!3935)))

(declare-fun lt!366710 () Unit!17144)

(declare-fun Unit!17172 () Unit!17144)

(assert (=> b!228399 (= lt!366710 Unit!17172)))

(declare-fun lt!366698 () Unit!17144)

(declare-fun arrayRangesEqReflexiveLemma!144 (array!11514) Unit!17144)

(assert (=> b!228399 (= lt!366698 (arrayRangesEqReflexiveLemma!144 lt!366176))))

(assert (=> b!228399 call!3934))

(declare-fun lt!366714 () Unit!17144)

(assert (=> b!228399 (= lt!366714 lt!366698)))

(assert (=> b!228399 (= lt!366697 lt!366176)))

(assert (=> b!228399 (= lt!366699 lt!366176)))

(declare-fun lt!366702 () (_ BitVec 32))

(assert (=> b!228399 (= lt!366702 #b00000000000000000000000000000000)))

(declare-fun lt!366704 () (_ BitVec 32))

(assert (=> b!228399 (= lt!366704 (size!5052 lt!366176))))

(assert (=> b!228399 (= lt!366703 #b00000000000000000000000000000000)))

(assert (=> b!228399 (= lt!366695 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!129 (array!11514 array!11514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17144)

(assert (=> b!228399 (= lt!366696 (arrayRangesEqSlicedLemma!129 lt!366697 lt!366699 lt!366702 lt!366704 lt!366703 lt!366695))))

(assert (=> b!228399 call!3936))

(declare-fun bm!3933 () Bool)

(assert (=> bm!3933 (= call!3935 (bitIndex!0 (ite c!11239 (size!5052 (buf!5593 (_2!10718 lt!366708))) (size!5052 (buf!5593 (_2!10720 lt!366180)))) (ite c!11239 (currentByte!10449 (_2!10718 lt!366708)) (currentByte!10449 (_2!10720 lt!366180))) (ite c!11239 (currentBit!10444 (_2!10718 lt!366708)) (currentBit!10444 (_2!10720 lt!366180)))))))

(declare-fun b!228400 () Bool)

(declare-fun lt!366718 () Unit!17144)

(assert (=> b!228400 (= e!156499 (tuple3!1487 lt!366718 (_2!10718 lt!366708) (_3!885 lt!366708)))))

(assert (=> b!228400 (= lt!366691 (readByte!0 (_2!10720 lt!366180)))))

(declare-fun lt!366712 () array!11514)

(assert (=> b!228400 (= lt!366712 (array!11515 (store (arr!6036 lt!366176) (bvadd #b00000000000000000000000000000001 i!761) (_1!10720 lt!366691)) (size!5052 lt!366176)))))

(declare-fun lt!366690 () (_ BitVec 64))

(assert (=> b!228400 (= lt!366690 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!366705 () (_ BitVec 32))

(assert (=> b!228400 (= lt!366705 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366694 () Unit!17144)

(assert (=> b!228400 (= lt!366694 (validateOffsetBytesFromBitIndexLemma!0 (_2!10720 lt!366180) (_2!10720 lt!366691) lt!366690 lt!366705))))

(assert (=> b!228400 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5052 (buf!5593 (_2!10720 lt!366691)))) ((_ sign_extend 32) (currentByte!10449 (_2!10720 lt!366691))) ((_ sign_extend 32) (currentBit!10444 (_2!10720 lt!366691))) (bvsub lt!366705 ((_ extract 31 0) (bvsdiv (bvadd lt!366690 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!366685 () Unit!17144)

(assert (=> b!228400 (= lt!366685 lt!366694)))

(assert (=> b!228400 (= lt!366708 (readByteArrayLoop!0 (_2!10720 lt!366691) lt!366712 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!228400 (= (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366691))) (currentByte!10449 (_2!10720 lt!366691)) (currentBit!10444 (_2!10720 lt!366691))) (bvadd (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366180))) (currentByte!10449 (_2!10720 lt!366180)) (currentBit!10444 (_2!10720 lt!366180))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!366719 () Unit!17144)

(declare-fun Unit!17173 () Unit!17144)

(assert (=> b!228400 (= lt!366719 Unit!17173)))

(assert (=> b!228400 (= (bvadd (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366691))) (currentByte!10449 (_2!10720 lt!366691)) (currentBit!10444 (_2!10720 lt!366691))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3935)))

(declare-fun lt!366686 () Unit!17144)

(declare-fun Unit!17174 () Unit!17144)

(assert (=> b!228400 (= lt!366686 Unit!17174)))

(assert (=> b!228400 (= (bvadd (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366180))) (currentByte!10449 (_2!10720 lt!366180)) (currentBit!10444 (_2!10720 lt!366180))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3935)))

(declare-fun lt!366692 () Unit!17144)

(declare-fun Unit!17175 () Unit!17144)

(assert (=> b!228400 (= lt!366692 Unit!17175)))

(assert (=> b!228400 (and (= (buf!5593 (_2!10720 lt!366180)) (buf!5593 (_2!10718 lt!366708))) (= (size!5052 lt!366176) (size!5052 (_3!885 lt!366708))))))

(declare-fun lt!366717 () Unit!17144)

(declare-fun Unit!17176 () Unit!17144)

(assert (=> b!228400 (= lt!366717 Unit!17176)))

(declare-fun lt!366713 () Unit!17144)

(assert (=> b!228400 (= lt!366713 (arrayUpdatedAtPrefixLemma!447 lt!366176 (bvadd #b00000000000000000000000000000001 i!761) (_1!10720 lt!366691)))))

(assert (=> b!228400 call!3934))

(declare-fun lt!366720 () Unit!17144)

(assert (=> b!228400 (= lt!366720 lt!366713)))

(assert (=> b!228400 (= lt!366711 #b00000000000000000000000000000000)))

(declare-fun lt!366709 () Unit!17144)

(assert (=> b!228400 (= lt!366709 (arrayRangesEqTransitive!311 lt!366176 lt!366712 (_3!885 lt!366708) lt!366711 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228400 call!3936))

(declare-fun lt!366706 () Unit!17144)

(assert (=> b!228400 (= lt!366706 lt!366709)))

(assert (=> b!228400 (arrayRangesEq!888 lt!366176 (_3!885 lt!366708) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!366688 () Unit!17144)

(declare-fun Unit!17177 () Unit!17144)

(assert (=> b!228400 (= lt!366688 Unit!17177)))

(declare-fun lt!366701 () Unit!17144)

(assert (=> b!228400 (= lt!366701 (arrayRangesEqImpliesEq!144 lt!366712 (_3!885 lt!366708) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228400 (= (select (store (arr!6036 lt!366176) (bvadd #b00000000000000000000000000000001 i!761) (_1!10720 lt!366691)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6036 (_3!885 lt!366708)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366715 () Unit!17144)

(assert (=> b!228400 (= lt!366715 lt!366701)))

(declare-fun lt!366687 () Bool)

(assert (=> b!228400 (= lt!366687 (= (select (arr!6036 (_3!885 lt!366708)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10720 lt!366691)))))

(declare-fun Unit!17178 () Unit!17144)

(assert (=> b!228400 (= lt!366718 Unit!17178)))

(assert (=> b!228400 lt!366687))

(declare-fun d!77503 () Bool)

(assert (=> d!77503 e!156500))

(declare-fun res!191596 () Bool)

(assert (=> d!77503 (=> res!191596 e!156500)))

(assert (=> d!77503 (= res!191596 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!366716 () Bool)

(assert (=> d!77503 (= lt!366716 e!156498)))

(declare-fun res!191597 () Bool)

(assert (=> d!77503 (=> (not res!191597) (not e!156498))))

(declare-fun lt!366707 () (_ BitVec 64))

(declare-fun lt!366700 () (_ BitVec 64))

(assert (=> d!77503 (= res!191597 (= (bvadd lt!366707 lt!366700) (bitIndex!0 (size!5052 (buf!5593 (_2!10718 lt!366689))) (currentByte!10449 (_2!10718 lt!366689)) (currentBit!10444 (_2!10718 lt!366689)))))))

(assert (=> d!77503 (or (not (= (bvand lt!366707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366700 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366707 lt!366700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!366693 () (_ BitVec 64))

(assert (=> d!77503 (= lt!366700 (bvmul lt!366693 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77503 (or (= lt!366693 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366693 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366693)))))

(assert (=> d!77503 (= lt!366693 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77503 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77503 (= lt!366707 (bitIndex!0 (size!5052 (buf!5593 (_2!10720 lt!366180))) (currentByte!10449 (_2!10720 lt!366180)) (currentBit!10444 (_2!10720 lt!366180))))))

(assert (=> d!77503 (= lt!366689 e!156499)))

(assert (=> d!77503 (= c!11239 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77503 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5052 lt!366176)))))

(assert (=> d!77503 (= (readByteArrayLoop!0 (_2!10720 lt!366180) lt!366176 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!366689)))

(assert (= (and d!77503 c!11239) b!228400))

(assert (= (and d!77503 (not c!11239)) b!228399))

(assert (= (or b!228400 b!228399) bm!3931))

(assert (= (or b!228400 b!228399) bm!3932))

(assert (= (or b!228400 b!228399) bm!3933))

(assert (= (and d!77503 res!191597) b!228396))

(assert (= (and b!228396 res!191595) b!228398))

(assert (= (and d!77503 (not res!191596)) b!228397))

(declare-fun m!352047 () Bool)

(assert (=> b!228398 m!352047))

(declare-fun m!352049 () Bool)

(assert (=> bm!3933 m!352049))

(declare-fun m!352051 () Bool)

(assert (=> b!228400 m!352051))

(declare-fun m!352053 () Bool)

(assert (=> b!228400 m!352053))

(declare-fun m!352055 () Bool)

(assert (=> b!228400 m!352055))

(declare-fun m!352057 () Bool)

(assert (=> b!228400 m!352057))

(declare-fun m!352059 () Bool)

(assert (=> b!228400 m!352059))

(declare-fun m!352061 () Bool)

(assert (=> b!228400 m!352061))

(declare-fun m!352063 () Bool)

(assert (=> b!228400 m!352063))

(assert (=> b!228400 m!351819))

(declare-fun m!352065 () Bool)

(assert (=> b!228400 m!352065))

(declare-fun m!352067 () Bool)

(assert (=> b!228400 m!352067))

(declare-fun m!352069 () Bool)

(assert (=> b!228400 m!352069))

(declare-fun m!352071 () Bool)

(assert (=> b!228400 m!352071))

(declare-fun m!352073 () Bool)

(assert (=> b!228400 m!352073))

(assert (=> bm!3932 m!352065))

(declare-fun m!352075 () Bool)

(assert (=> bm!3932 m!352075))

(declare-fun m!352077 () Bool)

(assert (=> d!77503 m!352077))

(assert (=> d!77503 m!351819))

(declare-fun m!352079 () Bool)

(assert (=> bm!3931 m!352079))

(declare-fun m!352081 () Bool)

(assert (=> b!228399 m!352081))

(declare-fun m!352083 () Bool)

(assert (=> b!228399 m!352083))

(declare-fun m!352085 () Bool)

(assert (=> b!228397 m!352085))

(declare-fun m!352087 () Bool)

(assert (=> b!228397 m!352087))

(assert (=> b!228266 d!77503))

(declare-fun d!77540 () Bool)

(declare-fun res!191598 () Bool)

(declare-fun e!156501 () Bool)

(assert (=> d!77540 (=> res!191598 e!156501)))

(assert (=> d!77540 (= res!191598 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77540 (= (arrayRangesEq!888 arr!308 lt!366176 #b00000000000000000000000000000000 i!761) e!156501)))

(declare-fun b!228401 () Bool)

(declare-fun e!156502 () Bool)

(assert (=> b!228401 (= e!156501 e!156502)))

(declare-fun res!191599 () Bool)

(assert (=> b!228401 (=> (not res!191599) (not e!156502))))

(assert (=> b!228401 (= res!191599 (= (select (arr!6036 arr!308) #b00000000000000000000000000000000) (select (arr!6036 lt!366176) #b00000000000000000000000000000000)))))

(declare-fun b!228402 () Bool)

(assert (=> b!228402 (= e!156502 (arrayRangesEq!888 arr!308 lt!366176 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77540 (not res!191598)) b!228401))

(assert (= (and b!228401 res!191599) b!228402))

(assert (=> b!228401 m!351883))

(declare-fun m!352089 () Bool)

(assert (=> b!228401 m!352089))

(declare-fun m!352091 () Bool)

(assert (=> b!228402 m!352091))

(assert (=> b!228266 d!77540))

(declare-fun d!77542 () Bool)

(assert (=> d!77542 (= (array_inv!4793 (buf!5593 thiss!1870)) (bvsge (size!5052 (buf!5593 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228267 d!77542))

(push 1)

