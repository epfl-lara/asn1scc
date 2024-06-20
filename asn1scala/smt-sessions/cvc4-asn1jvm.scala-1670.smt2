; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46578 () Bool)

(assert start!46578)

(declare-fun b!223609 () Bool)

(declare-fun e!152217 () Bool)

(declare-datatypes ((array!10984 0))(
  ( (array!10985 (arr!5760 (Array (_ BitVec 32) (_ BitVec 8))) (size!4818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8738 0))(
  ( (BitStream!8739 (buf!5362 array!10984) (currentByte!10072 (_ BitVec 32)) (currentBit!10067 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8738)

(declare-fun array_inv!4559 (array!10984) Bool)

(assert (=> b!223609 (= e!152217 (array_inv!4559 (buf!5362 thiss!1870)))))

(declare-fun b!223610 () Bool)

(declare-fun e!152218 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223610 (= e!152218 (not (invariant!0 (currentBit!10067 thiss!1870) (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870)))))))

(declare-fun e!152216 () Bool)

(assert (=> b!223610 e!152216))

(declare-fun res!187718 () Bool)

(assert (=> b!223610 (=> (not res!187718) (not e!152216))))

(declare-fun lt!353856 () (_ BitVec 64))

(declare-fun lt!353854 () (_ BitVec 64))

(assert (=> b!223610 (= res!187718 (= lt!353856 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!353854)))))

(declare-datatypes ((tuple2!19100 0))(
  ( (tuple2!19101 (_1!10273 (_ BitVec 8)) (_2!10273 BitStream!8738)) )
))
(declare-fun lt!353853 () tuple2!19100)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223610 (= lt!353856 (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!353853))) (currentByte!10072 (_2!10273 lt!353853)) (currentBit!10067 (_2!10273 lt!353853))))))

(assert (=> b!223610 (= lt!353854 (bitIndex!0 (size!4818 (buf!5362 thiss!1870)) (currentByte!10072 thiss!1870) (currentBit!10067 thiss!1870)))))

(declare-datatypes ((Unit!16239 0))(
  ( (Unit!16240) )
))
(declare-datatypes ((tuple3!1162 0))(
  ( (tuple3!1163 (_1!10274 Unit!16239) (_2!10274 BitStream!8738) (_3!723 array!10984)) )
))
(declare-fun lt!353851 () tuple3!1162)

(declare-fun arr!308 () array!10984)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8738 array!10984 (_ BitVec 32) (_ BitVec 32)) tuple3!1162)

(assert (=> b!223610 (= lt!353851 (readByteArrayLoop!0 (_2!10273 lt!353853) (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353855 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223610 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853))) lt!353855)))

(assert (=> b!223610 (= lt!353855 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353852 () Unit!16239)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8738 BitStream!8738 (_ BitVec 64) (_ BitVec 32)) Unit!16239)

(assert (=> b!223610 (= lt!353852 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10273 lt!353853) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8738) tuple2!19100)

(assert (=> b!223610 (= lt!353853 (readByte!0 thiss!1870))))

(declare-fun b!223611 () Bool)

(assert (=> b!223611 (= e!152216 (= (bvadd lt!353856 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!353855))) (bitIndex!0 (size!4818 (buf!5362 (_2!10274 lt!353851))) (currentByte!10072 (_2!10274 lt!353851)) (currentBit!10067 (_2!10274 lt!353851)))))))

(declare-fun res!187717 () Bool)

(assert (=> start!46578 (=> (not res!187717) (not e!152218))))

(assert (=> start!46578 (= res!187717 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4818 arr!308))))))

(assert (=> start!46578 e!152218))

(assert (=> start!46578 true))

(assert (=> start!46578 (array_inv!4559 arr!308)))

(declare-fun inv!12 (BitStream!8738) Bool)

(assert (=> start!46578 (and (inv!12 thiss!1870) e!152217)))

(declare-fun b!223612 () Bool)

(declare-fun res!187719 () Bool)

(assert (=> b!223612 (=> (not res!187719) (not e!152218))))

