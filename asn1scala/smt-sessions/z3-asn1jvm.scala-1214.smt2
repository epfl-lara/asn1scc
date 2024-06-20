; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34550 () Bool)

(assert start!34550)

(declare-fun b!163864 () Bool)

(declare-fun res!136546 () Bool)

(declare-fun e!113177 () Bool)

(assert (=> b!163864 (=> (not res!136546) (not e!113177))))

(declare-datatypes ((array!8165 0))(
  ( (array!8166 (arr!4577 (Array (_ BitVec 32) (_ BitVec 8))) (size!3656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6468 0))(
  ( (BitStream!6469 (buf!4108 array!8165) (currentByte!7667 (_ BitVec 32)) (currentBit!7662 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6468)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163864 (= res!136546 (validate_offset_bits!1 ((_ sign_extend 32) (size!3656 (buf!4108 thiss!1577))) ((_ sign_extend 32) (currentByte!7667 thiss!1577)) ((_ sign_extend 32) (currentBit!7662 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163866 () Bool)

(assert (=> b!163866 (= e!113177 (not true))))

(declare-fun lt!257155 () (_ BitVec 32))

(declare-fun lt!257152 () (_ BitVec 32))

(declare-fun lt!257153 () array!8165)

(declare-fun lt!257154 () (_ BitVec 8))

(declare-fun arrayRangesEq!590 (array!8165 array!8165 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163866 (arrayRangesEq!590 lt!257153 (array!8166 (store (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7662 thiss!1577)))))))) (bvlshr (bvand lt!257152 #b00000000000000000000000011111111) lt!257155)))) (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)) lt!257154) (size!3656 (buf!4108 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)))))

(declare-datatypes ((Unit!11389 0))(
  ( (Unit!11390) )
))
(declare-fun lt!257157 () Unit!11389)

(declare-fun arrayUpdatedAtPrefixLemma!198 (array!8165 (_ BitVec 32) (_ BitVec 8)) Unit!11389)

(assert (=> b!163866 (= lt!257157 (arrayUpdatedAtPrefixLemma!198 lt!257153 (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)) lt!257154))))

(assert (=> b!163866 (arrayRangesEq!590 (buf!4108 thiss!1577) (array!8166 (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) (select (store (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7662 thiss!1577)))))))) (bvlshr (bvand lt!257152 #b00000000000000000000000011111111) lt!257155)))) (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)) lt!257154) (currentByte!7667 thiss!1577))) (size!3656 (buf!4108 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7667 thiss!1577))))

(declare-fun lt!257156 () Unit!11389)

(assert (=> b!163866 (= lt!257156 (arrayUpdatedAtPrefixLemma!198 (buf!4108 thiss!1577) (currentByte!7667 thiss!1577) (select (store (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7662 thiss!1577)))))))) (bvlshr (bvand lt!257152 #b00000000000000000000000011111111) lt!257155)))) (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)) lt!257154) (currentByte!7667 thiss!1577))))))

(declare-fun lt!257151 () (_ BitVec 32))

(assert (=> b!163866 (= lt!257154 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7662 thiss!1577)))))))) (bvlshr (bvand lt!257152 #b00000000000000000000000011111111) lt!257155)))) (bvadd #b00000000000000000000000000000001 (currentByte!7667 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257151))) (bvshl lt!257152 lt!257151))))))

(assert (=> b!163866 (= lt!257151 (bvsub #b00000000000000000000000000001000 lt!257155))))

(assert (=> b!163866 (= lt!257153 (array!8166 (store (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4577 (buf!4108 thiss!1577)) (currentByte!7667 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7662 thiss!1577)))))))) (bvlshr (bvand lt!257152 #b00000000000000000000000011111111) lt!257155)))) (size!3656 (buf!4108 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163866 (= lt!257152 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163866 (= lt!257155 (bvsub (bvadd (currentBit!7662 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136548 () Bool)

(assert (=> start!34550 (=> (not res!136548) (not e!113177))))

(assert (=> start!34550 (= res!136548 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34550 e!113177))

(assert (=> start!34550 true))

(declare-fun e!113179 () Bool)

(declare-fun inv!12 (BitStream!6468) Bool)

(assert (=> start!34550 (and (inv!12 thiss!1577) e!113179)))

(declare-fun b!163867 () Bool)

(declare-fun array_inv!3397 (array!8165) Bool)

(assert (=> b!163867 (= e!113179 (array_inv!3397 (buf!4108 thiss!1577)))))

(declare-fun b!163865 () Bool)

(declare-fun res!136547 () Bool)

(assert (=> b!163865 (=> (not res!136547) (not e!113177))))

(assert (=> b!163865 (= res!136547 (bvsgt (bvadd (currentBit!7662 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34550 res!136548) b!163864))

(assert (= (and b!163864 res!136546) b!163865))

(assert (= (and b!163865 res!136547) b!163866))

(assert (= start!34550 b!163867))

(declare-fun m!260093 () Bool)

(assert (=> b!163864 m!260093))

(declare-fun m!260095 () Bool)

(assert (=> b!163866 m!260095))

(declare-fun m!260097 () Bool)

(assert (=> b!163866 m!260097))

(declare-fun m!260099 () Bool)

(assert (=> b!163866 m!260099))

(declare-fun m!260101 () Bool)

(assert (=> b!163866 m!260101))

(declare-fun m!260103 () Bool)

(assert (=> b!163866 m!260103))

(declare-fun m!260105 () Bool)

(assert (=> b!163866 m!260105))

(declare-fun m!260107 () Bool)

(assert (=> b!163866 m!260107))

(declare-fun m!260109 () Bool)

(assert (=> b!163866 m!260109))

(declare-fun m!260111 () Bool)

(assert (=> b!163866 m!260111))

(declare-fun m!260113 () Bool)

(assert (=> b!163866 m!260113))

(declare-fun m!260115 () Bool)

(assert (=> b!163866 m!260115))

(assert (=> b!163866 m!260101))

(declare-fun m!260117 () Bool)

(assert (=> b!163866 m!260117))

(declare-fun m!260119 () Bool)

(assert (=> b!163866 m!260119))

(declare-fun m!260121 () Bool)

(assert (=> start!34550 m!260121))

(declare-fun m!260123 () Bool)

(assert (=> b!163867 m!260123))

(check-sat (not start!34550) (not b!163864) (not b!163866) (not b!163867))
