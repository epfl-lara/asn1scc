; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35306 () Bool)

(assert start!35306)

(declare-fun b!165304 () Bool)

(declare-fun res!137670 () Bool)

(declare-fun e!114399 () Bool)

(assert (=> b!165304 (=> (not res!137670) (not e!114399))))

(declare-datatypes ((array!8410 0))(
  ( (array!8411 (arr!4676 (Array (_ BitVec 32) (_ BitVec 8))) (size!3755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6666 0))(
  ( (BitStream!6667 (buf!4207 array!8410) (currentByte!7882 (_ BitVec 32)) (currentBit!7877 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6666)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!165304 (= res!137670 (bvsle (bvadd (currentBit!7877 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165306 () Bool)

(declare-fun e!114398 () Bool)

(declare-fun array_inv!3496 (array!8410) Bool)

(assert (=> b!165306 (= e!114398 (array_inv!3496 (buf!4207 thiss!1577)))))

(declare-fun b!165305 () Bool)

(assert (=> b!165305 (= e!114399 (not (and (bvsge (currentByte!7882 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7882 thiss!1577) (size!3755 (buf!4207 thiss!1577))))))))

(declare-fun lt!258581 () (_ BitVec 8))

(declare-fun arrayRangesEq!635 (array!8410 array!8410 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165305 (arrayRangesEq!635 (buf!4207 thiss!1577) (array!8411 (store (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577) lt!258581) (size!3755 (buf!4207 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7882 thiss!1577))))

(declare-datatypes ((Unit!11482 0))(
  ( (Unit!11483) )
))
(declare-fun lt!258580 () Unit!11482)

(declare-fun arrayUpdatedAtPrefixLemma!243 (array!8410 (_ BitVec 32) (_ BitVec 8)) Unit!11482)

(assert (=> b!165305 (= lt!258580 (arrayUpdatedAtPrefixLemma!243 (buf!4207 thiss!1577) (currentByte!7882 thiss!1577) lt!258581))))

(declare-fun lt!258582 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165305 (= lt!258581 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7877 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258582)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258582))))))

(assert (=> b!165305 (= lt!258582 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7877 thiss!1577) nBits!511)))))

(declare-fun res!137671 () Bool)

(assert (=> start!35306 (=> (not res!137671) (not e!114399))))

(assert (=> start!35306 (= res!137671 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35306 e!114399))

(assert (=> start!35306 true))

(declare-fun inv!12 (BitStream!6666) Bool)

(assert (=> start!35306 (and (inv!12 thiss!1577) e!114398)))

(declare-fun b!165303 () Bool)

(declare-fun res!137672 () Bool)

(assert (=> b!165303 (=> (not res!137672) (not e!114399))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165303 (= res!137672 (validate_offset_bits!1 ((_ sign_extend 32) (size!3755 (buf!4207 thiss!1577))) ((_ sign_extend 32) (currentByte!7882 thiss!1577)) ((_ sign_extend 32) (currentBit!7877 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35306 res!137671) b!165303))

(assert (= (and b!165303 res!137672) b!165304))

(assert (= (and b!165304 res!137670) b!165305))

(assert (= start!35306 b!165306))

(declare-fun m!262731 () Bool)

(assert (=> b!165306 m!262731))

(declare-fun m!262733 () Bool)

(assert (=> b!165305 m!262733))

(declare-fun m!262735 () Bool)

(assert (=> b!165305 m!262735))

(declare-fun m!262737 () Bool)

(assert (=> b!165305 m!262737))

(declare-fun m!262739 () Bool)

(assert (=> b!165305 m!262739))

(declare-fun m!262741 () Bool)

(assert (=> b!165305 m!262741))

(declare-fun m!262743 () Bool)

(assert (=> b!165305 m!262743))

(declare-fun m!262745 () Bool)

(assert (=> b!165305 m!262745))

(declare-fun m!262747 () Bool)

(assert (=> start!35306 m!262747))

(declare-fun m!262749 () Bool)

(assert (=> b!165303 m!262749))

(check-sat (not b!165303) (not start!35306) (not b!165305) (not b!165306))
(check-sat)
(get-model)

(declare-fun d!57267 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57267 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3755 (buf!4207 thiss!1577))) ((_ sign_extend 32) (currentByte!7882 thiss!1577)) ((_ sign_extend 32) (currentBit!7877 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3755 (buf!4207 thiss!1577))) ((_ sign_extend 32) (currentByte!7882 thiss!1577)) ((_ sign_extend 32) (currentBit!7877 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14228 () Bool)

(assert (= bs!14228 d!57267))

(declare-fun m!262771 () Bool)

(assert (=> bs!14228 m!262771))

(assert (=> b!165303 d!57267))

(declare-fun d!57269 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57269 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7877 thiss!1577) (currentByte!7882 thiss!1577) (size!3755 (buf!4207 thiss!1577))))))

(declare-fun bs!14229 () Bool)

(assert (= bs!14229 d!57269))

(declare-fun m!262773 () Bool)

(assert (=> bs!14229 m!262773))

(assert (=> start!35306 d!57269))

(declare-fun d!57271 () Bool)

(declare-fun res!137686 () Bool)

(declare-fun e!114413 () Bool)

(assert (=> d!57271 (=> res!137686 e!114413)))

(assert (=> d!57271 (= res!137686 (= #b00000000000000000000000000000000 (currentByte!7882 thiss!1577)))))

(assert (=> d!57271 (= (arrayRangesEq!635 (buf!4207 thiss!1577) (array!8411 (store (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577) lt!258581) (size!3755 (buf!4207 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7882 thiss!1577)) e!114413)))

(declare-fun b!165323 () Bool)

(declare-fun e!114414 () Bool)

(assert (=> b!165323 (= e!114413 e!114414)))

(declare-fun res!137687 () Bool)

(assert (=> b!165323 (=> (not res!137687) (not e!114414))))

(assert (=> b!165323 (= res!137687 (= (select (arr!4676 (buf!4207 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4676 (array!8411 (store (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577) lt!258581) (size!3755 (buf!4207 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!165324 () Bool)

(assert (=> b!165324 (= e!114414 (arrayRangesEq!635 (buf!4207 thiss!1577) (array!8411 (store (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577) lt!258581) (size!3755 (buf!4207 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7882 thiss!1577)))))

(assert (= (and d!57271 (not res!137686)) b!165323))

(assert (= (and b!165323 res!137687) b!165324))

(declare-fun m!262775 () Bool)

(assert (=> b!165323 m!262775))

(declare-fun m!262777 () Bool)

(assert (=> b!165323 m!262777))

(declare-fun m!262779 () Bool)

(assert (=> b!165324 m!262779))

(assert (=> b!165305 d!57271))

(declare-fun d!57273 () Bool)

(declare-fun e!114417 () Bool)

(assert (=> d!57273 e!114417))

(declare-fun res!137690 () Bool)

(assert (=> d!57273 (=> (not res!137690) (not e!114417))))

(assert (=> d!57273 (= res!137690 (and (bvsge (currentByte!7882 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7882 thiss!1577) (size!3755 (buf!4207 thiss!1577)))))))

(declare-fun lt!258594 () Unit!11482)

(declare-fun choose!219 (array!8410 (_ BitVec 32) (_ BitVec 8)) Unit!11482)

(assert (=> d!57273 (= lt!258594 (choose!219 (buf!4207 thiss!1577) (currentByte!7882 thiss!1577) lt!258581))))

(assert (=> d!57273 (and (bvsle #b00000000000000000000000000000000 (currentByte!7882 thiss!1577)) (bvslt (currentByte!7882 thiss!1577) (size!3755 (buf!4207 thiss!1577))))))

(assert (=> d!57273 (= (arrayUpdatedAtPrefixLemma!243 (buf!4207 thiss!1577) (currentByte!7882 thiss!1577) lt!258581) lt!258594)))

(declare-fun b!165327 () Bool)

(assert (=> b!165327 (= e!114417 (arrayRangesEq!635 (buf!4207 thiss!1577) (array!8411 (store (arr!4676 (buf!4207 thiss!1577)) (currentByte!7882 thiss!1577) lt!258581) (size!3755 (buf!4207 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7882 thiss!1577)))))

(assert (= (and d!57273 res!137690) b!165327))

(declare-fun m!262781 () Bool)

(assert (=> d!57273 m!262781))

(assert (=> b!165327 m!262737))

(assert (=> b!165327 m!262739))

(assert (=> b!165305 d!57273))

(declare-fun d!57275 () Bool)

(assert (=> d!57275 (= (array_inv!3496 (buf!4207 thiss!1577)) (bvsge (size!3755 (buf!4207 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165306 d!57275))

(check-sat (not d!57269) (not d!57267) (not b!165327) (not b!165324) (not d!57273))
(check-sat)
