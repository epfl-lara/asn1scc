; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36168 () Bool)

(assert start!36168)

(declare-fun b!166908 () Bool)

(declare-fun e!115721 () Bool)

(declare-datatypes ((array!8613 0))(
  ( (array!8614 (arr!4749 (Array (_ BitVec 32) (_ BitVec 8))) (size!3828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6812 0))(
  ( (BitStream!6813 (buf!4280 array!8613) (currentByte!8104 (_ BitVec 32)) (currentBit!8099 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6812)

(declare-fun array_inv!3569 (array!8613) Bool)

(assert (=> b!166908 (= e!115721 (array_inv!3569 (buf!4280 thiss!1577)))))

(declare-fun res!138950 () Bool)

(declare-fun e!115720 () Bool)

(assert (=> start!36168 (=> (not res!138950) (not e!115720))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36168 (= res!138950 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36168 e!115720))

(assert (=> start!36168 true))

(declare-fun inv!12 (BitStream!6812) Bool)

(assert (=> start!36168 (and (inv!12 thiss!1577) e!115721)))

(declare-fun b!166907 () Bool)

(assert (=> b!166907 (= e!115720 (not (and (bvsle #b00000000000000000000000000000000 (currentByte!8104 thiss!1577)) (bvsle (currentByte!8104 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))))))))

(declare-fun lt!259880 () (_ BitVec 32))

(declare-fun lt!259884 () array!8613)

(declare-fun lt!259883 () (_ BitVec 32))

(declare-fun lt!259881 () (_ BitVec 8))

(declare-fun arrayRangesEq!657 (array!8613 array!8613 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166907 (arrayRangesEq!657 lt!259884 (array!8614 (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (size!3828 (buf!4280 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)))))

(declare-datatypes ((Unit!11604 0))(
  ( (Unit!11605) )
))
(declare-fun lt!259885 () Unit!11604)

(declare-fun arrayUpdatedAtPrefixLemma!265 (array!8613 (_ BitVec 32) (_ BitVec 8)) Unit!11604)

(assert (=> b!166907 (= lt!259885 (arrayUpdatedAtPrefixLemma!265 lt!259884 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881))))

(assert (=> b!166907 (arrayRangesEq!657 (buf!4280 thiss!1577) (array!8614 (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) (select (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (currentByte!8104 thiss!1577))) (size!3828 (buf!4280 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8104 thiss!1577))))

(declare-fun lt!259886 () Unit!11604)

(assert (=> b!166907 (= lt!259886 (arrayUpdatedAtPrefixLemma!265 (buf!4280 thiss!1577) (currentByte!8104 thiss!1577) (select (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (currentByte!8104 thiss!1577))))))

(declare-fun lt!259882 () (_ BitVec 32))

(assert (=> b!166907 (= lt!259881 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259882))) (bvshl lt!259880 lt!259882))))))

(assert (=> b!166907 (= lt!259882 (bvsub #b00000000000000000000000000001000 lt!259883))))

(assert (=> b!166907 (= lt!259884 (array!8614 (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (size!3828 (buf!4280 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166907 (= lt!259880 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166907 (= lt!259883 (bvsub (bvadd (currentBit!8099 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166906 () Bool)

(declare-fun res!138949 () Bool)

(assert (=> b!166906 (=> (not res!138949) (not e!115720))))

(assert (=> b!166906 (= res!138949 (bvsgt (bvadd (currentBit!8099 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166905 () Bool)

(declare-fun res!138948 () Bool)

(assert (=> b!166905 (=> (not res!138948) (not e!115720))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166905 (= res!138948 (validate_offset_bits!1 ((_ sign_extend 32) (size!3828 (buf!4280 thiss!1577))) ((_ sign_extend 32) (currentByte!8104 thiss!1577)) ((_ sign_extend 32) (currentBit!8099 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!36168 res!138950) b!166905))

(assert (= (and b!166905 res!138948) b!166906))

(assert (= (and b!166906 res!138949) b!166907))

(assert (= start!36168 b!166908))

(declare-fun m!265191 () Bool)

(assert (=> b!166908 m!265191))

(declare-fun m!265193 () Bool)

(assert (=> start!36168 m!265193))

(declare-fun m!265195 () Bool)

(assert (=> b!166907 m!265195))

(declare-fun m!265197 () Bool)

(assert (=> b!166907 m!265197))

(declare-fun m!265199 () Bool)

(assert (=> b!166907 m!265199))

(declare-fun m!265201 () Bool)

(assert (=> b!166907 m!265201))

(declare-fun m!265203 () Bool)

(assert (=> b!166907 m!265203))

(declare-fun m!265205 () Bool)

(assert (=> b!166907 m!265205))

(assert (=> b!166907 m!265197))

(declare-fun m!265207 () Bool)

(assert (=> b!166907 m!265207))

(declare-fun m!265209 () Bool)

(assert (=> b!166907 m!265209))

(declare-fun m!265211 () Bool)

(assert (=> b!166907 m!265211))

(declare-fun m!265213 () Bool)

(assert (=> b!166907 m!265213))

(declare-fun m!265215 () Bool)

(assert (=> b!166907 m!265215))

(declare-fun m!265217 () Bool)

(assert (=> b!166907 m!265217))

(declare-fun m!265219 () Bool)

(assert (=> b!166907 m!265219))

(declare-fun m!265221 () Bool)

(assert (=> b!166905 m!265221))

(push 1)

(assert (not b!166908))

(assert (not b!166907))

(assert (not start!36168))

(assert (not b!166905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58413 () Bool)

(assert (=> d!58413 (= (array_inv!3569 (buf!4280 thiss!1577)) (bvsge (size!3828 (buf!4280 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166908 d!58413))

(declare-fun d!58417 () Bool)

(declare-fun res!138973 () Bool)

(declare-fun e!115745 () Bool)

(assert (=> d!58417 (=> res!138973 e!115745)))

(assert (=> d!58417 (= res!138973 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))))))

(assert (=> d!58417 (= (arrayRangesEq!657 lt!259884 (array!8614 (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (size!3828 (buf!4280 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))) e!115745)))

(declare-fun b!166931 () Bool)

(declare-fun e!115746 () Bool)

(assert (=> b!166931 (= e!115745 e!115746)))

(declare-fun res!138974 () Bool)

(assert (=> b!166931 (=> (not res!138974) (not e!115746))))

(assert (=> b!166931 (= res!138974 (= (select (arr!4749 lt!259884) #b00000000000000000000000000000000) (select (arr!4749 (array!8614 (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (size!3828 (buf!4280 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166932 () Bool)

(assert (=> b!166932 (= e!115746 (arrayRangesEq!657 lt!259884 (array!8614 (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (size!3828 (buf!4280 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))))))

(assert (= (and d!58417 (not res!138973)) b!166931))

(assert (= (and b!166931 res!138974) b!166932))

(declare-fun m!265253 () Bool)

(assert (=> b!166931 m!265253))

(declare-fun m!265257 () Bool)

(assert (=> b!166931 m!265257))

(declare-fun m!265261 () Bool)

(assert (=> b!166932 m!265261))

(assert (=> b!166907 d!58417))

(declare-fun d!58427 () Bool)

(declare-fun e!115751 () Bool)

(assert (=> d!58427 e!115751))

(declare-fun res!138979 () Bool)

(assert (=> d!58427 (=> (not res!138979) (not e!115751))))

(assert (=> d!58427 (= res!138979 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) (size!3828 lt!259884))))))

(declare-fun lt!259895 () Unit!11604)

(declare-fun choose!235 (array!8613 (_ BitVec 32) (_ BitVec 8)) Unit!11604)

(assert (=> d!58427 (= lt!259895 (choose!235 lt!259884 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881))))

(assert (=> d!58427 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) (size!3828 lt!259884)))))

(assert (=> d!58427 (= (arrayUpdatedAtPrefixLemma!265 lt!259884 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) lt!259895)))

(declare-fun b!166937 () Bool)

(assert (=> b!166937 (= e!115751 (arrayRangesEq!657 lt!259884 (array!8614 (store (arr!4749 lt!259884) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (size!3828 lt!259884)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577))))))

(assert (= (and d!58427 res!138979) b!166937))

(declare-fun m!265264 () Bool)

(assert (=> d!58427 m!265264))

(declare-fun m!265267 () Bool)

(assert (=> b!166937 m!265267))

(declare-fun m!265271 () Bool)

(assert (=> b!166937 m!265271))

(assert (=> b!166907 d!58427))

(declare-fun d!58429 () Bool)

(declare-fun res!138981 () Bool)

(declare-fun e!115753 () Bool)

(assert (=> d!58429 (=> res!138981 e!115753)))

(assert (=> d!58429 (= res!138981 (= #b00000000000000000000000000000000 (currentByte!8104 thiss!1577)))))

(assert (=> d!58429 (= (arrayRangesEq!657 (buf!4280 thiss!1577) (array!8614 (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) (select (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (currentByte!8104 thiss!1577))) (size!3828 (buf!4280 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8104 thiss!1577)) e!115753)))

(declare-fun b!166939 () Bool)

(declare-fun e!115754 () Bool)

(assert (=> b!166939 (= e!115753 e!115754)))

(declare-fun res!138982 () Bool)

(assert (=> b!166939 (=> (not res!138982) (not e!115754))))

(assert (=> b!166939 (= res!138982 (= (select (arr!4749 (buf!4280 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4749 (array!8614 (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) (select (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (currentByte!8104 thiss!1577))) (size!3828 (buf!4280 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166940 () Bool)

(assert (=> b!166940 (= e!115754 (arrayRangesEq!657 (buf!4280 thiss!1577) (array!8614 (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) (select (store (store (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4749 (buf!4280 thiss!1577)) (currentByte!8104 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8099 thiss!1577)))))))) (bvlshr (bvand lt!259880 #b00000000000000000000000011111111) lt!259883)))) (bvadd #b00000000000000000000000000000001 (currentByte!8104 thiss!1577)) lt!259881) (currentByte!8104 thiss!1577))) (size!3828 (buf!4280 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8104 thiss!1577)))))

(assert (= (and d!58429 (not res!138981)) b!166939))

(assert (= (and b!166939 res!138982) b!166940))

(declare-fun m!265275 () Bool)

(assert (=> b!166939 m!265275))

(declare-fun m!265279 () Bool)

(assert (=> b!166939 m!265279))

(declare-fun m!265283 () Bool)

(assert (=> b!166940 m!265283))

(assert (=> b!166907 d!58429))

(declare-fun d!58433 () Bool)

(declare-fun e!115757 () Bool)

(assert (=> d!58433 e!115757))

(declare-fun res!138985 () Bool)

(assert (=> d!58433 (=> (not res!138985) (not e!115757))))

(assert (=> d!58433 (= res!138985 (and (bvsge (currentByte!8104 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8104 thiss!1577) (size!3828 (buf!4280 thiss!1577)))))))

