; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36248 () Bool)

(assert start!36248)

(declare-fun b!167107 () Bool)

(declare-fun res!139121 () Bool)

(declare-fun e!115891 () Bool)

(assert (=> b!167107 (=> (not res!139121) (not e!115891))))

(declare-datatypes ((array!8639 0))(
  ( (array!8640 (arr!4759 (Array (_ BitVec 32) (_ BitVec 8))) (size!3838 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6832 0))(
  ( (BitStream!6833 (buf!4290 array!8639) (currentByte!8120 (_ BitVec 32)) (currentBit!8115 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6832)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167107 (= res!139121 (bvsgt (bvadd (currentBit!8115 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167108 () Bool)

(assert (=> b!167108 (= e!115891 (not true))))

(declare-fun lt!260120 () (_ BitVec 32))

(declare-fun lt!260119 () array!8639)

(declare-fun lt!260115 () (_ BitVec 32))

(declare-fun lt!260118 () (_ BitVec 8))

(declare-fun arrayRangesEq!667 (array!8639 array!8639 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167108 (arrayRangesEq!667 lt!260119 (array!8640 (store (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8115 thiss!1577)))))))) (bvlshr (bvand lt!260120 #b00000000000000000000000011111111) lt!260115)))) (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)) lt!260118) (size!3838 (buf!4290 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)))))

(declare-datatypes ((Unit!11624 0))(
  ( (Unit!11625) )
))
(declare-fun lt!260116 () Unit!11624)

(declare-fun arrayUpdatedAtPrefixLemma!275 (array!8639 (_ BitVec 32) (_ BitVec 8)) Unit!11624)

(assert (=> b!167108 (= lt!260116 (arrayUpdatedAtPrefixLemma!275 lt!260119 (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)) lt!260118))))

(assert (=> b!167108 (arrayRangesEq!667 (buf!4290 thiss!1577) (array!8640 (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) (select (store (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8115 thiss!1577)))))))) (bvlshr (bvand lt!260120 #b00000000000000000000000011111111) lt!260115)))) (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)) lt!260118) (currentByte!8120 thiss!1577))) (size!3838 (buf!4290 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8120 thiss!1577))))

(declare-fun lt!260117 () Unit!11624)

(assert (=> b!167108 (= lt!260117 (arrayUpdatedAtPrefixLemma!275 (buf!4290 thiss!1577) (currentByte!8120 thiss!1577) (select (store (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8115 thiss!1577)))))))) (bvlshr (bvand lt!260120 #b00000000000000000000000011111111) lt!260115)))) (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)) lt!260118) (currentByte!8120 thiss!1577))))))

(declare-fun lt!260114 () (_ BitVec 32))

(assert (=> b!167108 (= lt!260118 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8115 thiss!1577)))))))) (bvlshr (bvand lt!260120 #b00000000000000000000000011111111) lt!260115)))) (bvadd #b00000000000000000000000000000001 (currentByte!8120 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260114))) (bvshl lt!260120 lt!260114))))))

(assert (=> b!167108 (= lt!260114 (bvsub #b00000000000000000000000000001000 lt!260115))))

(assert (=> b!167108 (= lt!260119 (array!8640 (store (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4759 (buf!4290 thiss!1577)) (currentByte!8120 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8115 thiss!1577)))))))) (bvlshr (bvand lt!260120 #b00000000000000000000000011111111) lt!260115)))) (size!3838 (buf!4290 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167108 (= lt!260120 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167108 (= lt!260115 (bvsub (bvadd (currentBit!8115 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167106 () Bool)

(declare-fun res!139120 () Bool)

(assert (=> b!167106 (=> (not res!139120) (not e!115891))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167106 (= res!139120 (validate_offset_bits!1 ((_ sign_extend 32) (size!3838 (buf!4290 thiss!1577))) ((_ sign_extend 32) (currentByte!8120 thiss!1577)) ((_ sign_extend 32) (currentBit!8115 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!139119 () Bool)

(assert (=> start!36248 (=> (not res!139119) (not e!115891))))

(assert (=> start!36248 (= res!139119 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36248 e!115891))

(assert (=> start!36248 true))

(declare-fun e!115893 () Bool)

(declare-fun inv!12 (BitStream!6832) Bool)

(assert (=> start!36248 (and (inv!12 thiss!1577) e!115893)))

(declare-fun b!167109 () Bool)

(declare-fun array_inv!3579 (array!8639) Bool)

(assert (=> b!167109 (= e!115893 (array_inv!3579 (buf!4290 thiss!1577)))))

(assert (= (and start!36248 res!139119) b!167106))

(assert (= (and b!167106 res!139120) b!167107))

(assert (= (and b!167107 res!139121) b!167108))

(assert (= start!36248 b!167109))

(declare-fun m!265661 () Bool)

(assert (=> b!167108 m!265661))

(declare-fun m!265663 () Bool)

(assert (=> b!167108 m!265663))

(declare-fun m!265665 () Bool)

(assert (=> b!167108 m!265665))

(declare-fun m!265667 () Bool)

(assert (=> b!167108 m!265667))

(declare-fun m!265669 () Bool)

(assert (=> b!167108 m!265669))

(declare-fun m!265671 () Bool)

(assert (=> b!167108 m!265671))

(declare-fun m!265673 () Bool)

(assert (=> b!167108 m!265673))

(declare-fun m!265675 () Bool)

(assert (=> b!167108 m!265675))

(assert (=> b!167108 m!265663))

(declare-fun m!265677 () Bool)

(assert (=> b!167108 m!265677))

(declare-fun m!265679 () Bool)

(assert (=> b!167108 m!265679))

(declare-fun m!265681 () Bool)

(assert (=> b!167108 m!265681))

(declare-fun m!265683 () Bool)

(assert (=> b!167108 m!265683))

(declare-fun m!265685 () Bool)

(assert (=> b!167108 m!265685))

(declare-fun m!265687 () Bool)

(assert (=> b!167106 m!265687))

(declare-fun m!265689 () Bool)

(assert (=> start!36248 m!265689))

(declare-fun m!265691 () Bool)

(assert (=> b!167109 m!265691))

(push 1)

(assert (not b!167108))

(assert (not b!167109))

(assert (not b!167106))

(assert (not start!36248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

