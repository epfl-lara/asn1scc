; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47392 () Bool)

(assert start!47392)

(declare-fun res!189697 () Bool)

(declare-fun e!154477 () Bool)

(assert (=> start!47392 (=> (not res!189697) (not e!154477))))

(declare-datatypes ((array!11293 0))(
  ( (array!11294 (arr!5912 (Array (_ BitVec 32) (_ BitVec 8))) (size!4955 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11293)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47392 (= res!189697 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4955 arr!308))))))

(assert (=> start!47392 e!154477))

(assert (=> start!47392 true))

(declare-fun array_inv!4696 (array!11293) Bool)

(assert (=> start!47392 (array_inv!4696 arr!308)))

(declare-datatypes ((BitStream!9006 0))(
  ( (BitStream!9007 (buf!5496 array!11293) (currentByte!10298 (_ BitVec 32)) (currentBit!10293 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9006)

(declare-fun e!154476 () Bool)

(declare-fun inv!12 (BitStream!9006) Bool)

(assert (=> start!47392 (and (inv!12 thiss!1870) e!154476)))

(declare-fun b!226056 () Bool)

(declare-fun res!189695 () Bool)

(assert (=> b!226056 (=> (not res!189695) (not e!154477))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226056 (= res!189695 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))) ((_ sign_extend 32) (currentByte!10298 thiss!1870)) ((_ sign_extend 32) (currentBit!10293 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226058 () Bool)

(declare-fun lt!359159 () (_ BitVec 64))

(declare-fun lt!359160 () (_ BitVec 64))

(assert (=> b!226058 (= e!154477 (not (or (not (= lt!359159 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!359159 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!359160) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226058 (= lt!359159 (bvand lt!359160 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226058 (= lt!359160 (bitIndex!0 (size!4955 (buf!5496 thiss!1870)) (currentByte!10298 thiss!1870) (currentBit!10293 thiss!1870)))))

(declare-datatypes ((tuple2!19360 0))(
  ( (tuple2!19361 (_1!10468 (_ BitVec 8)) (_2!10468 BitStream!9006)) )
))
(declare-fun lt!359161 () tuple2!19360)

(declare-datatypes ((Unit!16655 0))(
  ( (Unit!16656) )
))
(declare-datatypes ((tuple3!1292 0))(
  ( (tuple3!1293 (_1!10469 Unit!16655) (_2!10469 BitStream!9006) (_3!788 array!11293)) )
))
(declare-fun lt!359162 () tuple3!1292)

(declare-fun readByteArrayLoop!0 (BitStream!9006 array!11293 (_ BitVec 32) (_ BitVec 32)) tuple3!1292)

(assert (=> b!226058 (= lt!359162 (readByteArrayLoop!0 (_2!10468 lt!359161) (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226058 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 (_2!10468 lt!359161)))) ((_ sign_extend 32) (currentByte!10298 (_2!10468 lt!359161))) ((_ sign_extend 32) (currentBit!10293 (_2!10468 lt!359161))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359163 () Unit!16655)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9006 BitStream!9006 (_ BitVec 64) (_ BitVec 32)) Unit!16655)

(assert (=> b!226058 (= lt!359163 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10468 lt!359161) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9006) tuple2!19360)

(assert (=> b!226058 (= lt!359161 (readByte!0 thiss!1870))))

(declare-fun b!226057 () Bool)

(declare-fun res!189696 () Bool)

(assert (=> b!226057 (=> (not res!189696) (not e!154477))))

(assert (=> b!226057 (= res!189696 (bvslt i!761 to!496))))

(declare-fun b!226059 () Bool)

(assert (=> b!226059 (= e!154476 (array_inv!4696 (buf!5496 thiss!1870)))))

(assert (= (and start!47392 res!189697) b!226056))

(assert (= (and b!226056 res!189695) b!226057))

(assert (= (and b!226057 res!189696) b!226058))

(assert (= start!47392 b!226059))

(declare-fun m!347109 () Bool)

(assert (=> start!47392 m!347109))

(declare-fun m!347111 () Bool)

(assert (=> start!47392 m!347111))

(declare-fun m!347113 () Bool)

(assert (=> b!226056 m!347113))

(declare-fun m!347115 () Bool)

(assert (=> b!226058 m!347115))

(declare-fun m!347117 () Bool)

(assert (=> b!226058 m!347117))

(declare-fun m!347119 () Bool)

(assert (=> b!226058 m!347119))

(declare-fun m!347121 () Bool)

(assert (=> b!226058 m!347121))

(declare-fun m!347123 () Bool)

(assert (=> b!226058 m!347123))

(declare-fun m!347125 () Bool)

(assert (=> b!226058 m!347125))

(declare-fun m!347127 () Bool)

(assert (=> b!226059 m!347127))

(check-sat (not b!226056) (not start!47392) (not b!226059) (not b!226058))
(check-sat)
(get-model)

(declare-fun d!76716 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76716 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))) ((_ sign_extend 32) (currentByte!10298 thiss!1870)) ((_ sign_extend 32) (currentBit!10293 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))) ((_ sign_extend 32) (currentByte!10298 thiss!1870)) ((_ sign_extend 32) (currentBit!10293 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18756 () Bool)

(assert (= bs!18756 d!76716))

(declare-fun m!347171 () Bool)

(assert (=> bs!18756 m!347171))

(assert (=> b!226056 d!76716))

(declare-fun d!76720 () Bool)

(assert (=> d!76720 (= (array_inv!4696 arr!308) (bvsge (size!4955 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47392 d!76720))

(declare-fun d!76722 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76722 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10293 thiss!1870) (currentByte!10298 thiss!1870) (size!4955 (buf!5496 thiss!1870))))))

(declare-fun bs!18757 () Bool)

(assert (= bs!18757 d!76722))

(declare-fun m!347173 () Bool)

(assert (=> bs!18757 m!347173))

(assert (=> start!47392 d!76722))

(declare-fun d!76724 () Bool)

(assert (=> d!76724 (= (array_inv!4696 (buf!5496 thiss!1870)) (bvsge (size!4955 (buf!5496 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226059 d!76724))

(declare-fun d!76726 () Bool)

(declare-fun lt!359238 () (_ BitVec 8))

(declare-fun lt!359235 () (_ BitVec 8))

(assert (=> d!76726 (= lt!359238 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5912 (buf!5496 thiss!1870)) (currentByte!10298 thiss!1870))) ((_ sign_extend 24) lt!359235))))))

(assert (=> d!76726 (= lt!359235 ((_ extract 7 0) (currentBit!10293 thiss!1870)))))

(declare-fun e!154507 () Bool)

(assert (=> d!76726 e!154507))

(declare-fun res!189727 () Bool)

(assert (=> d!76726 (=> (not res!189727) (not e!154507))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76726 (= res!189727 (validate_offset_bits!1 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))) ((_ sign_extend 32) (currentByte!10298 thiss!1870)) ((_ sign_extend 32) (currentBit!10293 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19372 0))(
  ( (tuple2!19373 (_1!10476 Unit!16655) (_2!10476 (_ BitVec 8))) )
))
(declare-fun Unit!16681 () Unit!16655)

(declare-fun Unit!16682 () Unit!16655)

(assert (=> d!76726 (= (readByte!0 thiss!1870) (tuple2!19361 (_2!10476 (ite (bvsgt ((_ sign_extend 24) lt!359235) #b00000000000000000000000000000000) (tuple2!19373 Unit!16681 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359238) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5912 (buf!5496 thiss!1870)) (bvadd (currentByte!10298 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359235)))))))) (tuple2!19373 Unit!16682 lt!359238))) (BitStream!9007 (buf!5496 thiss!1870) (bvadd (currentByte!10298 thiss!1870) #b00000000000000000000000000000001) (currentBit!10293 thiss!1870))))))

(declare-fun b!226088 () Bool)

(declare-fun e!154506 () Bool)

(assert (=> b!226088 (= e!154507 e!154506)))

(declare-fun res!189726 () Bool)

(assert (=> b!226088 (=> (not res!189726) (not e!154506))))

(declare-fun lt!359237 () tuple2!19360)

(assert (=> b!226088 (= res!189726 (= (buf!5496 (_2!10468 lt!359237)) (buf!5496 thiss!1870)))))

(declare-fun lt!359236 () (_ BitVec 8))

(declare-fun lt!359240 () (_ BitVec 8))

(declare-fun Unit!16683 () Unit!16655)

(declare-fun Unit!16684 () Unit!16655)

(assert (=> b!226088 (= lt!359237 (tuple2!19361 (_2!10476 (ite (bvsgt ((_ sign_extend 24) lt!359236) #b00000000000000000000000000000000) (tuple2!19373 Unit!16683 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359240) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5912 (buf!5496 thiss!1870)) (bvadd (currentByte!10298 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359236)))))))) (tuple2!19373 Unit!16684 lt!359240))) (BitStream!9007 (buf!5496 thiss!1870) (bvadd (currentByte!10298 thiss!1870) #b00000000000000000000000000000001) (currentBit!10293 thiss!1870))))))

(assert (=> b!226088 (= lt!359240 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5912 (buf!5496 thiss!1870)) (currentByte!10298 thiss!1870))) ((_ sign_extend 24) lt!359236))))))

(assert (=> b!226088 (= lt!359236 ((_ extract 7 0) (currentBit!10293 thiss!1870)))))

(declare-fun b!226089 () Bool)

(declare-fun lt!359241 () (_ BitVec 64))

(declare-fun lt!359239 () (_ BitVec 64))

(assert (=> b!226089 (= e!154506 (= (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359237))) (currentByte!10298 (_2!10468 lt!359237)) (currentBit!10293 (_2!10468 lt!359237))) (bvadd lt!359239 lt!359241)))))

(assert (=> b!226089 (or (not (= (bvand lt!359239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359241 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359239 lt!359241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226089 (= lt!359241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226089 (= lt!359239 (bitIndex!0 (size!4955 (buf!5496 thiss!1870)) (currentByte!10298 thiss!1870) (currentBit!10293 thiss!1870)))))

(assert (= (and d!76726 res!189727) b!226088))

(assert (= (and b!226088 res!189726) b!226089))

(declare-fun m!347175 () Bool)

(assert (=> d!76726 m!347175))

(declare-fun m!347177 () Bool)

(assert (=> d!76726 m!347177))

(declare-fun m!347179 () Bool)

(assert (=> d!76726 m!347179))

(assert (=> b!226088 m!347179))

(assert (=> b!226088 m!347175))

(declare-fun m!347181 () Bool)

(assert (=> b!226089 m!347181))

(assert (=> b!226089 m!347125))

(assert (=> b!226058 d!76726))

(declare-fun b!226148 () Bool)

(declare-fun e!154545 () tuple3!1292)

(declare-fun lt!359596 () Unit!16655)

(declare-fun lt!359585 () tuple3!1292)

(assert (=> b!226148 (= e!154545 (tuple3!1293 lt!359596 (_2!10469 lt!359585) (_3!788 lt!359585)))))

(declare-fun lt!359608 () tuple2!19360)

(assert (=> b!226148 (= lt!359608 (readByte!0 (_2!10468 lt!359161)))))

(declare-fun lt!359597 () array!11293)

(assert (=> b!226148 (= lt!359597 (array!11294 (store (arr!5912 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10468 lt!359608)) (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)))))))

(declare-fun lt!359617 () (_ BitVec 64))

(assert (=> b!226148 (= lt!359617 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!359591 () (_ BitVec 32))

(assert (=> b!226148 (= lt!359591 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359587 () Unit!16655)

(assert (=> b!226148 (= lt!359587 (validateOffsetBytesFromBitIndexLemma!0 (_2!10468 lt!359161) (_2!10468 lt!359608) lt!359617 lt!359591))))

(assert (=> b!226148 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 (_2!10468 lt!359608)))) ((_ sign_extend 32) (currentByte!10298 (_2!10468 lt!359608))) ((_ sign_extend 32) (currentBit!10293 (_2!10468 lt!359608))) (bvsub lt!359591 ((_ extract 31 0) (bvsdiv (bvadd lt!359617 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!359613 () Unit!16655)

(assert (=> b!226148 (= lt!359613 lt!359587)))

(assert (=> b!226148 (= lt!359585 (readByteArrayLoop!0 (_2!10468 lt!359608) lt!359597 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226148 (= (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359608))) (currentByte!10298 (_2!10468 lt!359608)) (currentBit!10293 (_2!10468 lt!359608))) (bvadd (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359161))) (currentByte!10298 (_2!10468 lt!359161)) (currentBit!10293 (_2!10468 lt!359161))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!359590 () Unit!16655)

(declare-fun Unit!16685 () Unit!16655)

(assert (=> b!226148 (= lt!359590 Unit!16685)))

(declare-fun call!3693 () (_ BitVec 64))

(assert (=> b!226148 (= (bvadd (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359608))) (currentByte!10298 (_2!10468 lt!359608)) (currentBit!10293 (_2!10468 lt!359608))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3693)))

(declare-fun lt!359593 () Unit!16655)

(declare-fun Unit!16686 () Unit!16655)

(assert (=> b!226148 (= lt!359593 Unit!16686)))

(assert (=> b!226148 (= (bvadd (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359161))) (currentByte!10298 (_2!10468 lt!359161)) (currentBit!10293 (_2!10468 lt!359161))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3693)))

(declare-fun lt!359612 () Unit!16655)

(declare-fun Unit!16687 () Unit!16655)

(assert (=> b!226148 (= lt!359612 Unit!16687)))

(assert (=> b!226148 (and (= (buf!5496 (_2!10468 lt!359161)) (buf!5496 (_2!10469 lt!359585))) (= (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) (size!4955 (_3!788 lt!359585))))))

(declare-fun lt!359609 () Unit!16655)

(declare-fun Unit!16688 () Unit!16655)

(assert (=> b!226148 (= lt!359609 Unit!16688)))

(declare-fun lt!359610 () Unit!16655)

(declare-fun arrayUpdatedAtPrefixLemma!372 (array!11293 (_ BitVec 32) (_ BitVec 8)) Unit!16655)

(assert (=> b!226148 (= lt!359610 (arrayUpdatedAtPrefixLemma!372 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10468 lt!359608)))))

(declare-fun call!3692 () Bool)

(assert (=> b!226148 call!3692))

(declare-fun lt!359614 () Unit!16655)

(assert (=> b!226148 (= lt!359614 lt!359610)))

(declare-fun lt!359607 () (_ BitVec 32))

(assert (=> b!226148 (= lt!359607 #b00000000000000000000000000000000)))

(declare-fun lt!359586 () Unit!16655)

(declare-fun arrayRangesEqTransitive!251 (array!11293 array!11293 array!11293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16655)

(assert (=> b!226148 (= lt!359586 (arrayRangesEqTransitive!251 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) lt!359597 (_3!788 lt!359585) lt!359607 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun arrayRangesEq!813 (array!11293 array!11293 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226148 (arrayRangesEq!813 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (_3!788 lt!359585) lt!359607 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!359588 () Unit!16655)

(assert (=> b!226148 (= lt!359588 lt!359586)))

(declare-fun call!3691 () Bool)

(assert (=> b!226148 call!3691))

(declare-fun lt!359594 () Unit!16655)

(declare-fun Unit!16689 () Unit!16655)

(assert (=> b!226148 (= lt!359594 Unit!16689)))

(declare-fun lt!359616 () Unit!16655)

(declare-fun arrayRangesEqImpliesEq!102 (array!11293 array!11293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16655)

(assert (=> b!226148 (= lt!359616 (arrayRangesEqImpliesEq!102 lt!359597 (_3!788 lt!359585) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226148 (= (select (store (arr!5912 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10468 lt!359608)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5912 (_3!788 lt!359585)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359584 () Unit!16655)

(assert (=> b!226148 (= lt!359584 lt!359616)))

(declare-fun lt!359605 () Bool)

(assert (=> b!226148 (= lt!359605 (= (select (arr!5912 (_3!788 lt!359585)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10468 lt!359608)))))

(declare-fun Unit!16690 () Unit!16655)

(assert (=> b!226148 (= lt!359596 Unit!16690)))

(assert (=> b!226148 lt!359605))

(declare-fun lt!359595 () Unit!16655)

(declare-fun b!226149 () Bool)

(assert (=> b!226149 (= e!154545 (tuple3!1293 lt!359595 (_2!10468 lt!359161) (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))))))

(assert (=> b!226149 (= call!3693 call!3693)))

(declare-fun lt!359619 () Unit!16655)

(declare-fun Unit!16691 () Unit!16655)

(assert (=> b!226149 (= lt!359619 Unit!16691)))

(declare-fun lt!359615 () Unit!16655)

(declare-fun arrayRangesEqReflexiveLemma!117 (array!11293) Unit!16655)

(assert (=> b!226149 (= lt!359615 (arrayRangesEqReflexiveLemma!117 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))))))

(assert (=> b!226149 call!3692))

(declare-fun lt!359618 () Unit!16655)

(assert (=> b!226149 (= lt!359618 lt!359615)))

(declare-fun lt!359601 () array!11293)

(assert (=> b!226149 (= lt!359601 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)))))

(declare-fun lt!359592 () array!11293)

(assert (=> b!226149 (= lt!359592 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)))))

(declare-fun lt!359603 () (_ BitVec 32))

(assert (=> b!226149 (= lt!359603 #b00000000000000000000000000000000)))

(declare-fun lt!359599 () (_ BitVec 32))

(assert (=> b!226149 (= lt!359599 (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))))))

(declare-fun lt!359600 () (_ BitVec 32))

(assert (=> b!226149 (= lt!359600 #b00000000000000000000000000000000)))

(declare-fun lt!359611 () (_ BitVec 32))

(assert (=> b!226149 (= lt!359611 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!102 (array!11293 array!11293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16655)

(assert (=> b!226149 (= lt!359595 (arrayRangesEqSlicedLemma!102 lt!359601 lt!359592 lt!359603 lt!359599 lt!359600 lt!359611))))

(assert (=> b!226149 call!3691))

(declare-fun b!226150 () Bool)

(declare-fun res!189770 () Bool)

(declare-fun e!154546 () Bool)

(assert (=> b!226150 (=> (not res!189770) (not e!154546))))

(declare-fun lt!359606 () tuple3!1292)

(assert (=> b!226150 (= res!189770 (and (= (buf!5496 (_2!10468 lt!359161)) (buf!5496 (_2!10469 lt!359606))) (= (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) (size!4955 (_3!788 lt!359606)))))))

(declare-fun b!226151 () Bool)

(declare-fun e!154544 () Bool)

(declare-datatypes ((tuple2!19374 0))(
  ( (tuple2!19375 (_1!10477 BitStream!9006) (_2!10477 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9006) tuple2!19374)

(assert (=> b!226151 (= e!154544 (= (select (arr!5912 (_3!788 lt!359606)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10477 (readBytePure!0 (_2!10468 lt!359161)))))))

(assert (=> b!226151 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4955 (_3!788 lt!359606))))))

(declare-fun c!11158 () Bool)

(declare-fun bm!3688 () Bool)

(assert (=> bm!3688 (= call!3691 (arrayRangesEq!813 (ite c!11158 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) lt!359601) (ite c!11158 (_3!788 lt!359585) lt!359592) (ite c!11158 #b00000000000000000000000000000000 lt!359600) (ite c!11158 (bvadd #b00000000000000000000000000000001 i!761) lt!359611)))))

(declare-fun bm!3689 () Bool)

(assert (=> bm!3689 (= call!3693 (bitIndex!0 (ite c!11158 (size!4955 (buf!5496 (_2!10469 lt!359585))) (size!4955 (buf!5496 (_2!10468 lt!359161)))) (ite c!11158 (currentByte!10298 (_2!10469 lt!359585)) (currentByte!10298 (_2!10468 lt!359161))) (ite c!11158 (currentBit!10293 (_2!10469 lt!359585)) (currentBit!10293 (_2!10468 lt!359161)))))))

(declare-fun bm!3690 () Bool)

(assert (=> bm!3690 (= call!3692 (arrayRangesEq!813 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (ite c!11158 (array!11294 (store (arr!5912 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10468 lt!359608)) (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)))) (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))) #b00000000000000000000000000000000 (ite c!11158 (bvadd #b00000000000000000000000000000001 i!761) (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308))))))))

(declare-fun d!76728 () Bool)

(assert (=> d!76728 e!154544))

(declare-fun res!189772 () Bool)

(assert (=> d!76728 (=> res!189772 e!154544)))

(assert (=> d!76728 (= res!189772 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!359604 () Bool)

(assert (=> d!76728 (= lt!359604 e!154546)))

(declare-fun res!189771 () Bool)

(assert (=> d!76728 (=> (not res!189771) (not e!154546))))

(declare-fun lt!359602 () (_ BitVec 64))

(declare-fun lt!359598 () (_ BitVec 64))

(assert (=> d!76728 (= res!189771 (= (bvadd lt!359602 lt!359598) (bitIndex!0 (size!4955 (buf!5496 (_2!10469 lt!359606))) (currentByte!10298 (_2!10469 lt!359606)) (currentBit!10293 (_2!10469 lt!359606)))))))

(assert (=> d!76728 (or (not (= (bvand lt!359602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359598 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359602 lt!359598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!359589 () (_ BitVec 64))

(assert (=> d!76728 (= lt!359598 (bvmul lt!359589 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76728 (or (= lt!359589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359589)))))

(assert (=> d!76728 (= lt!359589 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76728 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76728 (= lt!359602 (bitIndex!0 (size!4955 (buf!5496 (_2!10468 lt!359161))) (currentByte!10298 (_2!10468 lt!359161)) (currentBit!10293 (_2!10468 lt!359161))))))

(assert (=> d!76728 (= lt!359606 e!154545)))

(assert (=> d!76728 (= c!11158 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76728 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4955 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)))))))

(assert (=> d!76728 (= (readByteArrayLoop!0 (_2!10468 lt!359161) (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!359606)))

(declare-fun b!226152 () Bool)

(assert (=> b!226152 (= e!154546 (arrayRangesEq!813 (array!11294 (store (arr!5912 arr!308) i!761 (_1!10468 lt!359161)) (size!4955 arr!308)) (_3!788 lt!359606) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!76728 c!11158) b!226148))

(assert (= (and d!76728 (not c!11158)) b!226149))

(assert (= (or b!226148 b!226149) bm!3690))

(assert (= (or b!226148 b!226149) bm!3688))

(assert (= (or b!226148 b!226149) bm!3689))

(assert (= (and d!76728 res!189771) b!226150))

(assert (= (and b!226150 res!189770) b!226152))

(assert (= (and d!76728 (not res!189772)) b!226151))

(declare-fun m!347285 () Bool)

(assert (=> b!226152 m!347285))

(declare-fun m!347287 () Bool)

(assert (=> b!226149 m!347287))

(declare-fun m!347289 () Bool)

(assert (=> b!226149 m!347289))

(declare-fun m!347291 () Bool)

(assert (=> bm!3688 m!347291))

(declare-fun m!347293 () Bool)

(assert (=> bm!3689 m!347293))

(declare-fun m!347295 () Bool)

(assert (=> b!226151 m!347295))

(declare-fun m!347297 () Bool)

(assert (=> b!226151 m!347297))

(declare-fun m!347299 () Bool)

(assert (=> bm!3690 m!347299))

(declare-fun m!347301 () Bool)

(assert (=> bm!3690 m!347301))

(assert (=> b!226148 m!347299))

(declare-fun m!347303 () Bool)

(assert (=> b!226148 m!347303))

(declare-fun m!347305 () Bool)

(assert (=> b!226148 m!347305))

(declare-fun m!347307 () Bool)

(assert (=> b!226148 m!347307))

(declare-fun m!347309 () Bool)

(assert (=> b!226148 m!347309))

(declare-fun m!347311 () Bool)

(assert (=> b!226148 m!347311))

(declare-fun m!347313 () Bool)

(assert (=> b!226148 m!347313))

(declare-fun m!347315 () Bool)

(assert (=> b!226148 m!347315))

(declare-fun m!347317 () Bool)

(assert (=> b!226148 m!347317))

(declare-fun m!347319 () Bool)

(assert (=> b!226148 m!347319))

(declare-fun m!347321 () Bool)

(assert (=> b!226148 m!347321))

(declare-fun m!347323 () Bool)

(assert (=> b!226148 m!347323))

(declare-fun m!347325 () Bool)

(assert (=> b!226148 m!347325))

(declare-fun m!347327 () Bool)

(assert (=> d!76728 m!347327))

(assert (=> d!76728 m!347305))

(assert (=> b!226058 d!76728))

(declare-fun d!76750 () Bool)

(declare-fun e!154549 () Bool)

(assert (=> d!76750 e!154549))

(declare-fun res!189778 () Bool)

(assert (=> d!76750 (=> (not res!189778) (not e!154549))))

(declare-fun lt!359634 () (_ BitVec 64))

(declare-fun lt!359636 () (_ BitVec 64))

(declare-fun lt!359632 () (_ BitVec 64))

(assert (=> d!76750 (= res!189778 (= lt!359634 (bvsub lt!359636 lt!359632)))))

(assert (=> d!76750 (or (= (bvand lt!359636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359636 lt!359632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76750 (= lt!359632 (remainingBits!0 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))) ((_ sign_extend 32) (currentByte!10298 thiss!1870)) ((_ sign_extend 32) (currentBit!10293 thiss!1870))))))

(declare-fun lt!359635 () (_ BitVec 64))

(declare-fun lt!359633 () (_ BitVec 64))

(assert (=> d!76750 (= lt!359636 (bvmul lt!359635 lt!359633))))

(assert (=> d!76750 (or (= lt!359635 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359633 (bvsdiv (bvmul lt!359635 lt!359633) lt!359635)))))

(assert (=> d!76750 (= lt!359633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76750 (= lt!359635 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))))))

(assert (=> d!76750 (= lt!359634 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10298 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10293 thiss!1870))))))

(assert (=> d!76750 (invariant!0 (currentBit!10293 thiss!1870) (currentByte!10298 thiss!1870) (size!4955 (buf!5496 thiss!1870)))))

(assert (=> d!76750 (= (bitIndex!0 (size!4955 (buf!5496 thiss!1870)) (currentByte!10298 thiss!1870) (currentBit!10293 thiss!1870)) lt!359634)))

(declare-fun b!226157 () Bool)

(declare-fun res!189777 () Bool)

(assert (=> b!226157 (=> (not res!189777) (not e!154549))))

(assert (=> b!226157 (= res!189777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359634))))

(declare-fun b!226158 () Bool)

(declare-fun lt!359637 () (_ BitVec 64))

(assert (=> b!226158 (= e!154549 (bvsle lt!359634 (bvmul lt!359637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226158 (or (= lt!359637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359637)))))

(assert (=> b!226158 (= lt!359637 ((_ sign_extend 32) (size!4955 (buf!5496 thiss!1870))))))

(assert (= (and d!76750 res!189778) b!226157))

(assert (= (and b!226157 res!189777) b!226158))

(assert (=> d!76750 m!347171))

(assert (=> d!76750 m!347173))

(assert (=> b!226058 d!76750))

(declare-fun d!76752 () Bool)

(declare-fun e!154552 () Bool)

(assert (=> d!76752 e!154552))

(declare-fun res!189781 () Bool)

(assert (=> d!76752 (=> (not res!189781) (not e!154552))))

(assert (=> d!76752 (= res!189781 (and (or (let ((rhs!3845 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3845 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3845) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76753 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76753 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76753 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3844 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3844 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3844) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!359644 () Unit!16655)

(declare-fun choose!57 (BitStream!9006 BitStream!9006 (_ BitVec 64) (_ BitVec 32)) Unit!16655)

(assert (=> d!76752 (= lt!359644 (choose!57 thiss!1870 (_2!10468 lt!359161) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76752 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10468 lt!359161) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!359644)))

(declare-fun lt!359646 () (_ BitVec 32))

(declare-fun b!226161 () Bool)

(assert (=> b!226161 (= e!154552 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 (_2!10468 lt!359161)))) ((_ sign_extend 32) (currentByte!10298 (_2!10468 lt!359161))) ((_ sign_extend 32) (currentBit!10293 (_2!10468 lt!359161))) (bvsub (bvsub to!496 i!761) lt!359646)))))

(assert (=> b!226161 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!359646 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!359646) #b10000000000000000000000000000000)))))

(declare-fun lt!359645 () (_ BitVec 64))

(assert (=> b!226161 (= lt!359646 ((_ extract 31 0) lt!359645))))

(assert (=> b!226161 (and (bvslt lt!359645 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!359645 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226161 (= lt!359645 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76752 res!189781) b!226161))

(declare-fun m!347329 () Bool)

(assert (=> d!76752 m!347329))

(declare-fun m!347331 () Bool)

(assert (=> b!226161 m!347331))

(assert (=> b!226058 d!76752))

(declare-fun d!76755 () Bool)

(assert (=> d!76755 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4955 (buf!5496 (_2!10468 lt!359161)))) ((_ sign_extend 32) (currentByte!10298 (_2!10468 lt!359161))) ((_ sign_extend 32) (currentBit!10293 (_2!10468 lt!359161))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4955 (buf!5496 (_2!10468 lt!359161)))) ((_ sign_extend 32) (currentByte!10298 (_2!10468 lt!359161))) ((_ sign_extend 32) (currentBit!10293 (_2!10468 lt!359161)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18761 () Bool)

(assert (= bs!18761 d!76755))

(declare-fun m!347333 () Bool)

(assert (=> bs!18761 m!347333))

(assert (=> b!226058 d!76755))

(check-sat (not d!76722) (not d!76728) (not b!226149) (not d!76752) (not b!226151) (not bm!3689) (not d!76750) (not d!76716) (not d!76755) (not bm!3690) (not d!76726) (not b!226089) (not b!226148) (not b!226152) (not bm!3688) (not b!226161))
