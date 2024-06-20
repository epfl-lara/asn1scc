; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34832 () Bool)

(assert start!34832)

(declare-fun res!137243 () Bool)

(declare-fun e!113815 () Bool)

(assert (=> start!34832 (=> (not res!137243) (not e!113815))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34832 (= res!137243 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34832 e!113815))

(assert (=> start!34832 true))

(declare-datatypes ((array!8257 0))(
  ( (array!8258 (arr!4617 (Array (_ BitVec 32) (_ BitVec 8))) (size!3696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6548 0))(
  ( (BitStream!6549 (buf!4148 array!8257) (currentByte!7729 (_ BitVec 32)) (currentBit!7724 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6548)

(declare-fun e!113817 () Bool)

(declare-fun inv!12 (BitStream!6548) Bool)

(assert (=> start!34832 (and (inv!12 thiss!1577) e!113817)))

(declare-fun lt!258483 () (_ BitVec 32))

(declare-fun lt!258477 () (_ BitVec 8))

(declare-fun b!164699 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164699 (= e!113815 (not (byteRangesEq!0 (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577)) lt!258477 #b00000000000000000000000000000000 lt!258483)))))

(declare-fun lt!258478 () array!8257)

(declare-fun arrayRangesEq!630 (array!8257 array!8257 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164699 (arrayRangesEq!630 (buf!4148 thiss!1577) lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577))))

(declare-datatypes ((Unit!11472 0))(
  ( (Unit!11473) )
))
(declare-fun lt!258479 () Unit!11472)

(declare-fun lt!258486 () array!8257)

(declare-fun arrayRangesEqTransitive!171 (array!8257 array!8257 array!8257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11472)

(assert (=> b!164699 (= lt!258479 (arrayRangesEqTransitive!171 (buf!4148 thiss!1577) lt!258486 lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (=> b!164699 (arrayRangesEq!630 lt!258486 lt!258478 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)))))

(declare-fun lt!258481 () Unit!11472)

(declare-fun lt!258485 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!238 (array!8257 (_ BitVec 32) (_ BitVec 8)) Unit!11472)

(assert (=> b!164699 (= lt!258481 (arrayUpdatedAtPrefixLemma!238 lt!258486 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485))))

(assert (=> b!164699 (arrayRangesEq!630 (buf!4148 thiss!1577) (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) lt!258477) (size!3696 (buf!4148 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7729 thiss!1577))))

(declare-fun lt!258484 () Unit!11472)

(assert (=> b!164699 (= lt!258484 (arrayUpdatedAtPrefixLemma!238 (buf!4148 thiss!1577) (currentByte!7729 thiss!1577) lt!258477))))

(declare-fun lt!258480 () (_ BitVec 32))

(assert (=> b!164699 (= lt!258477 (select (store (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7724 thiss!1577)))))))) (bvlshr (bvand lt!258480 #b00000000000000000000000011111111) lt!258483)))) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485) (currentByte!7729 thiss!1577)))))

(assert (=> b!164699 (= lt!258478 (array!8258 (store (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7724 thiss!1577)))))))) (bvlshr (bvand lt!258480 #b00000000000000000000000011111111) lt!258483)))) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485) (size!3696 (buf!4148 thiss!1577))))))

(declare-fun lt!258482 () (_ BitVec 32))

(assert (=> b!164699 (= lt!258485 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7724 thiss!1577)))))))) (bvlshr (bvand lt!258480 #b00000000000000000000000011111111) lt!258483)))) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258482))) (bvshl lt!258480 lt!258482))))))

(assert (=> b!164699 (= lt!258482 (bvsub #b00000000000000000000000000001000 lt!258483))))

(assert (=> b!164699 (= lt!258486 (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7724 thiss!1577)))))))) (bvlshr (bvand lt!258480 #b00000000000000000000000011111111) lt!258483)))) (size!3696 (buf!4148 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164699 (= lt!258480 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164699 (= lt!258483 (bvsub (bvadd (currentBit!7724 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164698 () Bool)

(declare-fun res!137242 () Bool)

(assert (=> b!164698 (=> (not res!137242) (not e!113815))))

(assert (=> b!164698 (= res!137242 (bvsgt (bvadd (currentBit!7724 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164697 () Bool)

(declare-fun res!137241 () Bool)

(assert (=> b!164697 (=> (not res!137241) (not e!113815))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164697 (= res!137241 (validate_offset_bits!1 ((_ sign_extend 32) (size!3696 (buf!4148 thiss!1577))) ((_ sign_extend 32) (currentByte!7729 thiss!1577)) ((_ sign_extend 32) (currentBit!7724 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164700 () Bool)

(declare-fun array_inv!3437 (array!8257) Bool)

(assert (=> b!164700 (= e!113817 (array_inv!3437 (buf!4148 thiss!1577)))))

(assert (= (and start!34832 res!137243) b!164697))

(assert (= (and b!164697 res!137241) b!164698))

(assert (= (and b!164698 res!137242) b!164699))

(assert (= start!34832 b!164700))

(declare-fun m!261971 () Bool)

(assert (=> start!34832 m!261971))

(declare-fun m!261973 () Bool)

(assert (=> b!164699 m!261973))

(declare-fun m!261975 () Bool)

(assert (=> b!164699 m!261975))

(declare-fun m!261977 () Bool)

(assert (=> b!164699 m!261977))

(declare-fun m!261979 () Bool)

(assert (=> b!164699 m!261979))

(declare-fun m!261981 () Bool)

(assert (=> b!164699 m!261981))

(assert (=> b!164699 m!261979))

(declare-fun m!261983 () Bool)

(assert (=> b!164699 m!261983))

(declare-fun m!261985 () Bool)

(assert (=> b!164699 m!261985))

(declare-fun m!261987 () Bool)

(assert (=> b!164699 m!261987))

(declare-fun m!261989 () Bool)

(assert (=> b!164699 m!261989))

(declare-fun m!261991 () Bool)

(assert (=> b!164699 m!261991))

(declare-fun m!261993 () Bool)

(assert (=> b!164699 m!261993))

(declare-fun m!261995 () Bool)

(assert (=> b!164699 m!261995))

(declare-fun m!261997 () Bool)

(assert (=> b!164699 m!261997))

(declare-fun m!261999 () Bool)

(assert (=> b!164699 m!261999))

(declare-fun m!262001 () Bool)

(assert (=> b!164699 m!262001))

(declare-fun m!262003 () Bool)

(assert (=> b!164699 m!262003))

(declare-fun m!262005 () Bool)

(assert (=> b!164697 m!262005))

(declare-fun m!262007 () Bool)

(assert (=> b!164700 m!262007))

(push 1)

(assert (not b!164700))

(assert (not b!164697))

(assert (not start!34832))

(assert (not b!164699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56861 () Bool)

(assert (=> d!56861 (= (array_inv!3437 (buf!4148 thiss!1577)) (bvsge (size!3696 (buf!4148 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164700 d!56861))

(declare-fun d!56865 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56865 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3696 (buf!4148 thiss!1577))) ((_ sign_extend 32) (currentByte!7729 thiss!1577)) ((_ sign_extend 32) (currentBit!7724 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3696 (buf!4148 thiss!1577))) ((_ sign_extend 32) (currentByte!7729 thiss!1577)) ((_ sign_extend 32) (currentBit!7724 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14094 () Bool)

(assert (= bs!14094 d!56865))

(declare-fun m!262021 () Bool)

(assert (=> bs!14094 m!262021))

(assert (=> b!164697 d!56865))

(declare-fun d!56867 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56867 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7724 thiss!1577) (currentByte!7729 thiss!1577) (size!3696 (buf!4148 thiss!1577))))))

(declare-fun bs!14095 () Bool)

(assert (= bs!14095 d!56867))

(declare-fun m!262023 () Bool)

(assert (=> bs!14095 m!262023))

(assert (=> start!34832 d!56867))

(declare-fun d!56869 () Bool)

(declare-fun e!113828 () Bool)

(assert (=> d!56869 e!113828))

(declare-fun res!137254 () Bool)

(assert (=> d!56869 (=> (not res!137254) (not e!113828))))

(assert (=> d!56869 (= res!137254 (and (bvsge (currentByte!7729 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7729 thiss!1577) (size!3696 (buf!4148 thiss!1577)))))))

(declare-fun lt!258492 () Unit!11472)

(declare-fun choose!213 (array!8257 (_ BitVec 32) (_ BitVec 8)) Unit!11472)

(assert (=> d!56869 (= lt!258492 (choose!213 (buf!4148 thiss!1577) (currentByte!7729 thiss!1577) lt!258477))))

(assert (=> d!56869 (and (bvsle #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)) (bvslt (currentByte!7729 thiss!1577) (size!3696 (buf!4148 thiss!1577))))))

(assert (=> d!56869 (= (arrayUpdatedAtPrefixLemma!238 (buf!4148 thiss!1577) (currentByte!7729 thiss!1577) lt!258477) lt!258492)))

(declare-fun b!164711 () Bool)

(assert (=> b!164711 (= e!113828 (arrayRangesEq!630 (buf!4148 thiss!1577) (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) lt!258477) (size!3696 (buf!4148 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)))))

(assert (= (and d!56869 res!137254) b!164711))

(declare-fun m!262035 () Bool)

(assert (=> d!56869 m!262035))

(assert (=> b!164711 m!261991))

(assert (=> b!164711 m!261975))

(assert (=> b!164699 d!56869))

(declare-fun d!56877 () Bool)

(assert (=> d!56877 (= (byteRangesEq!0 (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577)) lt!258477 #b00000000000000000000000000000000 lt!258483) (or (= #b00000000000000000000000000000000 lt!258483) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258483))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258477) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258483))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14098 () Bool)

(assert (= bs!14098 d!56877))

(declare-fun m!262045 () Bool)

(assert (=> bs!14098 m!262045))

(declare-fun m!262047 () Bool)

(assert (=> bs!14098 m!262047))

(assert (=> b!164699 d!56877))

(declare-fun d!56883 () Bool)

(declare-fun res!137275 () Bool)

(declare-fun e!113849 () Bool)

(assert (=> d!56883 (=> res!137275 e!113849)))

(assert (=> d!56883 (= res!137275 (= #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)))))

(assert (=> d!56883 (= (arrayRangesEq!630 (buf!4148 thiss!1577) lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)) e!113849)))

(declare-fun b!164732 () Bool)

(declare-fun e!113850 () Bool)

(assert (=> b!164732 (= e!113849 e!113850)))

(declare-fun res!137276 () Bool)

(assert (=> b!164732 (=> (not res!137276) (not e!113850))))

(assert (=> b!164732 (= res!137276 (= (select (arr!4617 (buf!4148 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4617 lt!258478) #b00000000000000000000000000000000)))))

(declare-fun b!164733 () Bool)

(assert (=> b!164733 (= e!113850 (arrayRangesEq!630 (buf!4148 thiss!1577) lt!258478 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7729 thiss!1577)))))

(assert (= (and d!56883 (not res!137275)) b!164732))

(assert (= (and b!164732 res!137276) b!164733))

(declare-fun m!262071 () Bool)

(assert (=> b!164732 m!262071))

(declare-fun m!262073 () Bool)

(assert (=> b!164732 m!262073))

(declare-fun m!262075 () Bool)

(assert (=> b!164733 m!262075))

(assert (=> b!164699 d!56883))

(declare-fun d!56897 () Bool)

(assert (=> d!56897 (arrayRangesEq!630 (buf!4148 thiss!1577) lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577))))

(declare-fun lt!258506 () Unit!11472)

(declare-fun choose!216 (array!8257 array!8257 array!8257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11472)

(assert (=> d!56897 (= lt!258506 (choose!216 (buf!4148 thiss!1577) lt!258486 lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (=> d!56897 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)) (bvsle (currentByte!7729 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (=> d!56897 (= (arrayRangesEqTransitive!171 (buf!4148 thiss!1577) lt!258486 lt!258478 #b00000000000000000000000000000000 (currentByte!7729 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))) lt!258506)))

(declare-fun bs!14102 () Bool)

(assert (= bs!14102 d!56897))

(assert (=> bs!14102 m!261987))

(declare-fun m!262087 () Bool)

(assert (=> bs!14102 m!262087))

(assert (=> b!164699 d!56897))

(declare-fun d!56903 () Bool)

(declare-fun res!137281 () Bool)

(declare-fun e!113855 () Bool)

(assert (=> d!56903 (=> res!137281 e!113855)))

(assert (=> d!56903 (= res!137281 (= #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)))))

(assert (=> d!56903 (= (arrayRangesEq!630 (buf!4148 thiss!1577) (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) lt!258477) (size!3696 (buf!4148 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7729 thiss!1577)) e!113855)))

(declare-fun b!164738 () Bool)

(declare-fun e!113856 () Bool)

(assert (=> b!164738 (= e!113855 e!113856)))

(declare-fun res!137282 () Bool)

(assert (=> b!164738 (=> (not res!137282) (not e!113856))))

(assert (=> b!164738 (= res!137282 (= (select (arr!4617 (buf!4148 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4617 (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) lt!258477) (size!3696 (buf!4148 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164739 () Bool)

(assert (=> b!164739 (= e!113856 (arrayRangesEq!630 (buf!4148 thiss!1577) (array!8258 (store (arr!4617 (buf!4148 thiss!1577)) (currentByte!7729 thiss!1577) lt!258477) (size!3696 (buf!4148 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7729 thiss!1577)))))

(assert (= (and d!56903 (not res!137281)) b!164738))

(assert (= (and b!164738 res!137282) b!164739))

(assert (=> b!164738 m!262071))

(declare-fun m!262091 () Bool)

(assert (=> b!164738 m!262091))

(declare-fun m!262093 () Bool)

(assert (=> b!164739 m!262093))

(assert (=> b!164699 d!56903))

(declare-fun d!56907 () Bool)

(declare-fun res!137283 () Bool)

(declare-fun e!113857 () Bool)

(assert (=> d!56907 (=> res!137283 e!113857)))

(assert (=> d!56907 (= res!137283 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (=> d!56907 (= (arrayRangesEq!630 lt!258486 lt!258478 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))) e!113857)))

(declare-fun b!164740 () Bool)

(declare-fun e!113858 () Bool)

(assert (=> b!164740 (= e!113857 e!113858)))

(declare-fun res!137284 () Bool)

(assert (=> b!164740 (=> (not res!137284) (not e!113858))))

(assert (=> b!164740 (= res!137284 (= (select (arr!4617 lt!258486) #b00000000000000000000000000000000) (select (arr!4617 lt!258478) #b00000000000000000000000000000000)))))

(declare-fun b!164741 () Bool)

(assert (=> b!164741 (= e!113858 (arrayRangesEq!630 lt!258486 lt!258478 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (= (and d!56907 (not res!137283)) b!164740))

(assert (= (and b!164740 res!137284) b!164741))

(declare-fun m!262095 () Bool)

(assert (=> b!164740 m!262095))

(assert (=> b!164740 m!262073))

(declare-fun m!262097 () Bool)

(assert (=> b!164741 m!262097))

(assert (=> b!164699 d!56907))

(declare-fun d!56909 () Bool)

(declare-fun e!113859 () Bool)

(assert (=> d!56909 e!113859))

(declare-fun res!137285 () Bool)

(assert (=> d!56909 (=> (not res!137285) (not e!113859))))

(assert (=> d!56909 (= res!137285 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) (size!3696 lt!258486))))))

(declare-fun lt!258507 () Unit!11472)

(assert (=> d!56909 (= lt!258507 (choose!213 lt!258486 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485))))

(assert (=> d!56909 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) (size!3696 lt!258486)))))

(assert (=> d!56909 (= (arrayUpdatedAtPrefixLemma!238 lt!258486 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485) lt!258507)))

(declare-fun b!164742 () Bool)

(assert (=> b!164742 (= e!113859 (arrayRangesEq!630 lt!258486 (array!8258 (store (arr!4617 lt!258486) (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577)) lt!258485) (size!3696 lt!258486)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7729 thiss!1577))))))

(assert (= (and d!56909 res!137285) b!164742))

(declare-fun m!262099 () Bool)

(assert (=> d!56909 m!262099))

(declare-fun m!262101 () Bool)

(assert (=> b!164742 m!262101))

(declare-fun m!262103 () Bool)

(assert (=> b!164742 m!262103))

(assert (=> b!164699 d!56909))

(push 1)

(assert (not d!56867))

(assert (not b!164739))

(assert (not d!56869))

(assert (not d!56909))

(assert (not d!56897))

(assert (not d!56865))

(assert (not b!164742))

(assert (not b!164741))

(assert (not b!164733))

(assert (not b!164711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

