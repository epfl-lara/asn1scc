; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34828 () Bool)

(assert start!34828)

(declare-fun b!164673 () Bool)

(declare-fun res!137223 () Bool)

(declare-fun e!113797 () Bool)

(assert (=> b!164673 (=> (not res!137223) (not e!113797))))

(declare-datatypes ((array!8253 0))(
  ( (array!8254 (arr!4615 (Array (_ BitVec 32) (_ BitVec 8))) (size!3694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6544 0))(
  ( (BitStream!6545 (buf!4146 array!8253) (currentByte!7727 (_ BitVec 32)) (currentBit!7722 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6544)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164673 (= res!137223 (validate_offset_bits!1 ((_ sign_extend 32) (size!3694 (buf!4146 thiss!1577))) ((_ sign_extend 32) (currentByte!7727 thiss!1577)) ((_ sign_extend 32) (currentBit!7722 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!137224 () Bool)

(assert (=> start!34828 (=> (not res!137224) (not e!113797))))

(assert (=> start!34828 (= res!137224 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34828 e!113797))

(assert (=> start!34828 true))

(declare-fun e!113798 () Bool)

(declare-fun inv!12 (BitStream!6544) Bool)

(assert (=> start!34828 (and (inv!12 thiss!1577) e!113798)))

(declare-fun b!164676 () Bool)

(declare-fun array_inv!3435 (array!8253) Bool)

(assert (=> b!164676 (= e!113798 (array_inv!3435 (buf!4146 thiss!1577)))))

(declare-fun lt!258418 () (_ BitVec 8))

(declare-fun lt!258420 () (_ BitVec 32))

(declare-fun b!164675 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164675 (= e!113797 (not (byteRangesEq!0 (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577)) lt!258418 #b00000000000000000000000000000000 lt!258420)))))

(declare-fun lt!258422 () array!8253)

(declare-fun arrayRangesEq!628 (array!8253 array!8253 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164675 (arrayRangesEq!628 (buf!4146 thiss!1577) lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577))))

(declare-fun lt!258423 () array!8253)

(declare-datatypes ((Unit!11468 0))(
  ( (Unit!11469) )
))
(declare-fun lt!258424 () Unit!11468)

(declare-fun arrayRangesEqTransitive!169 (array!8253 array!8253 array!8253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11468)

(assert (=> b!164675 (= lt!258424 (arrayRangesEqTransitive!169 (buf!4146 thiss!1577) lt!258423 lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (=> b!164675 (arrayRangesEq!628 lt!258423 lt!258422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)))))

(declare-fun lt!258421 () Unit!11468)

(declare-fun lt!258417 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!236 (array!8253 (_ BitVec 32) (_ BitVec 8)) Unit!11468)

(assert (=> b!164675 (= lt!258421 (arrayUpdatedAtPrefixLemma!236 lt!258423 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417))))

(assert (=> b!164675 (arrayRangesEq!628 (buf!4146 thiss!1577) (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) lt!258418) (size!3694 (buf!4146 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7727 thiss!1577))))

(declare-fun lt!258426 () Unit!11468)

(assert (=> b!164675 (= lt!258426 (arrayUpdatedAtPrefixLemma!236 (buf!4146 thiss!1577) (currentByte!7727 thiss!1577) lt!258418))))

(declare-fun lt!258425 () (_ BitVec 32))

(assert (=> b!164675 (= lt!258418 (select (store (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7722 thiss!1577)))))))) (bvlshr (bvand lt!258425 #b00000000000000000000000011111111) lt!258420)))) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417) (currentByte!7727 thiss!1577)))))

(assert (=> b!164675 (= lt!258422 (array!8254 (store (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7722 thiss!1577)))))))) (bvlshr (bvand lt!258425 #b00000000000000000000000011111111) lt!258420)))) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417) (size!3694 (buf!4146 thiss!1577))))))

(declare-fun lt!258419 () (_ BitVec 32))

(assert (=> b!164675 (= lt!258417 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7722 thiss!1577)))))))) (bvlshr (bvand lt!258425 #b00000000000000000000000011111111) lt!258420)))) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258419))) (bvshl lt!258425 lt!258419))))))

(assert (=> b!164675 (= lt!258419 (bvsub #b00000000000000000000000000001000 lt!258420))))

(assert (=> b!164675 (= lt!258423 (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7722 thiss!1577)))))))) (bvlshr (bvand lt!258425 #b00000000000000000000000011111111) lt!258420)))) (size!3694 (buf!4146 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164675 (= lt!258425 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164675 (= lt!258420 (bvsub (bvadd (currentBit!7722 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164674 () Bool)

(declare-fun res!137225 () Bool)

(assert (=> b!164674 (=> (not res!137225) (not e!113797))))

(assert (=> b!164674 (= res!137225 (bvsgt (bvadd (currentBit!7722 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34828 res!137224) b!164673))

(assert (= (and b!164673 res!137223) b!164674))

(assert (= (and b!164674 res!137225) b!164675))

(assert (= start!34828 b!164676))

(declare-fun m!261895 () Bool)

(assert (=> b!164673 m!261895))

(declare-fun m!261897 () Bool)

(assert (=> start!34828 m!261897))

(declare-fun m!261899 () Bool)

(assert (=> b!164676 m!261899))

(declare-fun m!261901 () Bool)

(assert (=> b!164675 m!261901))

(declare-fun m!261903 () Bool)

(assert (=> b!164675 m!261903))

(declare-fun m!261905 () Bool)

(assert (=> b!164675 m!261905))

(declare-fun m!261907 () Bool)

(assert (=> b!164675 m!261907))

(declare-fun m!261909 () Bool)

(assert (=> b!164675 m!261909))

(declare-fun m!261911 () Bool)

(assert (=> b!164675 m!261911))

(declare-fun m!261913 () Bool)

(assert (=> b!164675 m!261913))

(declare-fun m!261915 () Bool)

(assert (=> b!164675 m!261915))

(declare-fun m!261917 () Bool)

(assert (=> b!164675 m!261917))

(assert (=> b!164675 m!261903))

(declare-fun m!261919 () Bool)

(assert (=> b!164675 m!261919))

(declare-fun m!261921 () Bool)

(assert (=> b!164675 m!261921))

(declare-fun m!261923 () Bool)

(assert (=> b!164675 m!261923))

(declare-fun m!261925 () Bool)

(assert (=> b!164675 m!261925))

(declare-fun m!261927 () Bool)

(assert (=> b!164675 m!261927))

(declare-fun m!261929 () Bool)

(assert (=> b!164675 m!261929))

(declare-fun m!261931 () Bool)

(assert (=> b!164675 m!261931))

(push 1)

(assert (not b!164673))

(assert (not start!34828))

(assert (not b!164675))

(assert (not b!164676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56857 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56857 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3694 (buf!4146 thiss!1577))) ((_ sign_extend 32) (currentByte!7727 thiss!1577)) ((_ sign_extend 32) (currentBit!7722 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3694 (buf!4146 thiss!1577))) ((_ sign_extend 32) (currentByte!7727 thiss!1577)) ((_ sign_extend 32) (currentBit!7722 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14092 () Bool)

(assert (= bs!14092 d!56857))

(declare-fun m!262017 () Bool)

(assert (=> bs!14092 m!262017))

(assert (=> b!164673 d!56857))

(declare-fun d!56859 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56859 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7722 thiss!1577) (currentByte!7727 thiss!1577) (size!3694 (buf!4146 thiss!1577))))))

(declare-fun bs!14093 () Bool)

(assert (= bs!14093 d!56859))

(declare-fun m!262019 () Bool)

(assert (=> bs!14093 m!262019))

(assert (=> start!34828 d!56859))

(declare-fun d!56863 () Bool)

(assert (=> d!56863 (= (byteRangesEq!0 (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577)) lt!258418 #b00000000000000000000000000000000 lt!258420) (or (= #b00000000000000000000000000000000 lt!258420) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258418) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258420))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14097 () Bool)

(assert (= bs!14097 d!56863))

(declare-fun m!262031 () Bool)

(assert (=> bs!14097 m!262031))

(declare-fun m!262033 () Bool)

(assert (=> bs!14097 m!262033))

(assert (=> b!164675 d!56863))

(declare-fun d!56875 () Bool)

(declare-fun res!137262 () Bool)

(declare-fun e!113836 () Bool)

(assert (=> d!56875 (=> res!137262 e!113836)))

(assert (=> d!56875 (= res!137262 (= #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)))))

(assert (=> d!56875 (= (arrayRangesEq!628 (buf!4146 thiss!1577) (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) lt!258418) (size!3694 (buf!4146 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)) e!113836)))

(declare-fun b!164719 () Bool)

(declare-fun e!113837 () Bool)

(assert (=> b!164719 (= e!113836 e!113837)))

(declare-fun res!137263 () Bool)

(assert (=> b!164719 (=> (not res!137263) (not e!113837))))

(assert (=> b!164719 (= res!137263 (= (select (arr!4615 (buf!4146 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4615 (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) lt!258418) (size!3694 (buf!4146 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164720 () Bool)

(assert (=> b!164720 (= e!113837 (arrayRangesEq!628 (buf!4146 thiss!1577) (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) lt!258418) (size!3694 (buf!4146 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7727 thiss!1577)))))

(assert (= (and d!56875 (not res!137262)) b!164719))

(assert (= (and b!164719 res!137263) b!164720))

(declare-fun m!262039 () Bool)

(assert (=> b!164719 m!262039))

(declare-fun m!262041 () Bool)

(assert (=> b!164719 m!262041))

(declare-fun m!262043 () Bool)

(assert (=> b!164720 m!262043))

(assert (=> b!164675 d!56875))

(declare-fun d!56881 () Bool)

(declare-fun e!113840 () Bool)

(assert (=> d!56881 e!113840))

(declare-fun res!137266 () Bool)

(assert (=> d!56881 (=> (not res!137266) (not e!113840))))

(assert (=> d!56881 (= res!137266 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) (size!3694 lt!258423))))))

(declare-fun lt!258498 () Unit!11468)

(declare-fun choose!215 (array!8253 (_ BitVec 32) (_ BitVec 8)) Unit!11468)

(assert (=> d!56881 (= lt!258498 (choose!215 lt!258423 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417))))

(assert (=> d!56881 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) (size!3694 lt!258423)))))

(assert (=> d!56881 (= (arrayUpdatedAtPrefixLemma!236 lt!258423 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417) lt!258498)))

(declare-fun b!164723 () Bool)

(assert (=> b!164723 (= e!113840 (arrayRangesEq!628 lt!258423 (array!8254 (store (arr!4615 lt!258423) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577)) lt!258417) (size!3694 lt!258423)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (= (and d!56881 res!137266) b!164723))

(declare-fun m!262049 () Bool)

(assert (=> d!56881 m!262049))

(declare-fun m!262051 () Bool)

(assert (=> b!164723 m!262051))

(declare-fun m!262055 () Bool)

(assert (=> b!164723 m!262055))

(assert (=> b!164675 d!56881))

(declare-fun d!56885 () Bool)

(declare-fun e!113841 () Bool)

(assert (=> d!56885 e!113841))

(declare-fun res!137267 () Bool)

(assert (=> d!56885 (=> (not res!137267) (not e!113841))))

(assert (=> d!56885 (= res!137267 (and (bvsge (currentByte!7727 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7727 thiss!1577) (size!3694 (buf!4146 thiss!1577)))))))

(declare-fun lt!258499 () Unit!11468)

(assert (=> d!56885 (= lt!258499 (choose!215 (buf!4146 thiss!1577) (currentByte!7727 thiss!1577) lt!258418))))

(assert (=> d!56885 (and (bvsle #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)) (bvslt (currentByte!7727 thiss!1577) (size!3694 (buf!4146 thiss!1577))))))

(assert (=> d!56885 (= (arrayUpdatedAtPrefixLemma!236 (buf!4146 thiss!1577) (currentByte!7727 thiss!1577) lt!258418) lt!258499)))

(declare-fun b!164724 () Bool)

(assert (=> b!164724 (= e!113841 (arrayRangesEq!628 (buf!4146 thiss!1577) (array!8254 (store (arr!4615 (buf!4146 thiss!1577)) (currentByte!7727 thiss!1577) lt!258418) (size!3694 (buf!4146 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)))))

(assert (= (and d!56885 res!137267) b!164724))

(declare-fun m!262059 () Bool)

(assert (=> d!56885 m!262059))

(assert (=> b!164724 m!261905))

(assert (=> b!164724 m!261925))

(assert (=> b!164675 d!56885))

(declare-fun d!56889 () Bool)

(assert (=> d!56889 (arrayRangesEq!628 (buf!4146 thiss!1577) lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577))))

(declare-fun lt!258503 () Unit!11468)

(declare-fun choose!217 (array!8253 array!8253 array!8253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11468)

(assert (=> d!56889 (= lt!258503 (choose!217 (buf!4146 thiss!1577) lt!258423 lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (=> d!56889 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)) (bvsle (currentByte!7727 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (=> d!56889 (= (arrayRangesEqTransitive!169 (buf!4146 thiss!1577) lt!258423 lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))) lt!258503)))

(declare-fun bs!14101 () Bool)

(assert (= bs!14101 d!56889))

(assert (=> bs!14101 m!261911))

(declare-fun m!262079 () Bool)

(assert (=> bs!14101 m!262079))

(assert (=> b!164675 d!56889))

(declare-fun d!56899 () Bool)

(declare-fun res!137277 () Bool)

(declare-fun e!113851 () Bool)

(assert (=> d!56899 (=> res!137277 e!113851)))

(assert (=> d!56899 (= res!137277 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (=> d!56899 (= (arrayRangesEq!628 lt!258423 lt!258422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))) e!113851)))

(declare-fun b!164734 () Bool)

(declare-fun e!113852 () Bool)

(assert (=> b!164734 (= e!113851 e!113852)))

(declare-fun res!137278 () Bool)

(assert (=> b!164734 (=> (not res!137278) (not e!113852))))

(assert (=> b!164734 (= res!137278 (= (select (arr!4615 lt!258423) #b00000000000000000000000000000000) (select (arr!4615 lt!258422) #b00000000000000000000000000000000)))))

(declare-fun b!164735 () Bool)

(assert (=> b!164735 (= e!113852 (arrayRangesEq!628 lt!258423 lt!258422 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7727 thiss!1577))))))

(assert (= (and d!56899 (not res!137277)) b!164734))

(assert (= (and b!164734 res!137278) b!164735))

(declare-fun m!262081 () Bool)

(assert (=> b!164734 m!262081))

(declare-fun m!262083 () Bool)

(assert (=> b!164734 m!262083))

(declare-fun m!262085 () Bool)

(assert (=> b!164735 m!262085))

(assert (=> b!164675 d!56899))

(declare-fun d!56901 () Bool)

(declare-fun res!137279 () Bool)

(declare-fun e!113853 () Bool)

(assert (=> d!56901 (=> res!137279 e!113853)))

(assert (=> d!56901 (= res!137279 (= #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)))))

(assert (=> d!56901 (= (arrayRangesEq!628 (buf!4146 thiss!1577) lt!258422 #b00000000000000000000000000000000 (currentByte!7727 thiss!1577)) e!113853)))

(declare-fun b!164736 () Bool)

(declare-fun e!113854 () Bool)

(assert (=> b!164736 (= e!113853 e!113854)))

(declare-fun res!137280 () Bool)

(assert (=> b!164736 (=> (not res!137280) (not e!113854))))

(assert (=> b!164736 (= res!137280 (= (select (arr!4615 (buf!4146 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4615 lt!258422) #b00000000000000000000000000000000)))))

(declare-fun b!164737 () Bool)

(assert (=> b!164737 (= e!113854 (arrayRangesEq!628 (buf!4146 thiss!1577) lt!258422 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7727 thiss!1577)))))

(assert (= (and d!56901 (not res!137279)) b!164736))

(assert (= (and b!164736 res!137280) b!164737))

(assert (=> b!164736 m!262039))

(assert (=> b!164736 m!262083))

(declare-fun m!262089 () Bool)

(assert (=> b!164737 m!262089))

(assert (=> b!164675 d!56901))

(declare-fun d!56905 () Bool)

(assert (=> d!56905 (= (array_inv!3435 (buf!4146 thiss!1577)) (bvsge (size!3694 (buf!4146 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164676 d!56905))

(push 1)

(assert (not d!56885))

(assert (not b!164724))

(assert (not d!56889))

(assert (not b!164735))

(assert (not b!164720))

(assert (not d!56859))

(assert (not b!164737))

(assert (not d!56857))

(assert (not b!164723))

(assert (not d!56881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

