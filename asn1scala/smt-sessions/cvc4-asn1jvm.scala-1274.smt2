; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36246 () Bool)

(assert start!36246)

(declare-fun b!167093 () Bool)

(declare-fun e!115882 () Bool)

(declare-datatypes ((array!8637 0))(
  ( (array!8638 (arr!4758 (Array (_ BitVec 32) (_ BitVec 8))) (size!3837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6830 0))(
  ( (BitStream!6831 (buf!4289 array!8637) (currentByte!8119 (_ BitVec 32)) (currentBit!8114 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6830)

(declare-fun array_inv!3578 (array!8637) Bool)

(assert (=> b!167093 (= e!115882 (array_inv!3578 (buf!4289 thiss!1577)))))

(declare-fun b!167094 () Bool)

(declare-fun res!139110 () Bool)

(declare-fun e!115881 () Bool)

(assert (=> b!167094 (=> (not res!139110) (not e!115881))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167094 (= res!139110 (validate_offset_bits!1 ((_ sign_extend 32) (size!3837 (buf!4289 thiss!1577))) ((_ sign_extend 32) (currentByte!8119 thiss!1577)) ((_ sign_extend 32) (currentBit!8114 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!139111 () Bool)

(assert (=> start!36246 (=> (not res!139111) (not e!115881))))

(assert (=> start!36246 (= res!139111 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36246 e!115881))

(assert (=> start!36246 true))

(declare-fun inv!12 (BitStream!6830) Bool)

(assert (=> start!36246 (and (inv!12 thiss!1577) e!115882)))

(declare-fun b!167095 () Bool)

(declare-fun res!139112 () Bool)

(assert (=> b!167095 (=> (not res!139112) (not e!115881))))

(assert (=> b!167095 (= res!139112 (bvsgt (bvadd (currentBit!8114 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167096 () Bool)

(declare-fun e!115884 () Bool)

(assert (=> b!167096 (= e!115881 (not e!115884))))

(declare-fun res!139109 () Bool)

(assert (=> b!167096 (=> res!139109 e!115884)))

(assert (=> b!167096 (= res!139109 (or (bvsgt #b00000000000000000000000000000000 (currentByte!8119 thiss!1577)) (bvsgt (currentByte!8119 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577))) (bvsgt (currentByte!8119 thiss!1577) (size!3837 (buf!4289 thiss!1577))) (bvsgt (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)) (size!3837 (buf!4289 thiss!1577)))))))

(declare-fun lt!260093 () (_ BitVec 32))

(declare-fun lt!260097 () array!8637)

(declare-fun lt!260095 () (_ BitVec 32))

(declare-fun lt!260099 () (_ BitVec 8))

(declare-fun arrayRangesEq!666 (array!8637 array!8637 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167096 (arrayRangesEq!666 lt!260097 (array!8638 (store (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8114 thiss!1577)))))))) (bvlshr (bvand lt!260093 #b00000000000000000000000011111111) lt!260095)))) (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)) lt!260099) (size!3837 (buf!4289 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)))))

(declare-datatypes ((Unit!11622 0))(
  ( (Unit!11623) )
))
(declare-fun lt!260094 () Unit!11622)

(declare-fun arrayUpdatedAtPrefixLemma!274 (array!8637 (_ BitVec 32) (_ BitVec 8)) Unit!11622)

(assert (=> b!167096 (= lt!260094 (arrayUpdatedAtPrefixLemma!274 lt!260097 (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)) lt!260099))))

(assert (=> b!167096 (arrayRangesEq!666 (buf!4289 thiss!1577) (array!8638 (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) (select (store (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8114 thiss!1577)))))))) (bvlshr (bvand lt!260093 #b00000000000000000000000011111111) lt!260095)))) (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)) lt!260099) (currentByte!8119 thiss!1577))) (size!3837 (buf!4289 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8119 thiss!1577))))

(declare-fun lt!260098 () Unit!11622)

(assert (=> b!167096 (= lt!260098 (arrayUpdatedAtPrefixLemma!274 (buf!4289 thiss!1577) (currentByte!8119 thiss!1577) (select (store (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8114 thiss!1577)))))))) (bvlshr (bvand lt!260093 #b00000000000000000000000011111111) lt!260095)))) (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)) lt!260099) (currentByte!8119 thiss!1577))))))

(declare-fun lt!260096 () (_ BitVec 32))

(assert (=> b!167096 (= lt!260099 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8114 thiss!1577)))))))) (bvlshr (bvand lt!260093 #b00000000000000000000000011111111) lt!260095)))) (bvadd #b00000000000000000000000000000001 (currentByte!8119 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260096))) (bvshl lt!260093 lt!260096))))))

(assert (=> b!167096 (= lt!260096 (bvsub #b00000000000000000000000000001000 lt!260095))))

(assert (=> b!167096 (= lt!260097 (array!8638 (store (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4758 (buf!4289 thiss!1577)) (currentByte!8119 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8114 thiss!1577)))))))) (bvlshr (bvand lt!260093 #b00000000000000000000000011111111) lt!260095)))) (size!3837 (buf!4289 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167096 (= lt!260093 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167096 (= lt!260095 (bvsub (bvadd (currentBit!8114 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167097 () Bool)

(assert (=> b!167097 (= e!115884 (arrayRangesEq!666 (buf!4289 thiss!1577) lt!260097 #b00000000000000000000000000000000 (currentByte!8119 thiss!1577)))))

(assert (= (and start!36246 res!139111) b!167094))

(assert (= (and b!167094 res!139110) b!167095))

(assert (= (and b!167095 res!139112) b!167096))

(assert (= (and b!167096 (not res!139109)) b!167097))

(assert (= start!36246 b!167093))

(declare-fun m!265627 () Bool)

(assert (=> b!167093 m!265627))

(declare-fun m!265629 () Bool)

(assert (=> b!167096 m!265629))

(declare-fun m!265631 () Bool)

(assert (=> b!167096 m!265631))

(declare-fun m!265633 () Bool)

(assert (=> b!167096 m!265633))

(declare-fun m!265635 () Bool)

(assert (=> b!167096 m!265635))

(declare-fun m!265637 () Bool)

(assert (=> b!167096 m!265637))

(declare-fun m!265639 () Bool)

(assert (=> b!167096 m!265639))

(declare-fun m!265641 () Bool)

(assert (=> b!167096 m!265641))

(declare-fun m!265643 () Bool)

(assert (=> b!167096 m!265643))

(declare-fun m!265645 () Bool)

(assert (=> b!167096 m!265645))

(declare-fun m!265647 () Bool)

(assert (=> b!167096 m!265647))

(assert (=> b!167096 m!265631))

(declare-fun m!265649 () Bool)

(assert (=> b!167096 m!265649))

(declare-fun m!265651 () Bool)

(assert (=> b!167096 m!265651))

(declare-fun m!265653 () Bool)

(assert (=> b!167096 m!265653))

(declare-fun m!265655 () Bool)

(assert (=> start!36246 m!265655))

(declare-fun m!265657 () Bool)

(assert (=> b!167094 m!265657))

(declare-fun m!265659 () Bool)

(assert (=> b!167097 m!265659))

(push 1)

