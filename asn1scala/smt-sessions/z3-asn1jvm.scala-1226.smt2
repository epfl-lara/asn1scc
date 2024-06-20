; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34800 () Bool)

(assert start!34800)

(declare-fun b!164634 () Bool)

(declare-fun e!113763 () Bool)

(declare-datatypes ((array!8247 0))(
  ( (array!8248 (arr!4613 (Array (_ BitVec 32) (_ BitVec 8))) (size!3692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6540 0))(
  ( (BitStream!6541 (buf!4144 array!8247) (currentByte!7723 (_ BitVec 32)) (currentBit!7718 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6540)

(declare-fun array_inv!3433 (array!8247) Bool)

(assert (=> b!164634 (= e!113763 (array_inv!3433 (buf!4144 thiss!1577)))))

(declare-fun b!164632 () Bool)

(declare-fun res!137189 () Bool)

(declare-fun e!113761 () Bool)

(assert (=> b!164632 (=> (not res!137189) (not e!113761))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164632 (= res!137189 (bvsle (bvadd (currentBit!7718 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164633 () Bool)

(declare-fun lt!258380 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164633 (= e!113761 (not (byteRangesEq!0 (select (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577)) lt!258380 #b00000000000000000000000000000000 (currentBit!7718 thiss!1577))))))

(declare-fun arrayRangesEq!626 (array!8247 array!8247 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164633 (arrayRangesEq!626 (buf!4144 thiss!1577) (array!8248 (store (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577) lt!258380) (size!3692 (buf!4144 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7723 thiss!1577))))

(declare-datatypes ((Unit!11464 0))(
  ( (Unit!11465) )
))
(declare-fun lt!258379 () Unit!11464)

(declare-fun arrayUpdatedAtPrefixLemma!234 (array!8247 (_ BitVec 32) (_ BitVec 8)) Unit!11464)

(assert (=> b!164633 (= lt!258379 (arrayUpdatedAtPrefixLemma!234 (buf!4144 thiss!1577) (currentByte!7723 thiss!1577) lt!258380))))

(declare-fun lt!258381 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164633 (= lt!258380 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7718 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258381)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258381))))))

(assert (=> b!164633 (= lt!258381 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7718 thiss!1577) nBits!511)))))

(declare-fun res!137188 () Bool)

(assert (=> start!34800 (=> (not res!137188) (not e!113761))))

(assert (=> start!34800 (= res!137188 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34800 e!113761))

(assert (=> start!34800 true))

(declare-fun inv!12 (BitStream!6540) Bool)

(assert (=> start!34800 (and (inv!12 thiss!1577) e!113763)))

(declare-fun b!164631 () Bool)

(declare-fun res!137187 () Bool)

(assert (=> b!164631 (=> (not res!137187) (not e!113761))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164631 (= res!137187 (validate_offset_bits!1 ((_ sign_extend 32) (size!3692 (buf!4144 thiss!1577))) ((_ sign_extend 32) (currentByte!7723 thiss!1577)) ((_ sign_extend 32) (currentBit!7718 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34800 res!137188) b!164631))

(assert (= (and b!164631 res!137187) b!164632))

(assert (= (and b!164632 res!137189) b!164633))

(assert (= start!34800 b!164634))

(declare-fun m!261819 () Bool)

(assert (=> b!164634 m!261819))

(declare-fun m!261821 () Bool)

(assert (=> b!164633 m!261821))

(declare-fun m!261823 () Bool)

(assert (=> b!164633 m!261823))

(declare-fun m!261825 () Bool)

(assert (=> b!164633 m!261825))

(declare-fun m!261827 () Bool)

(assert (=> b!164633 m!261827))

(declare-fun m!261829 () Bool)

(assert (=> b!164633 m!261829))

(declare-fun m!261831 () Bool)

(assert (=> b!164633 m!261831))

(assert (=> b!164633 m!261821))

(declare-fun m!261833 () Bool)

(assert (=> b!164633 m!261833))

(declare-fun m!261835 () Bool)

(assert (=> b!164633 m!261835))

(declare-fun m!261837 () Bool)

(assert (=> start!34800 m!261837))

(declare-fun m!261839 () Bool)

(assert (=> b!164631 m!261839))

(check-sat (not start!34800) (not b!164633) (not b!164634) (not b!164631))
(check-sat)
(get-model)

(declare-fun d!56825 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56825 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7718 thiss!1577) (currentByte!7723 thiss!1577) (size!3692 (buf!4144 thiss!1577))))))

(declare-fun bs!14082 () Bool)

(assert (= bs!14082 d!56825))

(declare-fun m!261863 () Bool)

(assert (=> bs!14082 m!261863))

(assert (=> start!34800 d!56825))

(declare-fun d!56827 () Bool)

(assert (=> d!56827 (= (byteRangesEq!0 (select (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577)) lt!258380 #b00000000000000000000000000000000 (currentBit!7718 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7718 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7718 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258380) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7718 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14083 () Bool)

(assert (= bs!14083 d!56827))

(declare-fun m!261865 () Bool)

(assert (=> bs!14083 m!261865))

(declare-fun m!261867 () Bool)

(assert (=> bs!14083 m!261867))

(assert (=> b!164633 d!56827))

(declare-fun d!56829 () Bool)

(declare-fun res!137203 () Bool)

(declare-fun e!113777 () Bool)

(assert (=> d!56829 (=> res!137203 e!113777)))

(assert (=> d!56829 (= res!137203 (= #b00000000000000000000000000000000 (currentByte!7723 thiss!1577)))))

(assert (=> d!56829 (= (arrayRangesEq!626 (buf!4144 thiss!1577) (array!8248 (store (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577) lt!258380) (size!3692 (buf!4144 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7723 thiss!1577)) e!113777)))

(declare-fun b!164651 () Bool)

(declare-fun e!113778 () Bool)

(assert (=> b!164651 (= e!113777 e!113778)))

(declare-fun res!137204 () Bool)

(assert (=> b!164651 (=> (not res!137204) (not e!113778))))

(assert (=> b!164651 (= res!137204 (= (select (arr!4613 (buf!4144 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4613 (array!8248 (store (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577) lt!258380) (size!3692 (buf!4144 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164652 () Bool)

(assert (=> b!164652 (= e!113778 (arrayRangesEq!626 (buf!4144 thiss!1577) (array!8248 (store (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577) lt!258380) (size!3692 (buf!4144 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7723 thiss!1577)))))

(assert (= (and d!56829 (not res!137203)) b!164651))

(assert (= (and b!164651 res!137204) b!164652))

(declare-fun m!261869 () Bool)

(assert (=> b!164651 m!261869))

(declare-fun m!261871 () Bool)

(assert (=> b!164651 m!261871))

(declare-fun m!261873 () Bool)

(assert (=> b!164652 m!261873))

(assert (=> b!164633 d!56829))

(declare-fun d!56831 () Bool)

(declare-fun e!113781 () Bool)

(assert (=> d!56831 e!113781))

(declare-fun res!137207 () Bool)

(assert (=> d!56831 (=> (not res!137207) (not e!113781))))

(assert (=> d!56831 (= res!137207 (and (bvsge (currentByte!7723 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7723 thiss!1577) (size!3692 (buf!4144 thiss!1577)))))))

(declare-fun lt!258393 () Unit!11464)

(declare-fun choose!211 (array!8247 (_ BitVec 32) (_ BitVec 8)) Unit!11464)

(assert (=> d!56831 (= lt!258393 (choose!211 (buf!4144 thiss!1577) (currentByte!7723 thiss!1577) lt!258380))))

(assert (=> d!56831 (and (bvsle #b00000000000000000000000000000000 (currentByte!7723 thiss!1577)) (bvslt (currentByte!7723 thiss!1577) (size!3692 (buf!4144 thiss!1577))))))

(assert (=> d!56831 (= (arrayUpdatedAtPrefixLemma!234 (buf!4144 thiss!1577) (currentByte!7723 thiss!1577) lt!258380) lt!258393)))

(declare-fun b!164655 () Bool)

(assert (=> b!164655 (= e!113781 (arrayRangesEq!626 (buf!4144 thiss!1577) (array!8248 (store (arr!4613 (buf!4144 thiss!1577)) (currentByte!7723 thiss!1577) lt!258380) (size!3692 (buf!4144 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7723 thiss!1577)))))

(assert (= (and d!56831 res!137207) b!164655))

(declare-fun m!261875 () Bool)

(assert (=> d!56831 m!261875))

(assert (=> b!164655 m!261823))

(assert (=> b!164655 m!261831))

(assert (=> b!164633 d!56831))

(declare-fun d!56833 () Bool)

(assert (=> d!56833 (= (array_inv!3433 (buf!4144 thiss!1577)) (bvsge (size!3692 (buf!4144 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164634 d!56833))

(declare-fun d!56835 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56835 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3692 (buf!4144 thiss!1577))) ((_ sign_extend 32) (currentByte!7723 thiss!1577)) ((_ sign_extend 32) (currentBit!7718 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3692 (buf!4144 thiss!1577))) ((_ sign_extend 32) (currentByte!7723 thiss!1577)) ((_ sign_extend 32) (currentBit!7718 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14084 () Bool)

(assert (= bs!14084 d!56835))

(declare-fun m!261877 () Bool)

(assert (=> bs!14084 m!261877))

(assert (=> b!164631 d!56835))

(check-sat (not d!56825) (not b!164655) (not d!56835) (not d!56831) (not b!164652))
(check-sat)
