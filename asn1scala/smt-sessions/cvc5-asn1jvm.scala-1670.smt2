; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46574 () Bool)

(assert start!46574)

(declare-fun b!223579 () Bool)

(declare-fun e!152188 () Bool)

(declare-datatypes ((array!10980 0))(
  ( (array!10981 (arr!5758 (Array (_ BitVec 32) (_ BitVec 8))) (size!4816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8734 0))(
  ( (BitStream!8735 (buf!5360 array!10980) (currentByte!10070 (_ BitVec 32)) (currentBit!10065 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8734)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223579 (= e!152188 (not (invariant!0 (currentBit!10065 thiss!1870) (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870)))))))

(declare-fun e!152186 () Bool)

(assert (=> b!223579 e!152186))

(declare-fun res!187692 () Bool)

(assert (=> b!223579 (=> (not res!187692) (not e!152186))))

(declare-fun lt!353820 () (_ BitVec 64))

(declare-fun lt!353816 () (_ BitVec 64))

(assert (=> b!223579 (= res!187692 (= lt!353820 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!353816)))))

(declare-datatypes ((tuple2!19096 0))(
  ( (tuple2!19097 (_1!10269 (_ BitVec 8)) (_2!10269 BitStream!8734)) )
))
(declare-fun lt!353815 () tuple2!19096)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223579 (= lt!353820 (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353815))) (currentByte!10070 (_2!10269 lt!353815)) (currentBit!10065 (_2!10269 lt!353815))))))

(assert (=> b!223579 (= lt!353816 (bitIndex!0 (size!4816 (buf!5360 thiss!1870)) (currentByte!10070 thiss!1870) (currentBit!10065 thiss!1870)))))

(declare-fun arr!308 () array!10980)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((Unit!16235 0))(
  ( (Unit!16236) )
))
(declare-datatypes ((tuple3!1158 0))(
  ( (tuple3!1159 (_1!10270 Unit!16235) (_2!10270 BitStream!8734) (_3!721 array!10980)) )
))
(declare-fun lt!353817 () tuple3!1158)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8734 array!10980 (_ BitVec 32) (_ BitVec 32)) tuple3!1158)

(assert (=> b!223579 (= lt!353817 (readByteArrayLoop!0 (_2!10269 lt!353815) (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353819 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223579 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815))) lt!353819)))

(assert (=> b!223579 (= lt!353819 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353818 () Unit!16235)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8734 BitStream!8734 (_ BitVec 64) (_ BitVec 32)) Unit!16235)

(assert (=> b!223579 (= lt!353818 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10269 lt!353815) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8734) tuple2!19096)

(assert (=> b!223579 (= lt!353815 (readByte!0 thiss!1870))))

(declare-fun b!223580 () Bool)

(declare-fun res!187695 () Bool)

(assert (=> b!223580 (=> (not res!187695) (not e!152188))))

(assert (=> b!223580 (= res!187695 (bvslt i!761 to!496))))

(declare-fun b!223581 () Bool)

(declare-fun res!187693 () Bool)

(assert (=> b!223581 (=> (not res!187693) (not e!152188))))

(assert (=> b!223581 (= res!187693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))) ((_ sign_extend 32) (currentByte!10070 thiss!1870)) ((_ sign_extend 32) (currentBit!10065 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223582 () Bool)

(declare-fun e!152187 () Bool)

(declare-fun array_inv!4557 (array!10980) Bool)

(assert (=> b!223582 (= e!152187 (array_inv!4557 (buf!5360 thiss!1870)))))

(declare-fun b!223583 () Bool)

(assert (=> b!223583 (= e!152186 (= (bvadd lt!353820 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!353819))) (bitIndex!0 (size!4816 (buf!5360 (_2!10270 lt!353817))) (currentByte!10070 (_2!10270 lt!353817)) (currentBit!10065 (_2!10270 lt!353817)))))))

(declare-fun res!187694 () Bool)

(assert (=> start!46574 (=> (not res!187694) (not e!152188))))

(assert (=> start!46574 (= res!187694 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4816 arr!308))))))

(assert (=> start!46574 e!152188))

(assert (=> start!46574 true))

(assert (=> start!46574 (array_inv!4557 arr!308)))

(declare-fun inv!12 (BitStream!8734) Bool)

(assert (=> start!46574 (and (inv!12 thiss!1870) e!152187)))

(assert (= (and start!46574 res!187694) b!223581))

(assert (= (and b!223581 res!187693) b!223580))

(assert (= (and b!223580 res!187695) b!223579))

(assert (= (and b!223579 res!187692) b!223583))

(assert (= start!46574 b!223582))

