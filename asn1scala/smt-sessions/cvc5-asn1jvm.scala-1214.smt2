; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34548 () Bool)

(assert start!34548)

(declare-fun b!163855 () Bool)

(declare-fun e!113168 () Bool)

(declare-datatypes ((array!8163 0))(
  ( (array!8164 (arr!4576 (Array (_ BitVec 32) (_ BitVec 8))) (size!3655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6466 0))(
  ( (BitStream!6467 (buf!4107 array!8163) (currentByte!7666 (_ BitVec 32)) (currentBit!7661 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6466)

(declare-fun array_inv!3396 (array!8163) Bool)

(assert (=> b!163855 (= e!113168 (array_inv!3396 (buf!4107 thiss!1577)))))

(declare-fun res!136538 () Bool)

(declare-fun e!113170 () Bool)

(assert (=> start!34548 (=> (not res!136538) (not e!113170))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34548 (= res!136538 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34548 e!113170))

(assert (=> start!34548 true))

(declare-fun inv!12 (BitStream!6466) Bool)

(assert (=> start!34548 (and (inv!12 thiss!1577) e!113168)))

(declare-fun b!163854 () Bool)

(assert (=> b!163854 (= e!113170 (not true))))

(declare-fun lt!257134 () array!8163)

(declare-fun lt!257135 () (_ BitVec 32))

(declare-fun lt!257131 () (_ BitVec 32))

(declare-fun lt!257132 () (_ BitVec 8))

(declare-fun arrayRangesEq!589 (array!8163 array!8163 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163854 (arrayRangesEq!589 lt!257134 (array!8164 (store (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7661 thiss!1577)))))))) (bvlshr (bvand lt!257135 #b00000000000000000000000011111111) lt!257131)))) (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)) lt!257132) (size!3655 (buf!4107 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)))))

(declare-datatypes ((Unit!11387 0))(
  ( (Unit!11388) )
))
(declare-fun lt!257130 () Unit!11387)

(declare-fun arrayUpdatedAtPrefixLemma!197 (array!8163 (_ BitVec 32) (_ BitVec 8)) Unit!11387)

(assert (=> b!163854 (= lt!257130 (arrayUpdatedAtPrefixLemma!197 lt!257134 (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)) lt!257132))))

(assert (=> b!163854 (arrayRangesEq!589 (buf!4107 thiss!1577) (array!8164 (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) (select (store (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7661 thiss!1577)))))))) (bvlshr (bvand lt!257135 #b00000000000000000000000011111111) lt!257131)))) (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)) lt!257132) (currentByte!7666 thiss!1577))) (size!3655 (buf!4107 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7666 thiss!1577))))

(declare-fun lt!257133 () Unit!11387)

(assert (=> b!163854 (= lt!257133 (arrayUpdatedAtPrefixLemma!197 (buf!4107 thiss!1577) (currentByte!7666 thiss!1577) (select (store (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7661 thiss!1577)))))))) (bvlshr (bvand lt!257135 #b00000000000000000000000011111111) lt!257131)))) (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)) lt!257132) (currentByte!7666 thiss!1577))))))

(declare-fun lt!257136 () (_ BitVec 32))

(assert (=> b!163854 (= lt!257132 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7661 thiss!1577)))))))) (bvlshr (bvand lt!257135 #b00000000000000000000000011111111) lt!257131)))) (bvadd #b00000000000000000000000000000001 (currentByte!7666 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257136))) (bvshl lt!257135 lt!257136))))))

(assert (=> b!163854 (= lt!257136 (bvsub #b00000000000000000000000000001000 lt!257131))))

(assert (=> b!163854 (= lt!257134 (array!8164 (store (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4576 (buf!4107 thiss!1577)) (currentByte!7666 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7661 thiss!1577)))))))) (bvlshr (bvand lt!257135 #b00000000000000000000000011111111) lt!257131)))) (size!3655 (buf!4107 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163854 (= lt!257135 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163854 (= lt!257131 (bvsub (bvadd (currentBit!7661 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163852 () Bool)

(declare-fun res!136537 () Bool)

(assert (=> b!163852 (=> (not res!136537) (not e!113170))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163852 (= res!136537 (validate_offset_bits!1 ((_ sign_extend 32) (size!3655 (buf!4107 thiss!1577))) ((_ sign_extend 32) (currentByte!7666 thiss!1577)) ((_ sign_extend 32) (currentBit!7661 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163853 () Bool)

(declare-fun res!136539 () Bool)

(assert (=> b!163853 (=> (not res!136539) (not e!113170))))

(assert (=> b!163853 (= res!136539 (bvsgt (bvadd (currentBit!7661 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34548 res!136538) b!163852))

(assert (= (and b!163852 res!136537) b!163853))

(assert (= (and b!163853 res!136539) b!163854))

(assert (= start!34548 b!163855))

(declare-fun m!260061 () Bool)

(assert (=> b!163855 m!260061))

(declare-fun m!260063 () Bool)

(assert (=> start!34548 m!260063))

(declare-fun m!260065 () Bool)

(assert (=> b!163854 m!260065))

(declare-fun m!260067 () Bool)

(assert (=> b!163854 m!260067))

(declare-fun m!260069 () Bool)

(assert (=> b!163854 m!260069))

(declare-fun m!260071 () Bool)

(assert (=> b!163854 m!260071))

(declare-fun m!260073 () Bool)

(assert (=> b!163854 m!260073))

(declare-fun m!260075 () Bool)

(assert (=> b!163854 m!260075))

(declare-fun m!260077 () Bool)

(assert (=> b!163854 m!260077))

(declare-fun m!260079 () Bool)

(assert (=> b!163854 m!260079))

(declare-fun m!260081 () Bool)

(assert (=> b!163854 m!260081))

(declare-fun m!260083 () Bool)

(assert (=> b!163854 m!260083))

(declare-fun m!260085 () Bool)

(assert (=> b!163854 m!260085))

(declare-fun m!260087 () Bool)

(assert (=> b!163854 m!260087))

(assert (=> b!163854 m!260069))

(declare-fun m!260089 () Bool)

(assert (=> b!163854 m!260089))

(declare-fun m!260091 () Bool)

(assert (=> b!163852 m!260091))

(push 1)

(assert (not b!163854))

(assert (not b!163855))

(assert (not b!163852))

(assert (not start!34548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

