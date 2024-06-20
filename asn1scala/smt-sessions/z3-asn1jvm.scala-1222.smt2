; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34716 () Bool)

(assert start!34716)

(declare-fun b!164287 () Bool)

(declare-fun res!136898 () Bool)

(declare-fun e!113524 () Bool)

(assert (=> b!164287 (=> (not res!136898) (not e!113524))))

(declare-datatypes ((array!8220 0))(
  ( (array!8221 (arr!4601 (Array (_ BitVec 32) (_ BitVec 8))) (size!3680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6516 0))(
  ( (BitStream!6517 (buf!4132 array!8220) (currentByte!7705 (_ BitVec 32)) (currentBit!7700 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6516)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164287 (= res!136898 (bvsgt (bvadd (currentBit!7700 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164288 () Bool)

(declare-fun e!113526 () Bool)

(declare-fun array_inv!3421 (array!8220) Bool)

(assert (=> b!164288 (= e!113526 (array_inv!3421 (buf!4132 thiss!1577)))))

(declare-fun b!164289 () Bool)

(declare-fun res!136899 () Bool)

(assert (=> b!164289 (=> (not res!136899) (not e!113524))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164289 (= res!136899 (validate_offset_bits!1 ((_ sign_extend 32) (size!3680 (buf!4132 thiss!1577))) ((_ sign_extend 32) (currentByte!7705 thiss!1577)) ((_ sign_extend 32) (currentBit!7700 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136901 () Bool)

(assert (=> start!34716 (=> (not res!136901) (not e!113524))))

(assert (=> start!34716 (= res!136901 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34716 e!113524))

(assert (=> start!34716 true))

(declare-fun inv!12 (BitStream!6516) Bool)

(assert (=> start!34716 (and (inv!12 thiss!1577) e!113526)))

(declare-fun b!164290 () Bool)

(declare-fun res!136897 () Bool)

(declare-fun e!113525 () Bool)

(assert (=> b!164290 (=> res!136897 e!113525)))

(declare-fun lt!257805 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164290 (= res!136897 (not (= (bitIndex!0 (size!3680 (buf!4132 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)) lt!257805) (bvadd (bitIndex!0 (size!3680 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) (currentBit!7700 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!164291 () Bool)

(assert (=> b!164291 (= e!113524 (not e!113525))))

(declare-fun res!136900 () Bool)

(assert (=> b!164291 (=> res!136900 e!113525)))

(declare-fun lt!257807 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164291 (= res!136900 (not (byteRangesEq!0 (select (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577)) lt!257807 #b00000000000000000000000000000000 lt!257805)))))

(declare-fun lt!257812 () array!8220)

(declare-fun arrayRangesEq!614 (array!8220 array!8220 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164291 (arrayRangesEq!614 (buf!4132 thiss!1577) lt!257812 #b00000000000000000000000000000000 (currentByte!7705 thiss!1577))))

(declare-fun lt!257810 () array!8220)

(declare-datatypes ((Unit!11437 0))(
  ( (Unit!11438) )
))
(declare-fun lt!257814 () Unit!11437)

(declare-fun arrayRangesEqTransitive!161 (array!8220 array!8220 array!8220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11437)

(assert (=> b!164291 (= lt!257814 (arrayRangesEqTransitive!161 (buf!4132 thiss!1577) lt!257810 lt!257812 #b00000000000000000000000000000000 (currentByte!7705 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577))))))

(assert (=> b!164291 (arrayRangesEq!614 lt!257810 lt!257812 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)))))

(declare-fun lt!257808 () (_ BitVec 8))

(declare-fun lt!257806 () Unit!11437)

(declare-fun arrayUpdatedAtPrefixLemma!222 (array!8220 (_ BitVec 32) (_ BitVec 8)) Unit!11437)

(assert (=> b!164291 (= lt!257806 (arrayUpdatedAtPrefixLemma!222 lt!257810 (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)) lt!257808))))

(assert (=> b!164291 (arrayRangesEq!614 (buf!4132 thiss!1577) (array!8221 (store (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) lt!257807) (size!3680 (buf!4132 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7705 thiss!1577))))

(declare-fun lt!257804 () Unit!11437)

(assert (=> b!164291 (= lt!257804 (arrayUpdatedAtPrefixLemma!222 (buf!4132 thiss!1577) (currentByte!7705 thiss!1577) lt!257807))))

(declare-fun lt!257813 () (_ BitVec 32))

(assert (=> b!164291 (= lt!257807 (select (store (store (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7700 thiss!1577)))))))) (bvlshr (bvand lt!257813 #b00000000000000000000000011111111) lt!257805)))) (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)) lt!257808) (currentByte!7705 thiss!1577)))))

(assert (=> b!164291 (= lt!257812 (array!8221 (store (store (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7700 thiss!1577)))))))) (bvlshr (bvand lt!257813 #b00000000000000000000000011111111) lt!257805)))) (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)) lt!257808) (size!3680 (buf!4132 thiss!1577))))))

(declare-fun lt!257809 () (_ BitVec 32))

(assert (=> b!164291 (= lt!257808 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7700 thiss!1577)))))))) (bvlshr (bvand lt!257813 #b00000000000000000000000011111111) lt!257805)))) (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257809))) (bvshl lt!257813 lt!257809))))))

(assert (=> b!164291 (= lt!257809 (bvsub #b00000000000000000000000000001000 lt!257805))))

(assert (=> b!164291 (= lt!257810 (array!8221 (store (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4601 (buf!4132 thiss!1577)) (currentByte!7705 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7700 thiss!1577)))))))) (bvlshr (bvand lt!257813 #b00000000000000000000000011111111) lt!257805)))) (size!3680 (buf!4132 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164291 (= lt!257813 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164291 (= lt!257805 (bvsub (bvadd (currentBit!7700 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164292 () Bool)

(assert (=> b!164292 (= e!113525 true)))

(declare-fun lt!257811 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6516 BitStream!6516) Bool)

(assert (=> b!164292 (= lt!257811 (isPrefixOf!0 thiss!1577 (BitStream!6517 lt!257812 (bvadd #b00000000000000000000000000000001 (currentByte!7705 thiss!1577)) lt!257805)))))

(assert (= (and start!34716 res!136901) b!164289))

(assert (= (and b!164289 res!136899) b!164287))

(assert (= (and b!164287 res!136898) b!164291))

(assert (= (and b!164291 (not res!136900)) b!164290))

(assert (= (and b!164290 (not res!136897)) b!164292))

(assert (= start!34716 b!164288))

(declare-fun m!261151 () Bool)

(assert (=> b!164290 m!261151))

(declare-fun m!261153 () Bool)

(assert (=> b!164290 m!261153))

(declare-fun m!261155 () Bool)

(assert (=> start!34716 m!261155))

(declare-fun m!261157 () Bool)

(assert (=> b!164291 m!261157))

(declare-fun m!261159 () Bool)

(assert (=> b!164291 m!261159))

(assert (=> b!164291 m!261157))

(declare-fun m!261161 () Bool)

(assert (=> b!164291 m!261161))

(declare-fun m!261163 () Bool)

(assert (=> b!164291 m!261163))

(declare-fun m!261165 () Bool)

(assert (=> b!164291 m!261165))

(declare-fun m!261167 () Bool)

(assert (=> b!164291 m!261167))

(declare-fun m!261169 () Bool)

(assert (=> b!164291 m!261169))

(declare-fun m!261171 () Bool)

(assert (=> b!164291 m!261171))

(declare-fun m!261173 () Bool)

(assert (=> b!164291 m!261173))

(declare-fun m!261175 () Bool)

(assert (=> b!164291 m!261175))

(declare-fun m!261177 () Bool)

(assert (=> b!164291 m!261177))

(declare-fun m!261179 () Bool)

(assert (=> b!164291 m!261179))

(declare-fun m!261181 () Bool)

(assert (=> b!164291 m!261181))

(declare-fun m!261183 () Bool)

(assert (=> b!164291 m!261183))

(declare-fun m!261185 () Bool)

(assert (=> b!164291 m!261185))

(declare-fun m!261187 () Bool)

(assert (=> b!164291 m!261187))

(declare-fun m!261189 () Bool)

(assert (=> b!164292 m!261189))

(declare-fun m!261191 () Bool)

(assert (=> b!164289 m!261191))

(declare-fun m!261193 () Bool)

(assert (=> b!164288 m!261193))

(check-sat (not start!34716) (not b!164290) (not b!164288) (not b!164292) (not b!164289) (not b!164291))
