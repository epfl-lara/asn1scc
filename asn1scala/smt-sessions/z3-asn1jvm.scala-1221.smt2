; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34674 () Bool)

(assert start!34674)

(declare-fun b!164214 () Bool)

(declare-fun res!136836 () Bool)

(declare-fun e!113467 () Bool)

(assert (=> b!164214 (=> (not res!136836) (not e!113467))))

(declare-datatypes ((array!8212 0))(
  ( (array!8213 (arr!4598 (Array (_ BitVec 32) (_ BitVec 8))) (size!3677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6510 0))(
  ( (BitStream!6511 (buf!4129 array!8212) (currentByte!7698 (_ BitVec 32)) (currentBit!7693 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6510)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164214 (= res!136836 (validate_offset_bits!1 ((_ sign_extend 32) (size!3677 (buf!4129 thiss!1577))) ((_ sign_extend 32) (currentByte!7698 thiss!1577)) ((_ sign_extend 32) (currentBit!7693 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164216 () Bool)

(declare-fun e!113465 () Bool)

(assert (=> b!164216 (= e!113467 (not e!113465))))

(declare-fun res!136835 () Bool)

(assert (=> b!164216 (=> res!136835 e!113465)))

(declare-fun lt!257697 () (_ BitVec 32))

(declare-fun lt!257699 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164216 (= res!136835 (not (byteRangesEq!0 (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577)) lt!257699 #b00000000000000000000000000000000 lt!257697)))))

(declare-fun lt!257698 () array!8212)

(declare-fun arrayRangesEq!611 (array!8212 array!8212 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164216 (arrayRangesEq!611 (buf!4129 thiss!1577) lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577))))

(declare-fun lt!257701 () array!8212)

(declare-datatypes ((Unit!11431 0))(
  ( (Unit!11432) )
))
(declare-fun lt!257704 () Unit!11431)

(declare-fun arrayRangesEqTransitive!158 (array!8212 array!8212 array!8212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11431)

(assert (=> b!164216 (= lt!257704 (arrayRangesEqTransitive!158 (buf!4129 thiss!1577) lt!257701 lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (=> b!164216 (arrayRangesEq!611 lt!257701 lt!257698 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)))))

(declare-fun lt!257705 () (_ BitVec 8))

(declare-fun lt!257703 () Unit!11431)

(declare-fun arrayUpdatedAtPrefixLemma!219 (array!8212 (_ BitVec 32) (_ BitVec 8)) Unit!11431)

(assert (=> b!164216 (= lt!257703 (arrayUpdatedAtPrefixLemma!219 lt!257701 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705))))

(assert (=> b!164216 (arrayRangesEq!611 (buf!4129 thiss!1577) (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) lt!257699) (size!3677 (buf!4129 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7698 thiss!1577))))

(declare-fun lt!257702 () Unit!11431)

(assert (=> b!164216 (= lt!257702 (arrayUpdatedAtPrefixLemma!219 (buf!4129 thiss!1577) (currentByte!7698 thiss!1577) lt!257699))))

(declare-fun lt!257700 () (_ BitVec 32))

(assert (=> b!164216 (= lt!257699 (select (store (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7693 thiss!1577)))))))) (bvlshr (bvand lt!257700 #b00000000000000000000000011111111) lt!257697)))) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705) (currentByte!7698 thiss!1577)))))

(assert (=> b!164216 (= lt!257698 (array!8213 (store (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7693 thiss!1577)))))))) (bvlshr (bvand lt!257700 #b00000000000000000000000011111111) lt!257697)))) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705) (size!3677 (buf!4129 thiss!1577))))))

(declare-fun lt!257696 () (_ BitVec 32))

(assert (=> b!164216 (= lt!257705 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7693 thiss!1577)))))))) (bvlshr (bvand lt!257700 #b00000000000000000000000011111111) lt!257697)))) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257696))) (bvshl lt!257700 lt!257696))))))

(assert (=> b!164216 (= lt!257696 (bvsub #b00000000000000000000000000001000 lt!257697))))

(assert (=> b!164216 (= lt!257701 (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7693 thiss!1577)))))))) (bvlshr (bvand lt!257700 #b00000000000000000000000011111111) lt!257697)))) (size!3677 (buf!4129 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164216 (= lt!257700 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164216 (= lt!257697 (bvsub (bvadd (currentBit!7693 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164217 () Bool)

(declare-fun res!136834 () Bool)

(assert (=> b!164217 (=> (not res!136834) (not e!113467))))

(assert (=> b!164217 (= res!136834 (bvsgt (bvadd (currentBit!7693 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164218 () Bool)

(declare-fun e!113466 () Bool)

(declare-fun array_inv!3418 (array!8212) Bool)

(assert (=> b!164218 (= e!113466 (array_inv!3418 (buf!4129 thiss!1577)))))

(declare-fun b!164215 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164215 (= e!113465 (invariant!0 (currentBit!7693 thiss!1577) (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577))))))

(declare-fun res!136833 () Bool)

(assert (=> start!34674 (=> (not res!136833) (not e!113467))))

(assert (=> start!34674 (= res!136833 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34674 e!113467))

(assert (=> start!34674 true))

(declare-fun inv!12 (BitStream!6510) Bool)

(assert (=> start!34674 (and (inv!12 thiss!1577) e!113466)))

(assert (= (and start!34674 res!136833) b!164214))

(assert (= (and b!164214 res!136836) b!164217))

(assert (= (and b!164217 res!136834) b!164216))

(assert (= (and b!164216 (not res!136835)) b!164215))

(assert (= start!34674 b!164218))

(declare-fun m!260983 () Bool)

(assert (=> b!164218 m!260983))

(declare-fun m!260985 () Bool)

(assert (=> start!34674 m!260985))

(declare-fun m!260987 () Bool)

(assert (=> b!164216 m!260987))

(declare-fun m!260989 () Bool)

(assert (=> b!164216 m!260989))

(declare-fun m!260991 () Bool)

(assert (=> b!164216 m!260991))

(declare-fun m!260993 () Bool)

(assert (=> b!164216 m!260993))

(declare-fun m!260995 () Bool)

(assert (=> b!164216 m!260995))

(declare-fun m!260997 () Bool)

(assert (=> b!164216 m!260997))

(assert (=> b!164216 m!260991))

(declare-fun m!260999 () Bool)

(assert (=> b!164216 m!260999))

(declare-fun m!261001 () Bool)

(assert (=> b!164216 m!261001))

(declare-fun m!261003 () Bool)

(assert (=> b!164216 m!261003))

(declare-fun m!261005 () Bool)

(assert (=> b!164216 m!261005))

(declare-fun m!261007 () Bool)

(assert (=> b!164216 m!261007))

(declare-fun m!261009 () Bool)

(assert (=> b!164216 m!261009))

(declare-fun m!261011 () Bool)

(assert (=> b!164216 m!261011))

(declare-fun m!261013 () Bool)

(assert (=> b!164216 m!261013))

(declare-fun m!261015 () Bool)

(assert (=> b!164216 m!261015))

(declare-fun m!261017 () Bool)

(assert (=> b!164216 m!261017))

(declare-fun m!261019 () Bool)

(assert (=> b!164214 m!261019))

(declare-fun m!261021 () Bool)

(assert (=> b!164215 m!261021))

(check-sat (not b!164215) (not b!164218) (not b!164214) (not start!34674) (not b!164216))
(check-sat)
(get-model)

(declare-fun d!56683 () Bool)

(assert (=> d!56683 (= (invariant!0 (currentBit!7693 thiss!1577) (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577))) (and (bvsge (currentBit!7693 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7693 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7698 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577))) (and (= (currentBit!7693 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577)))))))))

(assert (=> b!164215 d!56683))

(declare-fun d!56685 () Bool)

(assert (=> d!56685 (= (byteRangesEq!0 (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577)) lt!257699 #b00000000000000000000000000000000 lt!257697) (or (= #b00000000000000000000000000000000 lt!257697) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!257699) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257697))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14043 () Bool)

(assert (= bs!14043 d!56685))

(declare-fun m!261063 () Bool)

(assert (=> bs!14043 m!261063))

(declare-fun m!261065 () Bool)

(assert (=> bs!14043 m!261065))

(assert (=> b!164216 d!56685))

(declare-fun d!56687 () Bool)

(declare-fun e!113482 () Bool)

(assert (=> d!56687 e!113482))

(declare-fun res!136851 () Bool)

(assert (=> d!56687 (=> (not res!136851) (not e!113482))))

(assert (=> d!56687 (= res!136851 (and (bvsge (currentByte!7698 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577)))))))

(declare-fun lt!257738 () Unit!11431)

(declare-fun choose!203 (array!8212 (_ BitVec 32) (_ BitVec 8)) Unit!11431)

(assert (=> d!56687 (= lt!257738 (choose!203 (buf!4129 thiss!1577) (currentByte!7698 thiss!1577) lt!257699))))

(assert (=> d!56687 (and (bvsle #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)) (bvslt (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577))))))

(assert (=> d!56687 (= (arrayUpdatedAtPrefixLemma!219 (buf!4129 thiss!1577) (currentByte!7698 thiss!1577) lt!257699) lt!257738)))

(declare-fun b!164236 () Bool)

(assert (=> b!164236 (= e!113482 (arrayRangesEq!611 (buf!4129 thiss!1577) (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) lt!257699) (size!3677 (buf!4129 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)))))

(assert (= (and d!56687 res!136851) b!164236))

(declare-fun m!261067 () Bool)

(assert (=> d!56687 m!261067))

(assert (=> b!164236 m!261013))

(assert (=> b!164236 m!260993))

(assert (=> b!164216 d!56687))

(declare-fun d!56689 () Bool)

(assert (=> d!56689 (arrayRangesEq!611 (buf!4129 thiss!1577) lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577))))

(declare-fun lt!257741 () Unit!11431)

(declare-fun choose!204 (array!8212 array!8212 array!8212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11431)

(assert (=> d!56689 (= lt!257741 (choose!204 (buf!4129 thiss!1577) lt!257701 lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (=> d!56689 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)) (bvsle (currentByte!7698 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (=> d!56689 (= (arrayRangesEqTransitive!158 (buf!4129 thiss!1577) lt!257701 lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))) lt!257741)))

(declare-fun bs!14044 () Bool)

(assert (= bs!14044 d!56689))

(assert (=> bs!14044 m!261011))

(declare-fun m!261069 () Bool)

(assert (=> bs!14044 m!261069))

(assert (=> b!164216 d!56689))

(declare-fun d!56691 () Bool)

(declare-fun res!136856 () Bool)

(declare-fun e!113487 () Bool)

(assert (=> d!56691 (=> res!136856 e!113487)))

(assert (=> d!56691 (= res!136856 (= #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)))))

(assert (=> d!56691 (= (arrayRangesEq!611 (buf!4129 thiss!1577) lt!257698 #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)) e!113487)))

(declare-fun b!164241 () Bool)

(declare-fun e!113488 () Bool)

(assert (=> b!164241 (= e!113487 e!113488)))

(declare-fun res!136857 () Bool)

(assert (=> b!164241 (=> (not res!136857) (not e!113488))))

(assert (=> b!164241 (= res!136857 (= (select (arr!4598 (buf!4129 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4598 lt!257698) #b00000000000000000000000000000000)))))

(declare-fun b!164242 () Bool)

(assert (=> b!164242 (= e!113488 (arrayRangesEq!611 (buf!4129 thiss!1577) lt!257698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7698 thiss!1577)))))

(assert (= (and d!56691 (not res!136856)) b!164241))

(assert (= (and b!164241 res!136857) b!164242))

(declare-fun m!261071 () Bool)

(assert (=> b!164241 m!261071))

(declare-fun m!261073 () Bool)

(assert (=> b!164241 m!261073))

(declare-fun m!261075 () Bool)

(assert (=> b!164242 m!261075))

(assert (=> b!164216 d!56691))

(declare-fun d!56693 () Bool)

(declare-fun res!136858 () Bool)

(declare-fun e!113489 () Bool)

(assert (=> d!56693 (=> res!136858 e!113489)))

(assert (=> d!56693 (= res!136858 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (=> d!56693 (= (arrayRangesEq!611 lt!257701 lt!257698 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))) e!113489)))

(declare-fun b!164243 () Bool)

(declare-fun e!113490 () Bool)

(assert (=> b!164243 (= e!113489 e!113490)))

(declare-fun res!136859 () Bool)

(assert (=> b!164243 (=> (not res!136859) (not e!113490))))

(assert (=> b!164243 (= res!136859 (= (select (arr!4598 lt!257701) #b00000000000000000000000000000000) (select (arr!4598 lt!257698) #b00000000000000000000000000000000)))))

(declare-fun b!164244 () Bool)

(assert (=> b!164244 (= e!113490 (arrayRangesEq!611 lt!257701 lt!257698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (= (and d!56693 (not res!136858)) b!164243))

(assert (= (and b!164243 res!136859) b!164244))

(declare-fun m!261077 () Bool)

(assert (=> b!164243 m!261077))

(assert (=> b!164243 m!261073))

(declare-fun m!261079 () Bool)

(assert (=> b!164244 m!261079))

(assert (=> b!164216 d!56693))

(declare-fun d!56695 () Bool)

(declare-fun res!136860 () Bool)

(declare-fun e!113491 () Bool)

(assert (=> d!56695 (=> res!136860 e!113491)))

(assert (=> d!56695 (= res!136860 (= #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)))))

(assert (=> d!56695 (= (arrayRangesEq!611 (buf!4129 thiss!1577) (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) lt!257699) (size!3677 (buf!4129 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7698 thiss!1577)) e!113491)))

(declare-fun b!164245 () Bool)

(declare-fun e!113492 () Bool)

(assert (=> b!164245 (= e!113491 e!113492)))

(declare-fun res!136861 () Bool)

(assert (=> b!164245 (=> (not res!136861) (not e!113492))))

(assert (=> b!164245 (= res!136861 (= (select (arr!4598 (buf!4129 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4598 (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) lt!257699) (size!3677 (buf!4129 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164246 () Bool)

(assert (=> b!164246 (= e!113492 (arrayRangesEq!611 (buf!4129 thiss!1577) (array!8213 (store (arr!4598 (buf!4129 thiss!1577)) (currentByte!7698 thiss!1577) lt!257699) (size!3677 (buf!4129 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7698 thiss!1577)))))

(assert (= (and d!56695 (not res!136860)) b!164245))

(assert (= (and b!164245 res!136861) b!164246))

(assert (=> b!164245 m!261071))

(declare-fun m!261081 () Bool)

(assert (=> b!164245 m!261081))

(declare-fun m!261083 () Bool)

(assert (=> b!164246 m!261083))

(assert (=> b!164216 d!56695))

(declare-fun d!56697 () Bool)

(declare-fun e!113493 () Bool)

(assert (=> d!56697 e!113493))

(declare-fun res!136862 () Bool)

(assert (=> d!56697 (=> (not res!136862) (not e!113493))))

(assert (=> d!56697 (= res!136862 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) (size!3677 lt!257701))))))

(declare-fun lt!257742 () Unit!11431)

(assert (=> d!56697 (= lt!257742 (choose!203 lt!257701 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705))))

(assert (=> d!56697 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) (size!3677 lt!257701)))))

(assert (=> d!56697 (= (arrayUpdatedAtPrefixLemma!219 lt!257701 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705) lt!257742)))

(declare-fun b!164247 () Bool)

(assert (=> b!164247 (= e!113493 (arrayRangesEq!611 lt!257701 (array!8213 (store (arr!4598 lt!257701) (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577)) lt!257705) (size!3677 lt!257701)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7698 thiss!1577))))))

(assert (= (and d!56697 res!136862) b!164247))

(declare-fun m!261085 () Bool)

(assert (=> d!56697 m!261085))

(declare-fun m!261087 () Bool)

(assert (=> b!164247 m!261087))

(declare-fun m!261089 () Bool)

(assert (=> b!164247 m!261089))

(assert (=> b!164216 d!56697))

(declare-fun d!56699 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56699 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3677 (buf!4129 thiss!1577))) ((_ sign_extend 32) (currentByte!7698 thiss!1577)) ((_ sign_extend 32) (currentBit!7693 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3677 (buf!4129 thiss!1577))) ((_ sign_extend 32) (currentByte!7698 thiss!1577)) ((_ sign_extend 32) (currentBit!7693 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14045 () Bool)

(assert (= bs!14045 d!56699))

(declare-fun m!261091 () Bool)

(assert (=> bs!14045 m!261091))

(assert (=> b!164214 d!56699))

(declare-fun d!56701 () Bool)

(assert (=> d!56701 (= (array_inv!3418 (buf!4129 thiss!1577)) (bvsge (size!3677 (buf!4129 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164218 d!56701))

(declare-fun d!56703 () Bool)

(assert (=> d!56703 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7693 thiss!1577) (currentByte!7698 thiss!1577) (size!3677 (buf!4129 thiss!1577))))))

(declare-fun bs!14046 () Bool)

(assert (= bs!14046 d!56703))

(assert (=> bs!14046 m!261021))

(assert (=> start!34674 d!56703))

(check-sat (not d!56699) (not d!56689) (not b!164246) (not d!56687) (not b!164242) (not b!164247) (not b!164244) (not d!56703) (not b!164236) (not d!56697))
(check-sat)
