; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36200 () Bool)

(assert start!36200)

(declare-fun b!166953 () Bool)

(declare-fun res!138995 () Bool)

(declare-fun e!115766 () Bool)

(assert (=> b!166953 (=> (not res!138995) (not e!115766))))

(declare-datatypes ((array!8618 0))(
  ( (array!8619 (arr!4750 (Array (_ BitVec 32) (_ BitVec 8))) (size!3829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6814 0))(
  ( (BitStream!6815 (buf!4281 array!8618) (currentByte!8108 (_ BitVec 32)) (currentBit!8103 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6814)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166953 (= res!138995 (validate_offset_bits!1 ((_ sign_extend 32) (size!3829 (buf!4281 thiss!1577))) ((_ sign_extend 32) (currentByte!8108 thiss!1577)) ((_ sign_extend 32) (currentBit!8103 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166955 () Bool)

(assert (=> b!166955 (= e!115766 (not true))))

(declare-fun lt!259919 () array!8618)

(declare-fun lt!259914 () (_ BitVec 8))

(declare-fun lt!259913 () (_ BitVec 32))

(declare-fun lt!259918 () (_ BitVec 32))

(declare-fun arrayRangesEq!658 (array!8618 array!8618 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166955 (arrayRangesEq!658 lt!259919 (array!8619 (store (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8103 thiss!1577)))))))) (bvlshr (bvand lt!259913 #b00000000000000000000000011111111) lt!259918)))) (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)) lt!259914) (size!3829 (buf!4281 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)))))

(declare-datatypes ((Unit!11606 0))(
  ( (Unit!11607) )
))
(declare-fun lt!259916 () Unit!11606)

(declare-fun arrayUpdatedAtPrefixLemma!266 (array!8618 (_ BitVec 32) (_ BitVec 8)) Unit!11606)

(assert (=> b!166955 (= lt!259916 (arrayUpdatedAtPrefixLemma!266 lt!259919 (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)) lt!259914))))

(assert (=> b!166955 (arrayRangesEq!658 (buf!4281 thiss!1577) (array!8619 (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) (select (store (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8103 thiss!1577)))))))) (bvlshr (bvand lt!259913 #b00000000000000000000000011111111) lt!259918)))) (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)) lt!259914) (currentByte!8108 thiss!1577))) (size!3829 (buf!4281 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8108 thiss!1577))))

(declare-fun lt!259915 () Unit!11606)

(assert (=> b!166955 (= lt!259915 (arrayUpdatedAtPrefixLemma!266 (buf!4281 thiss!1577) (currentByte!8108 thiss!1577) (select (store (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8103 thiss!1577)))))))) (bvlshr (bvand lt!259913 #b00000000000000000000000011111111) lt!259918)))) (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)) lt!259914) (currentByte!8108 thiss!1577))))))

(declare-fun lt!259917 () (_ BitVec 32))

(assert (=> b!166955 (= lt!259914 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8103 thiss!1577)))))))) (bvlshr (bvand lt!259913 #b00000000000000000000000011111111) lt!259918)))) (bvadd #b00000000000000000000000000000001 (currentByte!8108 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259917))) (bvshl lt!259913 lt!259917))))))

(assert (=> b!166955 (= lt!259917 (bvsub #b00000000000000000000000000001000 lt!259918))))

(assert (=> b!166955 (= lt!259919 (array!8619 (store (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4750 (buf!4281 thiss!1577)) (currentByte!8108 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8103 thiss!1577)))))))) (bvlshr (bvand lt!259913 #b00000000000000000000000011111111) lt!259918)))) (size!3829 (buf!4281 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166955 (= lt!259913 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166955 (= lt!259918 (bvsub (bvadd (currentBit!8103 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166954 () Bool)

(declare-fun res!138994 () Bool)

(assert (=> b!166954 (=> (not res!138994) (not e!115766))))

(assert (=> b!166954 (= res!138994 (bvsgt (bvadd (currentBit!8103 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166956 () Bool)

(declare-fun e!115765 () Bool)

(declare-fun array_inv!3570 (array!8618) Bool)

(assert (=> b!166956 (= e!115765 (array_inv!3570 (buf!4281 thiss!1577)))))

(declare-fun res!138993 () Bool)

(assert (=> start!36200 (=> (not res!138993) (not e!115766))))

(assert (=> start!36200 (= res!138993 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36200 e!115766))

(assert (=> start!36200 true))

(declare-fun inv!12 (BitStream!6814) Bool)

(assert (=> start!36200 (and (inv!12 thiss!1577) e!115765)))

(assert (= (and start!36200 res!138993) b!166953))

(assert (= (and b!166953 res!138995) b!166954))

(assert (= (and b!166954 res!138994) b!166955))

(assert (= start!36200 b!166956))

(declare-fun m!265295 () Bool)

(assert (=> b!166953 m!265295))

(declare-fun m!265297 () Bool)

(assert (=> b!166955 m!265297))

(declare-fun m!265299 () Bool)

(assert (=> b!166955 m!265299))

(declare-fun m!265301 () Bool)

(assert (=> b!166955 m!265301))

(declare-fun m!265303 () Bool)

(assert (=> b!166955 m!265303))

(declare-fun m!265305 () Bool)

(assert (=> b!166955 m!265305))

(declare-fun m!265307 () Bool)

(assert (=> b!166955 m!265307))

(declare-fun m!265309 () Bool)

(assert (=> b!166955 m!265309))

(declare-fun m!265311 () Bool)

(assert (=> b!166955 m!265311))

(declare-fun m!265313 () Bool)

(assert (=> b!166955 m!265313))

(assert (=> b!166955 m!265301))

(declare-fun m!265315 () Bool)

(assert (=> b!166955 m!265315))

(declare-fun m!265317 () Bool)

(assert (=> b!166955 m!265317))

(declare-fun m!265319 () Bool)

(assert (=> b!166955 m!265319))

(declare-fun m!265321 () Bool)

(assert (=> b!166955 m!265321))

(declare-fun m!265323 () Bool)

(assert (=> b!166956 m!265323))

(declare-fun m!265325 () Bool)

(assert (=> start!36200 m!265325))

(push 1)

(assert (not b!166955))

(assert (not b!166956))

(assert (not start!36200))

(assert (not b!166953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

