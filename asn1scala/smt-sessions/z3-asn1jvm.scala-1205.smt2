; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34216 () Bool)

(assert start!34216)

(declare-fun b!163020 () Bool)

(declare-fun res!135808 () Bool)

(declare-fun e!112544 () Bool)

(assert (=> b!163020 (=> (not res!135808) (not e!112544))))

(declare-datatypes ((array!8096 0))(
  ( (array!8097 (arr!4550 (Array (_ BitVec 32) (_ BitVec 8))) (size!3629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6414 0))(
  ( (BitStream!6415 (buf!4081 array!8096) (currentByte!7600 (_ BitVec 32)) (currentBit!7595 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6414)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163020 (= res!135808 (bvsle (bvadd (currentBit!7595 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163019 () Bool)

(declare-fun res!135806 () Bool)

(assert (=> b!163019 (=> (not res!135806) (not e!112544))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163019 (= res!135806 (validate_offset_bits!1 ((_ sign_extend 32) (size!3629 (buf!4081 thiss!1577))) ((_ sign_extend 32) (currentByte!7600 thiss!1577)) ((_ sign_extend 32) (currentBit!7595 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135807 () Bool)

(assert (=> start!34216 (=> (not res!135807) (not e!112544))))

(assert (=> start!34216 (= res!135807 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34216 e!112544))

(assert (=> start!34216 true))

(declare-fun e!112542 () Bool)

(declare-fun inv!12 (BitStream!6414) Bool)

(assert (=> start!34216 (and (inv!12 thiss!1577) e!112542)))

(declare-fun b!163022 () Bool)

(declare-fun array_inv!3370 (array!8096) Bool)

(assert (=> b!163022 (= e!112542 (array_inv!3370 (buf!4081 thiss!1577)))))

(declare-fun b!163021 () Bool)

(assert (=> b!163021 (= e!112544 (not (or (bvsgt #b00000000000000000000000000000000 (currentByte!7600 thiss!1577)) (bvsle (currentByte!7600 thiss!1577) (size!3629 (buf!4081 thiss!1577))))))))

(declare-fun lt!256160 () (_ BitVec 8))

(declare-fun arrayRangesEq!563 (array!8096 array!8096 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163021 (arrayRangesEq!563 (buf!4081 thiss!1577) (array!8097 (store (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577) lt!256160) (size!3629 (buf!4081 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7600 thiss!1577))))

(declare-datatypes ((Unit!11290 0))(
  ( (Unit!11291) )
))
(declare-fun lt!256161 () Unit!11290)

(declare-fun arrayUpdatedAtPrefixLemma!171 (array!8096 (_ BitVec 32) (_ BitVec 8)) Unit!11290)

(assert (=> b!163021 (= lt!256161 (arrayUpdatedAtPrefixLemma!171 (buf!4081 thiss!1577) (currentByte!7600 thiss!1577) lt!256160))))

(declare-fun lt!256159 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163021 (= lt!256160 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7595 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256159)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256159))))))

(assert (=> b!163021 (= lt!256159 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7595 thiss!1577) nBits!511)))))

(assert (= (and start!34216 res!135807) b!163019))

(assert (= (and b!163019 res!135806) b!163020))

(assert (= (and b!163020 res!135808) b!163021))

(assert (= start!34216 b!163022))

(declare-fun m!258843 () Bool)

(assert (=> b!163019 m!258843))

(declare-fun m!258845 () Bool)

(assert (=> start!34216 m!258845))

(declare-fun m!258847 () Bool)

(assert (=> b!163022 m!258847))

(declare-fun m!258849 () Bool)

(assert (=> b!163021 m!258849))

(declare-fun m!258851 () Bool)

(assert (=> b!163021 m!258851))

(declare-fun m!258853 () Bool)

(assert (=> b!163021 m!258853))

(declare-fun m!258855 () Bool)

(assert (=> b!163021 m!258855))

(declare-fun m!258857 () Bool)

(assert (=> b!163021 m!258857))

(declare-fun m!258859 () Bool)

(assert (=> b!163021 m!258859))

(declare-fun m!258861 () Bool)

(assert (=> b!163021 m!258861))

(check-sat (not b!163022) (not b!163021) (not start!34216) (not b!163019))
(check-sat)
(get-model)

(declare-fun d!56171 () Bool)

(assert (=> d!56171 (= (array_inv!3370 (buf!4081 thiss!1577)) (bvsge (size!3629 (buf!4081 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163022 d!56171))

(declare-fun d!56173 () Bool)

(declare-fun res!135822 () Bool)

(declare-fun e!112558 () Bool)

(assert (=> d!56173 (=> res!135822 e!112558)))

(assert (=> d!56173 (= res!135822 (= #b00000000000000000000000000000000 (currentByte!7600 thiss!1577)))))

(assert (=> d!56173 (= (arrayRangesEq!563 (buf!4081 thiss!1577) (array!8097 (store (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577) lt!256160) (size!3629 (buf!4081 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7600 thiss!1577)) e!112558)))

(declare-fun b!163039 () Bool)

(declare-fun e!112559 () Bool)

(assert (=> b!163039 (= e!112558 e!112559)))

(declare-fun res!135823 () Bool)

(assert (=> b!163039 (=> (not res!135823) (not e!112559))))

(assert (=> b!163039 (= res!135823 (= (select (arr!4550 (buf!4081 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4550 (array!8097 (store (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577) lt!256160) (size!3629 (buf!4081 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163040 () Bool)

(assert (=> b!163040 (= e!112559 (arrayRangesEq!563 (buf!4081 thiss!1577) (array!8097 (store (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577) lt!256160) (size!3629 (buf!4081 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7600 thiss!1577)))))

(assert (= (and d!56173 (not res!135822)) b!163039))

(assert (= (and b!163039 res!135823) b!163040))

(declare-fun m!258883 () Bool)

(assert (=> b!163039 m!258883))

(declare-fun m!258885 () Bool)

(assert (=> b!163039 m!258885))

(declare-fun m!258887 () Bool)

(assert (=> b!163040 m!258887))

(assert (=> b!163021 d!56173))

(declare-fun d!56175 () Bool)

(declare-fun e!112562 () Bool)

(assert (=> d!56175 e!112562))

(declare-fun res!135826 () Bool)

(assert (=> d!56175 (=> (not res!135826) (not e!112562))))

(assert (=> d!56175 (= res!135826 (and (bvsge (currentByte!7600 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7600 thiss!1577) (size!3629 (buf!4081 thiss!1577)))))))

(declare-fun lt!256173 () Unit!11290)

(declare-fun choose!183 (array!8096 (_ BitVec 32) (_ BitVec 8)) Unit!11290)

(assert (=> d!56175 (= lt!256173 (choose!183 (buf!4081 thiss!1577) (currentByte!7600 thiss!1577) lt!256160))))

(assert (=> d!56175 (and (bvsle #b00000000000000000000000000000000 (currentByte!7600 thiss!1577)) (bvslt (currentByte!7600 thiss!1577) (size!3629 (buf!4081 thiss!1577))))))

(assert (=> d!56175 (= (arrayUpdatedAtPrefixLemma!171 (buf!4081 thiss!1577) (currentByte!7600 thiss!1577) lt!256160) lt!256173)))

(declare-fun b!163043 () Bool)

(assert (=> b!163043 (= e!112562 (arrayRangesEq!563 (buf!4081 thiss!1577) (array!8097 (store (arr!4550 (buf!4081 thiss!1577)) (currentByte!7600 thiss!1577) lt!256160) (size!3629 (buf!4081 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7600 thiss!1577)))))

(assert (= (and d!56175 res!135826) b!163043))

(declare-fun m!258889 () Bool)

(assert (=> d!56175 m!258889))

(assert (=> b!163043 m!258853))

(assert (=> b!163043 m!258857))

(assert (=> b!163021 d!56175))

(declare-fun d!56177 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56177 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7595 thiss!1577) (currentByte!7600 thiss!1577) (size!3629 (buf!4081 thiss!1577))))))

(declare-fun bs!13921 () Bool)

(assert (= bs!13921 d!56177))

(declare-fun m!258891 () Bool)

(assert (=> bs!13921 m!258891))

(assert (=> start!34216 d!56177))

(declare-fun d!56179 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56179 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3629 (buf!4081 thiss!1577))) ((_ sign_extend 32) (currentByte!7600 thiss!1577)) ((_ sign_extend 32) (currentBit!7595 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3629 (buf!4081 thiss!1577))) ((_ sign_extend 32) (currentByte!7600 thiss!1577)) ((_ sign_extend 32) (currentBit!7595 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13922 () Bool)

(assert (= bs!13922 d!56179))

(declare-fun m!258893 () Bool)

(assert (=> bs!13922 m!258893))

(assert (=> b!163019 d!56179))

(check-sat (not d!56175) (not b!163040) (not d!56179) (not d!56177) (not b!163043))
(check-sat)
