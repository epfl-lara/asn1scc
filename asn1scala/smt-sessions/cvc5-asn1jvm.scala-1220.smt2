; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34612 () Bool)

(assert start!34612)

(declare-fun b!164102 () Bool)

(declare-fun res!136736 () Bool)

(declare-fun e!113367 () Bool)

(assert (=> b!164102 (=> (not res!136736) (not e!113367))))

(declare-datatypes ((array!8201 0))(
  ( (array!8202 (arr!4594 (Array (_ BitVec 32) (_ BitVec 8))) (size!3673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6502 0))(
  ( (BitStream!6503 (buf!4125 array!8201) (currentByte!7687 (_ BitVec 32)) (currentBit!7682 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6502)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164102 (= res!136736 (validate_offset_bits!1 ((_ sign_extend 32) (size!3673 (buf!4125 thiss!1577))) ((_ sign_extend 32) (currentByte!7687 thiss!1577)) ((_ sign_extend 32) (currentBit!7682 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136734 () Bool)

(assert (=> start!34612 (=> (not res!136734) (not e!113367))))

(assert (=> start!34612 (= res!136734 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34612 e!113367))

(assert (=> start!34612 true))

(declare-fun e!113364 () Bool)

(declare-fun inv!12 (BitStream!6502) Bool)

(assert (=> start!34612 (and (inv!12 thiss!1577) e!113364)))

(declare-fun b!164103 () Bool)

(declare-fun e!113365 () Bool)

(declare-fun lt!257555 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164103 (= e!113365 (invariant!0 lt!257555 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 (buf!4125 thiss!1577))))))

(declare-fun b!164104 () Bool)

(declare-fun res!136735 () Bool)

(assert (=> b!164104 (=> (not res!136735) (not e!113367))))

(assert (=> b!164104 (= res!136735 (bvsgt (bvadd (currentBit!7682 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164105 () Bool)

(declare-fun array_inv!3414 (array!8201) Bool)

(assert (=> b!164105 (= e!113364 (array_inv!3414 (buf!4125 thiss!1577)))))

(declare-fun b!164106 () Bool)

(assert (=> b!164106 (= e!113367 (not e!113365))))

(declare-fun res!136733 () Bool)

(assert (=> b!164106 (=> res!136733 e!113365)))

(declare-fun lt!257556 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164106 (= res!136733 (not (byteRangesEq!0 (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577)) lt!257556 #b00000000000000000000000000000000 lt!257555)))))

(declare-fun lt!257563 () array!8201)

(declare-fun arrayRangesEq!607 (array!8201 array!8201 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164106 (arrayRangesEq!607 (buf!4125 thiss!1577) lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577))))

(declare-fun lt!257560 () array!8201)

(declare-datatypes ((Unit!11423 0))(
  ( (Unit!11424) )
))
(declare-fun lt!257557 () Unit!11423)

(declare-fun arrayRangesEqTransitive!154 (array!8201 array!8201 array!8201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11423)

(assert (=> b!164106 (= lt!257557 (arrayRangesEqTransitive!154 (buf!4125 thiss!1577) lt!257560 lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (=> b!164106 (arrayRangesEq!607 lt!257560 lt!257563 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)))))

(declare-fun lt!257562 () (_ BitVec 8))

(declare-fun lt!257558 () Unit!11423)

(declare-fun arrayUpdatedAtPrefixLemma!215 (array!8201 (_ BitVec 32) (_ BitVec 8)) Unit!11423)

(assert (=> b!164106 (= lt!257558 (arrayUpdatedAtPrefixLemma!215 lt!257560 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562))))

(assert (=> b!164106 (arrayRangesEq!607 (buf!4125 thiss!1577) (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) lt!257556) (size!3673 (buf!4125 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7687 thiss!1577))))

(declare-fun lt!257559 () Unit!11423)

(assert (=> b!164106 (= lt!257559 (arrayUpdatedAtPrefixLemma!215 (buf!4125 thiss!1577) (currentByte!7687 thiss!1577) lt!257556))))

(declare-fun lt!257564 () (_ BitVec 32))

(assert (=> b!164106 (= lt!257556 (select (store (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7682 thiss!1577)))))))) (bvlshr (bvand lt!257564 #b00000000000000000000000011111111) lt!257555)))) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562) (currentByte!7687 thiss!1577)))))

(assert (=> b!164106 (= lt!257563 (array!8202 (store (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7682 thiss!1577)))))))) (bvlshr (bvand lt!257564 #b00000000000000000000000011111111) lt!257555)))) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562) (size!3673 (buf!4125 thiss!1577))))))

(declare-fun lt!257561 () (_ BitVec 32))

(assert (=> b!164106 (= lt!257562 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7682 thiss!1577)))))))) (bvlshr (bvand lt!257564 #b00000000000000000000000011111111) lt!257555)))) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257561))) (bvshl lt!257564 lt!257561))))))

(assert (=> b!164106 (= lt!257561 (bvsub #b00000000000000000000000000001000 lt!257555))))

(assert (=> b!164106 (= lt!257560 (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7682 thiss!1577)))))))) (bvlshr (bvand lt!257564 #b00000000000000000000000011111111) lt!257555)))) (size!3673 (buf!4125 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164106 (= lt!257564 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164106 (= lt!257555 (bvsub (bvadd (currentBit!7682 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34612 res!136734) b!164102))

(assert (= (and b!164102 res!136736) b!164104))

(assert (= (and b!164104 res!136735) b!164106))

(assert (= (and b!164106 (not res!136733)) b!164103))

(assert (= start!34612 b!164105))

(declare-fun m!260709 () Bool)

(assert (=> b!164103 m!260709))

(declare-fun m!260711 () Bool)

(assert (=> b!164102 m!260711))

(declare-fun m!260713 () Bool)

(assert (=> start!34612 m!260713))

(declare-fun m!260715 () Bool)

(assert (=> b!164105 m!260715))

(declare-fun m!260717 () Bool)

(assert (=> b!164106 m!260717))

(declare-fun m!260719 () Bool)

(assert (=> b!164106 m!260719))

(declare-fun m!260721 () Bool)

(assert (=> b!164106 m!260721))

(assert (=> b!164106 m!260719))

(declare-fun m!260723 () Bool)

(assert (=> b!164106 m!260723))

(declare-fun m!260725 () Bool)

(assert (=> b!164106 m!260725))

(declare-fun m!260727 () Bool)

(assert (=> b!164106 m!260727))

(declare-fun m!260729 () Bool)

(assert (=> b!164106 m!260729))

(declare-fun m!260731 () Bool)

(assert (=> b!164106 m!260731))

(declare-fun m!260733 () Bool)

(assert (=> b!164106 m!260733))

(declare-fun m!260735 () Bool)

(assert (=> b!164106 m!260735))

(declare-fun m!260737 () Bool)

(assert (=> b!164106 m!260737))

(declare-fun m!260739 () Bool)

(assert (=> b!164106 m!260739))

(declare-fun m!260741 () Bool)

(assert (=> b!164106 m!260741))

(declare-fun m!260743 () Bool)

(assert (=> b!164106 m!260743))

(declare-fun m!260745 () Bool)

(assert (=> b!164106 m!260745))

(declare-fun m!260747 () Bool)

(assert (=> b!164106 m!260747))

(push 1)

(assert (not b!164106))

(assert (not b!164102))

(assert (not b!164105))

(assert (not start!34612))

(assert (not b!164103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56599 () Bool)

(assert (=> d!56599 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7682 thiss!1577) (currentByte!7687 thiss!1577) (size!3673 (buf!4125 thiss!1577))))))

(declare-fun bs!14025 () Bool)

(assert (= bs!14025 d!56599))

(declare-fun m!260829 () Bool)

(assert (=> bs!14025 m!260829))

(assert (=> start!34612 d!56599))

(declare-fun d!56601 () Bool)

(declare-fun res!136765 () Bool)

(declare-fun e!113396 () Bool)

(assert (=> d!56601 (=> res!136765 e!113396)))

(assert (=> d!56601 (= res!136765 (= #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)))))

(assert (=> d!56601 (= (arrayRangesEq!607 (buf!4125 thiss!1577) lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)) e!113396)))

(declare-fun b!164141 () Bool)

(declare-fun e!113397 () Bool)

(assert (=> b!164141 (= e!113396 e!113397)))

(declare-fun res!136766 () Bool)

(assert (=> b!164141 (=> (not res!136766) (not e!113397))))

(assert (=> b!164141 (= res!136766 (= (select (arr!4594 (buf!4125 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4594 lt!257563) #b00000000000000000000000000000000)))))

(declare-fun b!164142 () Bool)

(assert (=> b!164142 (= e!113397 (arrayRangesEq!607 (buf!4125 thiss!1577) lt!257563 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7687 thiss!1577)))))

(assert (= (and d!56601 (not res!136765)) b!164141))

(assert (= (and b!164141 res!136766) b!164142))

(declare-fun m!260833 () Bool)

(assert (=> b!164141 m!260833))

(declare-fun m!260835 () Bool)

(assert (=> b!164141 m!260835))

(declare-fun m!260837 () Bool)

(assert (=> b!164142 m!260837))

(assert (=> b!164106 d!56601))

(declare-fun d!56609 () Bool)

(assert (=> d!56609 (= (byteRangesEq!0 (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577)) lt!257556 #b00000000000000000000000000000000 lt!257555) (or (= #b00000000000000000000000000000000 lt!257555) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257555))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!257556) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257555))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14029 () Bool)

(assert (= bs!14029 d!56609))

(declare-fun m!260845 () Bool)

(assert (=> bs!14029 m!260845))

(declare-fun m!260847 () Bool)

(assert (=> bs!14029 m!260847))

(assert (=> b!164106 d!56609))

(declare-fun d!56617 () Bool)

(declare-fun e!113417 () Bool)

(assert (=> d!56617 e!113417))

(declare-fun res!136786 () Bool)

(assert (=> d!56617 (=> (not res!136786) (not e!113417))))

(assert (=> d!56617 (= res!136786 (and (bvsge (currentByte!7687 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7687 thiss!1577) (size!3673 (buf!4125 thiss!1577)))))))

(declare-fun lt!257634 () Unit!11423)

(declare-fun choose!197 (array!8201 (_ BitVec 32) (_ BitVec 8)) Unit!11423)

(assert (=> d!56617 (= lt!257634 (choose!197 (buf!4125 thiss!1577) (currentByte!7687 thiss!1577) lt!257556))))

(assert (=> d!56617 (and (bvsle #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)) (bvslt (currentByte!7687 thiss!1577) (size!3673 (buf!4125 thiss!1577))))))

(assert (=> d!56617 (= (arrayUpdatedAtPrefixLemma!215 (buf!4125 thiss!1577) (currentByte!7687 thiss!1577) lt!257556) lt!257634)))

(declare-fun b!164162 () Bool)

(assert (=> b!164162 (= e!113417 (arrayRangesEq!607 (buf!4125 thiss!1577) (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) lt!257556) (size!3673 (buf!4125 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)))))

(assert (= (and d!56617 res!136786) b!164162))

(declare-fun m!260869 () Bool)

(assert (=> d!56617 m!260869))

(assert (=> b!164162 m!260733))

(assert (=> b!164162 m!260739))

(assert (=> b!164106 d!56617))

(declare-fun d!56629 () Bool)

(declare-fun e!113420 () Bool)

(assert (=> d!56629 e!113420))

(declare-fun res!136789 () Bool)

(assert (=> d!56629 (=> (not res!136789) (not e!113420))))

(assert (=> d!56629 (= res!136789 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 lt!257560))))))

(declare-fun lt!257635 () Unit!11423)

(assert (=> d!56629 (= lt!257635 (choose!197 lt!257560 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562))))

(assert (=> d!56629 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 lt!257560)))))

(assert (=> d!56629 (= (arrayUpdatedAtPrefixLemma!215 lt!257560 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562) lt!257635)))

(declare-fun b!164165 () Bool)

(assert (=> b!164165 (= e!113420 (arrayRangesEq!607 lt!257560 (array!8202 (store (arr!4594 lt!257560) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) lt!257562) (size!3673 lt!257560)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (= (and d!56629 res!136789) b!164165))

(declare-fun m!260877 () Bool)

(assert (=> d!56629 m!260877))

(declare-fun m!260879 () Bool)

(assert (=> b!164165 m!260879))

(declare-fun m!260881 () Bool)

(assert (=> b!164165 m!260881))

(assert (=> b!164106 d!56629))

(declare-fun d!56631 () Bool)

(declare-fun res!136790 () Bool)

(declare-fun e!113421 () Bool)

(assert (=> d!56631 (=> res!136790 e!113421)))

(assert (=> d!56631 (= res!136790 (= #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)))))

(assert (=> d!56631 (= (arrayRangesEq!607 (buf!4125 thiss!1577) (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) lt!257556) (size!3673 (buf!4125 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)) e!113421)))

(declare-fun b!164166 () Bool)

(declare-fun e!113422 () Bool)

(assert (=> b!164166 (= e!113421 e!113422)))

(declare-fun res!136791 () Bool)

(assert (=> b!164166 (=> (not res!136791) (not e!113422))))

(assert (=> b!164166 (= res!136791 (= (select (arr!4594 (buf!4125 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4594 (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) lt!257556) (size!3673 (buf!4125 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164167 () Bool)

(assert (=> b!164167 (= e!113422 (arrayRangesEq!607 (buf!4125 thiss!1577) (array!8202 (store (arr!4594 (buf!4125 thiss!1577)) (currentByte!7687 thiss!1577) lt!257556) (size!3673 (buf!4125 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7687 thiss!1577)))))

(assert (= (and d!56631 (not res!136790)) b!164166))

(assert (= (and b!164166 res!136791) b!164167))

(assert (=> b!164166 m!260833))

(declare-fun m!260883 () Bool)

(assert (=> b!164166 m!260883))

(declare-fun m!260885 () Bool)

(assert (=> b!164167 m!260885))

(assert (=> b!164106 d!56631))

(declare-fun d!56633 () Bool)

(declare-fun res!136792 () Bool)

(declare-fun e!113423 () Bool)

(assert (=> d!56633 (=> res!136792 e!113423)))

(assert (=> d!56633 (= res!136792 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (=> d!56633 (= (arrayRangesEq!607 lt!257560 lt!257563 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))) e!113423)))

(declare-fun b!164168 () Bool)

(declare-fun e!113424 () Bool)

(assert (=> b!164168 (= e!113423 e!113424)))

(declare-fun res!136793 () Bool)

(assert (=> b!164168 (=> (not res!136793) (not e!113424))))

(assert (=> b!164168 (= res!136793 (= (select (arr!4594 lt!257560) #b00000000000000000000000000000000) (select (arr!4594 lt!257563) #b00000000000000000000000000000000)))))

(declare-fun b!164169 () Bool)

(assert (=> b!164169 (= e!113424 (arrayRangesEq!607 lt!257560 lt!257563 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (= (and d!56633 (not res!136792)) b!164168))

(assert (= (and b!164168 res!136793) b!164169))

(declare-fun m!260887 () Bool)

(assert (=> b!164168 m!260887))

(assert (=> b!164168 m!260835))

(declare-fun m!260889 () Bool)

(assert (=> b!164169 m!260889))

(assert (=> b!164106 d!56633))

(declare-fun d!56635 () Bool)

(assert (=> d!56635 (arrayRangesEq!607 (buf!4125 thiss!1577) lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577))))

(declare-fun lt!257641 () Unit!11423)

(declare-fun choose!200 (array!8201 array!8201 array!8201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11423)

(assert (=> d!56635 (= lt!257641 (choose!200 (buf!4125 thiss!1577) lt!257560 lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (=> d!56635 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7687 thiss!1577)) (bvsle (currentByte!7687 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))))))

(assert (=> d!56635 (= (arrayRangesEqTransitive!154 (buf!4125 thiss!1577) lt!257560 lt!257563 #b00000000000000000000000000000000 (currentByte!7687 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577))) lt!257641)))

(declare-fun bs!14031 () Bool)

(assert (= bs!14031 d!56635))

(assert (=> bs!14031 m!260731))

(declare-fun m!260899 () Bool)

(assert (=> bs!14031 m!260899))

(assert (=> b!164106 d!56635))

(declare-fun d!56641 () Bool)

(assert (=> d!56641 (= (array_inv!3414 (buf!4125 thiss!1577)) (bvsge (size!3673 (buf!4125 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164105 d!56641))

(declare-fun d!56645 () Bool)

(assert (=> d!56645 (= (invariant!0 lt!257555 (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 (buf!4125 thiss!1577))) (and (bvsge lt!257555 #b00000000000000000000000000000000) (bvslt lt!257555 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 (buf!4125 thiss!1577))) (and (= lt!257555 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!7687 thiss!1577)) (size!3673 (buf!4125 thiss!1577)))))))))

(assert (=> b!164103 d!56645))

(declare-fun d!56657 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56657 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3673 (buf!4125 thiss!1577))) ((_ sign_extend 32) (currentByte!7687 thiss!1577)) ((_ sign_extend 32) (currentBit!7682 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3673 (buf!4125 thiss!1577))) ((_ sign_extend 32) (currentByte!7687 thiss!1577)) ((_ sign_extend 32) (currentBit!7682 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14035 () Bool)

(assert (= bs!14035 d!56657))

(declare-fun m!260921 () Bool)

(assert (=> bs!14035 m!260921))

(assert (=> b!164102 d!56657))

(push 1)

(assert (not b!164142))

(assert (not b!164162))

(assert (not b!164165))

(assert (not b!164167))

(assert (not b!164169))

(assert (not d!56617))

(assert (not d!56657))

(assert (not d!56635))

(assert (not d!56629))

(assert (not d!56599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

