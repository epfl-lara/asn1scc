; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34232 () Bool)

(assert start!34232)

(declare-fun b!163067 () Bool)

(declare-fun e!112578 () Bool)

(declare-datatypes ((array!8103 0))(
  ( (array!8104 (arr!4553 (Array (_ BitVec 32) (_ BitVec 8))) (size!3632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6420 0))(
  ( (BitStream!6421 (buf!4084 array!8103) (currentByte!7604 (_ BitVec 32)) (currentBit!7599 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6420)

(declare-fun array_inv!3373 (array!8103) Bool)

(assert (=> b!163067 (= e!112578 (array_inv!3373 (buf!4084 thiss!1577)))))

(declare-fun b!163065 () Bool)

(declare-fun res!135842 () Bool)

(declare-fun e!112579 () Bool)

(assert (=> b!163065 (=> (not res!135842) (not e!112579))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163065 (= res!135842 (bvsle (bvadd (currentBit!7599 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163064 () Bool)

(declare-fun res!135843 () Bool)

(assert (=> b!163064 (=> (not res!135843) (not e!112579))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163064 (= res!135843 (validate_offset_bits!1 ((_ sign_extend 32) (size!3632 (buf!4084 thiss!1577))) ((_ sign_extend 32) (currentByte!7604 thiss!1577)) ((_ sign_extend 32) (currentBit!7599 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135844 () Bool)

(assert (=> start!34232 (=> (not res!135844) (not e!112579))))

(assert (=> start!34232 (= res!135844 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34232 e!112579))

(assert (=> start!34232 true))

(declare-fun inv!12 (BitStream!6420) Bool)

(assert (=> start!34232 (and (inv!12 thiss!1577) e!112578)))

(declare-fun b!163066 () Bool)

(assert (=> b!163066 (= e!112579 (not (and (bvsle #b00000000000000000000000000000000 (currentBit!7599 thiss!1577)) (bvsle (currentBit!7599 thiss!1577) #b00000000000000000000000000001000))))))

(declare-fun lt!256189 () (_ BitVec 8))

(declare-fun arrayRangesEq!566 (array!8103 array!8103 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163066 (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7604 thiss!1577))))

(declare-datatypes ((Unit!11296 0))(
  ( (Unit!11297) )
))
(declare-fun lt!256191 () Unit!11296)

(declare-fun arrayUpdatedAtPrefixLemma!174 (array!8103 (_ BitVec 32) (_ BitVec 8)) Unit!11296)

(assert (=> b!163066 (= lt!256191 (arrayUpdatedAtPrefixLemma!174 (buf!4084 thiss!1577) (currentByte!7604 thiss!1577) lt!256189))))

(declare-fun lt!256190 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163066 (= lt!256189 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7599 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256190)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256190))))))

(assert (=> b!163066 (= lt!256190 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7599 thiss!1577) nBits!511)))))

(assert (= (and start!34232 res!135844) b!163064))

(assert (= (and b!163064 res!135843) b!163065))

(assert (= (and b!163065 res!135842) b!163066))

(assert (= start!34232 b!163067))

(declare-fun m!258915 () Bool)

(assert (=> b!163067 m!258915))

(declare-fun m!258917 () Bool)

(assert (=> b!163064 m!258917))

(declare-fun m!258919 () Bool)

(assert (=> start!34232 m!258919))

(declare-fun m!258921 () Bool)

(assert (=> b!163066 m!258921))

(declare-fun m!258923 () Bool)

(assert (=> b!163066 m!258923))

(declare-fun m!258925 () Bool)

(assert (=> b!163066 m!258925))

(declare-fun m!258927 () Bool)

(assert (=> b!163066 m!258927))

(declare-fun m!258929 () Bool)

(assert (=> b!163066 m!258929))

(declare-fun m!258931 () Bool)

(assert (=> b!163066 m!258931))

(declare-fun m!258933 () Bool)

(assert (=> b!163066 m!258933))

(check-sat (not b!163064) (not b!163067) (not b!163066) (not start!34232))
(check-sat)
(get-model)

(declare-fun d!56183 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56183 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3632 (buf!4084 thiss!1577))) ((_ sign_extend 32) (currentByte!7604 thiss!1577)) ((_ sign_extend 32) (currentBit!7599 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3632 (buf!4084 thiss!1577))) ((_ sign_extend 32) (currentByte!7604 thiss!1577)) ((_ sign_extend 32) (currentBit!7599 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13926 () Bool)

(assert (= bs!13926 d!56183))

(declare-fun m!258955 () Bool)

(assert (=> bs!13926 m!258955))

(assert (=> b!163064 d!56183))

(declare-fun d!56185 () Bool)

(assert (=> d!56185 (= (array_inv!3373 (buf!4084 thiss!1577)) (bvsge (size!3632 (buf!4084 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163067 d!56185))

(declare-fun d!56187 () Bool)

(declare-fun res!135858 () Bool)

(declare-fun e!112594 () Bool)

(assert (=> d!56187 (=> res!135858 e!112594)))

(assert (=> d!56187 (= res!135858 (= #b00000000000000000000000000000000 (currentByte!7604 thiss!1577)))))

(assert (=> d!56187 (= (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7604 thiss!1577)) e!112594)))

(declare-fun b!163084 () Bool)

(declare-fun e!112595 () Bool)

(assert (=> b!163084 (= e!112594 e!112595)))

(declare-fun res!135859 () Bool)

(assert (=> b!163084 (=> (not res!135859) (not e!112595))))

(assert (=> b!163084 (= res!135859 (= (select (arr!4553 (buf!4084 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4553 (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163085 () Bool)

(assert (=> b!163085 (= e!112595 (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7604 thiss!1577)))))

(assert (= (and d!56187 (not res!135858)) b!163084))

(assert (= (and b!163084 res!135859) b!163085))

(declare-fun m!258957 () Bool)

(assert (=> b!163084 m!258957))

(declare-fun m!258959 () Bool)

(assert (=> b!163084 m!258959))

(declare-fun m!258961 () Bool)

(assert (=> b!163085 m!258961))

(assert (=> b!163066 d!56187))

(declare-fun d!56189 () Bool)

(declare-fun e!112598 () Bool)

(assert (=> d!56189 e!112598))

(declare-fun res!135862 () Bool)

(assert (=> d!56189 (=> (not res!135862) (not e!112598))))

(assert (=> d!56189 (= res!135862 (and (bvsge (currentByte!7604 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577)))))))

(declare-fun lt!256203 () Unit!11296)

(declare-fun choose!184 (array!8103 (_ BitVec 32) (_ BitVec 8)) Unit!11296)

(assert (=> d!56189 (= lt!256203 (choose!184 (buf!4084 thiss!1577) (currentByte!7604 thiss!1577) lt!256189))))

(assert (=> d!56189 (and (bvsle #b00000000000000000000000000000000 (currentByte!7604 thiss!1577)) (bvslt (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577))))))

(assert (=> d!56189 (= (arrayUpdatedAtPrefixLemma!174 (buf!4084 thiss!1577) (currentByte!7604 thiss!1577) lt!256189) lt!256203)))

(declare-fun b!163088 () Bool)

(assert (=> b!163088 (= e!112598 (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7604 thiss!1577)))))

(assert (= (and d!56189 res!135862) b!163088))

(declare-fun m!258963 () Bool)

(assert (=> d!56189 m!258963))

(assert (=> b!163088 m!258933))

(assert (=> b!163088 m!258921))

(assert (=> b!163066 d!56189))

(declare-fun d!56191 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56191 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7599 thiss!1577) (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577))))))

(declare-fun bs!13927 () Bool)

(assert (= bs!13927 d!56191))

(declare-fun m!258965 () Bool)

(assert (=> bs!13927 m!258965))

(assert (=> start!34232 d!56191))

(check-sat (not b!163085) (not b!163088) (not d!56191) (not d!56189) (not d!56183))
(check-sat)
(get-model)

(declare-fun d!56193 () Bool)

(declare-fun res!135863 () Bool)

(declare-fun e!112599 () Bool)

(assert (=> d!56193 (=> res!135863 e!112599)))

(assert (=> d!56193 (= res!135863 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7604 thiss!1577)))))

(assert (=> d!56193 (= (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7604 thiss!1577)) e!112599)))

(declare-fun b!163089 () Bool)

(declare-fun e!112600 () Bool)

(assert (=> b!163089 (= e!112599 e!112600)))

(declare-fun res!135864 () Bool)

(assert (=> b!163089 (=> (not res!135864) (not e!112600))))

(assert (=> b!163089 (= res!135864 (= (select (arr!4553 (buf!4084 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4553 (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163090 () Bool)

(assert (=> b!163090 (= e!112600 (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7604 thiss!1577)))))

(assert (= (and d!56193 (not res!135863)) b!163089))

(assert (= (and b!163089 res!135864) b!163090))

(declare-fun m!258967 () Bool)

(assert (=> b!163089 m!258967))

(declare-fun m!258969 () Bool)

(assert (=> b!163089 m!258969))

(declare-fun m!258971 () Bool)

(assert (=> b!163090 m!258971))

(assert (=> b!163085 d!56193))

(assert (=> b!163088 d!56187))

(declare-fun d!56195 () Bool)

(assert (=> d!56195 (= (invariant!0 (currentBit!7599 thiss!1577) (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577))) (and (bvsge (currentBit!7599 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7599 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7604 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577))) (and (= (currentBit!7599 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7604 thiss!1577) (size!3632 (buf!4084 thiss!1577)))))))))

(assert (=> d!56191 d!56195))

(declare-fun d!56197 () Bool)

(assert (=> d!56197 (arrayRangesEq!566 (buf!4084 thiss!1577) (array!8104 (store (arr!4553 (buf!4084 thiss!1577)) (currentByte!7604 thiss!1577) lt!256189) (size!3632 (buf!4084 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7604 thiss!1577))))

(assert (=> d!56197 true))

(declare-fun _$8!148 () Unit!11296)

(assert (=> d!56197 (= (choose!184 (buf!4084 thiss!1577) (currentByte!7604 thiss!1577) lt!256189) _$8!148)))

(declare-fun bs!13928 () Bool)

(assert (= bs!13928 d!56197))

(assert (=> bs!13928 m!258933))

(assert (=> bs!13928 m!258921))

(assert (=> d!56189 d!56197))

(declare-fun d!56199 () Bool)

(assert (=> d!56199 (= (remainingBits!0 ((_ sign_extend 32) (size!3632 (buf!4084 thiss!1577))) ((_ sign_extend 32) (currentByte!7604 thiss!1577)) ((_ sign_extend 32) (currentBit!7599 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3632 (buf!4084 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7604 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7599 thiss!1577)))))))

(assert (=> d!56183 d!56199))

(check-sat (not b!163090) (not d!56197))
(check-sat)
