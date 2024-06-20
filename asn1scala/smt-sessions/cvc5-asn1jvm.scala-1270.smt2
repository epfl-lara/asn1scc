; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36134 () Bool)

(assert start!36134)

(declare-fun b!166815 () Bool)

(declare-fun e!115642 () Bool)

(declare-datatypes ((array!8601 0))(
  ( (array!8602 (arr!4744 (Array (_ BitVec 32) (_ BitVec 8))) (size!3823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6802 0))(
  ( (BitStream!6803 (buf!4275 array!8601) (currentByte!8097 (_ BitVec 32)) (currentBit!8092 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6802)

(declare-fun array_inv!3564 (array!8601) Bool)

(assert (=> b!166815 (= e!115642 (array_inv!3564 (buf!4275 thiss!1577)))))

(declare-fun b!166813 () Bool)

(declare-fun res!138871 () Bool)

(declare-fun e!115644 () Bool)

(assert (=> b!166813 (=> (not res!138871) (not e!115644))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166813 (= res!138871 (bvsgt (bvadd (currentBit!8092 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166812 () Bool)

(declare-fun res!138872 () Bool)

(assert (=> b!166812 (=> (not res!138872) (not e!115644))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166812 (= res!138872 (validate_offset_bits!1 ((_ sign_extend 32) (size!3823 (buf!4275 thiss!1577))) ((_ sign_extend 32) (currentByte!8097 thiss!1577)) ((_ sign_extend 32) (currentBit!8092 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!138870 () Bool)

(assert (=> start!36134 (=> (not res!138870) (not e!115644))))

(assert (=> start!36134 (= res!138870 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36134 e!115644))

(assert (=> start!36134 true))

(declare-fun inv!12 (BitStream!6802) Bool)

(assert (=> start!36134 (and (inv!12 thiss!1577) e!115642)))

(declare-fun b!166814 () Bool)

(declare-fun lt!259763 () (_ BitVec 32))

(assert (=> b!166814 (= e!115644 (not (or (= lt!259763 #b00000000000000000000000000000000) (= lt!259763 (bvand (currentByte!8097 thiss!1577) #b10000000000000000000000000000000)))))))

(assert (=> b!166814 (= lt!259763 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)) #b10000000000000000000000000000000))))

(declare-fun lt!259759 () array!8601)

(declare-fun lt!259758 () (_ BitVec 32))

(declare-fun lt!259762 () (_ BitVec 32))

(declare-fun lt!259764 () (_ BitVec 8))

(declare-fun arrayRangesEq!652 (array!8601 array!8601 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166814 (arrayRangesEq!652 lt!259759 (array!8602 (store (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8092 thiss!1577)))))))) (bvlshr (bvand lt!259758 #b00000000000000000000000011111111) lt!259762)))) (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)) lt!259764) (size!3823 (buf!4275 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)))))

(declare-datatypes ((Unit!11594 0))(
  ( (Unit!11595) )
))
(declare-fun lt!259761 () Unit!11594)

(declare-fun arrayUpdatedAtPrefixLemma!260 (array!8601 (_ BitVec 32) (_ BitVec 8)) Unit!11594)

(assert (=> b!166814 (= lt!259761 (arrayUpdatedAtPrefixLemma!260 lt!259759 (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)) lt!259764))))

(assert (=> b!166814 (arrayRangesEq!652 (buf!4275 thiss!1577) (array!8602 (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) (select (store (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8092 thiss!1577)))))))) (bvlshr (bvand lt!259758 #b00000000000000000000000011111111) lt!259762)))) (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)) lt!259764) (currentByte!8097 thiss!1577))) (size!3823 (buf!4275 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8097 thiss!1577))))

(declare-fun lt!259760 () Unit!11594)

(assert (=> b!166814 (= lt!259760 (arrayUpdatedAtPrefixLemma!260 (buf!4275 thiss!1577) (currentByte!8097 thiss!1577) (select (store (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8092 thiss!1577)))))))) (bvlshr (bvand lt!259758 #b00000000000000000000000011111111) lt!259762)))) (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)) lt!259764) (currentByte!8097 thiss!1577))))))

(declare-fun lt!259757 () (_ BitVec 32))

(assert (=> b!166814 (= lt!259764 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8092 thiss!1577)))))))) (bvlshr (bvand lt!259758 #b00000000000000000000000011111111) lt!259762)))) (bvadd #b00000000000000000000000000000001 (currentByte!8097 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259757))) (bvshl lt!259758 lt!259757))))))

(assert (=> b!166814 (= lt!259757 (bvsub #b00000000000000000000000000001000 lt!259762))))

(assert (=> b!166814 (= lt!259759 (array!8602 (store (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4744 (buf!4275 thiss!1577)) (currentByte!8097 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8092 thiss!1577)))))))) (bvlshr (bvand lt!259758 #b00000000000000000000000011111111) lt!259762)))) (size!3823 (buf!4275 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166814 (= lt!259758 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166814 (= lt!259762 (bvsub (bvadd (currentBit!8092 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36134 res!138870) b!166812))

(assert (= (and b!166812 res!138872) b!166813))

(assert (= (and b!166813 res!138871) b!166814))

(assert (= start!36134 b!166815))

(declare-fun m!264979 () Bool)

(assert (=> b!166815 m!264979))

(declare-fun m!264981 () Bool)

(assert (=> b!166812 m!264981))

(declare-fun m!264983 () Bool)

(assert (=> start!36134 m!264983))

(declare-fun m!264985 () Bool)

(assert (=> b!166814 m!264985))

(declare-fun m!264987 () Bool)

(assert (=> b!166814 m!264987))

(declare-fun m!264989 () Bool)

(assert (=> b!166814 m!264989))

(declare-fun m!264991 () Bool)

(assert (=> b!166814 m!264991))

(declare-fun m!264993 () Bool)

(assert (=> b!166814 m!264993))

(declare-fun m!264995 () Bool)

(assert (=> b!166814 m!264995))

(declare-fun m!264997 () Bool)

(assert (=> b!166814 m!264997))

(assert (=> b!166814 m!264985))

(declare-fun m!264999 () Bool)

(assert (=> b!166814 m!264999))

(declare-fun m!265001 () Bool)

(assert (=> b!166814 m!265001))

(declare-fun m!265003 () Bool)

(assert (=> b!166814 m!265003))

(declare-fun m!265005 () Bool)

(assert (=> b!166814 m!265005))

(declare-fun m!265007 () Bool)

(assert (=> b!166814 m!265007))

(declare-fun m!265009 () Bool)

(assert (=> b!166814 m!265009))

(push 1)

(assert (not b!166815))

(assert (not start!36134))

(assert (not b!166812))

(assert (not b!166814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