(assert (=> b!223612 (= res!187719 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))) ((_ sign_extend 32) (currentByte!10072 thiss!1870)) ((_ sign_extend 32) (currentBit!10067 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223613 () Bool)

(declare-fun res!187716 () Bool)

(assert (=> b!223613 (=> (not res!187716) (not e!152218))))

(assert (=> b!223613 (= res!187716 (bvslt i!761 to!496))))

(assert (= (and start!46578 res!187717) b!223612))

(assert (= (and b!223612 res!187719) b!223613))

(assert (= (and b!223613 res!187716) b!223610))

(assert (= (and b!223610 res!187718) b!223611))

(assert (= start!46578 b!223609))

(declare-fun m!342723 () Bool)

(assert (=> b!223612 m!342723))

(declare-fun m!342725 () Bool)

(assert (=> b!223611 m!342725))

(declare-fun m!342727 () Bool)

(assert (=> start!46578 m!342727))

(declare-fun m!342729 () Bool)

(assert (=> start!46578 m!342729))

(declare-fun m!342731 () Bool)

(assert (=> b!223609 m!342731))

(declare-fun m!342733 () Bool)

(assert (=> b!223610 m!342733))

(declare-fun m!342735 () Bool)

(assert (=> b!223610 m!342735))

(declare-fun m!342737 () Bool)

(assert (=> b!223610 m!342737))

(declare-fun m!342739 () Bool)

(assert (=> b!223610 m!342739))

(declare-fun m!342741 () Bool)

(assert (=> b!223610 m!342741))

(declare-fun m!342743 () Bool)

(assert (=> b!223610 m!342743))

(declare-fun m!342745 () Bool)

(assert (=> b!223610 m!342745))

(declare-fun m!342747 () Bool)

(assert (=> b!223610 m!342747))

(push 1)

(assert (not b!223611))

(assert (not b!223610))

(assert (not b!223609))

(assert (not start!46578))

(assert (not b!223612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75859 () Bool)

(declare-fun e!152228 () Bool)

(assert (=> d!75859 e!152228))

(declare-fun res!187729 () Bool)

(assert (=> d!75859 (=> (not res!187729) (not e!152228))))

(assert (=> d!75859 (= res!187729 (and (or (let ((rhs!3690 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3690 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3690) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75860 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75860 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75860 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3689 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3689 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3689) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353885 () Unit!16239)

(declare-fun choose!57 (BitStream!8738 BitStream!8738 (_ BitVec 64) (_ BitVec 32)) Unit!16239)

(assert (=> d!75859 (= lt!353885 (choose!57 thiss!1870 (_2!10273 lt!353853) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75859 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10273 lt!353853) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!353885)))

(declare-fun b!223622 () Bool)

(declare-fun lt!353884 () (_ BitVec 32))

(assert (=> b!223622 (= e!152228 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853))) (bvsub (bvsub to!496 i!761) lt!353884)))))

(assert (=> b!223622 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!353884 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!353884) #b10000000000000000000000000000000)))))

(declare-fun lt!353886 () (_ BitVec 64))

(assert (=> b!223622 (= lt!353884 ((_ extract 31 0) lt!353886))))

(assert (=> b!223622 (and (bvslt lt!353886 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353886 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223622 (= lt!353886 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75859 res!187729) b!223622))

(declare-fun m!342759 () Bool)

(assert (=> d!75859 m!342759))

(declare-fun m!342761 () Bool)

(assert (=> b!223622 m!342761))

(assert (=> b!223610 d!75859))

(declare-fun lt!354143 () tuple3!1162)

(declare-fun e!152259 () Bool)

(declare-fun b!223667 () Bool)

(declare-fun arrayRangesEq!716 (array!10984 array!10984 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223667 (= e!152259 (arrayRangesEq!716 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (_3!723 lt!354143) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!75862 () Bool)

(declare-fun e!152260 () Bool)

(assert (=> d!75862 e!152260))

(declare-fun res!187765 () Bool)

(assert (=> d!75862 (=> res!187765 e!152260)))

(assert (=> d!75862 (= res!187765 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354133 () Bool)

(assert (=> d!75862 (= lt!354133 e!152259)))

(declare-fun res!187766 () Bool)

(assert (=> d!75862 (=> (not res!187766) (not e!152259))))

(declare-fun lt!354162 () (_ BitVec 64))

(declare-fun lt!354153 () (_ BitVec 64))

(assert (=> d!75862 (= res!187766 (= (bvadd lt!354162 lt!354153) (bitIndex!0 (size!4818 (buf!5362 (_2!10274 lt!354143))) (currentByte!10072 (_2!10274 lt!354143)) (currentBit!10067 (_2!10274 lt!354143)))))))

(assert (=> d!75862 (or (not (= (bvand lt!354162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354153 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354162 lt!354153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!354140 () (_ BitVec 64))

(assert (=> d!75862 (= lt!354153 (bvmul lt!354140 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75862 (or (= lt!354140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354140)))))

(assert (=> d!75862 (= lt!354140 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75862 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75862 (= lt!354162 (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!353853))) (currentByte!10072 (_2!10273 lt!353853)) (currentBit!10067 (_2!10273 lt!353853))))))

(declare-fun e!152258 () tuple3!1162)

(assert (=> d!75862 (= lt!354143 e!152258)))

(declare-fun c!11110 () Bool)

(assert (=> d!75862 (= c!11110 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75862 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)))))))

(assert (=> d!75862 (= (readByteArrayLoop!0 (_2!10273 lt!353853) (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!354143)))

(declare-fun lt!354161 () array!10984)

(declare-fun lt!354134 () (_ BitVec 32))

(declare-fun lt!354145 () (_ BitVec 32))

(declare-fun bm!3544 () Bool)

(declare-fun lt!354144 () (_ BitVec 32))

(declare-fun lt!354132 () tuple3!1162)

(declare-fun call!3547 () Bool)

(declare-fun lt!354155 () array!10984)

(assert (=> bm!3544 (= call!3547 (arrayRangesEq!716 (ite c!11110 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) lt!354161) (ite c!11110 (_3!723 lt!354132) lt!354155) (ite c!11110 lt!354134 lt!354144) (ite c!11110 (bvadd #b00000000000000000000000000000001 i!761) lt!354145)))))

(declare-fun b!223668 () Bool)

(declare-fun lt!354139 () Unit!16239)

(assert (=> b!223668 (= e!152258 (tuple3!1163 lt!354139 (_2!10274 lt!354132) (_3!723 lt!354132)))))

(declare-fun lt!354130 () tuple2!19100)

(assert (=> b!223668 (= lt!354130 (readByte!0 (_2!10273 lt!353853)))))

(declare-fun lt!354148 () array!10984)

(assert (=> b!223668 (= lt!354148 (array!10985 (store (arr!5760 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10273 lt!354130)) (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)))))))

(declare-fun lt!354151 () (_ BitVec 64))

(assert (=> b!223668 (= lt!354151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354154 () (_ BitVec 32))

(assert (=> b!223668 (= lt!354154 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354160 () Unit!16239)

(assert (=> b!223668 (= lt!354160 (validateOffsetBytesFromBitIndexLemma!0 (_2!10273 lt!353853) (_2!10273 lt!354130) lt!354151 lt!354154))))

(assert (=> b!223668 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!354130)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!354130))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!354130))) (bvsub lt!354154 ((_ extract 31 0) (bvsdiv (bvadd lt!354151 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354150 () Unit!16239)

(assert (=> b!223668 (= lt!354150 lt!354160)))

(assert (=> b!223668 (= lt!354132 (readByteArrayLoop!0 (_2!10273 lt!354130) lt!354148 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223668 (= (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!354130))) (currentByte!10072 (_2!10273 lt!354130)) (currentBit!10067 (_2!10273 lt!354130))) (bvadd (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!353853))) (currentByte!10072 (_2!10273 lt!353853)) (currentBit!10067 (_2!10273 lt!353853))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354157 () Unit!16239)

(declare-fun Unit!16252 () Unit!16239)

(assert (=> b!223668 (= lt!354157 Unit!16252)))

(declare-fun call!3549 () (_ BitVec 64))

(assert (=> b!223668 (= (bvadd (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!354130))) (currentByte!10072 (_2!10273 lt!354130)) (currentBit!10067 (_2!10273 lt!354130))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3549)))

(declare-fun lt!354137 () Unit!16239)

(declare-fun Unit!16253 () Unit!16239)

(assert (=> b!223668 (= lt!354137 Unit!16253)))

(assert (=> b!223668 (= (bvadd (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!353853))) (currentByte!10072 (_2!10273 lt!353853)) (currentBit!10067 (_2!10273 lt!353853))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3549)))

(declare-fun lt!354128 () Unit!16239)

(declare-fun Unit!16254 () Unit!16239)

(assert (=> b!223668 (= lt!354128 Unit!16254)))

(assert (=> b!223668 (and (= (buf!5362 (_2!10273 lt!353853)) (buf!5362 (_2!10274 lt!354132))) (= (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) (size!4818 (_3!723 lt!354132))))))

(declare-fun lt!354138 () Unit!16239)

(declare-fun Unit!16255 () Unit!16239)

(assert (=> b!223668 (= lt!354138 Unit!16255)))

(declare-fun lt!354136 () Unit!16239)

(declare-fun arrayUpdatedAtPrefixLemma!308 (array!10984 (_ BitVec 32) (_ BitVec 8)) Unit!16239)

(assert (=> b!223668 (= lt!354136 (arrayUpdatedAtPrefixLemma!308 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10273 lt!354130)))))

(assert (=> b!223668 (arrayRangesEq!716 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (array!10985 (store (arr!5760 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10273 lt!354130)) (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354149 () Unit!16239)

(assert (=> b!223668 (= lt!354149 lt!354136)))

(assert (=> b!223668 (= lt!354134 #b00000000000000000000000000000000)))

(declare-fun lt!354135 () Unit!16239)

(declare-fun arrayRangesEqTransitive!202 (array!10984 array!10984 array!10984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16239)

(assert (=> b!223668 (= lt!354135 (arrayRangesEqTransitive!202 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) lt!354148 (_3!723 lt!354132) lt!354134 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223668 call!3547))

(declare-fun lt!354152 () Unit!16239)

(assert (=> b!223668 (= lt!354152 lt!354135)))

(declare-fun call!3548 () Bool)

(assert (=> b!223668 call!3548))

(declare-fun lt!354156 () Unit!16239)

(declare-fun Unit!16256 () Unit!16239)

(assert (=> b!223668 (= lt!354156 Unit!16256)))

(declare-fun lt!354159 () Unit!16239)

(declare-fun arrayRangesEqImpliesEq!77 (array!10984 array!10984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16239)

(assert (=> b!223668 (= lt!354159 (arrayRangesEqImpliesEq!77 lt!354148 (_3!723 lt!354132) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223668 (= (select (store (arr!5760 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10273 lt!354130)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5760 (_3!723 lt!354132)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354129 () Unit!16239)

(assert (=> b!223668 (= lt!354129 lt!354159)))

(declare-fun lt!354158 () Bool)

(assert (=> b!223668 (= lt!354158 (= (select (arr!5760 (_3!723 lt!354132)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10273 lt!354130)))))

(declare-fun Unit!16257 () Unit!16239)

(assert (=> b!223668 (= lt!354139 Unit!16257)))

(assert (=> b!223668 lt!354158))

(declare-fun bm!3545 () Bool)

(assert (=> bm!3545 (= call!3549 (bitIndex!0 (ite c!11110 (size!4818 (buf!5362 (_2!10274 lt!354132))) (size!4818 (buf!5362 (_2!10273 lt!353853)))) (ite c!11110 (currentByte!10072 (_2!10274 lt!354132)) (currentByte!10072 (_2!10273 lt!353853))) (ite c!11110 (currentBit!10067 (_2!10274 lt!354132)) (currentBit!10067 (_2!10273 lt!353853)))))))

(declare-fun b!223669 () Bool)

(declare-fun lt!354142 () Unit!16239)

(assert (=> b!223669 (= e!152258 (tuple3!1163 lt!354142 (_2!10273 lt!353853) (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))))))

(assert (=> b!223669 (= call!3549 call!3549)))

(declare-fun lt!354147 () Unit!16239)

(declare-fun Unit!16260 () Unit!16239)

(assert (=> b!223669 (= lt!354147 Unit!16260)))

(declare-fun lt!354131 () Unit!16239)

(declare-fun arrayRangesEqReflexiveLemma!69 (array!10984) Unit!16239)

(assert (=> b!223669 (= lt!354131 (arrayRangesEqReflexiveLemma!69 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))))))

(assert (=> b!223669 call!3548))

(declare-fun lt!354146 () Unit!16239)

(assert (=> b!223669 (= lt!354146 lt!354131)))

(assert (=> b!223669 (= lt!354161 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)))))

(assert (=> b!223669 (= lt!354155 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)))))

(declare-fun lt!354127 () (_ BitVec 32))

(assert (=> b!223669 (= lt!354127 #b00000000000000000000000000000000)))

(declare-fun lt!354141 () (_ BitVec 32))

(assert (=> b!223669 (= lt!354141 (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))))))

(assert (=> b!223669 (= lt!354144 #b00000000000000000000000000000000)))

(assert (=> b!223669 (= lt!354145 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!69 (array!10984 array!10984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16239)

(assert (=> b!223669 (= lt!354142 (arrayRangesEqSlicedLemma!69 lt!354161 lt!354155 lt!354127 lt!354141 lt!354144 lt!354145))))

(assert (=> b!223669 call!3547))

(declare-fun bm!3546 () Bool)

(assert (=> bm!3546 (= call!3548 (arrayRangesEq!716 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308)) (ite c!11110 (_3!723 lt!354132) (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) #b00000000000000000000000000000000 (ite c!11110 (bvadd #b00000000000000000000000000000001 i!761) (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))))))))

(declare-fun b!223670 () Bool)

(declare-fun res!187767 () Bool)

(assert (=> b!223670 (=> (not res!187767) (not e!152259))))

(assert (=> b!223670 (= res!187767 (and (= (buf!5362 (_2!10273 lt!353853)) (buf!5362 (_2!10274 lt!354143))) (= (size!4818 (array!10985 (store (arr!5760 arr!308) i!761 (_1!10273 lt!353853)) (size!4818 arr!308))) (size!4818 (_3!723 lt!354143)))))))

(declare-fun b!223671 () Bool)

(declare-datatypes ((tuple2!19108 0))(
  ( (tuple2!19109 (_1!10278 BitStream!8738) (_2!10278 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8738) tuple2!19108)

(assert (=> b!223671 (= e!152260 (= (select (arr!5760 (_3!723 lt!354143)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10278 (readBytePure!0 (_2!10273 lt!353853)))))))

(assert (=> b!223671 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4818 (_3!723 lt!354143))))))

(assert (= (and d!75862 c!11110) b!223668))

(assert (= (and d!75862 (not c!11110)) b!223669))

(assert (= (or b!223668 b!223669) bm!3544))

(assert (= (or b!223668 b!223669) bm!3546))

(assert (= (or b!223668 b!223669) bm!3545))

(assert (= (and d!75862 res!187766) b!223670))

(assert (= (and b!223670 res!187767) b!223667))

(assert (= (and d!75862 (not res!187765)) b!223671))

(declare-fun m!342825 () Bool)

(assert (=> b!223671 m!342825))

(declare-fun m!342827 () Bool)

(assert (=> b!223671 m!342827))

(declare-fun m!342829 () Bool)

(assert (=> b!223667 m!342829))

(declare-fun m!342831 () Bool)

(assert (=> b!223669 m!342831))

(declare-fun m!342833 () Bool)

(assert (=> b!223669 m!342833))

(declare-fun m!342835 () Bool)

(assert (=> b!223668 m!342835))

(declare-fun m!342837 () Bool)

(assert (=> b!223668 m!342837))

(declare-fun m!342839 () Bool)

(assert (=> b!223668 m!342839))

(declare-fun m!342841 () Bool)

(assert (=> b!223668 m!342841))

(assert (=> b!223668 m!342737))

(declare-fun m!342843 () Bool)

(assert (=> b!223668 m!342843))

(declare-fun m!342845 () Bool)

(assert (=> b!223668 m!342845))

(declare-fun m!342847 () Bool)

(assert (=> b!223668 m!342847))

(declare-fun m!342849 () Bool)

(assert (=> b!223668 m!342849))

(declare-fun m!342851 () Bool)

(assert (=> b!223668 m!342851))

(declare-fun m!342853 () Bool)

(assert (=> b!223668 m!342853))

(declare-fun m!342855 () Bool)

(assert (=> b!223668 m!342855))

(declare-fun m!342857 () Bool)

(assert (=> b!223668 m!342857))

(declare-fun m!342859 () Bool)

(assert (=> bm!3545 m!342859))

(declare-fun m!342861 () Bool)

(assert (=> d!75862 m!342861))

(assert (=> d!75862 m!342737))

(declare-fun m!342863 () Bool)

(assert (=> bm!3546 m!342863))

(declare-fun m!342865 () Bool)

(assert (=> bm!3544 m!342865))

(assert (=> b!223610 d!75862))

(declare-fun d!75883 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75883 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853))) lt!353855) (bvsle ((_ sign_extend 32) lt!353855) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18496 () Bool)

(assert (= bs!18496 d!75883))

(declare-fun m!342867 () Bool)

(assert (=> bs!18496 m!342867))

(assert (=> b!223610 d!75883))

(declare-fun d!75885 () Bool)

(assert (=> d!75885 (= (invariant!0 (currentBit!10067 thiss!1870) (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870))) (and (bvsge (currentBit!10067 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10067 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10072 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870))) (and (= (currentBit!10067 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870)))))))))

(assert (=> b!223610 d!75885))

(declare-fun d!75887 () Bool)

(declare-fun e!152263 () Bool)

(assert (=> d!75887 e!152263))

(declare-fun res!187772 () Bool)

(assert (=> d!75887 (=> (not res!187772) (not e!152263))))

(declare-fun lt!354178 () (_ BitVec 64))

(declare-fun lt!354175 () (_ BitVec 64))

(declare-fun lt!354180 () (_ BitVec 64))

(assert (=> d!75887 (= res!187772 (= lt!354178 (bvsub lt!354180 lt!354175)))))

(assert (=> d!75887 (or (= (bvand lt!354180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354180 lt!354175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75887 (= lt!354175 (remainingBits!0 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))) ((_ sign_extend 32) (currentByte!10072 thiss!1870)) ((_ sign_extend 32) (currentBit!10067 thiss!1870))))))

(declare-fun lt!354179 () (_ BitVec 64))

(declare-fun lt!354177 () (_ BitVec 64))

(assert (=> d!75887 (= lt!354180 (bvmul lt!354179 lt!354177))))

(assert (=> d!75887 (or (= lt!354179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354177 (bvsdiv (bvmul lt!354179 lt!354177) lt!354179)))))

(assert (=> d!75887 (= lt!354177 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75887 (= lt!354179 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))))))

(assert (=> d!75887 (= lt!354178 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10072 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10067 thiss!1870))))))

(assert (=> d!75887 (invariant!0 (currentBit!10067 thiss!1870) (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870)))))

(assert (=> d!75887 (= (bitIndex!0 (size!4818 (buf!5362 thiss!1870)) (currentByte!10072 thiss!1870) (currentBit!10067 thiss!1870)) lt!354178)))

(declare-fun b!223676 () Bool)

(declare-fun res!187773 () Bool)

(assert (=> b!223676 (=> (not res!187773) (not e!152263))))

(assert (=> b!223676 (= res!187773 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354178))))

(declare-fun b!223677 () Bool)

(declare-fun lt!354176 () (_ BitVec 64))

(assert (=> b!223677 (= e!152263 (bvsle lt!354178 (bvmul lt!354176 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223677 (or (= lt!354176 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354176 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354176)))))

(assert (=> b!223677 (= lt!354176 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))))))

(assert (= (and d!75887 res!187772) b!223676))

(assert (= (and b!223676 res!187773) b!223677))

(declare-fun m!342869 () Bool)

(assert (=> d!75887 m!342869))

(assert (=> d!75887 m!342743))

(assert (=> b!223610 d!75887))

(declare-fun d!75889 () Bool)

(declare-fun lt!354273 () (_ BitVec 8))

(declare-fun lt!354268 () (_ BitVec 8))

(assert (=> d!75889 (= lt!354273 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5760 (buf!5362 thiss!1870)) (currentByte!10072 thiss!1870))) ((_ sign_extend 24) lt!354268))))))

(assert (=> d!75889 (= lt!354268 ((_ extract 7 0) (currentBit!10067 thiss!1870)))))

(declare-fun e!152275 () Bool)

(assert (=> d!75889 e!152275))

(declare-fun res!187786 () Bool)

(assert (=> d!75889 (=> (not res!187786) (not e!152275))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75889 (= res!187786 (validate_offset_bits!1 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))) ((_ sign_extend 32) (currentByte!10072 thiss!1870)) ((_ sign_extend 32) (currentBit!10067 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19112 0))(
  ( (tuple2!19113 (_1!10280 Unit!16239) (_2!10280 (_ BitVec 8))) )
))
(declare-fun Unit!16270 () Unit!16239)

(declare-fun Unit!16271 () Unit!16239)

(assert (=> d!75889 (= (readByte!0 thiss!1870) (tuple2!19101 (_2!10280 (ite (bvsgt ((_ sign_extend 24) lt!354268) #b00000000000000000000000000000000) (tuple2!19113 Unit!16270 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354273) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5760 (buf!5362 thiss!1870)) (bvadd (currentByte!10072 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354268)))))))) (tuple2!19113 Unit!16271 lt!354273))) (BitStream!8739 (buf!5362 thiss!1870) (bvadd (currentByte!10072 thiss!1870) #b00000000000000000000000000000001) (currentBit!10067 thiss!1870))))))

(declare-fun b!223692 () Bool)

(declare-fun e!152274 () Bool)

(assert (=> b!223692 (= e!152275 e!152274)))

(declare-fun res!187785 () Bool)

(assert (=> b!223692 (=> (not res!187785) (not e!152274))))

(declare-fun lt!354269 () tuple2!19100)

(assert (=> b!223692 (= res!187785 (= (buf!5362 (_2!10273 lt!354269)) (buf!5362 thiss!1870)))))

(declare-fun lt!354270 () (_ BitVec 8))

(declare-fun lt!354267 () (_ BitVec 8))

(declare-fun Unit!16272 () Unit!16239)

(declare-fun Unit!16273 () Unit!16239)

(assert (=> b!223692 (= lt!354269 (tuple2!19101 (_2!10280 (ite (bvsgt ((_ sign_extend 24) lt!354267) #b00000000000000000000000000000000) (tuple2!19113 Unit!16272 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354270) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5760 (buf!5362 thiss!1870)) (bvadd (currentByte!10072 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354267)))))))) (tuple2!19113 Unit!16273 lt!354270))) (BitStream!8739 (buf!5362 thiss!1870) (bvadd (currentByte!10072 thiss!1870) #b00000000000000000000000000000001) (currentBit!10067 thiss!1870))))))

(assert (=> b!223692 (= lt!354270 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5760 (buf!5362 thiss!1870)) (currentByte!10072 thiss!1870))) ((_ sign_extend 24) lt!354267))))))

(assert (=> b!223692 (= lt!354267 ((_ extract 7 0) (currentBit!10067 thiss!1870)))))

(declare-fun b!223693 () Bool)

(declare-fun lt!354271 () (_ BitVec 64))

(declare-fun lt!354272 () (_ BitVec 64))

(assert (=> b!223693 (= e!152274 (= (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!354269))) (currentByte!10072 (_2!10273 lt!354269)) (currentBit!10067 (_2!10273 lt!354269))) (bvadd lt!354271 lt!354272)))))

(assert (=> b!223693 (or (not (= (bvand lt!354271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354272 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354271 lt!354272) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223693 (= lt!354272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223693 (= lt!354271 (bitIndex!0 (size!4818 (buf!5362 thiss!1870)) (currentByte!10072 thiss!1870) (currentBit!10067 thiss!1870)))))

(assert (= (and d!75889 res!187786) b!223692))

(assert (= (and b!223692 res!187785) b!223693))

(declare-fun m!342871 () Bool)

(assert (=> d!75889 m!342871))

(declare-fun m!342873 () Bool)

(assert (=> d!75889 m!342873))

(declare-fun m!342875 () Bool)

(assert (=> d!75889 m!342875))

(assert (=> b!223692 m!342875))

(assert (=> b!223692 m!342871))

(declare-fun m!342877 () Bool)

(assert (=> b!223693 m!342877))

(assert (=> b!223693 m!342739))

(assert (=> b!223610 d!75889))

(declare-fun d!75891 () Bool)

(declare-fun e!152276 () Bool)

(assert (=> d!75891 e!152276))

(declare-fun res!187787 () Bool)

(assert (=> d!75891 (=> (not res!187787) (not e!152276))))

(declare-fun lt!354279 () (_ BitVec 64))

(declare-fun lt!354274 () (_ BitVec 64))

(declare-fun lt!354277 () (_ BitVec 64))

(assert (=> d!75891 (= res!187787 (= lt!354277 (bvsub lt!354279 lt!354274)))))

(assert (=> d!75891 (or (= (bvand lt!354279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354274 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354279 lt!354274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75891 (= lt!354274 (remainingBits!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))) ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853)))))))

(declare-fun lt!354278 () (_ BitVec 64))

(declare-fun lt!354276 () (_ BitVec 64))

(assert (=> d!75891 (= lt!354279 (bvmul lt!354278 lt!354276))))

(assert (=> d!75891 (or (= lt!354278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354276 (bvsdiv (bvmul lt!354278 lt!354276) lt!354278)))))

(assert (=> d!75891 (= lt!354276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75891 (= lt!354278 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))))))

(assert (=> d!75891 (= lt!354277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10072 (_2!10273 lt!353853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10067 (_2!10273 lt!353853)))))))

(assert (=> d!75891 (invariant!0 (currentBit!10067 (_2!10273 lt!353853)) (currentByte!10072 (_2!10273 lt!353853)) (size!4818 (buf!5362 (_2!10273 lt!353853))))))

(assert (=> d!75891 (= (bitIndex!0 (size!4818 (buf!5362 (_2!10273 lt!353853))) (currentByte!10072 (_2!10273 lt!353853)) (currentBit!10067 (_2!10273 lt!353853))) lt!354277)))

(declare-fun b!223694 () Bool)

(declare-fun res!187788 () Bool)

(assert (=> b!223694 (=> (not res!187788) (not e!152276))))

(assert (=> b!223694 (= res!187788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354277))))

(declare-fun b!223695 () Bool)

(declare-fun lt!354275 () (_ BitVec 64))

(assert (=> b!223695 (= e!152276 (bvsle lt!354277 (bvmul lt!354275 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223695 (or (= lt!354275 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354275 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354275)))))

(assert (=> b!223695 (= lt!354275 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10273 lt!353853)))))))

(assert (= (and d!75891 res!187787) b!223694))

(assert (= (and b!223694 res!187788) b!223695))

(assert (=> d!75891 m!342867))

(declare-fun m!342879 () Bool)

(assert (=> d!75891 m!342879))

(assert (=> b!223610 d!75891))

(declare-fun d!75893 () Bool)

(assert (=> d!75893 (= (array_inv!4559 (buf!5362 thiss!1870)) (bvsge (size!4818 (buf!5362 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223609 d!75893))

(declare-fun d!75895 () Bool)

(assert (=> d!75895 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))) ((_ sign_extend 32) (currentByte!10072 thiss!1870)) ((_ sign_extend 32) (currentBit!10067 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4818 (buf!5362 thiss!1870))) ((_ sign_extend 32) (currentByte!10072 thiss!1870)) ((_ sign_extend 32) (currentBit!10067 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18497 () Bool)

(assert (= bs!18497 d!75895))

(assert (=> bs!18497 m!342869))

(assert (=> b!223612 d!75895))

(declare-fun d!75897 () Bool)

(assert (=> d!75897 (= (array_inv!4559 arr!308) (bvsge (size!4818 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46578 d!75897))

(declare-fun d!75899 () Bool)

(assert (=> d!75899 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10067 thiss!1870) (currentByte!10072 thiss!1870) (size!4818 (buf!5362 thiss!1870))))))

(declare-fun bs!18498 () Bool)

(assert (= bs!18498 d!75899))

(assert (=> bs!18498 m!342743))

(assert (=> start!46578 d!75899))

(declare-fun d!75901 () Bool)

(declare-fun e!152280 () Bool)

(assert (=> d!75901 e!152280))

(declare-fun res!187792 () Bool)

(assert (=> d!75901 (=> (not res!187792) (not e!152280))))

(declare-fun lt!354316 () (_ BitVec 64))

(declare-fun lt!354321 () (_ BitVec 64))

(declare-fun lt!354319 () (_ BitVec 64))

(assert (=> d!75901 (= res!187792 (= lt!354319 (bvsub lt!354321 lt!354316)))))

(assert (=> d!75901 (or (= (bvand lt!354321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354321 lt!354316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75901 (= lt!354316 (remainingBits!0 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10274 lt!353851)))) ((_ sign_extend 32) (currentByte!10072 (_2!10274 lt!353851))) ((_ sign_extend 32) (currentBit!10067 (_2!10274 lt!353851)))))))

(declare-fun lt!354320 () (_ BitVec 64))

(declare-fun lt!354318 () (_ BitVec 64))

(assert (=> d!75901 (= lt!354321 (bvmul lt!354320 lt!354318))))

(assert (=> d!75901 (or (= lt!354320 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354318 (bvsdiv (bvmul lt!354320 lt!354318) lt!354320)))))

(assert (=> d!75901 (= lt!354318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75901 (= lt!354320 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10274 lt!353851)))))))

(assert (=> d!75901 (= lt!354319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10072 (_2!10274 lt!353851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10067 (_2!10274 lt!353851)))))))

(assert (=> d!75901 (invariant!0 (currentBit!10067 (_2!10274 lt!353851)) (currentByte!10072 (_2!10274 lt!353851)) (size!4818 (buf!5362 (_2!10274 lt!353851))))))

(assert (=> d!75901 (= (bitIndex!0 (size!4818 (buf!5362 (_2!10274 lt!353851))) (currentByte!10072 (_2!10274 lt!353851)) (currentBit!10067 (_2!10274 lt!353851))) lt!354319)))

(declare-fun b!223701 () Bool)

(declare-fun res!187793 () Bool)

(assert (=> b!223701 (=> (not res!187793) (not e!152280))))

(assert (=> b!223701 (= res!187793 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354319))))

(declare-fun b!223702 () Bool)

(declare-fun lt!354317 () (_ BitVec 64))

(assert (=> b!223702 (= e!152280 (bvsle lt!354319 (bvmul lt!354317 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223702 (or (= lt!354317 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354317 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354317)))))

(assert (=> b!223702 (= lt!354317 ((_ sign_extend 32) (size!4818 (buf!5362 (_2!10274 lt!353851)))))))

(assert (= (and d!75901 res!187792) b!223701))

(assert (= (and b!223701 res!187793) b!223702))

(declare-fun m!342881 () Bool)

(assert (=> d!75901 m!342881))

(declare-fun m!342883 () Bool)

(assert (=> d!75901 m!342883))

(assert (=> b!223611 d!75901))

(push 1)

