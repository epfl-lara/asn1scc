; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34564 () Bool)

(assert start!34564)

(declare-fun res!136609 () Bool)

(declare-fun e!113240 () Bool)

(assert (=> start!34564 (=> (not res!136609) (not e!113240))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34564 (= res!136609 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34564 e!113240))

(assert (=> start!34564 true))

(declare-datatypes ((array!8179 0))(
  ( (array!8180 (arr!4584 (Array (_ BitVec 32) (_ BitVec 8))) (size!3663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6482 0))(
  ( (BitStream!6483 (buf!4115 array!8179) (currentByte!7674 (_ BitVec 32)) (currentBit!7669 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6482)

(declare-fun e!113242 () Bool)

(declare-fun inv!12 (BitStream!6482) Bool)

(assert (=> start!34564 (and (inv!12 thiss!1577) e!113242)))

(declare-fun b!163948 () Bool)

(declare-fun res!136611 () Bool)

(assert (=> b!163948 (=> (not res!136611) (not e!113240))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163948 (= res!136611 (validate_offset_bits!1 ((_ sign_extend 32) (size!3663 (buf!4115 thiss!1577))) ((_ sign_extend 32) (currentByte!7674 thiss!1577)) ((_ sign_extend 32) (currentBit!7669 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163950 () Bool)

(assert (=> b!163950 (= e!113240 (not true))))

(declare-fun lt!257300 () (_ BitVec 32))

(declare-fun lt!257301 () (_ BitVec 32))

(declare-fun lt!257299 () array!8179)

(declare-fun lt!257304 () (_ BitVec 8))

(declare-fun arrayRangesEq!597 (array!8179 array!8179 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163950 (arrayRangesEq!597 lt!257299 (array!8180 (store (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7669 thiss!1577)))))))) (bvlshr (bvand lt!257300 #b00000000000000000000000011111111) lt!257301)))) (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)) lt!257304) (size!3663 (buf!4115 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)))))

(declare-datatypes ((Unit!11403 0))(
  ( (Unit!11404) )
))
(declare-fun lt!257298 () Unit!11403)

(declare-fun arrayUpdatedAtPrefixLemma!205 (array!8179 (_ BitVec 32) (_ BitVec 8)) Unit!11403)

(assert (=> b!163950 (= lt!257298 (arrayUpdatedAtPrefixLemma!205 lt!257299 (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)) lt!257304))))

(assert (=> b!163950 (arrayRangesEq!597 (buf!4115 thiss!1577) (array!8180 (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) (select (store (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7669 thiss!1577)))))))) (bvlshr (bvand lt!257300 #b00000000000000000000000011111111) lt!257301)))) (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)) lt!257304) (currentByte!7674 thiss!1577))) (size!3663 (buf!4115 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7674 thiss!1577))))

(declare-fun lt!257303 () Unit!11403)

(assert (=> b!163950 (= lt!257303 (arrayUpdatedAtPrefixLemma!205 (buf!4115 thiss!1577) (currentByte!7674 thiss!1577) (select (store (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7669 thiss!1577)))))))) (bvlshr (bvand lt!257300 #b00000000000000000000000011111111) lt!257301)))) (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)) lt!257304) (currentByte!7674 thiss!1577))))))

(declare-fun lt!257302 () (_ BitVec 32))

(assert (=> b!163950 (= lt!257304 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7669 thiss!1577)))))))) (bvlshr (bvand lt!257300 #b00000000000000000000000011111111) lt!257301)))) (bvadd #b00000000000000000000000000000001 (currentByte!7674 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257302))) (bvshl lt!257300 lt!257302))))))

(assert (=> b!163950 (= lt!257302 (bvsub #b00000000000000000000000000001000 lt!257301))))

(assert (=> b!163950 (= lt!257299 (array!8180 (store (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4584 (buf!4115 thiss!1577)) (currentByte!7674 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7669 thiss!1577)))))))) (bvlshr (bvand lt!257300 #b00000000000000000000000011111111) lt!257301)))) (size!3663 (buf!4115 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163950 (= lt!257300 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163950 (= lt!257301 (bvsub (bvadd (currentBit!7669 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163949 () Bool)

(declare-fun res!136610 () Bool)

(assert (=> b!163949 (=> (not res!136610) (not e!113240))))

(assert (=> b!163949 (= res!136610 (bvsgt (bvadd (currentBit!7669 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163951 () Bool)

(declare-fun array_inv!3404 (array!8179) Bool)

(assert (=> b!163951 (= e!113242 (array_inv!3404 (buf!4115 thiss!1577)))))

(assert (= (and start!34564 res!136609) b!163948))

(assert (= (and b!163948 res!136611) b!163949))

(assert (= (and b!163949 res!136610) b!163950))

(assert (= start!34564 b!163951))

(declare-fun m!260317 () Bool)

(assert (=> start!34564 m!260317))

(declare-fun m!260319 () Bool)

(assert (=> b!163948 m!260319))

(declare-fun m!260321 () Bool)

(assert (=> b!163950 m!260321))

(declare-fun m!260323 () Bool)

(assert (=> b!163950 m!260323))

(declare-fun m!260325 () Bool)

(assert (=> b!163950 m!260325))

(declare-fun m!260327 () Bool)

(assert (=> b!163950 m!260327))

(declare-fun m!260329 () Bool)

(assert (=> b!163950 m!260329))

(assert (=> b!163950 m!260323))

(declare-fun m!260331 () Bool)

(assert (=> b!163950 m!260331))

(declare-fun m!260333 () Bool)

(assert (=> b!163950 m!260333))

(declare-fun m!260335 () Bool)

(assert (=> b!163950 m!260335))

(declare-fun m!260337 () Bool)

(assert (=> b!163950 m!260337))

(declare-fun m!260339 () Bool)

(assert (=> b!163950 m!260339))

(declare-fun m!260341 () Bool)

(assert (=> b!163950 m!260341))

(declare-fun m!260343 () Bool)

(assert (=> b!163950 m!260343))

(declare-fun m!260345 () Bool)

(assert (=> b!163950 m!260345))

(declare-fun m!260347 () Bool)

(assert (=> b!163951 m!260347))

(push 1)

(assert (not b!163951))

(assert (not b!163950))

(assert (not b!163948))