(declare-fun m!342671 () Bool)

(assert (=> b!223579 m!342671))

(declare-fun m!342673 () Bool)

(assert (=> b!223579 m!342673))

(declare-fun m!342675 () Bool)

(assert (=> b!223579 m!342675))

(declare-fun m!342677 () Bool)

(assert (=> b!223579 m!342677))

(declare-fun m!342679 () Bool)

(assert (=> b!223579 m!342679))

(declare-fun m!342681 () Bool)

(assert (=> b!223579 m!342681))

(declare-fun m!342683 () Bool)

(assert (=> b!223579 m!342683))

(declare-fun m!342685 () Bool)

(assert (=> b!223579 m!342685))

(declare-fun m!342687 () Bool)

(assert (=> b!223582 m!342687))

(declare-fun m!342689 () Bool)

(assert (=> b!223581 m!342689))

(declare-fun m!342691 () Bool)

(assert (=> start!46574 m!342691))

(declare-fun m!342693 () Bool)

(assert (=> start!46574 m!342693))

(declare-fun m!342695 () Bool)

(assert (=> b!223583 m!342695))

(push 1)

(assert (not b!223583))

(assert (not b!223579))

(assert (not b!223581))

(assert (not start!46574))

(assert (not b!223582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75864 () Bool)

(declare-fun lt!353906 () (_ BitVec 8))

(declare-fun lt!353903 () (_ BitVec 8))

(assert (=> d!75864 (= lt!353906 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5758 (buf!5360 thiss!1870)) (currentByte!10070 thiss!1870))) ((_ sign_extend 24) lt!353903))))))

(assert (=> d!75864 (= lt!353903 ((_ extract 7 0) (currentBit!10065 thiss!1870)))))

(declare-fun e!152233 () Bool)

(assert (=> d!75864 e!152233))

(declare-fun res!187736 () Bool)

(assert (=> d!75864 (=> (not res!187736) (not e!152233))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75864 (= res!187736 (validate_offset_bits!1 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))) ((_ sign_extend 32) (currentByte!10070 thiss!1870)) ((_ sign_extend 32) (currentBit!10065 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19106 0))(
  ( (tuple2!19107 (_1!10277 Unit!16235) (_2!10277 (_ BitVec 8))) )
))
(declare-fun Unit!16258 () Unit!16235)

(declare-fun Unit!16259 () Unit!16235)

