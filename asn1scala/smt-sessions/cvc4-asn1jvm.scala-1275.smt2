; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36252 () Bool)

(assert start!36252)

(declare-fun res!139138 () Bool)

(declare-fun e!115911 () Bool)

(assert (=> start!36252 (=> (not res!139138) (not e!115911))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36252 (= res!139138 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36252 e!115911))

(assert (=> start!36252 true))

(declare-datatypes ((array!8643 0))(
  ( (array!8644 (arr!4761 (Array (_ BitVec 32) (_ BitVec 8))) (size!3840 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6836 0))(
  ( (BitStream!6837 (buf!4292 array!8643) (currentByte!8122 (_ BitVec 32)) (currentBit!8117 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6836)

(declare-fun e!115909 () Bool)

(declare-fun inv!12 (BitStream!6836) Bool)

(assert (=> start!36252 (and (inv!12 thiss!1577) e!115909)))

(declare-fun b!167133 () Bool)

(declare-fun array_inv!3581 (array!8643) Bool)

(assert (=> b!167133 (= e!115909 (array_inv!3581 (buf!4292 thiss!1577)))))

(declare-fun b!167131 () Bool)

(declare-fun res!139137 () Bool)

(assert (=> b!167131 (=> (not res!139137) (not e!115911))))

(assert (=> b!167131 (= res!139137 (bvsgt (bvadd (currentBit!8117 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167130 () Bool)

(declare-fun res!139139 () Bool)

(assert (=> b!167130 (=> (not res!139139) (not e!115911))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167130 (= res!139139 (validate_offset_bits!1 ((_ sign_extend 32) (size!3840 (buf!4292 thiss!1577))) ((_ sign_extend 32) (currentByte!8122 thiss!1577)) ((_ sign_extend 32) (currentBit!8117 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167132 () Bool)

(assert (=> b!167132 (= e!115911 (not true))))

(declare-fun lt!260158 () (_ BitVec 32))

(declare-fun lt!260162 () (_ BitVec 32))

(declare-fun lt!260161 () (_ BitVec 8))

(declare-fun lt!260159 () array!8643)

(declare-fun arrayRangesEq!669 (array!8643 array!8643 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167132 (arrayRangesEq!669 lt!260159 (array!8644 (store (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8117 thiss!1577)))))))) (bvlshr (bvand lt!260162 #b00000000000000000000000011111111) lt!260158)))) (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)) lt!260161) (size!3840 (buf!4292 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)))))

(declare-datatypes ((Unit!11628 0))(
  ( (Unit!11629) )
))
(declare-fun lt!260157 () Unit!11628)

(declare-fun arrayUpdatedAtPrefixLemma!277 (array!8643 (_ BitVec 32) (_ BitVec 8)) Unit!11628)

(assert (=> b!167132 (= lt!260157 (arrayUpdatedAtPrefixLemma!277 lt!260159 (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)) lt!260161))))

(assert (=> b!167132 (arrayRangesEq!669 (buf!4292 thiss!1577) (array!8644 (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) (select (store (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8117 thiss!1577)))))))) (bvlshr (bvand lt!260162 #b00000000000000000000000011111111) lt!260158)))) (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)) lt!260161) (currentByte!8122 thiss!1577))) (size!3840 (buf!4292 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8122 thiss!1577))))

(declare-fun lt!260156 () Unit!11628)

(assert (=> b!167132 (= lt!260156 (arrayUpdatedAtPrefixLemma!277 (buf!4292 thiss!1577) (currentByte!8122 thiss!1577) (select (store (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8117 thiss!1577)))))))) (bvlshr (bvand lt!260162 #b00000000000000000000000011111111) lt!260158)))) (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)) lt!260161) (currentByte!8122 thiss!1577))))))

(declare-fun lt!260160 () (_ BitVec 32))

(assert (=> b!167132 (= lt!260161 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8117 thiss!1577)))))))) (bvlshr (bvand lt!260162 #b00000000000000000000000011111111) lt!260158)))) (bvadd #b00000000000000000000000000000001 (currentByte!8122 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260160))) (bvshl lt!260162 lt!260160))))))

(assert (=> b!167132 (= lt!260160 (bvsub #b00000000000000000000000000001000 lt!260158))))

(assert (=> b!167132 (= lt!260159 (array!8644 (store (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4761 (buf!4292 thiss!1577)) (currentByte!8122 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8117 thiss!1577)))))))) (bvlshr (bvand lt!260162 #b00000000000000000000000011111111) lt!260158)))) (size!3840 (buf!4292 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167132 (= lt!260162 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167132 (= lt!260158 (bvsub (bvadd (currentBit!8117 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36252 res!139138) b!167130))

(assert (= (and b!167130 res!139139) b!167131))

(assert (= (and b!167131 res!139137) b!167132))

(assert (= start!36252 b!167133))

(declare-fun m!265725 () Bool)

(assert (=> start!36252 m!265725))

(declare-fun m!265727 () Bool)

(assert (=> b!167133 m!265727))

(declare-fun m!265729 () Bool)

(assert (=> b!167130 m!265729))

(declare-fun m!265731 () Bool)

(assert (=> b!167132 m!265731))

(declare-fun m!265733 () Bool)

(assert (=> b!167132 m!265733))

(declare-fun m!265735 () Bool)

(assert (=> b!167132 m!265735))

(declare-fun m!265737 () Bool)

(assert (=> b!167132 m!265737))

(declare-fun m!265739 () Bool)

(assert (=> b!167132 m!265739))

(declare-fun m!265741 () Bool)

(assert (=> b!167132 m!265741))

(declare-fun m!265743 () Bool)

(assert (=> b!167132 m!265743))

(declare-fun m!265745 () Bool)

(assert (=> b!167132 m!265745))

(declare-fun m!265747 () Bool)

(assert (=> b!167132 m!265747))

(declare-fun m!265749 () Bool)

(assert (=> b!167132 m!265749))

(declare-fun m!265751 () Bool)

(assert (=> b!167132 m!265751))

(assert (=> b!167132 m!265745))

(declare-fun m!265753 () Bool)

(assert (=> b!167132 m!265753))

(declare-fun m!265755 () Bool)

(assert (=> b!167132 m!265755))

(push 1)

