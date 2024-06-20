; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36254 () Bool)

(assert start!36254)

(declare-fun b!167143 () Bool)

(declare-fun res!139147 () Bool)

(declare-fun e!115920 () Bool)

(assert (=> b!167143 (=> (not res!139147) (not e!115920))))

(declare-datatypes ((array!8645 0))(
  ( (array!8646 (arr!4762 (Array (_ BitVec 32) (_ BitVec 8))) (size!3841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6838 0))(
  ( (BitStream!6839 (buf!4293 array!8645) (currentByte!8123 (_ BitVec 32)) (currentBit!8118 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6838)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167143 (= res!139147 (bvsgt (bvadd (currentBit!8118 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139146 () Bool)

(assert (=> start!36254 (=> (not res!139146) (not e!115920))))

(assert (=> start!36254 (= res!139146 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36254 e!115920))

(assert (=> start!36254 true))

(declare-fun e!115918 () Bool)

(declare-fun inv!12 (BitStream!6838) Bool)

(assert (=> start!36254 (and (inv!12 thiss!1577) e!115918)))

(declare-fun b!167142 () Bool)

(declare-fun res!139148 () Bool)

(assert (=> b!167142 (=> (not res!139148) (not e!115920))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167142 (= res!139148 (validate_offset_bits!1 ((_ sign_extend 32) (size!3841 (buf!4293 thiss!1577))) ((_ sign_extend 32) (currentByte!8123 thiss!1577)) ((_ sign_extend 32) (currentBit!8118 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167144 () Bool)

(assert (=> b!167144 (= e!115920 (not (and (bvsge (currentByte!8123 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8123 thiss!1577) (size!3841 (buf!4293 thiss!1577))))))))

(declare-fun lt!260192 () array!8645)

(declare-fun arrayRangesEq!670 (array!8645 array!8645 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167144 (arrayRangesEq!670 (buf!4293 thiss!1577) lt!260192 #b00000000000000000000000000000000 (currentByte!8123 thiss!1577))))

(declare-fun lt!260185 () array!8645)

(declare-datatypes ((Unit!11630 0))(
  ( (Unit!11631) )
))
(declare-fun lt!260188 () Unit!11630)

(declare-fun arrayRangesEqTransitive!172 (array!8645 array!8645 array!8645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11630)

(assert (=> b!167144 (= lt!260188 (arrayRangesEqTransitive!172 (buf!4293 thiss!1577) lt!260185 lt!260192 #b00000000000000000000000000000000 (currentByte!8123 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577))))))

(assert (=> b!167144 (arrayRangesEq!670 lt!260185 lt!260192 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577)))))

(declare-fun lt!260184 () (_ BitVec 8))

(declare-fun lt!260187 () Unit!11630)

(declare-fun arrayUpdatedAtPrefixLemma!278 (array!8645 (_ BitVec 32) (_ BitVec 8)) Unit!11630)

(assert (=> b!167144 (= lt!260187 (arrayUpdatedAtPrefixLemma!278 lt!260185 (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577)) lt!260184))))

(declare-fun lt!260186 () (_ BitVec 8))

(assert (=> b!167144 (arrayRangesEq!670 (buf!4293 thiss!1577) (array!8646 (store (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577) lt!260186) (size!3841 (buf!4293 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8123 thiss!1577))))

(declare-fun lt!260189 () Unit!11630)

(assert (=> b!167144 (= lt!260189 (arrayUpdatedAtPrefixLemma!278 (buf!4293 thiss!1577) (currentByte!8123 thiss!1577) lt!260186))))

(declare-fun lt!260191 () (_ BitVec 32))

(declare-fun lt!260190 () (_ BitVec 32))

(assert (=> b!167144 (= lt!260186 (select (store (store (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8118 thiss!1577)))))))) (bvlshr (bvand lt!260191 #b00000000000000000000000011111111) lt!260190)))) (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577)) lt!260184) (currentByte!8123 thiss!1577)))))

(assert (=> b!167144 (= lt!260192 (array!8646 (store (store (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8118 thiss!1577)))))))) (bvlshr (bvand lt!260191 #b00000000000000000000000011111111) lt!260190)))) (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577)) lt!260184) (size!3841 (buf!4293 thiss!1577))))))

(declare-fun lt!260183 () (_ BitVec 32))

(assert (=> b!167144 (= lt!260184 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8118 thiss!1577)))))))) (bvlshr (bvand lt!260191 #b00000000000000000000000011111111) lt!260190)))) (bvadd #b00000000000000000000000000000001 (currentByte!8123 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260183))) (bvshl lt!260191 lt!260183))))))

(assert (=> b!167144 (= lt!260183 (bvsub #b00000000000000000000000000001000 lt!260190))))

(assert (=> b!167144 (= lt!260185 (array!8646 (store (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4762 (buf!4293 thiss!1577)) (currentByte!8123 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8118 thiss!1577)))))))) (bvlshr (bvand lt!260191 #b00000000000000000000000011111111) lt!260190)))) (size!3841 (buf!4293 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167144 (= lt!260191 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167144 (= lt!260190 (bvsub (bvadd (currentBit!8118 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167145 () Bool)

(declare-fun array_inv!3582 (array!8645) Bool)

(assert (=> b!167145 (= e!115918 (array_inv!3582 (buf!4293 thiss!1577)))))

(assert (= (and start!36254 res!139146) b!167142))

(assert (= (and b!167142 res!139148) b!167143))

(assert (= (and b!167143 res!139147) b!167144))

(assert (= start!36254 b!167145))

(declare-fun m!265757 () Bool)

(assert (=> start!36254 m!265757))

(declare-fun m!265759 () Bool)

(assert (=> b!167142 m!265759))

(declare-fun m!265761 () Bool)

(assert (=> b!167144 m!265761))

(declare-fun m!265763 () Bool)

(assert (=> b!167144 m!265763))

(declare-fun m!265765 () Bool)

(assert (=> b!167144 m!265765))

(declare-fun m!265767 () Bool)

(assert (=> b!167144 m!265767))

(declare-fun m!265769 () Bool)

(assert (=> b!167144 m!265769))

(declare-fun m!265771 () Bool)

(assert (=> b!167144 m!265771))

(declare-fun m!265773 () Bool)

(assert (=> b!167144 m!265773))

(declare-fun m!265775 () Bool)

(assert (=> b!167144 m!265775))

(declare-fun m!265777 () Bool)

(assert (=> b!167144 m!265777))

(declare-fun m!265779 () Bool)

(assert (=> b!167144 m!265779))

(declare-fun m!265781 () Bool)

(assert (=> b!167144 m!265781))

(declare-fun m!265783 () Bool)

(assert (=> b!167144 m!265783))

(declare-fun m!265785 () Bool)

(assert (=> b!167144 m!265785))

(declare-fun m!265787 () Bool)

(assert (=> b!167144 m!265787))

(declare-fun m!265789 () Bool)

(assert (=> b!167144 m!265789))

(declare-fun m!265791 () Bool)

(assert (=> b!167145 m!265791))

(push 1)

(assert (not b!167142))

(assert (not start!36254))

(assert (not b!167144))

(assert (not b!167145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