(assert (=> d!75864 (= (readByte!0 thiss!1870) (tuple2!19097 (_2!10277 (ite (bvsgt ((_ sign_extend 24) lt!353903) #b00000000000000000000000000000000) (tuple2!19107 Unit!16258 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353906) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5758 (buf!5360 thiss!1870)) (bvadd (currentByte!10070 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353903)))))))) (tuple2!19107 Unit!16259 lt!353906))) (BitStream!8735 (buf!5360 thiss!1870) (bvadd (currentByte!10070 thiss!1870) #b00000000000000000000000000000001) (currentBit!10065 thiss!1870))))))

(declare-fun b!223627 () Bool)

(declare-fun e!152234 () Bool)

(assert (=> b!223627 (= e!152233 e!152234)))

(declare-fun res!187735 () Bool)

(assert (=> b!223627 (=> (not res!187735) (not e!152234))))

(declare-fun lt!353902 () tuple2!19096)

(assert (=> b!223627 (= res!187735 (= (buf!5360 (_2!10269 lt!353902)) (buf!5360 thiss!1870)))))

(declare-fun lt!353901 () (_ BitVec 8))

(declare-fun lt!353907 () (_ BitVec 8))

(declare-fun Unit!16261 () Unit!16235)

(declare-fun Unit!16262 () Unit!16235)

(assert (=> b!223627 (= lt!353902 (tuple2!19097 (_2!10277 (ite (bvsgt ((_ sign_extend 24) lt!353901) #b00000000000000000000000000000000) (tuple2!19107 Unit!16261 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353907) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5758 (buf!5360 thiss!1870)) (bvadd (currentByte!10070 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353901)))))))) (tuple2!19107 Unit!16262 lt!353907))) (BitStream!8735 (buf!5360 thiss!1870) (bvadd (currentByte!10070 thiss!1870) #b00000000000000000000000000000001) (currentBit!10065 thiss!1870))))))

(assert (=> b!223627 (= lt!353907 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5758 (buf!5360 thiss!1870)) (currentByte!10070 thiss!1870))) ((_ sign_extend 24) lt!353901))))))

(assert (=> b!223627 (= lt!353901 ((_ extract 7 0) (currentBit!10065 thiss!1870)))))

(declare-fun lt!353904 () (_ BitVec 64))

(declare-fun b!223628 () Bool)

(declare-fun lt!353905 () (_ BitVec 64))

(assert (=> b!223628 (= e!152234 (= (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353902))) (currentByte!10070 (_2!10269 lt!353902)) (currentBit!10065 (_2!10269 lt!353902))) (bvadd lt!353904 lt!353905)))))

(assert (=> b!223628 (or (not (= (bvand lt!353904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353905 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353904 lt!353905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223628 (= lt!353905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223628 (= lt!353904 (bitIndex!0 (size!4816 (buf!5360 thiss!1870)) (currentByte!10070 thiss!1870) (currentBit!10065 thiss!1870)))))

(assert (= (and d!75864 res!187736) b!223627))

(assert (= (and b!223627 res!187735) b!223628))

(declare-fun m!342763 () Bool)

(assert (=> d!75864 m!342763))

(declare-fun m!342765 () Bool)

(assert (=> d!75864 m!342765))

(declare-fun m!342767 () Bool)

(assert (=> d!75864 m!342767))

(assert (=> b!223627 m!342767))

(assert (=> b!223627 m!342763))

(declare-fun m!342769 () Bool)

(assert (=> b!223628 m!342769))

(assert (=> b!223628 m!342683))

(assert (=> b!223579 d!75864))

(declare-fun b!223696 () Bool)

(declare-fun lt!354314 () Unit!16235)

(declare-fun e!152279 () tuple3!1158)

(assert (=> b!223696 (= e!152279 (tuple3!1159 lt!354314 (_2!10269 lt!353815) (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))))))

(declare-fun call!3558 () (_ BitVec 64))

(assert (=> b!223696 (= call!3558 call!3558)))

(declare-fun lt!354285 () Unit!16235)

(declare-fun Unit!16263 () Unit!16235)

(assert (=> b!223696 (= lt!354285 Unit!16263)))

(declare-fun lt!354315 () Unit!16235)

(declare-fun arrayRangesEqReflexiveLemma!70 (array!10980) Unit!16235)

(assert (=> b!223696 (= lt!354315 (arrayRangesEqReflexiveLemma!70 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))))))

(declare-fun call!3557 () Bool)

(assert (=> b!223696 call!3557))

(declare-fun lt!354282 () Unit!16235)

(assert (=> b!223696 (= lt!354282 lt!354315)))

(declare-fun lt!354308 () array!10980)

(assert (=> b!223696 (= lt!354308 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)))))

(declare-fun lt!354298 () array!10980)

(assert (=> b!223696 (= lt!354298 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)))))

(declare-fun lt!354297 () (_ BitVec 32))

(assert (=> b!223696 (= lt!354297 #b00000000000000000000000000000000)))

(declare-fun lt!354293 () (_ BitVec 32))

(assert (=> b!223696 (= lt!354293 (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))))))

(declare-fun lt!354302 () (_ BitVec 32))

(assert (=> b!223696 (= lt!354302 #b00000000000000000000000000000000)))

(declare-fun lt!354284 () (_ BitVec 32))

(assert (=> b!223696 (= lt!354284 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!70 (array!10980 array!10980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16235)

(assert (=> b!223696 (= lt!354314 (arrayRangesEqSlicedLemma!70 lt!354308 lt!354298 lt!354297 lt!354293 lt!354302 lt!354284))))

(declare-fun call!3556 () Bool)

(assert (=> b!223696 call!3556))

(declare-fun b!223697 () Bool)

(declare-fun lt!354280 () tuple3!1158)

(declare-fun e!152277 () Bool)

(declare-fun arrayRangesEq!717 (array!10980 array!10980 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223697 (= e!152277 (arrayRangesEq!717 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (_3!721 lt!354280) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!75866 () Bool)

(declare-fun e!152278 () Bool)

(assert (=> d!75866 e!152278))

(declare-fun res!187790 () Bool)

(assert (=> d!75866 (=> res!187790 e!152278)))

(assert (=> d!75866 (= res!187790 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354290 () Bool)

(assert (=> d!75866 (= lt!354290 e!152277)))

(declare-fun res!187789 () Bool)

(assert (=> d!75866 (=> (not res!187789) (not e!152277))))

(declare-fun lt!354303 () (_ BitVec 64))

(declare-fun lt!354310 () (_ BitVec 64))

(assert (=> d!75866 (= res!187789 (= (bvadd lt!354310 lt!354303) (bitIndex!0 (size!4816 (buf!5360 (_2!10270 lt!354280))) (currentByte!10070 (_2!10270 lt!354280)) (currentBit!10065 (_2!10270 lt!354280)))))))

(assert (=> d!75866 (or (not (= (bvand lt!354310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354303 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354310 lt!354303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!354288 () (_ BitVec 64))

(assert (=> d!75866 (= lt!354303 (bvmul lt!354288 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75866 (or (= lt!354288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354288)))))

(assert (=> d!75866 (= lt!354288 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75866 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75866 (= lt!354310 (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353815))) (currentByte!10070 (_2!10269 lt!353815)) (currentBit!10065 (_2!10269 lt!353815))))))

(assert (=> d!75866 (= lt!354280 e!152279)))

(declare-fun c!11113 () Bool)

(assert (=> d!75866 (= c!11113 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75866 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)))))))

(assert (=> d!75866 (= (readByteArrayLoop!0 (_2!10269 lt!353815) (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!354280)))

(declare-fun lt!354304 () tuple2!19096)

(declare-fun bm!3553 () Bool)

(assert (=> bm!3553 (= call!3558 (bitIndex!0 (ite c!11113 (size!4816 (buf!5360 (_2!10269 lt!354304))) (size!4816 (buf!5360 (_2!10269 lt!353815)))) (ite c!11113 (currentByte!10070 (_2!10269 lt!354304)) (currentByte!10070 (_2!10269 lt!353815))) (ite c!11113 (currentBit!10065 (_2!10269 lt!354304)) (currentBit!10065 (_2!10269 lt!353815)))))))

(declare-fun b!223698 () Bool)

(declare-fun res!187791 () Bool)

(assert (=> b!223698 (=> (not res!187791) (not e!152277))))

(assert (=> b!223698 (= res!187791 (and (= (buf!5360 (_2!10269 lt!353815)) (buf!5360 (_2!10270 lt!354280))) (= (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (size!4816 (_3!721 lt!354280)))))))

(declare-fun b!223699 () Bool)

(declare-fun lt!354283 () Unit!16235)

(declare-fun lt!354295 () tuple3!1158)

(assert (=> b!223699 (= e!152279 (tuple3!1159 lt!354283 (_2!10270 lt!354295) (_3!721 lt!354295)))))

(assert (=> b!223699 (= lt!354304 (readByte!0 (_2!10269 lt!353815)))))

(declare-fun lt!354306 () array!10980)

(assert (=> b!223699 (= lt!354306 (array!10981 (store (arr!5758 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10269 lt!354304)) (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)))))))

(declare-fun lt!354313 () (_ BitVec 64))

(assert (=> b!223699 (= lt!354313 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354296 () (_ BitVec 32))

(assert (=> b!223699 (= lt!354296 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354281 () Unit!16235)

(assert (=> b!223699 (= lt!354281 (validateOffsetBytesFromBitIndexLemma!0 (_2!10269 lt!353815) (_2!10269 lt!354304) lt!354313 lt!354296))))

(assert (=> b!223699 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!354304)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!354304))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!354304))) (bvsub lt!354296 ((_ extract 31 0) (bvsdiv (bvadd lt!354313 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354307 () Unit!16235)

(assert (=> b!223699 (= lt!354307 lt!354281)))

(assert (=> b!223699 (= lt!354295 (readByteArrayLoop!0 (_2!10269 lt!354304) lt!354306 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223699 (= call!3558 (bvadd (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353815))) (currentByte!10070 (_2!10269 lt!353815)) (currentBit!10065 (_2!10269 lt!353815))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354311 () Unit!16235)

(declare-fun Unit!16264 () Unit!16235)

(assert (=> b!223699 (= lt!354311 Unit!16264)))

(assert (=> b!223699 (= (bvadd call!3558 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4816 (buf!5360 (_2!10270 lt!354295))) (currentByte!10070 (_2!10270 lt!354295)) (currentBit!10065 (_2!10270 lt!354295))))))

(declare-fun lt!354312 () Unit!16235)

(declare-fun Unit!16265 () Unit!16235)

(assert (=> b!223699 (= lt!354312 Unit!16265)))

(assert (=> b!223699 (= (bvadd (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353815))) (currentByte!10070 (_2!10269 lt!353815)) (currentBit!10065 (_2!10269 lt!353815))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4816 (buf!5360 (_2!10270 lt!354295))) (currentByte!10070 (_2!10270 lt!354295)) (currentBit!10065 (_2!10270 lt!354295))))))

(declare-fun lt!354292 () Unit!16235)

(declare-fun Unit!16266 () Unit!16235)

(assert (=> b!223699 (= lt!354292 Unit!16266)))

(assert (=> b!223699 (and (= (buf!5360 (_2!10269 lt!353815)) (buf!5360 (_2!10270 lt!354295))) (= (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (size!4816 (_3!721 lt!354295))))))

(declare-fun lt!354301 () Unit!16235)

(declare-fun Unit!16267 () Unit!16235)

(assert (=> b!223699 (= lt!354301 Unit!16267)))

(declare-fun lt!354286 () Unit!16235)

(declare-fun arrayUpdatedAtPrefixLemma!309 (array!10980 (_ BitVec 32) (_ BitVec 8)) Unit!16235)

(assert (=> b!223699 (= lt!354286 (arrayUpdatedAtPrefixLemma!309 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10269 lt!354304)))))

(assert (=> b!223699 (arrayRangesEq!717 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (array!10981 (store (arr!5758 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10269 lt!354304)) (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354309 () Unit!16235)

(assert (=> b!223699 (= lt!354309 lt!354286)))

(declare-fun lt!354299 () (_ BitVec 32))

(assert (=> b!223699 (= lt!354299 #b00000000000000000000000000000000)))

(declare-fun lt!354287 () Unit!16235)

(declare-fun arrayRangesEqTransitive!203 (array!10980 array!10980 array!10980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16235)

(assert (=> b!223699 (= lt!354287 (arrayRangesEqTransitive!203 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) lt!354306 (_3!721 lt!354295) lt!354299 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223699 call!3557))

(declare-fun lt!354291 () Unit!16235)

(assert (=> b!223699 (= lt!354291 lt!354287)))

(assert (=> b!223699 call!3556))

(declare-fun lt!354300 () Unit!16235)

(declare-fun Unit!16268 () Unit!16235)

(assert (=> b!223699 (= lt!354300 Unit!16268)))

(declare-fun lt!354305 () Unit!16235)

(declare-fun arrayRangesEqImpliesEq!78 (array!10980 array!10980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16235)

(assert (=> b!223699 (= lt!354305 (arrayRangesEqImpliesEq!78 lt!354306 (_3!721 lt!354295) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223699 (= (select (store (arr!5758 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10269 lt!354304)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5758 (_3!721 lt!354295)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354294 () Unit!16235)

(assert (=> b!223699 (= lt!354294 lt!354305)))

(declare-fun lt!354289 () Bool)

(assert (=> b!223699 (= lt!354289 (= (select (arr!5758 (_3!721 lt!354295)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10269 lt!354304)))))

(declare-fun Unit!16269 () Unit!16235)

(assert (=> b!223699 (= lt!354283 Unit!16269)))

(assert (=> b!223699 lt!354289))

(declare-fun bm!3554 () Bool)

(assert (=> bm!3554 (= call!3556 (arrayRangesEq!717 (ite c!11113 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) lt!354308) (ite c!11113 (_3!721 lt!354295) lt!354298) (ite c!11113 #b00000000000000000000000000000000 lt!354302) (ite c!11113 (bvadd #b00000000000000000000000000000001 i!761) lt!354284)))))

(declare-fun b!223700 () Bool)

(declare-datatypes ((tuple2!19110 0))(
  ( (tuple2!19111 (_1!10279 BitStream!8734) (_2!10279 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8734) tuple2!19110)

(assert (=> b!223700 (= e!152278 (= (select (arr!5758 (_3!721 lt!354280)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10279 (readBytePure!0 (_2!10269 lt!353815)))))))

(assert (=> b!223700 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4816 (_3!721 lt!354280))))))

(declare-fun bm!3555 () Bool)

(assert (=> bm!3555 (= call!3557 (arrayRangesEq!717 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308)) (ite c!11113 (_3!721 lt!354295) (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))) (ite c!11113 lt!354299 #b00000000000000000000000000000000) (ite c!11113 (bvadd #b00000000000000000000000000000001 i!761) (size!4816 (array!10981 (store (arr!5758 arr!308) i!761 (_1!10269 lt!353815)) (size!4816 arr!308))))))))

(assert (= (and d!75866 c!11113) b!223699))

(assert (= (and d!75866 (not c!11113)) b!223696))

(assert (= (or b!223699 b!223696) bm!3554))

(assert (= (or b!223699 b!223696) bm!3555))

(assert (= (or b!223699 b!223696) bm!3553))

(assert (= (and d!75866 res!187789) b!223698))

(assert (= (and b!223698 res!187791) b!223697))

(assert (= (and d!75866 (not res!187790)) b!223700))

(declare-fun m!342885 () Bool)

(assert (=> b!223699 m!342885))

(declare-fun m!342887 () Bool)

(assert (=> b!223699 m!342887))

(declare-fun m!342889 () Bool)

(assert (=> b!223699 m!342889))

(declare-fun m!342891 () Bool)

(assert (=> b!223699 m!342891))

(assert (=> b!223699 m!342671))

(declare-fun m!342893 () Bool)

(assert (=> b!223699 m!342893))

(declare-fun m!342895 () Bool)

(assert (=> b!223699 m!342895))

(declare-fun m!342897 () Bool)

(assert (=> b!223699 m!342897))

(declare-fun m!342899 () Bool)

(assert (=> b!223699 m!342899))

(declare-fun m!342901 () Bool)

(assert (=> b!223699 m!342901))

(declare-fun m!342903 () Bool)

(assert (=> b!223699 m!342903))

(declare-fun m!342905 () Bool)

(assert (=> b!223699 m!342905))

(declare-fun m!342907 () Bool)

(assert (=> b!223699 m!342907))

(declare-fun m!342909 () Bool)

(assert (=> d!75866 m!342909))

(assert (=> d!75866 m!342671))

(declare-fun m!342911 () Bool)

(assert (=> bm!3555 m!342911))

(declare-fun m!342913 () Bool)

(assert (=> b!223696 m!342913))

(declare-fun m!342915 () Bool)

(assert (=> b!223696 m!342915))

(declare-fun m!342917 () Bool)

(assert (=> bm!3554 m!342917))

(declare-fun m!342919 () Bool)

(assert (=> bm!3553 m!342919))

(declare-fun m!342921 () Bool)

(assert (=> b!223700 m!342921))

(declare-fun m!342923 () Bool)

(assert (=> b!223700 m!342923))

(declare-fun m!342925 () Bool)

(assert (=> b!223697 m!342925))

(assert (=> b!223579 d!75866))

(declare-fun d!75903 () Bool)

(declare-fun e!152283 () Bool)

(assert (=> d!75903 e!152283))

(declare-fun res!187796 () Bool)

(assert (=> d!75903 (=> (not res!187796) (not e!152283))))

(assert (=> d!75903 (= res!187796 (and (or (let ((rhs!3704 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3704 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3704) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75904 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75904 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75904 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3703 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3703 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3703) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!354330 () Unit!16235)

(declare-fun choose!57 (BitStream!8734 BitStream!8734 (_ BitVec 64) (_ BitVec 32)) Unit!16235)

(assert (=> d!75903 (= lt!354330 (choose!57 thiss!1870 (_2!10269 lt!353815) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75903 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10269 lt!353815) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!354330)))

(declare-fun lt!354329 () (_ BitVec 32))

(declare-fun b!223705 () Bool)

(assert (=> b!223705 (= e!152283 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815))) (bvsub (bvsub to!496 i!761) lt!354329)))))

(assert (=> b!223705 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!354329 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!354329) #b10000000000000000000000000000000)))))

(declare-fun lt!354328 () (_ BitVec 64))

(assert (=> b!223705 (= lt!354329 ((_ extract 31 0) lt!354328))))

(assert (=> b!223705 (and (bvslt lt!354328 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!354328 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223705 (= lt!354328 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75903 res!187796) b!223705))

(declare-fun m!342927 () Bool)

(assert (=> d!75903 m!342927))

(declare-fun m!342929 () Bool)

(assert (=> b!223705 m!342929))

(assert (=> b!223579 d!75903))

(declare-fun d!75906 () Bool)

(assert (=> d!75906 (= (invariant!0 (currentBit!10065 thiss!1870) (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870))) (and (bvsge (currentBit!10065 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10065 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10070 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870))) (and (= (currentBit!10065 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870)))))))))

(assert (=> b!223579 d!75906))

(declare-fun d!75908 () Bool)

(declare-fun e!152286 () Bool)

(assert (=> d!75908 e!152286))

(declare-fun res!187801 () Bool)

(assert (=> d!75908 (=> (not res!187801) (not e!152286))))

(declare-fun lt!354345 () (_ BitVec 64))

(declare-fun lt!354347 () (_ BitVec 64))

(declare-fun lt!354348 () (_ BitVec 64))

(assert (=> d!75908 (= res!187801 (= lt!354347 (bvsub lt!354345 lt!354348)))))

(assert (=> d!75908 (or (= (bvand lt!354345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354345 lt!354348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75908 (= lt!354348 (remainingBits!0 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))) ((_ sign_extend 32) (currentByte!10070 thiss!1870)) ((_ sign_extend 32) (currentBit!10065 thiss!1870))))))

(declare-fun lt!354344 () (_ BitVec 64))

(declare-fun lt!354346 () (_ BitVec 64))

(assert (=> d!75908 (= lt!354345 (bvmul lt!354344 lt!354346))))

(assert (=> d!75908 (or (= lt!354344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354346 (bvsdiv (bvmul lt!354344 lt!354346) lt!354344)))))

(assert (=> d!75908 (= lt!354346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75908 (= lt!354344 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))))))

(assert (=> d!75908 (= lt!354347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10070 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10065 thiss!1870))))))

(assert (=> d!75908 (invariant!0 (currentBit!10065 thiss!1870) (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870)))))

(assert (=> d!75908 (= (bitIndex!0 (size!4816 (buf!5360 thiss!1870)) (currentByte!10070 thiss!1870) (currentBit!10065 thiss!1870)) lt!354347)))

(declare-fun b!223710 () Bool)

(declare-fun res!187802 () Bool)

(assert (=> b!223710 (=> (not res!187802) (not e!152286))))

(assert (=> b!223710 (= res!187802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354347))))

(declare-fun b!223711 () Bool)

(declare-fun lt!354343 () (_ BitVec 64))

(assert (=> b!223711 (= e!152286 (bvsle lt!354347 (bvmul lt!354343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223711 (or (= lt!354343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354343)))))

(assert (=> b!223711 (= lt!354343 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))))))

(assert (= (and d!75908 res!187801) b!223710))

(assert (= (and b!223710 res!187802) b!223711))

(declare-fun m!342931 () Bool)

(assert (=> d!75908 m!342931))

(assert (=> d!75908 m!342685))

(assert (=> b!223579 d!75908))

(declare-fun d!75910 () Bool)

(declare-fun e!152287 () Bool)

(assert (=> d!75910 e!152287))

(declare-fun res!187803 () Bool)

(assert (=> d!75910 (=> (not res!187803) (not e!152287))))

(declare-fun lt!354353 () (_ BitVec 64))

(declare-fun lt!354351 () (_ BitVec 64))

(declare-fun lt!354354 () (_ BitVec 64))

(assert (=> d!75910 (= res!187803 (= lt!354353 (bvsub lt!354351 lt!354354)))))

(assert (=> d!75910 (or (= (bvand lt!354351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354351 lt!354354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75910 (= lt!354354 (remainingBits!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815)))))))

(declare-fun lt!354350 () (_ BitVec 64))

(declare-fun lt!354352 () (_ BitVec 64))

(assert (=> d!75910 (= lt!354351 (bvmul lt!354350 lt!354352))))

(assert (=> d!75910 (or (= lt!354350 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354352 (bvsdiv (bvmul lt!354350 lt!354352) lt!354350)))))

(assert (=> d!75910 (= lt!354352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75910 (= lt!354350 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))))))

(assert (=> d!75910 (= lt!354353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815)))))))

(assert (=> d!75910 (invariant!0 (currentBit!10065 (_2!10269 lt!353815)) (currentByte!10070 (_2!10269 lt!353815)) (size!4816 (buf!5360 (_2!10269 lt!353815))))))

(assert (=> d!75910 (= (bitIndex!0 (size!4816 (buf!5360 (_2!10269 lt!353815))) (currentByte!10070 (_2!10269 lt!353815)) (currentBit!10065 (_2!10269 lt!353815))) lt!354353)))

(declare-fun b!223712 () Bool)

(declare-fun res!187804 () Bool)

(assert (=> b!223712 (=> (not res!187804) (not e!152287))))

(assert (=> b!223712 (= res!187804 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354353))))

(declare-fun b!223713 () Bool)

(declare-fun lt!354349 () (_ BitVec 64))

(assert (=> b!223713 (= e!152287 (bvsle lt!354353 (bvmul lt!354349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223713 (or (= lt!354349 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354349 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354349)))))

(assert (=> b!223713 (= lt!354349 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))))))

(assert (= (and d!75910 res!187803) b!223712))

(assert (= (and b!223712 res!187804) b!223713))

(declare-fun m!342933 () Bool)

(assert (=> d!75910 m!342933))

(declare-fun m!342935 () Bool)

(assert (=> d!75910 m!342935))

(assert (=> b!223579 d!75910))

(declare-fun d!75912 () Bool)

(assert (=> d!75912 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815))) lt!353819) (bvsle ((_ sign_extend 32) lt!353819) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10269 lt!353815)))) ((_ sign_extend 32) (currentByte!10070 (_2!10269 lt!353815))) ((_ sign_extend 32) (currentBit!10065 (_2!10269 lt!353815)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18499 () Bool)

(assert (= bs!18499 d!75912))

(assert (=> bs!18499 m!342933))

(assert (=> b!223579 d!75912))

(declare-fun d!75914 () Bool)

(declare-fun e!152288 () Bool)

(assert (=> d!75914 e!152288))

(declare-fun res!187805 () Bool)

(assert (=> d!75914 (=> (not res!187805) (not e!152288))))

(declare-fun lt!354357 () (_ BitVec 64))

(declare-fun lt!354360 () (_ BitVec 64))

(declare-fun lt!354359 () (_ BitVec 64))

(assert (=> d!75914 (= res!187805 (= lt!354359 (bvsub lt!354357 lt!354360)))))

(assert (=> d!75914 (or (= (bvand lt!354357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354357 lt!354360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75914 (= lt!354360 (remainingBits!0 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10270 lt!353817)))) ((_ sign_extend 32) (currentByte!10070 (_2!10270 lt!353817))) ((_ sign_extend 32) (currentBit!10065 (_2!10270 lt!353817)))))))

(declare-fun lt!354356 () (_ BitVec 64))

(declare-fun lt!354358 () (_ BitVec 64))

(assert (=> d!75914 (= lt!354357 (bvmul lt!354356 lt!354358))))

(assert (=> d!75914 (or (= lt!354356 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354358 (bvsdiv (bvmul lt!354356 lt!354358) lt!354356)))))

(assert (=> d!75914 (= lt!354358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75914 (= lt!354356 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10270 lt!353817)))))))

(assert (=> d!75914 (= lt!354359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10070 (_2!10270 lt!353817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10065 (_2!10270 lt!353817)))))))

(assert (=> d!75914 (invariant!0 (currentBit!10065 (_2!10270 lt!353817)) (currentByte!10070 (_2!10270 lt!353817)) (size!4816 (buf!5360 (_2!10270 lt!353817))))))

(assert (=> d!75914 (= (bitIndex!0 (size!4816 (buf!5360 (_2!10270 lt!353817))) (currentByte!10070 (_2!10270 lt!353817)) (currentBit!10065 (_2!10270 lt!353817))) lt!354359)))

(declare-fun b!223714 () Bool)

(declare-fun res!187806 () Bool)

(assert (=> b!223714 (=> (not res!187806) (not e!152288))))

(assert (=> b!223714 (= res!187806 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354359))))

(declare-fun b!223715 () Bool)

(declare-fun lt!354355 () (_ BitVec 64))

(assert (=> b!223715 (= e!152288 (bvsle lt!354359 (bvmul lt!354355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223715 (or (= lt!354355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354355)))))

(assert (=> b!223715 (= lt!354355 ((_ sign_extend 32) (size!4816 (buf!5360 (_2!10270 lt!353817)))))))

(assert (= (and d!75914 res!187805) b!223714))

(assert (= (and b!223714 res!187806) b!223715))

(declare-fun m!342937 () Bool)

(assert (=> d!75914 m!342937))

(declare-fun m!342939 () Bool)

(assert (=> d!75914 m!342939))

(assert (=> b!223583 d!75914))

(declare-fun d!75916 () Bool)

(assert (=> d!75916 (= (array_inv!4557 (buf!5360 thiss!1870)) (bvsge (size!4816 (buf!5360 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223582 d!75916))

(declare-fun d!75918 () Bool)

(assert (=> d!75918 (= (array_inv!4557 arr!308) (bvsge (size!4816 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46574 d!75918))

(declare-fun d!75920 () Bool)

(assert (=> d!75920 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10065 thiss!1870) (currentByte!10070 thiss!1870) (size!4816 (buf!5360 thiss!1870))))))

(declare-fun bs!18500 () Bool)

(assert (= bs!18500 d!75920))

(assert (=> bs!18500 m!342685))

(assert (=> start!46574 d!75920))

(declare-fun d!75922 () Bool)

(assert (=> d!75922 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))) ((_ sign_extend 32) (currentByte!10070 thiss!1870)) ((_ sign_extend 32) (currentBit!10065 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4816 (buf!5360 thiss!1870))) ((_ sign_extend 32) (currentByte!10070 thiss!1870)) ((_ sign_extend 32) (currentBit!10065 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18501 () Bool)

(assert (= bs!18501 d!75922))

(assert (=> bs!18501 m!342931))

(assert (=> b!223581 d!75922))

(push 1)

(assert (not b!223628))

(assert (not b!223697))

(assert (not d!75912))

(assert (not d!75866))

(assert (not b!223700))

(assert (not d!75903))

(assert (not d!75910))

(assert (not d!75864))

(assert (not bm!3555))

(assert (not d!75908))

(assert (not bm!3554))

(assert (not d!75922))

(assert (not d!75914))

(assert (not b!223699))

(assert (not b!223705))

(assert (not b!223696))

(assert (not bm!3553))

(assert (not d!75920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

