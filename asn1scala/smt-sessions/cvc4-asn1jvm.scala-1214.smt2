; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34552 () Bool)

(assert start!34552)

(declare-fun b!163877 () Bool)

(declare-fun res!136557 () Bool)

(declare-fun e!113188 () Bool)

(assert (=> b!163877 (=> (not res!136557) (not e!113188))))

(declare-datatypes ((array!8167 0))(
  ( (array!8168 (arr!4578 (Array (_ BitVec 32) (_ BitVec 8))) (size!3657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6470 0))(
  ( (BitStream!6471 (buf!4109 array!8167) (currentByte!7668 (_ BitVec 32)) (currentBit!7663 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6470)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163877 (= res!136557 (bvsgt (bvadd (currentBit!7663 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163878 () Bool)

(assert (=> b!163878 (= e!113188 (not true))))

(declare-fun lt!257173 () (_ BitVec 32))

(declare-fun lt!257178 () array!8167)

(declare-fun lt!257174 () (_ BitVec 32))

(declare-fun lt!257177 () (_ BitVec 8))

(declare-fun arrayRangesEq!591 (array!8167 array!8167 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163878 (arrayRangesEq!591 lt!257178 (array!8168 (store (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7663 thiss!1577)))))))) (bvlshr (bvand lt!257173 #b00000000000000000000000011111111) lt!257174)))) (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)) lt!257177) (size!3657 (buf!4109 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)))))

(declare-datatypes ((Unit!11391 0))(
  ( (Unit!11392) )
))
(declare-fun lt!257172 () Unit!11391)

(declare-fun arrayUpdatedAtPrefixLemma!199 (array!8167 (_ BitVec 32) (_ BitVec 8)) Unit!11391)

(assert (=> b!163878 (= lt!257172 (arrayUpdatedAtPrefixLemma!199 lt!257178 (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)) lt!257177))))

(assert (=> b!163878 (arrayRangesEq!591 (buf!4109 thiss!1577) (array!8168 (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) (select (store (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7663 thiss!1577)))))))) (bvlshr (bvand lt!257173 #b00000000000000000000000011111111) lt!257174)))) (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)) lt!257177) (currentByte!7668 thiss!1577))) (size!3657 (buf!4109 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7668 thiss!1577))))

(declare-fun lt!257175 () Unit!11391)

(assert (=> b!163878 (= lt!257175 (arrayUpdatedAtPrefixLemma!199 (buf!4109 thiss!1577) (currentByte!7668 thiss!1577) (select (store (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7663 thiss!1577)))))))) (bvlshr (bvand lt!257173 #b00000000000000000000000011111111) lt!257174)))) (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)) lt!257177) (currentByte!7668 thiss!1577))))))

(declare-fun lt!257176 () (_ BitVec 32))

(assert (=> b!163878 (= lt!257177 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7663 thiss!1577)))))))) (bvlshr (bvand lt!257173 #b00000000000000000000000011111111) lt!257174)))) (bvadd #b00000000000000000000000000000001 (currentByte!7668 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257176))) (bvshl lt!257173 lt!257176))))))

(assert (=> b!163878 (= lt!257176 (bvsub #b00000000000000000000000000001000 lt!257174))))

(assert (=> b!163878 (= lt!257178 (array!8168 (store (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4578 (buf!4109 thiss!1577)) (currentByte!7668 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7663 thiss!1577)))))))) (bvlshr (bvand lt!257173 #b00000000000000000000000011111111) lt!257174)))) (size!3657 (buf!4109 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163878 (= lt!257173 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163878 (= lt!257174 (bvsub (bvadd (currentBit!7663 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136556 () Bool)

(assert (=> start!34552 (=> (not res!136556) (not e!113188))))

(assert (=> start!34552 (= res!136556 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34552 e!113188))

(assert (=> start!34552 true))

(declare-fun e!113186 () Bool)

(declare-fun inv!12 (BitStream!6470) Bool)

(assert (=> start!34552 (and (inv!12 thiss!1577) e!113186)))

(declare-fun b!163879 () Bool)

(declare-fun array_inv!3398 (array!8167) Bool)

(assert (=> b!163879 (= e!113186 (array_inv!3398 (buf!4109 thiss!1577)))))

(declare-fun b!163876 () Bool)

(declare-fun res!136555 () Bool)

(assert (=> b!163876 (=> (not res!136555) (not e!113188))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163876 (= res!136555 (validate_offset_bits!1 ((_ sign_extend 32) (size!3657 (buf!4109 thiss!1577))) ((_ sign_extend 32) (currentByte!7668 thiss!1577)) ((_ sign_extend 32) (currentBit!7663 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34552 res!136556) b!163876))

(assert (= (and b!163876 res!136555) b!163877))

(assert (= (and b!163877 res!136557) b!163878))

(assert (= start!34552 b!163879))

(declare-fun m!260125 () Bool)

(assert (=> b!163878 m!260125))

(declare-fun m!260127 () Bool)

(assert (=> b!163878 m!260127))

(declare-fun m!260129 () Bool)

(assert (=> b!163878 m!260129))

(declare-fun m!260131 () Bool)

(assert (=> b!163878 m!260131))

(declare-fun m!260133 () Bool)

(assert (=> b!163878 m!260133))

(declare-fun m!260135 () Bool)

(assert (=> b!163878 m!260135))

(declare-fun m!260137 () Bool)

(assert (=> b!163878 m!260137))

(declare-fun m!260139 () Bool)

(assert (=> b!163878 m!260139))

(declare-fun m!260141 () Bool)

(assert (=> b!163878 m!260141))

(assert (=> b!163878 m!260127))

(declare-fun m!260143 () Bool)

(assert (=> b!163878 m!260143))

(declare-fun m!260145 () Bool)

(assert (=> b!163878 m!260145))

(declare-fun m!260147 () Bool)

(assert (=> b!163878 m!260147))

(declare-fun m!260149 () Bool)

(assert (=> b!163878 m!260149))

(declare-fun m!260151 () Bool)

(assert (=> start!34552 m!260151))

(declare-fun m!260153 () Bool)

(assert (=> b!163879 m!260153))

(declare-fun m!260155 () Bool)

(assert (=> b!163876 m!260155))

(push 1)

(assert (not b!163878))

