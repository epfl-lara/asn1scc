; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34546 () Bool)

(assert start!34546)

(declare-fun b!163841 () Bool)

(declare-fun res!136530 () Bool)

(declare-fun e!113159 () Bool)

(assert (=> b!163841 (=> (not res!136530) (not e!113159))))

(declare-datatypes ((array!8161 0))(
  ( (array!8162 (arr!4575 (Array (_ BitVec 32) (_ BitVec 8))) (size!3654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6464 0))(
  ( (BitStream!6465 (buf!4106 array!8161) (currentByte!7665 (_ BitVec 32)) (currentBit!7660 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6464)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163841 (= res!136530 (bvsgt (bvadd (currentBit!7660 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163840 () Bool)

(declare-fun res!136529 () Bool)

(assert (=> b!163840 (=> (not res!136529) (not e!113159))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163840 (= res!136529 (validate_offset_bits!1 ((_ sign_extend 32) (size!3654 (buf!4106 thiss!1577))) ((_ sign_extend 32) (currentByte!7665 thiss!1577)) ((_ sign_extend 32) (currentBit!7660 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136528 () Bool)

(assert (=> start!34546 (=> (not res!136528) (not e!113159))))

(assert (=> start!34546 (= res!136528 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34546 e!113159))

(assert (=> start!34546 true))

(declare-fun e!113160 () Bool)

(declare-fun inv!12 (BitStream!6464) Bool)

(assert (=> start!34546 (and (inv!12 thiss!1577) e!113160)))

(declare-fun b!163842 () Bool)

(assert (=> b!163842 (= e!113159 (not true))))

(declare-fun lt!257113 () (_ BitVec 32))

(declare-fun lt!257114 () (_ BitVec 32))

(declare-fun lt!257115 () (_ BitVec 32))

(declare-fun arrayRangesEq!588 (array!8161 array!8161 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163842 (arrayRangesEq!588 (buf!4106 thiss!1577) (array!8162 (store (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577) (select (store (store (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7660 thiss!1577)))))))) (bvlshr (bvand lt!257114 #b00000000000000000000000011111111) lt!257113)))) (bvadd #b00000000000000000000000000000001 (currentByte!7665 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7660 thiss!1577)))))))) (bvlshr (bvand lt!257114 #b00000000000000000000000011111111) lt!257113)))) (bvadd #b00000000000000000000000000000001 (currentByte!7665 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257115))) (bvshl lt!257114 lt!257115)))) (currentByte!7665 thiss!1577))) (size!3654 (buf!4106 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7665 thiss!1577))))

(declare-datatypes ((Unit!11385 0))(
  ( (Unit!11386) )
))
(declare-fun lt!257112 () Unit!11385)

(declare-fun arrayUpdatedAtPrefixLemma!196 (array!8161 (_ BitVec 32) (_ BitVec 8)) Unit!11385)

(assert (=> b!163842 (= lt!257112 (arrayUpdatedAtPrefixLemma!196 (buf!4106 thiss!1577) (currentByte!7665 thiss!1577) (select (store (store (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7660 thiss!1577)))))))) (bvlshr (bvand lt!257114 #b00000000000000000000000011111111) lt!257113)))) (bvadd #b00000000000000000000000000000001 (currentByte!7665 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4575 (buf!4106 thiss!1577)) (currentByte!7665 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7660 thiss!1577)))))))) (bvlshr (bvand lt!257114 #b00000000000000000000000011111111) lt!257113)))) (bvadd #b00000000000000000000000000000001 (currentByte!7665 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257115))) (bvshl lt!257114 lt!257115)))) (currentByte!7665 thiss!1577))))))

(assert (=> b!163842 (= lt!257115 (bvsub #b00000000000000000000000000001000 lt!257113))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163842 (= lt!257114 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163842 (= lt!257113 (bvsub (bvadd (currentBit!7660 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163843 () Bool)

(declare-fun array_inv!3395 (array!8161) Bool)

(assert (=> b!163843 (= e!113160 (array_inv!3395 (buf!4106 thiss!1577)))))

(assert (= (and start!34546 res!136528) b!163840))

(assert (= (and b!163840 res!136529) b!163841))

(assert (= (and b!163841 res!136530) b!163842))

(assert (= start!34546 b!163843))

(declare-fun m!260033 () Bool)

(assert (=> b!163840 m!260033))

(declare-fun m!260035 () Bool)

(assert (=> start!34546 m!260035))

(declare-fun m!260037 () Bool)

(assert (=> b!163842 m!260037))

(declare-fun m!260039 () Bool)

(assert (=> b!163842 m!260039))

(declare-fun m!260041 () Bool)

(assert (=> b!163842 m!260041))

(declare-fun m!260043 () Bool)

(assert (=> b!163842 m!260043))

(declare-fun m!260045 () Bool)

(assert (=> b!163842 m!260045))

(declare-fun m!260047 () Bool)

(assert (=> b!163842 m!260047))

(declare-fun m!260049 () Bool)

(assert (=> b!163842 m!260049))

(declare-fun m!260051 () Bool)

(assert (=> b!163842 m!260051))

(declare-fun m!260053 () Bool)

(assert (=> b!163842 m!260053))

(declare-fun m!260055 () Bool)

(assert (=> b!163842 m!260055))

(assert (=> b!163842 m!260047))

(declare-fun m!260057 () Bool)

(assert (=> b!163842 m!260057))

(declare-fun m!260059 () Bool)

(assert (=> b!163843 m!260059))

(push 1)

(assert (not start!34546))

