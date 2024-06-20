; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15350 () Bool)

(assert start!15350)

(declare-fun b!78134 () Bool)

(declare-fun e!51284 () Bool)

(declare-datatypes ((array!3327 0))(
  ( (array!3328 (arr!2143 (Array (_ BitVec 32) (_ BitVec 8))) (size!1542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2646 0))(
  ( (BitStream!2647 (buf!1932 array!3327) (currentByte!3761 (_ BitVec 32)) (currentBit!3756 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2646)

(declare-fun array_inv!1388 (array!3327) Bool)

(assert (=> b!78134 (= e!51284 (array_inv!1388 (buf!1932 thiss!1107)))))

(declare-fun res!64551 () Bool)

(declare-fun e!51286 () Bool)

(assert (=> start!15350 (=> (not res!64551) (not e!51286))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15350 (= res!64551 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15350 e!51286))

(assert (=> start!15350 true))

(declare-fun inv!12 (BitStream!2646) Bool)

(assert (=> start!15350 (and (inv!12 thiss!1107) e!51284)))

(declare-fun b!78135 () Bool)

(declare-fun res!64552 () Bool)

(declare-fun e!51285 () Bool)

(assert (=> b!78135 (=> (not res!64552) (not e!51285))))

(declare-datatypes ((Unit!5169 0))(
  ( (Unit!5170) )
))
(declare-datatypes ((tuple2!6960 0))(
  ( (tuple2!6961 (_1!3617 Unit!5169) (_2!3617 BitStream!2646)) )
))
(declare-fun lt!125083 () tuple2!6960)

(declare-fun isPrefixOf!0 (BitStream!2646 BitStream!2646) Bool)

(assert (=> b!78135 (= res!64552 (isPrefixOf!0 thiss!1107 (_2!3617 lt!125083)))))

(declare-fun b!78136 () Bool)

(declare-fun e!51282 () Bool)

(assert (=> b!78136 (= e!51282 e!51285)))

(declare-fun res!64547 () Bool)

(assert (=> b!78136 (=> (not res!64547) (not e!51285))))

(declare-fun lt!125085 () (_ BitVec 64))

(declare-fun lt!125084 () (_ BitVec 64))

(assert (=> b!78136 (= res!64547 (= lt!125085 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125084)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78136 (= lt!125085 (bitIndex!0 (size!1542 (buf!1932 (_2!3617 lt!125083))) (currentByte!3761 (_2!3617 lt!125083)) (currentBit!3756 (_2!3617 lt!125083))))))

(assert (=> b!78136 (= lt!125084 (bitIndex!0 (size!1542 (buf!1932 thiss!1107)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107)))))

(declare-fun b!78137 () Bool)

(declare-fun e!51283 () Bool)

(declare-datatypes ((tuple2!6962 0))(
  ( (tuple2!6963 (_1!3618 BitStream!2646) (_2!3618 Bool)) )
))
(declare-fun lt!125081 () tuple2!6962)

(assert (=> b!78137 (= e!51283 (= (bitIndex!0 (size!1542 (buf!1932 (_1!3618 lt!125081))) (currentByte!3761 (_1!3618 lt!125081)) (currentBit!3756 (_1!3618 lt!125081))) lt!125085))))

(declare-fun b!78138 () Bool)

(declare-fun e!51287 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78138 (= e!51287 (invariant!0 (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107))))))

(declare-fun b!78139 () Bool)

(assert (=> b!78139 (= e!51285 e!51283)))

(declare-fun res!64546 () Bool)

(assert (=> b!78139 (=> (not res!64546) (not e!51283))))

(declare-fun lt!125082 () Bool)

(assert (=> b!78139 (= res!64546 (and (= (_2!3618 lt!125081) lt!125082) (= (_1!3618 lt!125081) (_2!3617 lt!125083))))))

(declare-fun readBitPure!0 (BitStream!2646) tuple2!6962)

(declare-fun readerFrom!0 (BitStream!2646 (_ BitVec 32) (_ BitVec 32)) BitStream!2646)

(assert (=> b!78139 (= lt!125081 (readBitPure!0 (readerFrom!0 (_2!3617 lt!125083) (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107))))))

(declare-fun b!78140 () Bool)

(assert (=> b!78140 (= e!51286 (not e!51287))))

(declare-fun res!64549 () Bool)

(assert (=> b!78140 (=> res!64549 e!51287)))

(assert (=> b!78140 (= res!64549 (not (= (size!1542 (buf!1932 (_2!3617 lt!125083))) (size!1542 (buf!1932 thiss!1107)))))))

(assert (=> b!78140 e!51282))

(declare-fun res!64550 () Bool)

(assert (=> b!78140 (=> (not res!64550) (not e!51282))))

(assert (=> b!78140 (= res!64550 (= (size!1542 (buf!1932 thiss!1107)) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(declare-fun appendBit!0 (BitStream!2646 Bool) tuple2!6960)

(assert (=> b!78140 (= lt!125083 (appendBit!0 thiss!1107 lt!125082))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78140 (= lt!125082 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78141 () Bool)

(declare-fun res!64548 () Bool)

(assert (=> b!78141 (=> (not res!64548) (not e!51286))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78141 (= res!64548 (validate_offset_bit!0 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))) ((_ sign_extend 32) (currentByte!3761 thiss!1107)) ((_ sign_extend 32) (currentBit!3756 thiss!1107))))))

(assert (= (and start!15350 res!64551) b!78141))

(assert (= (and b!78141 res!64548) b!78140))

(assert (= (and b!78140 res!64550) b!78136))

(assert (= (and b!78136 res!64547) b!78135))

(assert (= (and b!78135 res!64552) b!78139))

(assert (= (and b!78139 res!64546) b!78137))

(assert (= (and b!78140 (not res!64549)) b!78138))

(assert (= start!15350 b!78134))

(declare-fun m!123735 () Bool)

(assert (=> b!78138 m!123735))

(declare-fun m!123737 () Bool)

(assert (=> start!15350 m!123737))

(declare-fun m!123739 () Bool)

(assert (=> b!78141 m!123739))

(declare-fun m!123741 () Bool)

(assert (=> b!78139 m!123741))

(assert (=> b!78139 m!123741))

(declare-fun m!123743 () Bool)

(assert (=> b!78139 m!123743))

(declare-fun m!123745 () Bool)

(assert (=> b!78136 m!123745))

(declare-fun m!123747 () Bool)

(assert (=> b!78136 m!123747))

(declare-fun m!123749 () Bool)

(assert (=> b!78135 m!123749))

(declare-fun m!123751 () Bool)

(assert (=> b!78140 m!123751))

(declare-fun m!123753 () Bool)

(assert (=> b!78140 m!123753))

(declare-fun m!123755 () Bool)

(assert (=> b!78137 m!123755))

(declare-fun m!123757 () Bool)

(assert (=> b!78134 m!123757))

(check-sat (not b!78141) (not b!78138) (not b!78134) (not b!78139) (not b!78135) (not b!78136) (not start!15350) (not b!78140) (not b!78137))
(check-sat)
(get-model)

(declare-fun d!24648 () Bool)

(declare-fun res!64581 () Bool)

(declare-fun e!51314 () Bool)

(assert (=> d!24648 (=> (not res!64581) (not e!51314))))

(assert (=> d!24648 (= res!64581 (= (size!1542 (buf!1932 thiss!1107)) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(assert (=> d!24648 (= (isPrefixOf!0 thiss!1107 (_2!3617 lt!125083)) e!51314)))

(declare-fun b!78172 () Bool)

(declare-fun res!64580 () Bool)

(assert (=> b!78172 (=> (not res!64580) (not e!51314))))

(assert (=> b!78172 (= res!64580 (bvsle (bitIndex!0 (size!1542 (buf!1932 thiss!1107)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107)) (bitIndex!0 (size!1542 (buf!1932 (_2!3617 lt!125083))) (currentByte!3761 (_2!3617 lt!125083)) (currentBit!3756 (_2!3617 lt!125083)))))))

(declare-fun b!78173 () Bool)

(declare-fun e!51315 () Bool)

(assert (=> b!78173 (= e!51314 e!51315)))

(declare-fun res!64582 () Bool)

(assert (=> b!78173 (=> res!64582 e!51315)))

(assert (=> b!78173 (= res!64582 (= (size!1542 (buf!1932 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78174 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3327 array!3327 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78174 (= e!51315 (arrayBitRangesEq!0 (buf!1932 thiss!1107) (buf!1932 (_2!3617 lt!125083)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1542 (buf!1932 thiss!1107)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107))))))

(assert (= (and d!24648 res!64581) b!78172))

(assert (= (and b!78172 res!64580) b!78173))

(assert (= (and b!78173 (not res!64582)) b!78174))

(assert (=> b!78172 m!123747))

(assert (=> b!78172 m!123745))

(assert (=> b!78174 m!123747))

(assert (=> b!78174 m!123747))

(declare-fun m!123783 () Bool)

(assert (=> b!78174 m!123783))

(assert (=> b!78135 d!24648))

(declare-fun d!24650 () Bool)

(declare-fun e!51321 () Bool)

(assert (=> d!24650 e!51321))

(declare-fun res!64591 () Bool)

(assert (=> d!24650 (=> (not res!64591) (not e!51321))))

(declare-fun lt!125111 () tuple2!6960)

(assert (=> d!24650 (= res!64591 (= (size!1542 (buf!1932 thiss!1107)) (size!1542 (buf!1932 (_2!3617 lt!125111)))))))

(declare-fun choose!16 (BitStream!2646 Bool) tuple2!6960)

(assert (=> d!24650 (= lt!125111 (choose!16 thiss!1107 lt!125082))))

(assert (=> d!24650 (validate_offset_bit!0 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))) ((_ sign_extend 32) (currentByte!3761 thiss!1107)) ((_ sign_extend 32) (currentBit!3756 thiss!1107)))))

(assert (=> d!24650 (= (appendBit!0 thiss!1107 lt!125082) lt!125111)))

(declare-fun b!78185 () Bool)

(declare-fun res!64593 () Bool)

(assert (=> b!78185 (=> (not res!64593) (not e!51321))))

(assert (=> b!78185 (= res!64593 (isPrefixOf!0 thiss!1107 (_2!3617 lt!125111)))))

(declare-fun b!78184 () Bool)

(declare-fun res!64592 () Bool)

(assert (=> b!78184 (=> (not res!64592) (not e!51321))))

(declare-fun lt!125110 () (_ BitVec 64))

(declare-fun lt!125109 () (_ BitVec 64))

(assert (=> b!78184 (= res!64592 (= (bitIndex!0 (size!1542 (buf!1932 (_2!3617 lt!125111))) (currentByte!3761 (_2!3617 lt!125111)) (currentBit!3756 (_2!3617 lt!125111))) (bvadd lt!125110 lt!125109)))))

(assert (=> b!78184 (or (not (= (bvand lt!125110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125109 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125110 lt!125109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78184 (= lt!125109 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78184 (= lt!125110 (bitIndex!0 (size!1542 (buf!1932 thiss!1107)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107)))))

(declare-fun b!78186 () Bool)

(declare-fun e!51320 () Bool)

(assert (=> b!78186 (= e!51321 e!51320)))

(declare-fun res!64594 () Bool)

(assert (=> b!78186 (=> (not res!64594) (not e!51320))))

(declare-fun lt!125112 () tuple2!6962)

(assert (=> b!78186 (= res!64594 (and (= (_2!3618 lt!125112) lt!125082) (= (_1!3618 lt!125112) (_2!3617 lt!125111))))))

(assert (=> b!78186 (= lt!125112 (readBitPure!0 (readerFrom!0 (_2!3617 lt!125111) (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107))))))

(declare-fun b!78187 () Bool)

(assert (=> b!78187 (= e!51320 (= (bitIndex!0 (size!1542 (buf!1932 (_1!3618 lt!125112))) (currentByte!3761 (_1!3618 lt!125112)) (currentBit!3756 (_1!3618 lt!125112))) (bitIndex!0 (size!1542 (buf!1932 (_2!3617 lt!125111))) (currentByte!3761 (_2!3617 lt!125111)) (currentBit!3756 (_2!3617 lt!125111)))))))

(assert (= (and d!24650 res!64591) b!78184))

(assert (= (and b!78184 res!64592) b!78185))

(assert (= (and b!78185 res!64593) b!78186))

(assert (= (and b!78186 res!64594) b!78187))

(declare-fun m!123787 () Bool)

(assert (=> b!78184 m!123787))

(assert (=> b!78184 m!123747))

(declare-fun m!123789 () Bool)

(assert (=> d!24650 m!123789))

(assert (=> d!24650 m!123739))

(declare-fun m!123791 () Bool)

(assert (=> b!78185 m!123791))

(declare-fun m!123793 () Bool)

(assert (=> b!78186 m!123793))

(assert (=> b!78186 m!123793))

(declare-fun m!123795 () Bool)

(assert (=> b!78186 m!123795))

(declare-fun m!123797 () Bool)

(assert (=> b!78187 m!123797))

(assert (=> b!78187 m!123787))

(assert (=> b!78140 d!24650))

(declare-fun d!24658 () Bool)

(assert (=> d!24658 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107))))))

(declare-fun bs!5989 () Bool)

(assert (= bs!5989 d!24658))

(assert (=> bs!5989 m!123735))

(assert (=> start!15350 d!24658))

(declare-fun d!24660 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24660 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))) ((_ sign_extend 32) (currentByte!3761 thiss!1107)) ((_ sign_extend 32) (currentBit!3756 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))) ((_ sign_extend 32) (currentByte!3761 thiss!1107)) ((_ sign_extend 32) (currentBit!3756 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5990 () Bool)

(assert (= bs!5990 d!24660))

(declare-fun m!123799 () Bool)

(assert (=> bs!5990 m!123799))

(assert (=> b!78141 d!24660))

(declare-fun d!24662 () Bool)

(declare-fun e!51333 () Bool)

(assert (=> d!24662 e!51333))

(declare-fun res!64612 () Bool)

(assert (=> d!24662 (=> (not res!64612) (not e!51333))))

(declare-fun lt!125132 () (_ BitVec 64))

(declare-fun lt!125128 () (_ BitVec 64))

(declare-fun lt!125129 () (_ BitVec 64))

(assert (=> d!24662 (= res!64612 (= lt!125128 (bvsub lt!125132 lt!125129)))))

(assert (=> d!24662 (or (= (bvand lt!125132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125132 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125132 lt!125129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24662 (= lt!125129 (remainingBits!0 ((_ sign_extend 32) (size!1542 (buf!1932 (_2!3617 lt!125083)))) ((_ sign_extend 32) (currentByte!3761 (_2!3617 lt!125083))) ((_ sign_extend 32) (currentBit!3756 (_2!3617 lt!125083)))))))

(declare-fun lt!125133 () (_ BitVec 64))

(declare-fun lt!125130 () (_ BitVec 64))

(assert (=> d!24662 (= lt!125132 (bvmul lt!125133 lt!125130))))

(assert (=> d!24662 (or (= lt!125133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125130 (bvsdiv (bvmul lt!125133 lt!125130) lt!125133)))))

(assert (=> d!24662 (= lt!125130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24662 (= lt!125133 ((_ sign_extend 32) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(assert (=> d!24662 (= lt!125128 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3761 (_2!3617 lt!125083))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3756 (_2!3617 lt!125083)))))))

(assert (=> d!24662 (invariant!0 (currentBit!3756 (_2!3617 lt!125083)) (currentByte!3761 (_2!3617 lt!125083)) (size!1542 (buf!1932 (_2!3617 lt!125083))))))

(assert (=> d!24662 (= (bitIndex!0 (size!1542 (buf!1932 (_2!3617 lt!125083))) (currentByte!3761 (_2!3617 lt!125083)) (currentBit!3756 (_2!3617 lt!125083))) lt!125128)))

(declare-fun b!78204 () Bool)

(declare-fun res!64613 () Bool)

(assert (=> b!78204 (=> (not res!64613) (not e!51333))))

(assert (=> b!78204 (= res!64613 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125128))))

(declare-fun b!78205 () Bool)

(declare-fun lt!125131 () (_ BitVec 64))

(assert (=> b!78205 (= e!51333 (bvsle lt!125128 (bvmul lt!125131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78205 (or (= lt!125131 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125131 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125131)))))

(assert (=> b!78205 (= lt!125131 ((_ sign_extend 32) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(assert (= (and d!24662 res!64612) b!78204))

(assert (= (and b!78204 res!64613) b!78205))

(declare-fun m!123809 () Bool)

(assert (=> d!24662 m!123809))

(declare-fun m!123811 () Bool)

(assert (=> d!24662 m!123811))

(assert (=> b!78136 d!24662))

(declare-fun d!24674 () Bool)

(declare-fun e!51334 () Bool)

(assert (=> d!24674 e!51334))

(declare-fun res!64614 () Bool)

(assert (=> d!24674 (=> (not res!64614) (not e!51334))))

(declare-fun lt!125138 () (_ BitVec 64))

(declare-fun lt!125135 () (_ BitVec 64))

(declare-fun lt!125134 () (_ BitVec 64))

(assert (=> d!24674 (= res!64614 (= lt!125134 (bvsub lt!125138 lt!125135)))))

(assert (=> d!24674 (or (= (bvand lt!125138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125135 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125138 lt!125135) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24674 (= lt!125135 (remainingBits!0 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))) ((_ sign_extend 32) (currentByte!3761 thiss!1107)) ((_ sign_extend 32) (currentBit!3756 thiss!1107))))))

(declare-fun lt!125139 () (_ BitVec 64))

(declare-fun lt!125136 () (_ BitVec 64))

(assert (=> d!24674 (= lt!125138 (bvmul lt!125139 lt!125136))))

(assert (=> d!24674 (or (= lt!125139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125136 (bvsdiv (bvmul lt!125139 lt!125136) lt!125139)))))

(assert (=> d!24674 (= lt!125136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24674 (= lt!125139 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))))))

(assert (=> d!24674 (= lt!125134 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3761 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3756 thiss!1107))))))

(assert (=> d!24674 (invariant!0 (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107)))))

(assert (=> d!24674 (= (bitIndex!0 (size!1542 (buf!1932 thiss!1107)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107)) lt!125134)))

(declare-fun b!78206 () Bool)

(declare-fun res!64615 () Bool)

(assert (=> b!78206 (=> (not res!64615) (not e!51334))))

(assert (=> b!78206 (= res!64615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125134))))

(declare-fun b!78207 () Bool)

(declare-fun lt!125137 () (_ BitVec 64))

(assert (=> b!78207 (= e!51334 (bvsle lt!125134 (bvmul lt!125137 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78207 (or (= lt!125137 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125137 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125137)))))

(assert (=> b!78207 (= lt!125137 ((_ sign_extend 32) (size!1542 (buf!1932 thiss!1107))))))

(assert (= (and d!24674 res!64614) b!78206))

(assert (= (and b!78206 res!64615) b!78207))

(assert (=> d!24674 m!123799))

(assert (=> d!24674 m!123735))

(assert (=> b!78136 d!24674))

(declare-fun d!24676 () Bool)

(declare-fun e!51335 () Bool)

(assert (=> d!24676 e!51335))

(declare-fun res!64616 () Bool)

(assert (=> d!24676 (=> (not res!64616) (not e!51335))))

(declare-fun lt!125144 () (_ BitVec 64))

(declare-fun lt!125141 () (_ BitVec 64))

(declare-fun lt!125140 () (_ BitVec 64))

(assert (=> d!24676 (= res!64616 (= lt!125140 (bvsub lt!125144 lt!125141)))))

(assert (=> d!24676 (or (= (bvand lt!125144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125144 lt!125141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24676 (= lt!125141 (remainingBits!0 ((_ sign_extend 32) (size!1542 (buf!1932 (_1!3618 lt!125081)))) ((_ sign_extend 32) (currentByte!3761 (_1!3618 lt!125081))) ((_ sign_extend 32) (currentBit!3756 (_1!3618 lt!125081)))))))

(declare-fun lt!125145 () (_ BitVec 64))

(declare-fun lt!125142 () (_ BitVec 64))

(assert (=> d!24676 (= lt!125144 (bvmul lt!125145 lt!125142))))

(assert (=> d!24676 (or (= lt!125145 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125142 (bvsdiv (bvmul lt!125145 lt!125142) lt!125145)))))

(assert (=> d!24676 (= lt!125142 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24676 (= lt!125145 ((_ sign_extend 32) (size!1542 (buf!1932 (_1!3618 lt!125081)))))))

(assert (=> d!24676 (= lt!125140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3761 (_1!3618 lt!125081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3756 (_1!3618 lt!125081)))))))

(assert (=> d!24676 (invariant!0 (currentBit!3756 (_1!3618 lt!125081)) (currentByte!3761 (_1!3618 lt!125081)) (size!1542 (buf!1932 (_1!3618 lt!125081))))))

(assert (=> d!24676 (= (bitIndex!0 (size!1542 (buf!1932 (_1!3618 lt!125081))) (currentByte!3761 (_1!3618 lt!125081)) (currentBit!3756 (_1!3618 lt!125081))) lt!125140)))

(declare-fun b!78208 () Bool)

(declare-fun res!64617 () Bool)

(assert (=> b!78208 (=> (not res!64617) (not e!51335))))

(assert (=> b!78208 (= res!64617 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125140))))

(declare-fun b!78209 () Bool)

(declare-fun lt!125143 () (_ BitVec 64))

(assert (=> b!78209 (= e!51335 (bvsle lt!125140 (bvmul lt!125143 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78209 (or (= lt!125143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125143)))))

(assert (=> b!78209 (= lt!125143 ((_ sign_extend 32) (size!1542 (buf!1932 (_1!3618 lt!125081)))))))

(assert (= (and d!24676 res!64616) b!78208))

(assert (= (and b!78208 res!64617) b!78209))

(declare-fun m!123813 () Bool)

(assert (=> d!24676 m!123813))

(declare-fun m!123815 () Bool)

(assert (=> d!24676 m!123815))

(assert (=> b!78137 d!24676))

(declare-fun d!24678 () Bool)

(assert (=> d!24678 (= (invariant!0 (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107))) (and (bvsge (currentBit!3756 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3756 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3761 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107))) (and (= (currentBit!3756 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3761 thiss!1107) (size!1542 (buf!1932 thiss!1107)))))))))

(assert (=> b!78138 d!24678))

(declare-fun d!24680 () Bool)

(declare-datatypes ((tuple2!6968 0))(
  ( (tuple2!6969 (_1!3621 Bool) (_2!3621 BitStream!2646)) )
))
(declare-fun lt!125148 () tuple2!6968)

(declare-fun readBit!0 (BitStream!2646) tuple2!6968)

(assert (=> d!24680 (= lt!125148 (readBit!0 (readerFrom!0 (_2!3617 lt!125083) (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107))))))

(assert (=> d!24680 (= (readBitPure!0 (readerFrom!0 (_2!3617 lt!125083) (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107))) (tuple2!6963 (_2!3621 lt!125148) (_1!3621 lt!125148)))))

(declare-fun bs!5993 () Bool)

(assert (= bs!5993 d!24680))

(assert (=> bs!5993 m!123741))

(declare-fun m!123817 () Bool)

(assert (=> bs!5993 m!123817))

(assert (=> b!78139 d!24680))

(declare-fun d!24682 () Bool)

(declare-fun e!51342 () Bool)

(assert (=> d!24682 e!51342))

(declare-fun res!64629 () Bool)

(assert (=> d!24682 (=> (not res!64629) (not e!51342))))

(assert (=> d!24682 (= res!64629 (invariant!0 (currentBit!3756 (_2!3617 lt!125083)) (currentByte!3761 (_2!3617 lt!125083)) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(assert (=> d!24682 (= (readerFrom!0 (_2!3617 lt!125083) (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107)) (BitStream!2647 (buf!1932 (_2!3617 lt!125083)) (currentByte!3761 thiss!1107) (currentBit!3756 thiss!1107)))))

(declare-fun b!78221 () Bool)

(assert (=> b!78221 (= e!51342 (invariant!0 (currentBit!3756 thiss!1107) (currentByte!3761 thiss!1107) (size!1542 (buf!1932 (_2!3617 lt!125083)))))))

(assert (= (and d!24682 res!64629) b!78221))

(assert (=> d!24682 m!123811))

(declare-fun m!123819 () Bool)

(assert (=> b!78221 m!123819))

(assert (=> b!78139 d!24682))

(declare-fun d!24684 () Bool)

(assert (=> d!24684 (= (array_inv!1388 (buf!1932 thiss!1107)) (bvsge (size!1542 (buf!1932 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78134 d!24684))

(check-sat (not d!24674) (not b!78172) (not b!78187) (not d!24650) (not b!78184) (not d!24660) (not d!24682) (not b!78186) (not b!78174) (not d!24676) (not b!78221) (not d!24680) (not d!24658) (not b!78185) (not d!24662))
