; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35290 () Bool)

(assert start!35290)

(declare-fun b!165260 () Bool)

(declare-fun e!114362 () Bool)

(declare-datatypes ((array!8403 0))(
  ( (array!8404 (arr!4673 (Array (_ BitVec 32) (_ BitVec 8))) (size!3752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6660 0))(
  ( (BitStream!6661 (buf!4204 array!8403) (currentByte!7878 (_ BitVec 32)) (currentBit!7873 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6660)

(assert (=> b!165260 (= e!114362 (not (and (bvsge (currentByte!7878 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7878 thiss!1577) (size!3752 (buf!4204 thiss!1577))))))))

(declare-fun lt!258552 () (_ BitVec 8))

(declare-fun arrayRangesEq!632 (array!8403 array!8403 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165260 (arrayRangesEq!632 (buf!4204 thiss!1577) (array!8404 (store (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577) lt!258552) (size!3752 (buf!4204 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7878 thiss!1577))))

(declare-datatypes ((Unit!11476 0))(
  ( (Unit!11477) )
))
(declare-fun lt!258550 () Unit!11476)

(declare-fun arrayUpdatedAtPrefixLemma!240 (array!8403 (_ BitVec 32) (_ BitVec 8)) Unit!11476)

(assert (=> b!165260 (= lt!258550 (arrayUpdatedAtPrefixLemma!240 (buf!4204 thiss!1577) (currentByte!7878 thiss!1577) lt!258552))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!258551 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165260 (= lt!258552 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7873 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258551)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258551))))))

(assert (=> b!165260 (= lt!258551 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7873 thiss!1577) nBits!511)))))

(declare-fun b!165258 () Bool)

(declare-fun res!137635 () Bool)

(assert (=> b!165258 (=> (not res!137635) (not e!114362))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165258 (= res!137635 (validate_offset_bits!1 ((_ sign_extend 32) (size!3752 (buf!4204 thiss!1577))) ((_ sign_extend 32) (currentByte!7878 thiss!1577)) ((_ sign_extend 32) (currentBit!7873 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165259 () Bool)

(declare-fun res!137636 () Bool)

(assert (=> b!165259 (=> (not res!137636) (not e!114362))))

(assert (=> b!165259 (= res!137636 (bvsle (bvadd (currentBit!7873 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137634 () Bool)

(assert (=> start!35290 (=> (not res!137634) (not e!114362))))

(assert (=> start!35290 (= res!137634 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35290 e!114362))

(assert (=> start!35290 true))

(declare-fun e!114361 () Bool)

(declare-fun inv!12 (BitStream!6660) Bool)

(assert (=> start!35290 (and (inv!12 thiss!1577) e!114361)))

(declare-fun b!165261 () Bool)

(declare-fun array_inv!3493 (array!8403) Bool)

(assert (=> b!165261 (= e!114361 (array_inv!3493 (buf!4204 thiss!1577)))))

(assert (= (and start!35290 res!137634) b!165258))

(assert (= (and b!165258 res!137635) b!165259))

(assert (= (and b!165259 res!137636) b!165260))

(assert (= start!35290 b!165261))

(declare-fun m!262659 () Bool)

(assert (=> b!165260 m!262659))

(declare-fun m!262661 () Bool)

(assert (=> b!165260 m!262661))

(declare-fun m!262663 () Bool)

(assert (=> b!165260 m!262663))

(declare-fun m!262665 () Bool)

(assert (=> b!165260 m!262665))

(declare-fun m!262667 () Bool)

(assert (=> b!165260 m!262667))

(declare-fun m!262669 () Bool)

(assert (=> b!165260 m!262669))

(declare-fun m!262671 () Bool)

(assert (=> b!165260 m!262671))

(declare-fun m!262673 () Bool)

(assert (=> b!165258 m!262673))

(declare-fun m!262675 () Bool)

(assert (=> start!35290 m!262675))

(declare-fun m!262677 () Bool)

(assert (=> b!165261 m!262677))

(check-sat (not b!165261) (not b!165258) (not start!35290) (not b!165260))
(check-sat)
(get-model)

(declare-fun d!57255 () Bool)

(assert (=> d!57255 (= (array_inv!3493 (buf!4204 thiss!1577)) (bvsge (size!3752 (buf!4204 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165261 d!57255))

(declare-fun d!57257 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57257 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3752 (buf!4204 thiss!1577))) ((_ sign_extend 32) (currentByte!7878 thiss!1577)) ((_ sign_extend 32) (currentBit!7873 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3752 (buf!4204 thiss!1577))) ((_ sign_extend 32) (currentByte!7878 thiss!1577)) ((_ sign_extend 32) (currentBit!7873 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14223 () Bool)

(assert (= bs!14223 d!57257))

(declare-fun m!262699 () Bool)

(assert (=> bs!14223 m!262699))

(assert (=> b!165258 d!57257))

(declare-fun d!57259 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57259 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7873 thiss!1577) (currentByte!7878 thiss!1577) (size!3752 (buf!4204 thiss!1577))))))

(declare-fun bs!14224 () Bool)

(assert (= bs!14224 d!57259))

(declare-fun m!262701 () Bool)

(assert (=> bs!14224 m!262701))

(assert (=> start!35290 d!57259))

(declare-fun d!57261 () Bool)

(declare-fun res!137650 () Bool)

(declare-fun e!114377 () Bool)

(assert (=> d!57261 (=> res!137650 e!114377)))

(assert (=> d!57261 (= res!137650 (= #b00000000000000000000000000000000 (currentByte!7878 thiss!1577)))))

(assert (=> d!57261 (= (arrayRangesEq!632 (buf!4204 thiss!1577) (array!8404 (store (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577) lt!258552) (size!3752 (buf!4204 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7878 thiss!1577)) e!114377)))

(declare-fun b!165278 () Bool)

(declare-fun e!114378 () Bool)

(assert (=> b!165278 (= e!114377 e!114378)))

(declare-fun res!137651 () Bool)

(assert (=> b!165278 (=> (not res!137651) (not e!114378))))

(assert (=> b!165278 (= res!137651 (= (select (arr!4673 (buf!4204 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4673 (array!8404 (store (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577) lt!258552) (size!3752 (buf!4204 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!165279 () Bool)

(assert (=> b!165279 (= e!114378 (arrayRangesEq!632 (buf!4204 thiss!1577) (array!8404 (store (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577) lt!258552) (size!3752 (buf!4204 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7878 thiss!1577)))))

(assert (= (and d!57261 (not res!137650)) b!165278))

(assert (= (and b!165278 res!137651) b!165279))

(declare-fun m!262703 () Bool)

(assert (=> b!165278 m!262703))

(declare-fun m!262705 () Bool)

(assert (=> b!165278 m!262705))

(declare-fun m!262707 () Bool)

(assert (=> b!165279 m!262707))

(assert (=> b!165260 d!57261))

(declare-fun d!57263 () Bool)

(declare-fun e!114381 () Bool)

(assert (=> d!57263 e!114381))

(declare-fun res!137654 () Bool)

(assert (=> d!57263 (=> (not res!137654) (not e!114381))))

(assert (=> d!57263 (= res!137654 (and (bvsge (currentByte!7878 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7878 thiss!1577) (size!3752 (buf!4204 thiss!1577)))))))

(declare-fun lt!258564 () Unit!11476)

(declare-fun choose!218 (array!8403 (_ BitVec 32) (_ BitVec 8)) Unit!11476)

(assert (=> d!57263 (= lt!258564 (choose!218 (buf!4204 thiss!1577) (currentByte!7878 thiss!1577) lt!258552))))

(assert (=> d!57263 (and (bvsle #b00000000000000000000000000000000 (currentByte!7878 thiss!1577)) (bvslt (currentByte!7878 thiss!1577) (size!3752 (buf!4204 thiss!1577))))))

(assert (=> d!57263 (= (arrayUpdatedAtPrefixLemma!240 (buf!4204 thiss!1577) (currentByte!7878 thiss!1577) lt!258552) lt!258564)))

(declare-fun b!165282 () Bool)

(assert (=> b!165282 (= e!114381 (arrayRangesEq!632 (buf!4204 thiss!1577) (array!8404 (store (arr!4673 (buf!4204 thiss!1577)) (currentByte!7878 thiss!1577) lt!258552) (size!3752 (buf!4204 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7878 thiss!1577)))))

(assert (= (and d!57263 res!137654) b!165282))

(declare-fun m!262709 () Bool)

(assert (=> d!57263 m!262709))

(assert (=> b!165282 m!262665))

(assert (=> b!165282 m!262663))

(assert (=> b!165260 d!57263))

(check-sat (not d!57259) (not b!165282) (not b!165279) (not d!57257) (not d!57263))
(check-sat)
