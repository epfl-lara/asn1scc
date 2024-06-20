; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34194 () Bool)

(assert start!34194)

(declare-fun b!162939 () Bool)

(declare-fun res!135743 () Bool)

(declare-fun e!112480 () Bool)

(assert (=> b!162939 (=> (not res!135743) (not e!112480))))

(declare-datatypes ((array!8083 0))(
  ( (array!8084 (arr!4544 (Array (_ BitVec 32) (_ BitVec 8))) (size!3623 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6402 0))(
  ( (BitStream!6403 (buf!4075 array!8083) (currentByte!7593 (_ BitVec 32)) (currentBit!7588 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6402)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!162939 (= res!135743 (bvsle (bvadd (currentBit!7588 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!162941 () Bool)

(declare-fun e!112481 () Bool)

(declare-fun array_inv!3364 (array!8083) Bool)

(assert (=> b!162941 (= e!112481 (array_inv!3364 (buf!4075 thiss!1577)))))

(declare-fun b!162938 () Bool)

(declare-fun res!135744 () Bool)

(assert (=> b!162938 (=> (not res!135744) (not e!112480))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162938 (= res!135744 (validate_offset_bits!1 ((_ sign_extend 32) (size!3623 (buf!4075 thiss!1577))) ((_ sign_extend 32) (currentByte!7593 thiss!1577)) ((_ sign_extend 32) (currentBit!7588 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135745 () Bool)

(assert (=> start!34194 (=> (not res!135745) (not e!112480))))

(assert (=> start!34194 (= res!135745 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34194 e!112480))

(assert (=> start!34194 true))

(declare-fun inv!12 (BitStream!6402) Bool)

(assert (=> start!34194 (and (inv!12 thiss!1577) e!112481)))

(declare-fun b!162940 () Bool)

(assert (=> b!162940 (= e!112480 (not (bvsle #b00000000000000000000000000000000 (currentByte!7593 thiss!1577))))))

(declare-fun lt!256104 () (_ BitVec 8))

(declare-fun arrayRangesEq!557 (array!8083 array!8083 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162940 (arrayRangesEq!557 (buf!4075 thiss!1577) (array!8084 (store (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577) lt!256104) (size!3623 (buf!4075 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7593 thiss!1577))))

(declare-datatypes ((Unit!11278 0))(
  ( (Unit!11279) )
))
(declare-fun lt!256102 () Unit!11278)

(declare-fun arrayUpdatedAtPrefixLemma!165 (array!8083 (_ BitVec 32) (_ BitVec 8)) Unit!11278)

(assert (=> b!162940 (= lt!256102 (arrayUpdatedAtPrefixLemma!165 (buf!4075 thiss!1577) (currentByte!7593 thiss!1577) lt!256104))))

(declare-fun lt!256103 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162940 (= lt!256104 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7588 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256103)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256103))))))

(assert (=> b!162940 (= lt!256103 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7588 thiss!1577) nBits!511)))))

(assert (= (and start!34194 res!135745) b!162938))

(assert (= (and b!162938 res!135744) b!162939))

(assert (= (and b!162939 res!135743) b!162940))

(assert (= start!34194 b!162941))

(declare-fun m!258711 () Bool)

(assert (=> b!162941 m!258711))

(declare-fun m!258713 () Bool)

(assert (=> b!162938 m!258713))

(declare-fun m!258715 () Bool)

(assert (=> start!34194 m!258715))

(declare-fun m!258717 () Bool)

(assert (=> b!162940 m!258717))

(declare-fun m!258719 () Bool)

(assert (=> b!162940 m!258719))

(declare-fun m!258721 () Bool)

(assert (=> b!162940 m!258721))

(declare-fun m!258723 () Bool)

(assert (=> b!162940 m!258723))

(declare-fun m!258725 () Bool)

(assert (=> b!162940 m!258725))

(declare-fun m!258727 () Bool)

(assert (=> b!162940 m!258727))

(declare-fun m!258729 () Bool)

(assert (=> b!162940 m!258729))

(check-sat (not start!34194) (not b!162940) (not b!162941) (not b!162938))
(check-sat)
(get-model)

(declare-fun d!56157 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56157 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7588 thiss!1577) (currentByte!7593 thiss!1577) (size!3623 (buf!4075 thiss!1577))))))

(declare-fun bs!13913 () Bool)

(assert (= bs!13913 d!56157))

(declare-fun m!258751 () Bool)

(assert (=> bs!13913 m!258751))

(assert (=> start!34194 d!56157))

(declare-fun d!56159 () Bool)

(declare-fun res!135759 () Bool)

(declare-fun e!112495 () Bool)

(assert (=> d!56159 (=> res!135759 e!112495)))

(assert (=> d!56159 (= res!135759 (= #b00000000000000000000000000000000 (currentByte!7593 thiss!1577)))))

(assert (=> d!56159 (= (arrayRangesEq!557 (buf!4075 thiss!1577) (array!8084 (store (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577) lt!256104) (size!3623 (buf!4075 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7593 thiss!1577)) e!112495)))

(declare-fun b!162958 () Bool)

(declare-fun e!112496 () Bool)

(assert (=> b!162958 (= e!112495 e!112496)))

(declare-fun res!135760 () Bool)

(assert (=> b!162958 (=> (not res!135760) (not e!112496))))

(assert (=> b!162958 (= res!135760 (= (select (arr!4544 (buf!4075 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4544 (array!8084 (store (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577) lt!256104) (size!3623 (buf!4075 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!162959 () Bool)

(assert (=> b!162959 (= e!112496 (arrayRangesEq!557 (buf!4075 thiss!1577) (array!8084 (store (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577) lt!256104) (size!3623 (buf!4075 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7593 thiss!1577)))))

(assert (= (and d!56159 (not res!135759)) b!162958))

(assert (= (and b!162958 res!135760) b!162959))

(declare-fun m!258753 () Bool)

(assert (=> b!162958 m!258753))

(declare-fun m!258755 () Bool)

(assert (=> b!162958 m!258755))

(declare-fun m!258757 () Bool)

(assert (=> b!162959 m!258757))

(assert (=> b!162940 d!56159))

(declare-fun d!56161 () Bool)

(declare-fun e!112499 () Bool)

(assert (=> d!56161 e!112499))

(declare-fun res!135763 () Bool)

(assert (=> d!56161 (=> (not res!135763) (not e!112499))))

(assert (=> d!56161 (= res!135763 (and (bvsge (currentByte!7593 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7593 thiss!1577) (size!3623 (buf!4075 thiss!1577)))))))

(declare-fun lt!256116 () Unit!11278)

(declare-fun choose!182 (array!8083 (_ BitVec 32) (_ BitVec 8)) Unit!11278)

(assert (=> d!56161 (= lt!256116 (choose!182 (buf!4075 thiss!1577) (currentByte!7593 thiss!1577) lt!256104))))

(assert (=> d!56161 (and (bvsle #b00000000000000000000000000000000 (currentByte!7593 thiss!1577)) (bvslt (currentByte!7593 thiss!1577) (size!3623 (buf!4075 thiss!1577))))))

(assert (=> d!56161 (= (arrayUpdatedAtPrefixLemma!165 (buf!4075 thiss!1577) (currentByte!7593 thiss!1577) lt!256104) lt!256116)))

(declare-fun b!162962 () Bool)

(assert (=> b!162962 (= e!112499 (arrayRangesEq!557 (buf!4075 thiss!1577) (array!8084 (store (arr!4544 (buf!4075 thiss!1577)) (currentByte!7593 thiss!1577) lt!256104) (size!3623 (buf!4075 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7593 thiss!1577)))))

(assert (= (and d!56161 res!135763) b!162962))

(declare-fun m!258759 () Bool)

(assert (=> d!56161 m!258759))

(assert (=> b!162962 m!258719))

(assert (=> b!162962 m!258723))

(assert (=> b!162940 d!56161))

(declare-fun d!56163 () Bool)

(assert (=> d!56163 (= (array_inv!3364 (buf!4075 thiss!1577)) (bvsge (size!3623 (buf!4075 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!162941 d!56163))

(declare-fun d!56165 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56165 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3623 (buf!4075 thiss!1577))) ((_ sign_extend 32) (currentByte!7593 thiss!1577)) ((_ sign_extend 32) (currentBit!7588 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3623 (buf!4075 thiss!1577))) ((_ sign_extend 32) (currentByte!7593 thiss!1577)) ((_ sign_extend 32) (currentBit!7588 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13914 () Bool)

(assert (= bs!13914 d!56165))

(declare-fun m!258761 () Bool)

(assert (=> bs!13914 m!258761))

(assert (=> b!162938 d!56165))

(check-sat (not b!162959) (not d!56165) (not d!56157) (not b!162962) (not d!56161))
(check-sat)
