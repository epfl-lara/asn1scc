; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34714 () Bool)

(assert start!34714)

(declare-fun b!164269 () Bool)

(declare-fun res!136885 () Bool)

(declare-fun e!113512 () Bool)

(assert (=> b!164269 (=> (not res!136885) (not e!113512))))

(declare-datatypes ((array!8218 0))(
  ( (array!8219 (arr!4600 (Array (_ BitVec 32) (_ BitVec 8))) (size!3679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6514 0))(
  ( (BitStream!6515 (buf!4131 array!8218) (currentByte!7704 (_ BitVec 32)) (currentBit!7699 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6514)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164269 (= res!136885 (validate_offset_bits!1 ((_ sign_extend 32) (size!3679 (buf!4131 thiss!1577))) ((_ sign_extend 32) (currentByte!7704 thiss!1577)) ((_ sign_extend 32) (currentBit!7699 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164270 () Bool)

(declare-fun res!136886 () Bool)

(assert (=> b!164270 (=> (not res!136886) (not e!113512))))

(assert (=> b!164270 (= res!136886 (bvsgt (bvadd (currentBit!7699 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164271 () Bool)

(declare-fun e!113514 () Bool)

(declare-fun array_inv!3420 (array!8218) Bool)

(assert (=> b!164271 (= e!113514 (array_inv!3420 (buf!4131 thiss!1577)))))

(declare-fun b!164272 () Bool)

(declare-fun res!136883 () Bool)

(declare-fun e!113511 () Bool)

(assert (=> b!164272 (=> res!136883 e!113511)))

(declare-fun lt!257779 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164272 (= res!136883 (not (= (bitIndex!0 (size!3679 (buf!4131 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)) lt!257779) (bvadd (bitIndex!0 (size!3679 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) (currentBit!7699 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!164273 () Bool)

(assert (=> b!164273 (= e!113512 (not e!113511))))

(declare-fun res!136882 () Bool)

(assert (=> b!164273 (=> res!136882 e!113511)))

(declare-fun lt!257775 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164273 (= res!136882 (not (byteRangesEq!0 (select (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577)) lt!257775 #b00000000000000000000000000000000 lt!257779)))))

(declare-fun lt!257771 () array!8218)

(declare-fun arrayRangesEq!613 (array!8218 array!8218 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164273 (arrayRangesEq!613 (buf!4131 thiss!1577) lt!257771 #b00000000000000000000000000000000 (currentByte!7704 thiss!1577))))

(declare-datatypes ((Unit!11435 0))(
  ( (Unit!11436) )
))
(declare-fun lt!257777 () Unit!11435)

(declare-fun lt!257773 () array!8218)

(declare-fun arrayRangesEqTransitive!160 (array!8218 array!8218 array!8218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11435)

(assert (=> b!164273 (= lt!257777 (arrayRangesEqTransitive!160 (buf!4131 thiss!1577) lt!257773 lt!257771 #b00000000000000000000000000000000 (currentByte!7704 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577))))))

(assert (=> b!164273 (arrayRangesEq!613 lt!257773 lt!257771 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)))))

(declare-fun lt!257780 () (_ BitVec 8))

(declare-fun lt!257778 () Unit!11435)

(declare-fun arrayUpdatedAtPrefixLemma!221 (array!8218 (_ BitVec 32) (_ BitVec 8)) Unit!11435)

(assert (=> b!164273 (= lt!257778 (arrayUpdatedAtPrefixLemma!221 lt!257773 (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)) lt!257780))))

(assert (=> b!164273 (arrayRangesEq!613 (buf!4131 thiss!1577) (array!8219 (store (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) lt!257775) (size!3679 (buf!4131 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7704 thiss!1577))))

(declare-fun lt!257772 () Unit!11435)

(assert (=> b!164273 (= lt!257772 (arrayUpdatedAtPrefixLemma!221 (buf!4131 thiss!1577) (currentByte!7704 thiss!1577) lt!257775))))

(declare-fun lt!257781 () (_ BitVec 32))

(assert (=> b!164273 (= lt!257775 (select (store (store (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7699 thiss!1577)))))))) (bvlshr (bvand lt!257781 #b00000000000000000000000011111111) lt!257779)))) (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)) lt!257780) (currentByte!7704 thiss!1577)))))

(assert (=> b!164273 (= lt!257771 (array!8219 (store (store (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7699 thiss!1577)))))))) (bvlshr (bvand lt!257781 #b00000000000000000000000011111111) lt!257779)))) (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)) lt!257780) (size!3679 (buf!4131 thiss!1577))))))

(declare-fun lt!257774 () (_ BitVec 32))

(assert (=> b!164273 (= lt!257780 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7699 thiss!1577)))))))) (bvlshr (bvand lt!257781 #b00000000000000000000000011111111) lt!257779)))) (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257774))) (bvshl lt!257781 lt!257774))))))

(assert (=> b!164273 (= lt!257774 (bvsub #b00000000000000000000000000001000 lt!257779))))

(assert (=> b!164273 (= lt!257773 (array!8219 (store (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4600 (buf!4131 thiss!1577)) (currentByte!7704 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7699 thiss!1577)))))))) (bvlshr (bvand lt!257781 #b00000000000000000000000011111111) lt!257779)))) (size!3679 (buf!4131 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164273 (= lt!257781 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164273 (= lt!257779 (bvsub (bvadd (currentBit!7699 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164274 () Bool)

(assert (=> b!164274 (= e!113511 true)))

(declare-fun lt!257776 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6514 BitStream!6514) Bool)

(assert (=> b!164274 (= lt!257776 (isPrefixOf!0 thiss!1577 (BitStream!6515 lt!257771 (bvadd #b00000000000000000000000000000001 (currentByte!7704 thiss!1577)) lt!257779)))))

(declare-fun res!136884 () Bool)

(assert (=> start!34714 (=> (not res!136884) (not e!113512))))

(assert (=> start!34714 (= res!136884 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34714 e!113512))

(assert (=> start!34714 true))

(declare-fun inv!12 (BitStream!6514) Bool)

(assert (=> start!34714 (and (inv!12 thiss!1577) e!113514)))

(assert (= (and start!34714 res!136884) b!164269))

(assert (= (and b!164269 res!136885) b!164270))

(assert (= (and b!164270 res!136886) b!164273))

(assert (= (and b!164273 (not res!136882)) b!164272))

(assert (= (and b!164272 (not res!136883)) b!164274))

(assert (= start!34714 b!164271))

(declare-fun m!261107 () Bool)

(assert (=> b!164271 m!261107))

(declare-fun m!261109 () Bool)

(assert (=> start!34714 m!261109))

(declare-fun m!261111 () Bool)

(assert (=> b!164269 m!261111))

(declare-fun m!261113 () Bool)

(assert (=> b!164273 m!261113))

(declare-fun m!261115 () Bool)

(assert (=> b!164273 m!261115))

(declare-fun m!261117 () Bool)

(assert (=> b!164273 m!261117))

(assert (=> b!164273 m!261115))

(declare-fun m!261119 () Bool)

(assert (=> b!164273 m!261119))

(declare-fun m!261121 () Bool)

(assert (=> b!164273 m!261121))

(declare-fun m!261123 () Bool)

(assert (=> b!164273 m!261123))

(declare-fun m!261125 () Bool)

(assert (=> b!164273 m!261125))

(declare-fun m!261127 () Bool)

(assert (=> b!164273 m!261127))

(declare-fun m!261129 () Bool)

(assert (=> b!164273 m!261129))

(declare-fun m!261131 () Bool)

(assert (=> b!164273 m!261131))

(declare-fun m!261133 () Bool)

(assert (=> b!164273 m!261133))

(declare-fun m!261135 () Bool)

(assert (=> b!164273 m!261135))

(declare-fun m!261137 () Bool)

(assert (=> b!164273 m!261137))

(declare-fun m!261139 () Bool)

(assert (=> b!164273 m!261139))

(declare-fun m!261141 () Bool)

(assert (=> b!164273 m!261141))

(declare-fun m!261143 () Bool)

(assert (=> b!164273 m!261143))

(declare-fun m!261145 () Bool)

(assert (=> b!164272 m!261145))

(declare-fun m!261147 () Bool)

(assert (=> b!164272 m!261147))

(declare-fun m!261149 () Bool)

(assert (=> b!164274 m!261149))

(push 1)

(assert (not b!164271))

(assert (not b!164269))

(assert (not b!164272))

(assert (not b!164274))

(assert (not start!34714))

(assert (not b!164273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

