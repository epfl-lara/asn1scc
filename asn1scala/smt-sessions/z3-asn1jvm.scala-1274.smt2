; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36244 () Bool)

(assert start!36244)

(declare-fun b!167078 () Bool)

(declare-fun e!115872 () Bool)

(declare-datatypes ((array!8635 0))(
  ( (array!8636 (arr!4757 (Array (_ BitVec 32) (_ BitVec 8))) (size!3836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6828 0))(
  ( (BitStream!6829 (buf!4288 array!8635) (currentByte!8118 (_ BitVec 32)) (currentBit!8113 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6828)

(declare-fun array_inv!3577 (array!8635) Bool)

(assert (=> b!167078 (= e!115872 (array_inv!3577 (buf!4288 thiss!1577)))))

(declare-fun b!167079 () Bool)

(declare-fun res!139099 () Bool)

(declare-fun e!115871 () Bool)

(assert (=> b!167079 (=> (not res!139099) (not e!115871))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167079 (= res!139099 (validate_offset_bits!1 ((_ sign_extend 32) (size!3836 (buf!4288 thiss!1577))) ((_ sign_extend 32) (currentByte!8118 thiss!1577)) ((_ sign_extend 32) (currentBit!8113 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!139098 () Bool)

(assert (=> start!36244 (=> (not res!139098) (not e!115871))))

(assert (=> start!36244 (= res!139098 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36244 e!115871))

(assert (=> start!36244 true))

(declare-fun inv!12 (BitStream!6828) Bool)

(assert (=> start!36244 (and (inv!12 thiss!1577) e!115872)))

(declare-fun b!167080 () Bool)

(declare-fun e!115870 () Bool)

(assert (=> b!167080 (= e!115871 (not e!115870))))

(declare-fun res!139100 () Bool)

(assert (=> b!167080 (=> res!139100 e!115870)))

(assert (=> b!167080 (= res!139100 (or (bvsgt #b00000000000000000000000000000000 (currentByte!8118 thiss!1577)) (bvsgt (currentByte!8118 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577))) (bvsgt (currentByte!8118 thiss!1577) (size!3836 (buf!4288 thiss!1577))) (bvsgt (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)) (size!3836 (buf!4288 thiss!1577)))))))

(declare-fun lt!260078 () (_ BitVec 32))

(declare-fun lt!260077 () (_ BitVec 8))

(declare-fun lt!260073 () array!8635)

(declare-fun lt!260074 () (_ BitVec 32))

(declare-fun arrayRangesEq!665 (array!8635 array!8635 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167080 (arrayRangesEq!665 lt!260073 (array!8636 (store (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8113 thiss!1577)))))))) (bvlshr (bvand lt!260078 #b00000000000000000000000011111111) lt!260074)))) (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)) lt!260077) (size!3836 (buf!4288 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)))))

(declare-datatypes ((Unit!11620 0))(
  ( (Unit!11621) )
))
(declare-fun lt!260076 () Unit!11620)

(declare-fun arrayUpdatedAtPrefixLemma!273 (array!8635 (_ BitVec 32) (_ BitVec 8)) Unit!11620)

(assert (=> b!167080 (= lt!260076 (arrayUpdatedAtPrefixLemma!273 lt!260073 (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)) lt!260077))))

(assert (=> b!167080 (arrayRangesEq!665 (buf!4288 thiss!1577) (array!8636 (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) (select (store (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8113 thiss!1577)))))))) (bvlshr (bvand lt!260078 #b00000000000000000000000011111111) lt!260074)))) (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)) lt!260077) (currentByte!8118 thiss!1577))) (size!3836 (buf!4288 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8118 thiss!1577))))

(declare-fun lt!260075 () Unit!11620)

(assert (=> b!167080 (= lt!260075 (arrayUpdatedAtPrefixLemma!273 (buf!4288 thiss!1577) (currentByte!8118 thiss!1577) (select (store (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8113 thiss!1577)))))))) (bvlshr (bvand lt!260078 #b00000000000000000000000011111111) lt!260074)))) (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)) lt!260077) (currentByte!8118 thiss!1577))))))

(declare-fun lt!260072 () (_ BitVec 32))

(assert (=> b!167080 (= lt!260077 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8113 thiss!1577)))))))) (bvlshr (bvand lt!260078 #b00000000000000000000000011111111) lt!260074)))) (bvadd #b00000000000000000000000000000001 (currentByte!8118 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260072))) (bvshl lt!260078 lt!260072))))))

(assert (=> b!167080 (= lt!260072 (bvsub #b00000000000000000000000000001000 lt!260074))))

(assert (=> b!167080 (= lt!260073 (array!8636 (store (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4757 (buf!4288 thiss!1577)) (currentByte!8118 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8113 thiss!1577)))))))) (bvlshr (bvand lt!260078 #b00000000000000000000000011111111) lt!260074)))) (size!3836 (buf!4288 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167080 (= lt!260078 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167080 (= lt!260074 (bvsub (bvadd (currentBit!8113 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167081 () Bool)

(declare-fun res!139097 () Bool)

(assert (=> b!167081 (=> (not res!139097) (not e!115871))))

(assert (=> b!167081 (= res!139097 (bvsgt (bvadd (currentBit!8113 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167082 () Bool)

(assert (=> b!167082 (= e!115870 (arrayRangesEq!665 (buf!4288 thiss!1577) lt!260073 #b00000000000000000000000000000000 (currentByte!8118 thiss!1577)))))

(assert (= (and start!36244 res!139098) b!167079))

(assert (= (and b!167079 res!139099) b!167081))

(assert (= (and b!167081 res!139097) b!167080))

(assert (= (and b!167080 (not res!139100)) b!167082))

(assert (= start!36244 b!167078))

(declare-fun m!265593 () Bool)

(assert (=> b!167080 m!265593))

(declare-fun m!265595 () Bool)

(assert (=> b!167080 m!265595))

(declare-fun m!265597 () Bool)

(assert (=> b!167080 m!265597))

(assert (=> b!167080 m!265593))

(declare-fun m!265599 () Bool)

(assert (=> b!167080 m!265599))

(declare-fun m!265601 () Bool)

(assert (=> b!167080 m!265601))

(declare-fun m!265603 () Bool)

(assert (=> b!167080 m!265603))

(declare-fun m!265605 () Bool)

(assert (=> b!167080 m!265605))

(declare-fun m!265607 () Bool)

(assert (=> b!167080 m!265607))

(declare-fun m!265609 () Bool)

(assert (=> b!167080 m!265609))

(declare-fun m!265611 () Bool)

(assert (=> b!167080 m!265611))

(declare-fun m!265613 () Bool)

(assert (=> b!167080 m!265613))

(declare-fun m!265615 () Bool)

(assert (=> b!167080 m!265615))

(declare-fun m!265617 () Bool)

(assert (=> b!167080 m!265617))

(declare-fun m!265619 () Bool)

(assert (=> b!167078 m!265619))

(declare-fun m!265621 () Bool)

(assert (=> start!36244 m!265621))

(declare-fun m!265623 () Bool)

(assert (=> b!167082 m!265623))

(declare-fun m!265625 () Bool)

(assert (=> b!167079 m!265625))

(check-sat (not start!36244) (not b!167080) (not b!167082) (not b!167079) (not b!167078))
