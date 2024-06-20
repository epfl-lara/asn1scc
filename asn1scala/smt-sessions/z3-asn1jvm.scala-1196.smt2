; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33940 () Bool)

(assert start!33940)

(declare-fun b!162066 () Bool)

(declare-fun res!135101 () Bool)

(declare-fun e!111767 () Bool)

(assert (=> b!162066 (=> (not res!135101) (not e!111767))))

(declare-datatypes ((array!8033 0))(
  ( (array!8034 (arr!4523 (Array (_ BitVec 32) (_ BitVec 8))) (size!3602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6372 0))(
  ( (BitStream!6373 (buf!4060 array!8033) (currentByte!7560 (_ BitVec 32)) (currentBit!7555 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6372)

(declare-datatypes ((Unit!11186 0))(
  ( (Unit!11187) )
))
(declare-datatypes ((tuple3!932 0))(
  ( (tuple3!933 (_1!7819 Unit!11186) (_2!7819 (_ BitVec 8)) (_3!583 BitStream!6372)) )
))
(declare-fun lt!255226 () tuple3!932)

(declare-fun isPrefixOf!0 (BitStream!6372 BitStream!6372) Bool)

(assert (=> b!162066 (= res!135101 (isPrefixOf!0 thiss!1602 (_3!583 lt!255226)))))

(declare-fun b!162067 () Bool)

(declare-fun e!111765 () Unit!11186)

(declare-fun Unit!11188 () Unit!11186)

(assert (=> b!162067 (= e!111765 Unit!11188)))

(declare-fun call!2738 () Bool)

(assert (=> b!162067 call!2738))

(declare-fun b!162068 () Bool)

(declare-fun Unit!11189 () Unit!11186)

(assert (=> b!162068 (= e!111765 Unit!11189)))

(declare-fun lt!255227 () Unit!11186)

(declare-fun arrayUpdatedAtPrefixLemma!162 (array!8033 (_ BitVec 32) (_ BitVec 8)) Unit!11186)

(assert (=> b!162068 (= lt!255227 (arrayUpdatedAtPrefixLemma!162 (buf!4060 thiss!1602) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))))))

(assert (=> b!162068 call!2738))

(declare-fun lt!255216 () Unit!11186)

(declare-fun lt!255218 () array!8033)

(assert (=> b!162068 (= lt!255216 (arrayUpdatedAtPrefixLemma!162 lt!255218 (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))))))

(declare-fun lt!255213 () (_ BitVec 8))

(declare-fun lt!255214 () (_ BitVec 8))

(declare-fun arrayRangesEq!554 (array!8033 array!8033 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162068 (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226)))))

(declare-fun lt!255220 () Unit!11186)

(declare-fun arrayRangesEqTransitive!149 (array!8033 array!8033 array!8033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11186)

(assert (=> b!162068 (= lt!255220 (arrayRangesEqTransitive!149 (buf!4060 thiss!1602) lt!255218 (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(declare-fun res!135104 () Bool)

(assert (=> b!162068 (= res!135104 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(declare-fun e!111766 () Bool)

(assert (=> b!162068 (=> (not res!135104) (not e!111766))))

(assert (=> b!162068 e!111766))

(declare-fun b!162069 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-datatypes ((tuple2!14472 0))(
  ( (tuple2!14473 (_1!7820 BitStream!6372) (_2!7820 BitStream!6372)) )
))
(declare-fun lt!255212 () tuple2!14472)

(declare-datatypes ((tuple2!14474 0))(
  ( (tuple2!14475 (_1!7821 BitStream!6372) (_2!7821 (_ BitVec 8))) )
))
(declare-fun lt!255217 () tuple2!14474)

(assert (=> b!162069 (= e!111767 (and (= (_2!7821 lt!255217) v!222) (= (_1!7821 lt!255217) (_2!7820 lt!255212))))))

(declare-fun readBytePure!0 (BitStream!6372) tuple2!14474)

(assert (=> b!162069 (= lt!255217 (readBytePure!0 (_1!7820 lt!255212)))))

(declare-fun reader!0 (BitStream!6372 BitStream!6372) tuple2!14472)

(assert (=> b!162069 (= lt!255212 (reader!0 thiss!1602 (_3!583 lt!255226)))))

(declare-fun c!8477 () Bool)

(declare-fun bm!2735 () Bool)

(assert (=> bm!2735 (= call!2738 (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) #b00000000000000000000000000000000 (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(declare-fun res!135102 () Bool)

(declare-fun e!111771 () Bool)

(assert (=> start!33940 (=> (not res!135102) (not e!111771))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33940 (= res!135102 (validate_offset_byte!0 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) ((_ sign_extend 32) (currentByte!7560 thiss!1602)) ((_ sign_extend 32) (currentBit!7555 thiss!1602))))))

(assert (=> start!33940 e!111771))

(declare-fun e!111768 () Bool)

(declare-fun inv!12 (BitStream!6372) Bool)

(assert (=> start!33940 (and (inv!12 thiss!1602) e!111768)))

(assert (=> start!33940 true))

(declare-fun b!162070 () Bool)

(declare-fun res!135098 () Bool)

(assert (=> b!162070 (=> (not res!135098) (not e!111767))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!162070 (= res!135098 (= (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)))))))

(declare-fun b!162071 () Bool)

(declare-fun e!111764 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162071 (= e!111764 (byteRangesEq!0 (select (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602)) lt!255213 #b00000000000000000000000000000000 (currentBit!7555 thiss!1602)))))

(declare-fun b!162072 () Bool)

(declare-fun array_inv!3349 (array!8033) Bool)

(assert (=> b!162072 (= e!111768 (array_inv!3349 (buf!4060 thiss!1602)))))

(declare-fun b!162073 () Bool)

(declare-fun e!111769 () Bool)

(assert (=> b!162073 (= e!111769 e!111767)))

(declare-fun res!135100 () Bool)

(assert (=> b!162073 (=> (not res!135100) (not e!111767))))

(assert (=> b!162073 (= res!135100 (= (size!3602 (buf!4060 thiss!1602)) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(declare-fun lt!255219 () Unit!11186)

(assert (=> b!162073 (= lt!255219 e!111765)))

(declare-fun lt!255222 () Bool)

(assert (=> b!162073 (= c!8477 lt!255222)))

(declare-fun b!162074 () Bool)

(assert (=> b!162074 (= e!111771 (not e!111769))))

(declare-fun res!135099 () Bool)

(assert (=> b!162074 (=> res!135099 e!111769)))

(assert (=> b!162074 (= res!135099 (not (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001))))))

(declare-fun lt!255221 () (_ BitVec 8))

(assert (=> b!162074 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001))))

(declare-fun lt!255225 () Unit!11186)

(assert (=> b!162074 (= lt!255225 (arrayUpdatedAtPrefixLemma!162 (buf!4060 thiss!1602) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221))))

(assert (=> b!162074 (= lt!255221 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(declare-fun lt!255228 () (_ BitVec 32))

(declare-fun lt!255223 () (_ BitVec 8))

(declare-fun lt!255215 () (_ BitVec 32))

(declare-fun Unit!11190 () Unit!11186)

(declare-fun Unit!11191 () Unit!11186)

(assert (=> b!162074 (= lt!255226 (ite lt!255222 (let ((bdg!9767 ((_ extract 7 0) (bvnot lt!255215)))) (let ((bdg!9768 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)))) ((_ sign_extend 24) bdg!9767))))) (tuple3!933 Unit!11190 bdg!9767 (BitStream!6373 (array!8034 (store (arr!4523 (array!8034 (store (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)) bdg!9768) (size!3602 lt!255218))) (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9768) (bvshl ((_ sign_extend 24) v!222) lt!255228)))) (size!3602 (array!8034 (store (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)) bdg!9768) (size!3602 lt!255218)))) (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)) (currentBit!7555 thiss!1602))))) (tuple3!933 Unit!11191 lt!255223 (BitStream!6373 lt!255218 (bvadd #b00000000000000000000000000000001 (currentByte!7560 thiss!1602)) (currentBit!7555 thiss!1602)))))))

(declare-fun lt!255224 () (_ BitVec 32))

(assert (=> b!162074 (= lt!255222 (bvsgt lt!255224 #b00000000000000000000000000000000))))

(assert (=> b!162074 e!111764))

(declare-fun res!135103 () Bool)

(assert (=> b!162074 (=> res!135103 e!111764)))

(assert (=> b!162074 (= res!135103 (bvsge (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> b!162074 (= lt!255218 (array!8034 (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> b!162074 (= lt!255213 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255214) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!255224))))))

(assert (=> b!162074 (= lt!255214 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602))) lt!255215)))))

(assert (=> b!162074 (= lt!255215 ((_ sign_extend 24) lt!255223))))

(assert (=> b!162074 (= lt!255223 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!255228)))))))

(assert (=> b!162074 (= lt!255228 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!255224))))))

(assert (=> b!162074 (= lt!255224 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7555 thiss!1602))))))

(declare-fun b!162075 () Bool)

(assert (=> b!162075 (= e!111766 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (currentByte!7560 thiss!1602)))))

(assert (= (and start!33940 res!135102) b!162074))

(assert (= (and b!162074 (not res!135103)) b!162071))

(assert (= (and b!162074 (not res!135099)) b!162073))

(assert (= (and b!162073 c!8477) b!162068))

(assert (= (and b!162073 (not c!8477)) b!162067))

(assert (= (and b!162068 res!135104) b!162075))

(assert (= (or b!162068 b!162067) bm!2735))

(assert (= (and b!162073 res!135100) b!162070))

(assert (= (and b!162070 res!135098) b!162066))

(assert (= (and b!162066 res!135101) b!162069))

(assert (= start!33940 b!162072))

(declare-fun m!257205 () Bool)

(assert (=> b!162066 m!257205))

(declare-fun m!257207 () Bool)

(assert (=> b!162072 m!257207))

(declare-fun m!257209 () Bool)

(assert (=> b!162068 m!257209))

(declare-fun m!257211 () Bool)

(assert (=> b!162068 m!257211))

(declare-fun m!257213 () Bool)

(assert (=> b!162068 m!257213))

(declare-fun m!257215 () Bool)

(assert (=> b!162068 m!257215))

(declare-fun m!257217 () Bool)

(assert (=> b!162068 m!257217))

(declare-fun m!257219 () Bool)

(assert (=> b!162068 m!257219))

(assert (=> b!162068 m!257211))

(declare-fun m!257221 () Bool)

(assert (=> b!162068 m!257221))

(declare-fun m!257223 () Bool)

(assert (=> b!162068 m!257223))

(declare-fun m!257225 () Bool)

(assert (=> b!162068 m!257225))

(assert (=> b!162068 m!257211))

(declare-fun m!257227 () Bool)

(assert (=> b!162075 m!257227))

(assert (=> bm!2735 m!257211))

(declare-fun m!257229 () Bool)

(assert (=> bm!2735 m!257229))

(declare-fun m!257231 () Bool)

(assert (=> bm!2735 m!257231))

(declare-fun m!257233 () Bool)

(assert (=> b!162071 m!257233))

(assert (=> b!162071 m!257233))

(declare-fun m!257235 () Bool)

(assert (=> b!162071 m!257235))

(declare-fun m!257237 () Bool)

(assert (=> start!33940 m!257237))

(declare-fun m!257239 () Bool)

(assert (=> start!33940 m!257239))

(declare-fun m!257241 () Bool)

(assert (=> b!162070 m!257241))

(declare-fun m!257243 () Bool)

(assert (=> b!162070 m!257243))

(declare-fun m!257245 () Bool)

(assert (=> b!162074 m!257245))

(declare-fun m!257247 () Bool)

(assert (=> b!162074 m!257247))

(declare-fun m!257249 () Bool)

(assert (=> b!162074 m!257249))

(assert (=> b!162074 m!257233))

(declare-fun m!257251 () Bool)

(assert (=> b!162074 m!257251))

(declare-fun m!257253 () Bool)

(assert (=> b!162074 m!257253))

(declare-fun m!257255 () Bool)

(assert (=> b!162074 m!257255))

(assert (=> b!162074 m!257217))

(declare-fun m!257257 () Bool)

(assert (=> b!162074 m!257257))

(declare-fun m!257259 () Bool)

(assert (=> b!162074 m!257259))

(assert (=> b!162074 m!257223))

(declare-fun m!257261 () Bool)

(assert (=> b!162074 m!257261))

(declare-fun m!257263 () Bool)

(assert (=> b!162069 m!257263))

(declare-fun m!257265 () Bool)

(assert (=> b!162069 m!257265))

(check-sat (not b!162071) (not b!162068) (not b!162072) (not b!162075) (not b!162069) (not b!162066) (not b!162070) (not start!33940) (not b!162074) (not bm!2735))
(check-sat)
(get-model)

(declare-fun d!55479 () Bool)

(assert (=> d!55479 (= (byteRangesEq!0 (select (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602)) lt!255213 #b00000000000000000000000000000000 (currentBit!7555 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7555 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7555 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!255213) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7555 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13798 () Bool)

(assert (= bs!13798 d!55479))

(declare-fun m!257329 () Bool)

(assert (=> bs!13798 m!257329))

(declare-fun m!257331 () Bool)

(assert (=> bs!13798 m!257331))

(assert (=> b!162071 d!55479))

(declare-fun d!55481 () Bool)

(declare-fun res!135133 () Bool)

(declare-fun e!111801 () Bool)

(assert (=> d!55481 (=> (not res!135133) (not e!111801))))

(assert (=> d!55481 (= res!135133 (= (size!3602 (buf!4060 thiss!1602)) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (=> d!55481 (= (isPrefixOf!0 thiss!1602 (_3!583 lt!255226)) e!111801)))

(declare-fun b!162112 () Bool)

(declare-fun res!135132 () Bool)

(assert (=> b!162112 (=> (not res!135132) (not e!111801))))

(assert (=> b!162112 (= res!135132 (bvsle (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun b!162113 () Bool)

(declare-fun e!111800 () Bool)

(assert (=> b!162113 (= e!111801 e!111800)))

(declare-fun res!135134 () Bool)

(assert (=> b!162113 (=> res!135134 e!111800)))

(assert (=> b!162113 (= res!135134 (= (size!3602 (buf!4060 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162114 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8033 array!8033 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162114 (= e!111800 (arrayBitRangesEq!0 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (= (and d!55481 res!135133) b!162112))

(assert (= (and b!162112 res!135132) b!162113))

(assert (= (and b!162113 (not res!135134)) b!162114))

(assert (=> b!162112 m!257243))

(assert (=> b!162112 m!257241))

(assert (=> b!162114 m!257243))

(assert (=> b!162114 m!257243))

(declare-fun m!257333 () Bool)

(assert (=> b!162114 m!257333))

(assert (=> b!162066 d!55481))

(declare-fun d!55483 () Bool)

(declare-fun e!111804 () Bool)

(assert (=> d!55483 e!111804))

(declare-fun res!135139 () Bool)

(assert (=> d!55483 (=> (not res!135139) (not e!111804))))

(declare-fun lt!255293 () (_ BitVec 64))

(declare-fun lt!255295 () (_ BitVec 64))

(declare-fun lt!255294 () (_ BitVec 64))

(assert (=> d!55483 (= res!135139 (= lt!255293 (bvsub lt!255295 lt!255294)))))

(assert (=> d!55483 (or (= (bvand lt!255295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255295 lt!255294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55483 (= lt!255294 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_3!583 lt!255226)))) ((_ sign_extend 32) (currentByte!7560 (_3!583 lt!255226))) ((_ sign_extend 32) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun lt!255296 () (_ BitVec 64))

(declare-fun lt!255292 () (_ BitVec 64))

(assert (=> d!55483 (= lt!255295 (bvmul lt!255296 lt!255292))))

(assert (=> d!55483 (or (= lt!255296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255292 (bvsdiv (bvmul lt!255296 lt!255292) lt!255296)))))

(assert (=> d!55483 (= lt!255292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55483 (= lt!255296 ((_ sign_extend 32) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (=> d!55483 (= lt!255293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_3!583 lt!255226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55483 (invariant!0 (currentBit!7555 (_3!583 lt!255226)) (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 (_3!583 lt!255226))))))

(assert (=> d!55483 (= (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226))) lt!255293)))

(declare-fun b!162119 () Bool)

(declare-fun res!135140 () Bool)

(assert (=> b!162119 (=> (not res!135140) (not e!111804))))

(assert (=> b!162119 (= res!135140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255293))))

(declare-fun b!162120 () Bool)

(declare-fun lt!255297 () (_ BitVec 64))

(assert (=> b!162120 (= e!111804 (bvsle lt!255293 (bvmul lt!255297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162120 (or (= lt!255297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255297)))))

(assert (=> b!162120 (= lt!255297 ((_ sign_extend 32) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (= (and d!55483 res!135139) b!162119))

(assert (= (and b!162119 res!135140) b!162120))

(declare-fun m!257335 () Bool)

(assert (=> d!55483 m!257335))

(declare-fun m!257337 () Bool)

(assert (=> d!55483 m!257337))

(assert (=> b!162070 d!55483))

(declare-fun d!55485 () Bool)

(declare-fun e!111805 () Bool)

(assert (=> d!55485 e!111805))

(declare-fun res!135141 () Bool)

(assert (=> d!55485 (=> (not res!135141) (not e!111805))))

(declare-fun lt!255301 () (_ BitVec 64))

(declare-fun lt!255300 () (_ BitVec 64))

(declare-fun lt!255299 () (_ BitVec 64))

(assert (=> d!55485 (= res!135141 (= lt!255299 (bvsub lt!255301 lt!255300)))))

(assert (=> d!55485 (or (= (bvand lt!255301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255301 lt!255300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55485 (= lt!255300 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) ((_ sign_extend 32) (currentByte!7560 thiss!1602)) ((_ sign_extend 32) (currentBit!7555 thiss!1602))))))

(declare-fun lt!255302 () (_ BitVec 64))

(declare-fun lt!255298 () (_ BitVec 64))

(assert (=> d!55485 (= lt!255301 (bvmul lt!255302 lt!255298))))

(assert (=> d!55485 (or (= lt!255302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255298 (bvsdiv (bvmul lt!255302 lt!255298) lt!255302)))))

(assert (=> d!55485 (= lt!255298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55485 (= lt!255302 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55485 (= lt!255299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 thiss!1602))))))

(assert (=> d!55485 (invariant!0 (currentBit!7555 thiss!1602) (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602)))))

(assert (=> d!55485 (= (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) lt!255299)))

(declare-fun b!162121 () Bool)

(declare-fun res!135142 () Bool)

(assert (=> b!162121 (=> (not res!135142) (not e!111805))))

(assert (=> b!162121 (= res!135142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255299))))

(declare-fun b!162122 () Bool)

(declare-fun lt!255303 () (_ BitVec 64))

(assert (=> b!162122 (= e!111805 (bvsle lt!255299 (bvmul lt!255303 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162122 (or (= lt!255303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255303)))))

(assert (=> b!162122 (= lt!255303 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))))))

(assert (= (and d!55485 res!135141) b!162121))

(assert (= (and b!162121 res!135142) b!162122))

(declare-fun m!257339 () Bool)

(assert (=> d!55485 m!257339))

(declare-fun m!257341 () Bool)

(assert (=> d!55485 m!257341))

(assert (=> b!162070 d!55485))

(declare-fun d!55487 () Bool)

(assert (=> d!55487 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) ((_ sign_extend 32) (currentByte!7560 thiss!1602)) ((_ sign_extend 32) (currentBit!7555 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) ((_ sign_extend 32) (currentByte!7560 thiss!1602)) ((_ sign_extend 32) (currentBit!7555 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13799 () Bool)

(assert (= bs!13799 d!55487))

(assert (=> bs!13799 m!257339))

(assert (=> start!33940 d!55487))

(declare-fun d!55489 () Bool)

(assert (=> d!55489 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7555 thiss!1602) (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602))))))

(declare-fun bs!13800 () Bool)

(assert (= bs!13800 d!55489))

(assert (=> bs!13800 m!257341))

(assert (=> start!33940 d!55489))

(declare-fun d!55491 () Bool)

(declare-fun res!135147 () Bool)

(declare-fun e!111810 () Bool)

(assert (=> d!55491 (=> res!135147 e!111810)))

(assert (=> d!55491 (= res!135147 (= #b00000000000000000000000000000000 (currentByte!7560 thiss!1602)))))

(assert (=> d!55491 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (currentByte!7560 thiss!1602)) e!111810)))

(declare-fun b!162127 () Bool)

(declare-fun e!111811 () Bool)

(assert (=> b!162127 (= e!111810 e!111811)))

(declare-fun res!135148 () Bool)

(assert (=> b!162127 (=> (not res!135148) (not e!111811))))

(assert (=> b!162127 (= res!135148 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) #b00000000000000000000000000000000)))))

(declare-fun b!162128 () Bool)

(assert (=> b!162128 (= e!111811 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)))))

(assert (= (and d!55491 (not res!135147)) b!162127))

(assert (= (and b!162127 res!135148) b!162128))

(declare-fun m!257343 () Bool)

(assert (=> b!162127 m!257343))

(declare-fun m!257345 () Bool)

(assert (=> b!162127 m!257345))

(declare-fun m!257347 () Bool)

(assert (=> b!162128 m!257347))

(assert (=> b!162075 d!55491))

(declare-fun d!55493 () Bool)

(declare-fun res!135149 () Bool)

(declare-fun e!111812 () Bool)

(assert (=> d!55493 (=> res!135149 e!111812)))

(assert (=> d!55493 (= res!135149 (= #b00000000000000000000000000000000 (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (=> d!55493 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) #b00000000000000000000000000000000 (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))) e!111812)))

(declare-fun b!162129 () Bool)

(declare-fun e!111813 () Bool)

(assert (=> b!162129 (= e!111812 e!111813)))

(declare-fun res!135150 () Bool)

(assert (=> b!162129 (=> (not res!135150) (not e!111813))))

(assert (=> b!162129 (= res!135150 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226)))) #b00000000000000000000000000000000)))))

(declare-fun b!162130 () Bool)

(assert (=> b!162130 (= e!111813 (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (= (and d!55493 (not res!135149)) b!162129))

(assert (= (and b!162129 res!135150) b!162130))

(assert (=> b!162129 m!257343))

(declare-fun m!257349 () Bool)

(assert (=> b!162129 m!257349))

(declare-fun m!257351 () Bool)

(assert (=> b!162130 m!257351))

(assert (=> bm!2735 d!55493))

(declare-fun d!55495 () Bool)

(declare-fun res!135151 () Bool)

(declare-fun e!111814 () Bool)

(assert (=> d!55495 (=> res!135151 e!111814)))

(assert (=> d!55495 (= res!135151 (= #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55495 (= (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!111814)))

(declare-fun b!162131 () Bool)

(declare-fun e!111815 () Bool)

(assert (=> b!162131 (= e!111814 e!111815)))

(declare-fun res!135152 () Bool)

(assert (=> b!162131 (=> (not res!135152) (not e!111815))))

(assert (=> b!162131 (= res!135152 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 lt!255218) #b00000000000000000000000000000000)))))

(declare-fun b!162132 () Bool)

(assert (=> b!162132 (= e!111815 (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55495 (not res!135151)) b!162131))

(assert (= (and b!162131 res!135152) b!162132))

(assert (=> b!162131 m!257343))

(declare-fun m!257353 () Bool)

(assert (=> b!162131 m!257353))

(declare-fun m!257355 () Bool)

(assert (=> b!162132 m!257355))

(assert (=> b!162074 d!55495))

(declare-fun d!55497 () Bool)

(declare-fun res!135153 () Bool)

(declare-fun e!111816 () Bool)

(assert (=> d!55497 (=> res!135153 e!111816)))

(assert (=> d!55497 (= res!135153 (= #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55497 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!111816)))

(declare-fun b!162133 () Bool)

(declare-fun e!111817 () Bool)

(assert (=> b!162133 (= e!111816 e!111817)))

(declare-fun res!135154 () Bool)

(assert (=> b!162133 (=> (not res!135154) (not e!111817))))

(assert (=> b!162133 (= res!135154 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162134 () Bool)

(assert (=> b!162134 (= e!111817 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55497 (not res!135153)) b!162133))

(assert (= (and b!162133 res!135154) b!162134))

(assert (=> b!162133 m!257343))

(declare-fun m!257357 () Bool)

(assert (=> b!162133 m!257357))

(declare-fun m!257359 () Bool)

(assert (=> b!162134 m!257359))

(assert (=> b!162074 d!55497))

(declare-fun d!55499 () Bool)

(declare-fun e!111820 () Bool)

(assert (=> d!55499 e!111820))

(declare-fun res!135157 () Bool)

(assert (=> d!55499 (=> (not res!135157) (not e!111820))))

(assert (=> d!55499 (= res!135157 (and (bvsge (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (size!3602 (buf!4060 thiss!1602)))))))

(declare-fun lt!255306 () Unit!11186)

(declare-fun choose!176 (array!8033 (_ BitVec 32) (_ BitVec 8)) Unit!11186)

(assert (=> d!55499 (= lt!255306 (choose!176 (buf!4060 thiss!1602) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221))))

(assert (=> d!55499 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55499 (= (arrayUpdatedAtPrefixLemma!162 (buf!4060 thiss!1602) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) lt!255306)))

(declare-fun b!162137 () Bool)

(assert (=> b!162137 (= e!111820 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55499 res!135157) b!162137))

(declare-fun m!257361 () Bool)

(assert (=> d!55499 m!257361))

(assert (=> b!162137 m!257249))

(assert (=> b!162137 m!257245))

(assert (=> b!162074 d!55499))

(declare-fun d!55501 () Bool)

(declare-datatypes ((tuple2!14480 0))(
  ( (tuple2!14481 (_1!7825 (_ BitVec 8)) (_2!7825 BitStream!6372)) )
))
(declare-fun lt!255309 () tuple2!14480)

(declare-fun readByte!0 (BitStream!6372) tuple2!14480)

(assert (=> d!55501 (= lt!255309 (readByte!0 (_1!7820 lt!255212)))))

(assert (=> d!55501 (= (readBytePure!0 (_1!7820 lt!255212)) (tuple2!14475 (_2!7825 lt!255309) (_1!7825 lt!255309)))))

(declare-fun bs!13801 () Bool)

(assert (= bs!13801 d!55501))

(declare-fun m!257363 () Bool)

(assert (=> bs!13801 m!257363))

(assert (=> b!162069 d!55501))

(declare-fun b!162148 () Bool)

(declare-fun res!135164 () Bool)

(declare-fun e!111825 () Bool)

(assert (=> b!162148 (=> (not res!135164) (not e!111825))))

(declare-fun lt!255368 () tuple2!14472)

(assert (=> b!162148 (= res!135164 (isPrefixOf!0 (_1!7820 lt!255368) thiss!1602))))

(declare-fun b!162149 () Bool)

(declare-fun e!111826 () Unit!11186)

(declare-fun lt!255355 () Unit!11186)

(assert (=> b!162149 (= e!111826 lt!255355)))

(declare-fun lt!255361 () (_ BitVec 64))

(assert (=> b!162149 (= lt!255361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!255350 () (_ BitVec 64))

(assert (=> b!162149 (= lt!255350 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8033 array!8033 (_ BitVec 64) (_ BitVec 64)) Unit!11186)

(assert (=> b!162149 (= lt!255355 (arrayBitRangesEqSymmetric!0 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) lt!255361 lt!255350))))

(assert (=> b!162149 (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) lt!255361 lt!255350)))

(declare-fun b!162150 () Bool)

(declare-fun Unit!11198 () Unit!11186)

(assert (=> b!162150 (= e!111826 Unit!11198)))

(declare-fun b!162152 () Bool)

(declare-fun lt!255351 () (_ BitVec 64))

(declare-fun lt!255366 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6372 (_ BitVec 64)) BitStream!6372)

(assert (=> b!162152 (= e!111825 (= (_1!7820 lt!255368) (withMovedBitIndex!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366))))))

(assert (=> b!162152 (or (= (bvand lt!255351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255366 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255351 lt!255366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162152 (= lt!255366 (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226))))))

(assert (=> b!162152 (= lt!255351 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)))))

(declare-fun d!55503 () Bool)

(assert (=> d!55503 e!111825))

(declare-fun res!135166 () Bool)

(assert (=> d!55503 (=> (not res!135166) (not e!111825))))

(assert (=> d!55503 (= res!135166 (isPrefixOf!0 (_1!7820 lt!255368) (_2!7820 lt!255368)))))

(declare-fun lt!255362 () BitStream!6372)

(assert (=> d!55503 (= lt!255368 (tuple2!14473 lt!255362 (_3!583 lt!255226)))))

(declare-fun lt!255353 () Unit!11186)

(declare-fun lt!255358 () Unit!11186)

(assert (=> d!55503 (= lt!255353 lt!255358)))

(assert (=> d!55503 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6372 BitStream!6372 BitStream!6372) Unit!11186)

(assert (=> d!55503 (= lt!255358 (lemmaIsPrefixTransitive!0 lt!255362 (_3!583 lt!255226) (_3!583 lt!255226)))))

(declare-fun lt!255357 () Unit!11186)

(declare-fun lt!255369 () Unit!11186)

(assert (=> d!55503 (= lt!255357 lt!255369)))

(assert (=> d!55503 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(assert (=> d!55503 (= lt!255369 (lemmaIsPrefixTransitive!0 lt!255362 thiss!1602 (_3!583 lt!255226)))))

(declare-fun lt!255363 () Unit!11186)

(assert (=> d!55503 (= lt!255363 e!111826)))

(declare-fun c!8483 () Bool)

(assert (=> d!55503 (= c!8483 (not (= (size!3602 (buf!4060 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!255352 () Unit!11186)

(declare-fun lt!255359 () Unit!11186)

(assert (=> d!55503 (= lt!255352 lt!255359)))

(assert (=> d!55503 (isPrefixOf!0 (_3!583 lt!255226) (_3!583 lt!255226))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6372) Unit!11186)

(assert (=> d!55503 (= lt!255359 (lemmaIsPrefixRefl!0 (_3!583 lt!255226)))))

(declare-fun lt!255367 () Unit!11186)

(declare-fun lt!255365 () Unit!11186)

(assert (=> d!55503 (= lt!255367 lt!255365)))

(assert (=> d!55503 (= lt!255365 (lemmaIsPrefixRefl!0 (_3!583 lt!255226)))))

(declare-fun lt!255364 () Unit!11186)

(declare-fun lt!255360 () Unit!11186)

(assert (=> d!55503 (= lt!255364 lt!255360)))

(assert (=> d!55503 (isPrefixOf!0 lt!255362 lt!255362)))

(assert (=> d!55503 (= lt!255360 (lemmaIsPrefixRefl!0 lt!255362))))

(declare-fun lt!255354 () Unit!11186)

(declare-fun lt!255356 () Unit!11186)

(assert (=> d!55503 (= lt!255354 lt!255356)))

(assert (=> d!55503 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55503 (= lt!255356 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!55503 (= lt!255362 (BitStream!6373 (buf!4060 (_3!583 lt!255226)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)))))

(assert (=> d!55503 (isPrefixOf!0 thiss!1602 (_3!583 lt!255226))))

(assert (=> d!55503 (= (reader!0 thiss!1602 (_3!583 lt!255226)) lt!255368)))

(declare-fun b!162151 () Bool)

(declare-fun res!135165 () Bool)

(assert (=> b!162151 (=> (not res!135165) (not e!111825))))

(assert (=> b!162151 (= res!135165 (isPrefixOf!0 (_2!7820 lt!255368) (_3!583 lt!255226)))))

(assert (= (and d!55503 c!8483) b!162149))

(assert (= (and d!55503 (not c!8483)) b!162150))

(assert (= (and d!55503 res!135166) b!162148))

(assert (= (and b!162148 res!135164) b!162151))

(assert (= (and b!162151 res!135165) b!162152))

(declare-fun m!257365 () Bool)

(assert (=> b!162148 m!257365))

(assert (=> b!162149 m!257243))

(declare-fun m!257367 () Bool)

(assert (=> b!162149 m!257367))

(declare-fun m!257369 () Bool)

(assert (=> b!162149 m!257369))

(declare-fun m!257371 () Bool)

(assert (=> b!162151 m!257371))

(declare-fun m!257373 () Bool)

(assert (=> d!55503 m!257373))

(declare-fun m!257375 () Bool)

(assert (=> d!55503 m!257375))

(declare-fun m!257377 () Bool)

(assert (=> d!55503 m!257377))

(assert (=> d!55503 m!257205))

(declare-fun m!257379 () Bool)

(assert (=> d!55503 m!257379))

(declare-fun m!257381 () Bool)

(assert (=> d!55503 m!257381))

(declare-fun m!257383 () Bool)

(assert (=> d!55503 m!257383))

(declare-fun m!257385 () Bool)

(assert (=> d!55503 m!257385))

(declare-fun m!257387 () Bool)

(assert (=> d!55503 m!257387))

(declare-fun m!257389 () Bool)

(assert (=> d!55503 m!257389))

(declare-fun m!257391 () Bool)

(assert (=> d!55503 m!257391))

(declare-fun m!257393 () Bool)

(assert (=> b!162152 m!257393))

(assert (=> b!162152 m!257241))

(assert (=> b!162152 m!257243))

(assert (=> b!162069 d!55503))

(declare-fun d!55505 () Bool)

(declare-fun res!135167 () Bool)

(declare-fun e!111827 () Bool)

(assert (=> d!55505 (=> res!135167 e!111827)))

(assert (=> d!55505 (= res!135167 (= #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55505 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!111827)))

(declare-fun b!162153 () Bool)

(declare-fun e!111828 () Bool)

(assert (=> b!162153 (= e!111827 e!111828)))

(declare-fun res!135168 () Bool)

(assert (=> b!162153 (=> (not res!135168) (not e!111828))))

(assert (=> b!162153 (= res!135168 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) #b00000000000000000000000000000000)))))

(declare-fun b!162154 () Bool)

(assert (=> b!162154 (= e!111828 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55505 (not res!135167)) b!162153))

(assert (= (and b!162153 res!135168) b!162154))

(assert (=> b!162153 m!257343))

(assert (=> b!162153 m!257345))

(declare-fun m!257395 () Bool)

(assert (=> b!162154 m!257395))

(assert (=> b!162068 d!55505))

(declare-fun d!55507 () Bool)

(declare-fun e!111829 () Bool)

(assert (=> d!55507 e!111829))

(declare-fun res!135169 () Bool)

(assert (=> d!55507 (=> (not res!135169) (not e!111829))))

(assert (=> d!55507 (= res!135169 (and (bvsge (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000000) (bvslt (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 thiss!1602)))))))

(declare-fun lt!255370 () Unit!11186)

(assert (=> d!55507 (= lt!255370 (choose!176 (buf!4060 thiss!1602) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))))))

(assert (=> d!55507 (and (bvsle #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))) (bvslt (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55507 (= (arrayUpdatedAtPrefixLemma!162 (buf!4060 thiss!1602) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) lt!255370)))

(declare-fun b!162155 () Bool)

(assert (=> b!162155 (= e!111829 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55507 res!135169) b!162155))

(assert (=> d!55507 m!257211))

(declare-fun m!257397 () Bool)

(assert (=> d!55507 m!257397))

(assert (=> b!162155 m!257229))

(declare-fun m!257399 () Bool)

(assert (=> b!162155 m!257399))

(assert (=> b!162068 d!55507))

(declare-fun d!55509 () Bool)

(assert (=> d!55509 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001))))

(declare-fun lt!255373 () Unit!11186)

(declare-fun choose!177 (array!8033 array!8033 array!8033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11186)

(assert (=> d!55509 (= lt!255373 (choose!177 (buf!4060 thiss!1602) lt!255218 (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55509 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55509 (= (arrayRangesEqTransitive!149 (buf!4060 thiss!1602) lt!255218 (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) lt!255373)))

(declare-fun bs!13802 () Bool)

(assert (= bs!13802 d!55509))

(assert (=> bs!13802 m!257219))

(declare-fun m!257401 () Bool)

(assert (=> bs!13802 m!257401))

(assert (=> b!162068 d!55509))

(declare-fun d!55511 () Bool)

(declare-fun e!111830 () Bool)

(assert (=> d!55511 e!111830))

(declare-fun res!135170 () Bool)

(assert (=> d!55511 (=> (not res!135170) (not e!111830))))

(assert (=> d!55511 (= res!135170 (and (bvsge (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000000) (bvslt (currentByte!7560 (_3!583 lt!255226)) (size!3602 lt!255218))))))

(declare-fun lt!255374 () Unit!11186)

(assert (=> d!55511 (= lt!255374 (choose!176 lt!255218 (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))))))

(assert (=> d!55511 (and (bvsle #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))) (bvslt (currentByte!7560 (_3!583 lt!255226)) (size!3602 lt!255218)))))

(assert (=> d!55511 (= (arrayUpdatedAtPrefixLemma!162 lt!255218 (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) lt!255374)))

(declare-fun b!162156 () Bool)

(assert (=> b!162156 (= e!111830 (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55511 res!135170) b!162156))

(assert (=> d!55511 m!257211))

(declare-fun m!257403 () Bool)

(assert (=> d!55511 m!257403))

(declare-fun m!257405 () Bool)

(assert (=> b!162156 m!257405))

(declare-fun m!257407 () Bool)

(assert (=> b!162156 m!257407))

(assert (=> b!162068 d!55511))

(declare-fun d!55513 () Bool)

(declare-fun res!135171 () Bool)

(declare-fun e!111831 () Bool)

(assert (=> d!55513 (=> res!135171 e!111831)))

(assert (=> d!55513 (= res!135171 (= #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55513 (= (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))) e!111831)))

(declare-fun b!162157 () Bool)

(declare-fun e!111832 () Bool)

(assert (=> b!162157 (= e!111831 e!111832)))

(declare-fun res!135172 () Bool)

(assert (=> b!162157 (=> (not res!135172) (not e!111832))))

(assert (=> b!162157 (= res!135172 (= (select (arr!4523 lt!255218) #b00000000000000000000000000000000) (select (arr!4523 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162158 () Bool)

(assert (=> b!162158 (= e!111832 (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55513 (not res!135171)) b!162157))

(assert (= (and b!162157 res!135172) b!162158))

(assert (=> b!162157 m!257353))

(declare-fun m!257409 () Bool)

(assert (=> b!162157 m!257409))

(declare-fun m!257411 () Bool)

(assert (=> b!162158 m!257411))

(assert (=> b!162068 d!55513))

(declare-fun d!55515 () Bool)

(assert (=> d!55515 (= (array_inv!3349 (buf!4060 thiss!1602)) (bvsge (size!3602 (buf!4060 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!162072 d!55515))

(check-sat (not b!162154) (not b!162155) (not b!162134) (not b!162128) (not b!162130) (not d!55483) (not b!162151) (not b!162148) (not b!162114) (not d!55509) (not b!162152) (not d!55503) (not d!55487) (not d!55511) (not b!162156) (not d!55489) (not d!55507) (not b!162112) (not d!55499) (not b!162137) (not b!162149) (not d!55501) (not d!55485) (not b!162158) (not b!162132))
(check-sat)
(get-model)

(declare-fun d!55659 () Bool)

(assert (=> d!55659 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001))))

(assert (=> d!55659 true))

(declare-fun _$8!138 () Unit!11186)

(assert (=> d!55659 (= (choose!176 (buf!4060 thiss!1602) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) _$8!138)))

(declare-fun bs!13824 () Bool)

(assert (= bs!13824 d!55659))

(assert (=> bs!13824 m!257249))

(assert (=> bs!13824 m!257245))

(assert (=> d!55499 d!55659))

(assert (=> b!162149 d!55485))

(declare-fun d!55661 () Bool)

(assert (=> d!55661 (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) lt!255361 lt!255350)))

(declare-fun lt!255618 () Unit!11186)

(declare-fun choose!8 (array!8033 array!8033 (_ BitVec 64) (_ BitVec 64)) Unit!11186)

(assert (=> d!55661 (= lt!255618 (choose!8 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) lt!255361 lt!255350))))

(assert (=> d!55661 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255361) (bvsle lt!255361 lt!255350))))

(assert (=> d!55661 (= (arrayBitRangesEqSymmetric!0 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) lt!255361 lt!255350) lt!255618)))

(declare-fun bs!13825 () Bool)

(assert (= bs!13825 d!55661))

(assert (=> bs!13825 m!257369))

(declare-fun m!257693 () Bool)

(assert (=> bs!13825 m!257693))

(assert (=> b!162149 d!55661))

(declare-fun b!162354 () Bool)

(declare-fun res!135348 () Bool)

(declare-fun lt!255627 () (_ BitVec 32))

(assert (=> b!162354 (= res!135348 (= lt!255627 #b00000000000000000000000000000000))))

(declare-fun e!111982 () Bool)

(assert (=> b!162354 (=> res!135348 e!111982)))

(declare-fun e!111983 () Bool)

(assert (=> b!162354 (= e!111983 e!111982)))

(declare-fun bm!2745 () Bool)

(declare-fun c!8496 () Bool)

(declare-fun lt!255625 () (_ BitVec 32))

(declare-datatypes ((tuple4!236 0))(
  ( (tuple4!237 (_1!7831 (_ BitVec 32)) (_2!7831 (_ BitVec 32)) (_3!586 (_ BitVec 32)) (_4!118 (_ BitVec 32))) )
))
(declare-fun lt!255626 () tuple4!236)

(declare-fun call!2748 () Bool)

(assert (=> bm!2745 (= call!2748 (byteRangesEq!0 (ite c!8496 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255626))) (ite c!8496 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255626))) (ite c!8496 lt!255625 #b00000000000000000000000000000000) lt!255627))))

(declare-fun b!162355 () Bool)

(declare-fun e!111987 () Bool)

(assert (=> b!162355 (= e!111987 (arrayRangesEq!554 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) (_1!7831 lt!255626) (_2!7831 lt!255626)))))

(declare-fun b!162356 () Bool)

(declare-fun e!111984 () Bool)

(declare-fun e!111986 () Bool)

(assert (=> b!162356 (= e!111984 e!111986)))

(assert (=> b!162356 (= c!8496 (= (_3!586 lt!255626) (_4!118 lt!255626)))))

(declare-fun b!162357 () Bool)

(assert (=> b!162357 (= e!111986 e!111983)))

(declare-fun res!135346 () Bool)

(assert (=> b!162357 (= res!135346 (byteRangesEq!0 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626)) lt!255625 #b00000000000000000000000000001000))))

(assert (=> b!162357 (=> (not res!135346) (not e!111983))))

(declare-fun b!162358 () Bool)

(assert (=> b!162358 (= e!111982 call!2748)))

(declare-fun b!162359 () Bool)

(assert (=> b!162359 (= e!111986 call!2748)))

(declare-fun d!55663 () Bool)

(declare-fun res!135344 () Bool)

(declare-fun e!111985 () Bool)

(assert (=> d!55663 (=> res!135344 e!111985)))

(assert (=> d!55663 (= res!135344 (bvsge lt!255361 lt!255350))))

(assert (=> d!55663 (= (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) lt!255361 lt!255350) e!111985)))

(declare-fun b!162353 () Bool)

(assert (=> b!162353 (= e!111985 e!111984)))

(declare-fun res!135345 () Bool)

(assert (=> b!162353 (=> (not res!135345) (not e!111984))))

(assert (=> b!162353 (= res!135345 e!111987)))

(declare-fun res!135347 () Bool)

(assert (=> b!162353 (=> res!135347 e!111987)))

(assert (=> b!162353 (= res!135347 (bvsge (_1!7831 lt!255626) (_2!7831 lt!255626)))))

(assert (=> b!162353 (= lt!255627 ((_ extract 31 0) (bvsrem lt!255350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162353 (= lt!255625 ((_ extract 31 0) (bvsrem lt!255361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!236)

(assert (=> b!162353 (= lt!255626 (arrayBitIndices!0 lt!255361 lt!255350))))

(assert (= (and d!55663 (not res!135344)) b!162353))

(assert (= (and b!162353 (not res!135347)) b!162355))

(assert (= (and b!162353 res!135345) b!162356))

(assert (= (and b!162356 c!8496) b!162359))

(assert (= (and b!162356 (not c!8496)) b!162357))

(assert (= (and b!162357 res!135346) b!162354))

(assert (= (and b!162354 (not res!135348)) b!162358))

(assert (= (or b!162359 b!162358) bm!2745))

(declare-fun m!257695 () Bool)

(assert (=> bm!2745 m!257695))

(declare-fun m!257697 () Bool)

(assert (=> bm!2745 m!257697))

(declare-fun m!257699 () Bool)

(assert (=> bm!2745 m!257699))

(declare-fun m!257701 () Bool)

(assert (=> bm!2745 m!257701))

(declare-fun m!257703 () Bool)

(assert (=> bm!2745 m!257703))

(declare-fun m!257705 () Bool)

(assert (=> b!162355 m!257705))

(assert (=> b!162357 m!257697))

(assert (=> b!162357 m!257703))

(assert (=> b!162357 m!257697))

(assert (=> b!162357 m!257703))

(declare-fun m!257707 () Bool)

(assert (=> b!162357 m!257707))

(declare-fun m!257709 () Bool)

(assert (=> b!162353 m!257709))

(assert (=> b!162149 d!55663))

(declare-fun d!55665 () Bool)

(declare-fun res!135349 () Bool)

(declare-fun e!111988 () Bool)

(assert (=> d!55665 (=> res!135349 e!111988)))

(assert (=> d!55665 (= res!135349 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)))))

(assert (=> d!55665 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)) e!111988)))

(declare-fun b!162360 () Bool)

(declare-fun e!111989 () Bool)

(assert (=> b!162360 (= e!111988 e!111989)))

(declare-fun res!135350 () Bool)

(assert (=> b!162360 (=> (not res!135350) (not e!111989))))

(assert (=> b!162360 (= res!135350 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162361 () Bool)

(assert (=> b!162361 (= e!111989 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)))))

(assert (= (and d!55665 (not res!135349)) b!162360))

(assert (= (and b!162360 res!135350) b!162361))

(declare-fun m!257711 () Bool)

(assert (=> b!162360 m!257711))

(declare-fun m!257713 () Bool)

(assert (=> b!162360 m!257713))

(declare-fun m!257715 () Bool)

(assert (=> b!162361 m!257715))

(assert (=> b!162128 d!55665))

(declare-fun d!55667 () Bool)

(declare-fun res!135352 () Bool)

(declare-fun e!111991 () Bool)

(assert (=> d!55667 (=> (not res!135352) (not e!111991))))

(assert (=> d!55667 (= res!135352 (= (size!3602 (buf!4060 (_1!7820 lt!255368))) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55667 (= (isPrefixOf!0 (_1!7820 lt!255368) thiss!1602) e!111991)))

(declare-fun b!162362 () Bool)

(declare-fun res!135351 () Bool)

(assert (=> b!162362 (=> (not res!135351) (not e!111991))))

(assert (=> b!162362 (= res!135351 (bvsle (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368))) (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(declare-fun b!162363 () Bool)

(declare-fun e!111990 () Bool)

(assert (=> b!162363 (= e!111991 e!111990)))

(declare-fun res!135353 () Bool)

(assert (=> b!162363 (=> res!135353 e!111990)))

(assert (=> b!162363 (= res!135353 (= (size!3602 (buf!4060 (_1!7820 lt!255368))) #b00000000000000000000000000000000))))

(declare-fun b!162364 () Bool)

(assert (=> b!162364 (= e!111990 (arrayBitRangesEq!0 (buf!4060 (_1!7820 lt!255368)) (buf!4060 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (= (and d!55667 res!135352) b!162362))

(assert (= (and b!162362 res!135351) b!162363))

(assert (= (and b!162363 (not res!135353)) b!162364))

(declare-fun m!257717 () Bool)

(assert (=> b!162362 m!257717))

(assert (=> b!162362 m!257243))

(assert (=> b!162364 m!257717))

(assert (=> b!162364 m!257717))

(declare-fun m!257719 () Bool)

(assert (=> b!162364 m!257719))

(assert (=> b!162148 d!55667))

(declare-fun d!55669 () Bool)

(declare-fun res!135354 () Bool)

(declare-fun e!111992 () Bool)

(assert (=> d!55669 (=> res!135354 e!111992)))

(assert (=> d!55669 (= res!135354 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55669 (= (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) e!111992)))

(declare-fun b!162365 () Bool)

(declare-fun e!111993 () Bool)

(assert (=> b!162365 (= e!111992 e!111993)))

(declare-fun res!135355 () Bool)

(assert (=> b!162365 (=> (not res!135355) (not e!111993))))

(assert (=> b!162365 (= res!135355 (= (select (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162366 () Bool)

(assert (=> b!162366 (= e!111993 (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55669 (not res!135354)) b!162365))

(assert (= (and b!162365 res!135355) b!162366))

(declare-fun m!257721 () Bool)

(assert (=> b!162365 m!257721))

(declare-fun m!257723 () Bool)

(assert (=> b!162365 m!257723))

(declare-fun m!257725 () Bool)

(assert (=> b!162366 m!257725))

(assert (=> b!162158 d!55669))

(declare-fun b!162368 () Bool)

(declare-fun res!135360 () Bool)

(declare-fun lt!255630 () (_ BitVec 32))

(assert (=> b!162368 (= res!135360 (= lt!255630 #b00000000000000000000000000000000))))

(declare-fun e!111994 () Bool)

(assert (=> b!162368 (=> res!135360 e!111994)))

(declare-fun e!111995 () Bool)

(assert (=> b!162368 (= e!111995 e!111994)))

(declare-fun bm!2746 () Bool)

(declare-fun lt!255629 () tuple4!236)

(declare-fun call!2749 () Bool)

(declare-fun c!8497 () Bool)

(declare-fun lt!255628 () (_ BitVec 32))

(assert (=> bm!2746 (= call!2749 (byteRangesEq!0 (ite c!8497 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255629))) (ite c!8497 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255629))) (ite c!8497 lt!255628 #b00000000000000000000000000000000) lt!255630))))

(declare-fun b!162369 () Bool)

(declare-fun e!111999 () Bool)

(assert (=> b!162369 (= e!111999 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (_1!7831 lt!255629) (_2!7831 lt!255629)))))

(declare-fun b!162370 () Bool)

(declare-fun e!111996 () Bool)

(declare-fun e!111998 () Bool)

(assert (=> b!162370 (= e!111996 e!111998)))

(assert (=> b!162370 (= c!8497 (= (_3!586 lt!255629) (_4!118 lt!255629)))))

(declare-fun b!162371 () Bool)

(assert (=> b!162371 (= e!111998 e!111995)))

(declare-fun res!135358 () Bool)

(assert (=> b!162371 (= res!135358 (byteRangesEq!0 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629)) lt!255628 #b00000000000000000000000000001000))))

(assert (=> b!162371 (=> (not res!135358) (not e!111995))))

(declare-fun b!162372 () Bool)

(assert (=> b!162372 (= e!111994 call!2749)))

(declare-fun b!162373 () Bool)

(assert (=> b!162373 (= e!111998 call!2749)))

(declare-fun d!55671 () Bool)

(declare-fun res!135356 () Bool)

(declare-fun e!111997 () Bool)

(assert (=> d!55671 (=> res!135356 e!111997)))

(assert (=> d!55671 (= res!135356 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (=> d!55671 (= (arrayBitRangesEq!0 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))) e!111997)))

(declare-fun b!162367 () Bool)

(assert (=> b!162367 (= e!111997 e!111996)))

(declare-fun res!135357 () Bool)

(assert (=> b!162367 (=> (not res!135357) (not e!111996))))

(assert (=> b!162367 (= res!135357 e!111999)))

(declare-fun res!135359 () Bool)

(assert (=> b!162367 (=> res!135359 e!111999)))

(assert (=> b!162367 (= res!135359 (bvsge (_1!7831 lt!255629) (_2!7831 lt!255629)))))

(assert (=> b!162367 (= lt!255630 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162367 (= lt!255628 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162367 (= lt!255629 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (= (and d!55671 (not res!135356)) b!162367))

(assert (= (and b!162367 (not res!135359)) b!162369))

(assert (= (and b!162367 res!135357) b!162370))

(assert (= (and b!162370 c!8497) b!162373))

(assert (= (and b!162370 (not c!8497)) b!162371))

(assert (= (and b!162371 res!135358) b!162368))

(assert (= (and b!162368 (not res!135360)) b!162372))

(assert (= (or b!162373 b!162372) bm!2746))

(declare-fun m!257727 () Bool)

(assert (=> bm!2746 m!257727))

(declare-fun m!257729 () Bool)

(assert (=> bm!2746 m!257729))

(declare-fun m!257731 () Bool)

(assert (=> bm!2746 m!257731))

(declare-fun m!257733 () Bool)

(assert (=> bm!2746 m!257733))

(declare-fun m!257735 () Bool)

(assert (=> bm!2746 m!257735))

(declare-fun m!257737 () Bool)

(assert (=> b!162369 m!257737))

(assert (=> b!162371 m!257729))

(assert (=> b!162371 m!257735))

(assert (=> b!162371 m!257729))

(assert (=> b!162371 m!257735))

(declare-fun m!257739 () Bool)

(assert (=> b!162371 m!257739))

(assert (=> b!162367 m!257243))

(declare-fun m!257741 () Bool)

(assert (=> b!162367 m!257741))

(assert (=> b!162114 d!55671))

(assert (=> b!162114 d!55485))

(declare-fun d!55673 () Bool)

(declare-fun e!112002 () Bool)

(assert (=> d!55673 e!112002))

(declare-fun res!135363 () Bool)

(assert (=> d!55673 (=> (not res!135363) (not e!112002))))

(declare-fun lt!255636 () (_ BitVec 64))

(declare-fun lt!255635 () BitStream!6372)

(assert (=> d!55673 (= res!135363 (= (bvadd lt!255636 (bvsub lt!255351 lt!255366)) (bitIndex!0 (size!3602 (buf!4060 lt!255635)) (currentByte!7560 lt!255635) (currentBit!7555 lt!255635))))))

(assert (=> d!55673 (or (not (= (bvand lt!255636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255351 lt!255366) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255636 (bvsub lt!255351 lt!255366)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55673 (= lt!255636 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))))))

(declare-datatypes ((tuple2!14490 0))(
  ( (tuple2!14491 (_1!7832 Unit!11186) (_2!7832 BitStream!6372)) )
))
(declare-fun moveBitIndex!0 (BitStream!6372 (_ BitVec 64)) tuple2!14490)

(assert (=> d!55673 (= lt!255635 (_2!7832 (moveBitIndex!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6372 (_ BitVec 64)) Bool)

(assert (=> d!55673 (moveBitIndexPrecond!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366))))

(assert (=> d!55673 (= (withMovedBitIndex!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366)) lt!255635)))

(declare-fun b!162376 () Bool)

(assert (=> b!162376 (= e!112002 (= (size!3602 (buf!4060 (_2!7820 lt!255368))) (size!3602 (buf!4060 lt!255635))))))

(assert (= (and d!55673 res!135363) b!162376))

(declare-fun m!257743 () Bool)

(assert (=> d!55673 m!257743))

(declare-fun m!257745 () Bool)

(assert (=> d!55673 m!257745))

(declare-fun m!257747 () Bool)

(assert (=> d!55673 m!257747))

(declare-fun m!257749 () Bool)

(assert (=> d!55673 m!257749))

(assert (=> b!162152 d!55673))

(assert (=> b!162152 d!55483))

(assert (=> b!162152 d!55485))

(declare-fun d!55675 () Bool)

(assert (=> d!55675 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226)))))

(assert (=> d!55675 true))

(declare-fun _$8!139 () Unit!11186)

(assert (=> d!55675 (= (choose!176 (buf!4060 thiss!1602) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) _$8!139)))

(declare-fun bs!13826 () Bool)

(assert (= bs!13826 d!55675))

(assert (=> bs!13826 m!257229))

(assert (=> bs!13826 m!257399))

(assert (=> d!55507 d!55675))

(declare-fun d!55677 () Bool)

(declare-fun res!135365 () Bool)

(declare-fun e!112004 () Bool)

(assert (=> d!55677 (=> (not res!135365) (not e!112004))))

(assert (=> d!55677 (= res!135365 (= (size!3602 (buf!4060 (_2!7820 lt!255368))) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (=> d!55677 (= (isPrefixOf!0 (_2!7820 lt!255368) (_3!583 lt!255226)) e!112004)))

(declare-fun b!162377 () Bool)

(declare-fun res!135364 () Bool)

(assert (=> b!162377 (=> (not res!135364) (not e!112004))))

(assert (=> b!162377 (= res!135364 (bvsle (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))) (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun b!162378 () Bool)

(declare-fun e!112003 () Bool)

(assert (=> b!162378 (= e!112004 e!112003)))

(declare-fun res!135366 () Bool)

(assert (=> b!162378 (=> res!135366 e!112003)))

(assert (=> b!162378 (= res!135366 (= (size!3602 (buf!4060 (_2!7820 lt!255368))) #b00000000000000000000000000000000))))

(declare-fun b!162379 () Bool)

(assert (=> b!162379 (= e!112003 (arrayBitRangesEq!0 (buf!4060 (_2!7820 lt!255368)) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368)))))))

(assert (= (and d!55677 res!135365) b!162377))

(assert (= (and b!162377 res!135364) b!162378))

(assert (= (and b!162378 (not res!135366)) b!162379))

(assert (=> b!162377 m!257745))

(assert (=> b!162377 m!257241))

(assert (=> b!162379 m!257745))

(assert (=> b!162379 m!257745))

(declare-fun m!257751 () Bool)

(assert (=> b!162379 m!257751))

(assert (=> b!162151 d!55677))

(declare-fun d!55679 () Bool)

(declare-fun lt!255657 () (_ BitVec 8))

(declare-fun lt!255653 () (_ BitVec 8))

(assert (=> d!55679 (= lt!255657 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_1!7820 lt!255212))) (currentByte!7560 (_1!7820 lt!255212)))) ((_ sign_extend 24) lt!255653))))))

(assert (=> d!55679 (= lt!255653 ((_ extract 7 0) (currentBit!7555 (_1!7820 lt!255212))))))

(declare-fun e!112010 () Bool)

(assert (=> d!55679 e!112010))

(declare-fun res!135372 () Bool)

(assert (=> d!55679 (=> (not res!135372) (not e!112010))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!55679 (= res!135372 (validate_offset_bits!1 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))) ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255212))) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255212))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14492 0))(
  ( (tuple2!14493 (_1!7833 Unit!11186) (_2!7833 (_ BitVec 8))) )
))
(declare-fun Unit!11205 () Unit!11186)

(declare-fun Unit!11206 () Unit!11186)

(assert (=> d!55679 (= (readByte!0 (_1!7820 lt!255212)) (tuple2!14481 (_2!7833 (ite (bvsgt ((_ sign_extend 24) lt!255653) #b00000000000000000000000000000000) (tuple2!14493 Unit!11205 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255657) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_1!7820 lt!255212))) (bvadd (currentByte!7560 (_1!7820 lt!255212)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255653)))))))) (tuple2!14493 Unit!11206 lt!255657))) (BitStream!6373 (buf!4060 (_1!7820 lt!255212)) (bvadd (currentByte!7560 (_1!7820 lt!255212)) #b00000000000000000000000000000001) (currentBit!7555 (_1!7820 lt!255212)))))))

(declare-fun b!162384 () Bool)

(declare-fun e!112009 () Bool)

(assert (=> b!162384 (= e!112010 e!112009)))

(declare-fun res!135373 () Bool)

(assert (=> b!162384 (=> (not res!135373) (not e!112009))))

(declare-fun lt!255656 () tuple2!14480)

(assert (=> b!162384 (= res!135373 (= (buf!4060 (_2!7825 lt!255656)) (buf!4060 (_1!7820 lt!255212))))))

(declare-fun lt!255652 () (_ BitVec 8))

(declare-fun lt!255655 () (_ BitVec 8))

(declare-fun Unit!11207 () Unit!11186)

(declare-fun Unit!11208 () Unit!11186)

(assert (=> b!162384 (= lt!255656 (tuple2!14481 (_2!7833 (ite (bvsgt ((_ sign_extend 24) lt!255655) #b00000000000000000000000000000000) (tuple2!14493 Unit!11207 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255652) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_1!7820 lt!255212))) (bvadd (currentByte!7560 (_1!7820 lt!255212)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255655)))))))) (tuple2!14493 Unit!11208 lt!255652))) (BitStream!6373 (buf!4060 (_1!7820 lt!255212)) (bvadd (currentByte!7560 (_1!7820 lt!255212)) #b00000000000000000000000000000001) (currentBit!7555 (_1!7820 lt!255212)))))))

(assert (=> b!162384 (= lt!255652 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_1!7820 lt!255212))) (currentByte!7560 (_1!7820 lt!255212)))) ((_ sign_extend 24) lt!255655))))))

(assert (=> b!162384 (= lt!255655 ((_ extract 7 0) (currentBit!7555 (_1!7820 lt!255212))))))

(declare-fun lt!255651 () (_ BitVec 64))

(declare-fun lt!255654 () (_ BitVec 64))

(declare-fun b!162385 () Bool)

(assert (=> b!162385 (= e!112009 (= (bitIndex!0 (size!3602 (buf!4060 (_2!7825 lt!255656))) (currentByte!7560 (_2!7825 lt!255656)) (currentBit!7555 (_2!7825 lt!255656))) (bvadd lt!255651 lt!255654)))))

(assert (=> b!162385 (or (not (= (bvand lt!255651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255654 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255651 lt!255654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162385 (= lt!255654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!162385 (= lt!255651 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255212))) (currentByte!7560 (_1!7820 lt!255212)) (currentBit!7555 (_1!7820 lt!255212))))))

(assert (= (and d!55679 res!135372) b!162384))

(assert (= (and b!162384 res!135373) b!162385))

(declare-fun m!257753 () Bool)

(assert (=> d!55679 m!257753))

(declare-fun m!257755 () Bool)

(assert (=> d!55679 m!257755))

(declare-fun m!257757 () Bool)

(assert (=> d!55679 m!257757))

(assert (=> b!162384 m!257757))

(assert (=> b!162384 m!257753))

(declare-fun m!257759 () Bool)

(assert (=> b!162385 m!257759))

(declare-fun m!257761 () Bool)

(assert (=> b!162385 m!257761))

(assert (=> d!55501 d!55679))

(assert (=> b!162112 d!55485))

(assert (=> b!162112 d!55483))

(declare-fun d!55681 () Bool)

(declare-fun res!135374 () Bool)

(declare-fun e!112011 () Bool)

(assert (=> d!55681 (=> res!135374 e!112011)))

(assert (=> d!55681 (= res!135374 (= #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55681 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))) e!112011)))

(declare-fun b!162386 () Bool)

(declare-fun e!112012 () Bool)

(assert (=> b!162386 (= e!112011 e!112012)))

(declare-fun res!135375 () Bool)

(assert (=> b!162386 (=> (not res!135375) (not e!112012))))

(assert (=> b!162386 (= res!135375 (= (select (arr!4523 (buf!4060 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4523 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162387 () Bool)

(assert (=> b!162387 (= e!112012 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55681 (not res!135374)) b!162386))

(assert (= (and b!162386 res!135375) b!162387))

(assert (=> b!162386 m!257343))

(declare-fun m!257763 () Bool)

(assert (=> b!162386 m!257763))

(declare-fun m!257765 () Bool)

(assert (=> b!162387 m!257765))

(assert (=> b!162155 d!55681))

(declare-fun d!55683 () Bool)

(declare-fun res!135376 () Bool)

(declare-fun e!112013 () Bool)

(assert (=> d!55683 (=> res!135376 e!112013)))

(assert (=> d!55683 (= res!135376 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55683 (= (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112013)))

(declare-fun b!162388 () Bool)

(declare-fun e!112014 () Bool)

(assert (=> b!162388 (= e!112013 e!112014)))

(declare-fun res!135377 () Bool)

(assert (=> b!162388 (=> (not res!135377) (not e!112014))))

(assert (=> b!162388 (= res!135377 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162389 () Bool)

(assert (=> b!162389 (= e!112014 (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55683 (not res!135376)) b!162388))

(assert (= (and b!162388 res!135377) b!162389))

(assert (=> b!162388 m!257711))

(assert (=> b!162388 m!257721))

(declare-fun m!257767 () Bool)

(assert (=> b!162389 m!257767))

(assert (=> b!162132 d!55683))

(declare-fun d!55685 () Bool)

(assert (=> d!55685 (= (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) ((_ sign_extend 32) (currentByte!7560 thiss!1602)) ((_ sign_extend 32) (currentBit!7555 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3602 (buf!4060 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 thiss!1602)))))))

(assert (=> d!55487 d!55685))

(assert (=> d!55485 d!55685))

(declare-fun d!55687 () Bool)

(assert (=> d!55687 (= (invariant!0 (currentBit!7555 thiss!1602) (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602))) (and (bvsge (currentBit!7555 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7555 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7560 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602))) (and (= (currentBit!7555 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7560 thiss!1602) (size!3602 (buf!4060 thiss!1602)))))))))

(assert (=> d!55485 d!55687))

(declare-fun d!55691 () Bool)

(assert (=> d!55691 (= (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_3!583 lt!255226)))) ((_ sign_extend 32) (currentByte!7560 (_3!583 lt!255226))) ((_ sign_extend 32) (currentBit!7555 (_3!583 lt!255226)))) (bvsub (bvmul ((_ sign_extend 32) (size!3602 (buf!4060 (_3!583 lt!255226)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_3!583 lt!255226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_3!583 lt!255226))))))))

(assert (=> d!55483 d!55691))

(declare-fun d!55695 () Bool)

(assert (=> d!55695 (= (invariant!0 (currentBit!7555 (_3!583 lt!255226)) (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 (_3!583 lt!255226)))) (and (bvsge (currentBit!7555 (_3!583 lt!255226)) #b00000000000000000000000000000000) (bvslt (currentBit!7555 (_3!583 lt!255226)) #b00000000000000000000000000001000) (bvsge (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 (_3!583 lt!255226)))) (and (= (currentBit!7555 (_3!583 lt!255226)) #b00000000000000000000000000000000) (= (currentByte!7560 (_3!583 lt!255226)) (size!3602 (buf!4060 (_3!583 lt!255226))))))))))

(assert (=> d!55483 d!55695))

(declare-fun d!55697 () Bool)

(assert (=> d!55697 (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226)))))

(assert (=> d!55697 true))

(declare-fun _$8!140 () Unit!11186)

(assert (=> d!55697 (= (choose!176 lt!255218 (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) _$8!140)))

(declare-fun bs!13827 () Bool)

(assert (= bs!13827 d!55697))

(assert (=> bs!13827 m!257405))

(assert (=> bs!13827 m!257407))

(assert (=> d!55511 d!55697))

(declare-fun d!55701 () Bool)

(declare-fun res!135387 () Bool)

(declare-fun e!112023 () Bool)

(assert (=> d!55701 (=> res!135387 e!112023)))

(assert (=> d!55701 (= res!135387 (= #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55701 (= (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) #b00000000000000000000000000000000 (currentByte!7560 (_3!583 lt!255226))) e!112023)))

(declare-fun b!162401 () Bool)

(declare-fun e!112024 () Bool)

(assert (=> b!162401 (= e!112023 e!112024)))

(declare-fun res!135388 () Bool)

(assert (=> b!162401 (=> (not res!135388) (not e!112024))))

(assert (=> b!162401 (= res!135388 (= (select (arr!4523 lt!255218) #b00000000000000000000000000000000) (select (arr!4523 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218))) #b00000000000000000000000000000000)))))

(declare-fun b!162402 () Bool)

(assert (=> b!162402 (= e!112024 (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55701 (not res!135387)) b!162401))

(assert (= (and b!162401 res!135388) b!162402))

(assert (=> b!162401 m!257353))

(declare-fun m!257783 () Bool)

(assert (=> b!162401 m!257783))

(declare-fun m!257787 () Bool)

(assert (=> b!162402 m!257787))

(assert (=> b!162156 d!55701))

(declare-fun d!55703 () Bool)

(declare-fun res!135389 () Bool)

(declare-fun e!112025 () Bool)

(assert (=> d!55703 (=> res!135389 e!112025)))

(assert (=> d!55703 (= res!135389 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (=> d!55703 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))) e!112025)))

(declare-fun b!162403 () Bool)

(declare-fun e!112026 () Bool)

(assert (=> b!162403 (= e!112025 e!112026)))

(declare-fun res!135390 () Bool)

(assert (=> b!162403 (=> (not res!135390) (not e!112026))))

(assert (=> b!162403 (= res!135390 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162404 () Bool)

(assert (=> b!162404 (= e!112026 (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (= (and d!55703 (not res!135389)) b!162403))

(assert (= (and b!162403 res!135390) b!162404))

(assert (=> b!162403 m!257711))

(declare-fun m!257791 () Bool)

(assert (=> b!162403 m!257791))

(declare-fun m!257793 () Bool)

(assert (=> b!162404 m!257793))

(assert (=> b!162130 d!55703))

(assert (=> d!55503 d!55481))

(declare-fun d!55707 () Bool)

(assert (=> d!55707 (isPrefixOf!0 thiss!1602 thiss!1602)))

(declare-fun lt!255675 () Unit!11186)

(declare-fun choose!11 (BitStream!6372) Unit!11186)

(assert (=> d!55707 (= lt!255675 (choose!11 thiss!1602))))

(assert (=> d!55707 (= (lemmaIsPrefixRefl!0 thiss!1602) lt!255675)))

(declare-fun bs!13830 () Bool)

(assert (= bs!13830 d!55707))

(assert (=> bs!13830 m!257383))

(declare-fun m!257797 () Bool)

(assert (=> bs!13830 m!257797))

(assert (=> d!55503 d!55707))

(declare-fun d!55713 () Bool)

(declare-fun res!135395 () Bool)

(declare-fun e!112030 () Bool)

(assert (=> d!55713 (=> (not res!135395) (not e!112030))))

(assert (=> d!55713 (= res!135395 (= (size!3602 (buf!4060 lt!255362)) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (=> d!55713 (= (isPrefixOf!0 lt!255362 (_3!583 lt!255226)) e!112030)))

(declare-fun b!162408 () Bool)

(declare-fun res!135394 () Bool)

(assert (=> b!162408 (=> (not res!135394) (not e!112030))))

(assert (=> b!162408 (= res!135394 (bvsle (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun b!162409 () Bool)

(declare-fun e!112029 () Bool)

(assert (=> b!162409 (= e!112030 e!112029)))

(declare-fun res!135396 () Bool)

(assert (=> b!162409 (=> res!135396 e!112029)))

(assert (=> b!162409 (= res!135396 (= (size!3602 (buf!4060 lt!255362)) #b00000000000000000000000000000000))))

(declare-fun b!162410 () Bool)

(assert (=> b!162410 (= e!112029 (arrayBitRangesEq!0 (buf!4060 lt!255362) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (= (and d!55713 res!135395) b!162408))

(assert (= (and b!162408 res!135394) b!162409))

(assert (= (and b!162409 (not res!135396)) b!162410))

(declare-fun m!257803 () Bool)

(assert (=> b!162408 m!257803))

(assert (=> b!162408 m!257241))

(assert (=> b!162410 m!257803))

(assert (=> b!162410 m!257803))

(declare-fun m!257805 () Bool)

(assert (=> b!162410 m!257805))

(assert (=> d!55503 d!55713))

(declare-fun d!55717 () Bool)

(assert (=> d!55717 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(declare-fun lt!255681 () Unit!11186)

(declare-fun choose!30 (BitStream!6372 BitStream!6372 BitStream!6372) Unit!11186)

(assert (=> d!55717 (= lt!255681 (choose!30 lt!255362 (_3!583 lt!255226) (_3!583 lt!255226)))))

(assert (=> d!55717 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(assert (=> d!55717 (= (lemmaIsPrefixTransitive!0 lt!255362 (_3!583 lt!255226) (_3!583 lt!255226)) lt!255681)))

(declare-fun bs!13833 () Bool)

(assert (= bs!13833 d!55717))

(assert (=> bs!13833 m!257379))

(declare-fun m!257831 () Bool)

(assert (=> bs!13833 m!257831))

(assert (=> bs!13833 m!257379))

(assert (=> d!55503 d!55717))

(declare-fun d!55725 () Bool)

(assert (=> d!55725 (isPrefixOf!0 (_3!583 lt!255226) (_3!583 lt!255226))))

(declare-fun lt!255682 () Unit!11186)

(assert (=> d!55725 (= lt!255682 (choose!11 (_3!583 lt!255226)))))

(assert (=> d!55725 (= (lemmaIsPrefixRefl!0 (_3!583 lt!255226)) lt!255682)))

(declare-fun bs!13834 () Bool)

(assert (= bs!13834 d!55725))

(assert (=> bs!13834 m!257381))

(declare-fun m!257833 () Bool)

(assert (=> bs!13834 m!257833))

(assert (=> d!55503 d!55725))

(declare-fun d!55727 () Bool)

(declare-fun res!135405 () Bool)

(declare-fun e!112040 () Bool)

(assert (=> d!55727 (=> (not res!135405) (not e!112040))))

(assert (=> d!55727 (= res!135405 (= (size!3602 (buf!4060 (_1!7820 lt!255368))) (size!3602 (buf!4060 (_2!7820 lt!255368)))))))

(assert (=> d!55727 (= (isPrefixOf!0 (_1!7820 lt!255368) (_2!7820 lt!255368)) e!112040)))

(declare-fun b!162420 () Bool)

(declare-fun res!135404 () Bool)

(assert (=> b!162420 (=> (not res!135404) (not e!112040))))

(assert (=> b!162420 (= res!135404 (bvsle (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368))) (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368)))))))

(declare-fun b!162421 () Bool)

(declare-fun e!112039 () Bool)

(assert (=> b!162421 (= e!112040 e!112039)))

(declare-fun res!135406 () Bool)

(assert (=> b!162421 (=> res!135406 e!112039)))

(assert (=> b!162421 (= res!135406 (= (size!3602 (buf!4060 (_1!7820 lt!255368))) #b00000000000000000000000000000000))))

(declare-fun b!162422 () Bool)

(assert (=> b!162422 (= e!112039 (arrayBitRangesEq!0 (buf!4060 (_1!7820 lt!255368)) (buf!4060 (_2!7820 lt!255368)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (= (and d!55727 res!135405) b!162420))

(assert (= (and b!162420 res!135404) b!162421))

(assert (= (and b!162421 (not res!135406)) b!162422))

(assert (=> b!162420 m!257717))

(assert (=> b!162420 m!257745))

(assert (=> b!162422 m!257717))

(assert (=> b!162422 m!257717))

(declare-fun m!257835 () Bool)

(assert (=> b!162422 m!257835))

(assert (=> d!55503 d!55727))

(declare-fun d!55729 () Bool)

(declare-fun res!135408 () Bool)

(declare-fun e!112042 () Bool)

(assert (=> d!55729 (=> (not res!135408) (not e!112042))))

(assert (=> d!55729 (= res!135408 (= (size!3602 (buf!4060 (_3!583 lt!255226))) (size!3602 (buf!4060 (_3!583 lt!255226)))))))

(assert (=> d!55729 (= (isPrefixOf!0 (_3!583 lt!255226) (_3!583 lt!255226)) e!112042)))

(declare-fun b!162423 () Bool)

(declare-fun res!135407 () Bool)

(assert (=> b!162423 (=> (not res!135407) (not e!112042))))

(assert (=> b!162423 (= res!135407 (bvsle (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226))) (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(declare-fun b!162424 () Bool)

(declare-fun e!112041 () Bool)

(assert (=> b!162424 (= e!112042 e!112041)))

(declare-fun res!135409 () Bool)

(assert (=> b!162424 (=> res!135409 e!112041)))

(assert (=> b!162424 (= res!135409 (= (size!3602 (buf!4060 (_3!583 lt!255226))) #b00000000000000000000000000000000))))

(declare-fun b!162425 () Bool)

(assert (=> b!162425 (= e!112041 (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(assert (= (and d!55729 res!135408) b!162423))

(assert (= (and b!162423 res!135407) b!162424))

(assert (= (and b!162424 (not res!135409)) b!162425))

(assert (=> b!162423 m!257241))

(assert (=> b!162423 m!257241))

(assert (=> b!162425 m!257241))

(assert (=> b!162425 m!257241))

(declare-fun m!257837 () Bool)

(assert (=> b!162425 m!257837))

(assert (=> d!55503 d!55729))

(declare-fun d!55733 () Bool)

(assert (=> d!55733 (isPrefixOf!0 lt!255362 lt!255362)))

(declare-fun lt!255683 () Unit!11186)

(assert (=> d!55733 (= lt!255683 (choose!11 lt!255362))))

(assert (=> d!55733 (= (lemmaIsPrefixRefl!0 lt!255362) lt!255683)))

(declare-fun bs!13836 () Bool)

(assert (= bs!13836 d!55733))

(assert (=> bs!13836 m!257391))

(declare-fun m!257839 () Bool)

(assert (=> bs!13836 m!257839))

(assert (=> d!55503 d!55733))

(declare-fun d!55735 () Bool)

(declare-fun res!135411 () Bool)

(declare-fun e!112044 () Bool)

(assert (=> d!55735 (=> (not res!135411) (not e!112044))))

(assert (=> d!55735 (= res!135411 (= (size!3602 (buf!4060 lt!255362)) (size!3602 (buf!4060 lt!255362))))))

(assert (=> d!55735 (= (isPrefixOf!0 lt!255362 lt!255362) e!112044)))

(declare-fun b!162426 () Bool)

(declare-fun res!135410 () Bool)

(assert (=> b!162426 (=> (not res!135410) (not e!112044))))

(assert (=> b!162426 (= res!135410 (bvsle (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(declare-fun b!162427 () Bool)

(declare-fun e!112043 () Bool)

(assert (=> b!162427 (= e!112044 e!112043)))

(declare-fun res!135412 () Bool)

(assert (=> b!162427 (=> res!135412 e!112043)))

(assert (=> b!162427 (= res!135412 (= (size!3602 (buf!4060 lt!255362)) #b00000000000000000000000000000000))))

(declare-fun b!162428 () Bool)

(assert (=> b!162428 (= e!112043 (arrayBitRangesEq!0 (buf!4060 lt!255362) (buf!4060 lt!255362) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (= (and d!55735 res!135411) b!162426))

(assert (= (and b!162426 res!135410) b!162427))

(assert (= (and b!162427 (not res!135412)) b!162428))

(assert (=> b!162426 m!257803))

(assert (=> b!162426 m!257803))

(assert (=> b!162428 m!257803))

(assert (=> b!162428 m!257803))

(declare-fun m!257841 () Bool)

(assert (=> b!162428 m!257841))

(assert (=> d!55503 d!55735))

(declare-fun d!55737 () Bool)

(assert (=> d!55737 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(declare-fun lt!255684 () Unit!11186)

(assert (=> d!55737 (= lt!255684 (choose!30 lt!255362 thiss!1602 (_3!583 lt!255226)))))

(assert (=> d!55737 (isPrefixOf!0 lt!255362 thiss!1602)))

(assert (=> d!55737 (= (lemmaIsPrefixTransitive!0 lt!255362 thiss!1602 (_3!583 lt!255226)) lt!255684)))

(declare-fun bs!13837 () Bool)

(assert (= bs!13837 d!55737))

(assert (=> bs!13837 m!257379))

(declare-fun m!257843 () Bool)

(assert (=> bs!13837 m!257843))

(declare-fun m!257845 () Bool)

(assert (=> bs!13837 m!257845))

(assert (=> d!55503 d!55737))

(declare-fun d!55739 () Bool)

(declare-fun res!135414 () Bool)

(declare-fun e!112046 () Bool)

(assert (=> d!55739 (=> (not res!135414) (not e!112046))))

(assert (=> d!55739 (= res!135414 (= (size!3602 (buf!4060 thiss!1602)) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55739 (= (isPrefixOf!0 thiss!1602 thiss!1602) e!112046)))

(declare-fun b!162429 () Bool)

(declare-fun res!135413 () Bool)

(assert (=> b!162429 (=> (not res!135413) (not e!112046))))

(assert (=> b!162429 (= res!135413 (bvsle (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(declare-fun b!162430 () Bool)

(declare-fun e!112045 () Bool)

(assert (=> b!162430 (= e!112046 e!112045)))

(declare-fun res!135415 () Bool)

(assert (=> b!162430 (=> res!135415 e!112045)))

(assert (=> b!162430 (= res!135415 (= (size!3602 (buf!4060 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162431 () Bool)

(assert (=> b!162431 (= e!112045 (arrayBitRangesEq!0 (buf!4060 thiss!1602) (buf!4060 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (= (and d!55739 res!135414) b!162429))

(assert (= (and b!162429 res!135413) b!162430))

(assert (= (and b!162430 (not res!135415)) b!162431))

(assert (=> b!162429 m!257243))

(assert (=> b!162429 m!257243))

(assert (=> b!162431 m!257243))

(assert (=> b!162431 m!257243))

(declare-fun m!257847 () Bool)

(assert (=> b!162431 m!257847))

(assert (=> d!55503 d!55739))

(assert (=> d!55509 d!55505))

(declare-fun d!55741 () Bool)

(assert (=> d!55741 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001))))

(assert (=> d!55741 true))

(declare-fun _$16!65 () Unit!11186)

(assert (=> d!55741 (= (choose!177 (buf!4060 thiss!1602) lt!255218 (buf!4060 (_3!583 lt!255226)) #b00000000000000000000000000000000 (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) _$16!65)))

(declare-fun bs!13838 () Bool)

(assert (= bs!13838 d!55741))

(assert (=> bs!13838 m!257219))

(assert (=> d!55509 d!55741))

(assert (=> d!55489 d!55687))

(declare-fun d!55743 () Bool)

(declare-fun res!135416 () Bool)

(declare-fun e!112047 () Bool)

(assert (=> d!55743 (=> res!135416 e!112047)))

(assert (=> d!55743 (= res!135416 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55743 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112047)))

(declare-fun b!162432 () Bool)

(declare-fun e!112048 () Bool)

(assert (=> b!162432 (= e!112047 e!112048)))

(declare-fun res!135417 () Bool)

(assert (=> b!162432 (=> (not res!135417) (not e!112048))))

(assert (=> b!162432 (= res!135417 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162433 () Bool)

(assert (=> b!162433 (= e!112048 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55743 (not res!135416)) b!162432))

(assert (= (and b!162432 res!135417) b!162433))

(assert (=> b!162432 m!257711))

(declare-fun m!257849 () Bool)

(assert (=> b!162432 m!257849))

(declare-fun m!257851 () Bool)

(assert (=> b!162433 m!257851))

(assert (=> b!162134 d!55743))

(declare-fun d!55745 () Bool)

(declare-fun res!135418 () Bool)

(declare-fun e!112049 () Bool)

(assert (=> d!55745 (=> res!135418 e!112049)))

(assert (=> d!55745 (= res!135418 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55745 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112049)))

(declare-fun b!162434 () Bool)

(declare-fun e!112050 () Bool)

(assert (=> b!162434 (= e!112049 e!112050)))

(declare-fun res!135419 () Bool)

(assert (=> b!162434 (=> (not res!135419) (not e!112050))))

(assert (=> b!162434 (= res!135419 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162435 () Bool)

(assert (=> b!162435 (= e!112050 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55745 (not res!135418)) b!162434))

(assert (= (and b!162434 res!135419) b!162435))

(assert (=> b!162434 m!257711))

(assert (=> b!162434 m!257713))

(declare-fun m!257853 () Bool)

(assert (=> b!162435 m!257853))

(assert (=> b!162154 d!55745))

(assert (=> b!162137 d!55497))

(check-sat (not b!162408) (not b!162385) (not b!162428) (not d!55659) (not b!162367) (not b!162433) (not d!55707) (not b!162361) (not b!162422) (not b!162426) (not b!162402) (not b!162353) (not b!162435) (not b!162389) (not b!162420) (not b!162371) (not d!55673) (not b!162364) (not b!162404) (not b!162429) (not b!162425) (not b!162387) (not d!55737) (not b!162423) (not d!55675) (not b!162366) (not b!162431) (not b!162410) (not b!162377) (not d!55733) (not b!162369) (not b!162362) (not bm!2745) (not b!162379) (not d!55661) (not d!55741) (not d!55725) (not b!162355) (not bm!2746) (not b!162357) (not d!55717) (not d!55697) (not d!55679))
(check-sat)
(get-model)

(assert (=> d!55697 d!55701))

(declare-fun d!55805 () Bool)

(assert (=> d!55805 (= (byteRangesEq!0 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626)) lt!255625 #b00000000000000000000000000001000) (or (= lt!255625 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255625)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255625)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13847 () Bool)

(assert (= bs!13847 d!55805))

(declare-fun m!257985 () Bool)

(assert (=> bs!13847 m!257985))

(declare-fun m!257987 () Bool)

(assert (=> bs!13847 m!257987))

(assert (=> b!162357 d!55805))

(declare-fun d!55807 () Bool)

(declare-fun res!135480 () Bool)

(declare-fun e!112112 () Bool)

(assert (=> d!55807 (=> res!135480 e!112112)))

(assert (=> d!55807 (= res!135480 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (=> d!55807 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))) e!112112)))

(declare-fun b!162507 () Bool)

(declare-fun e!112113 () Bool)

(assert (=> b!162507 (= e!112112 e!112113)))

(declare-fun res!135481 () Bool)

(assert (=> b!162507 (=> (not res!135481) (not e!112113))))

(assert (=> b!162507 (= res!135481 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162508 () Bool)

(assert (=> b!162508 (= e!112113 (arrayRangesEq!554 (buf!4060 thiss!1602) (ite c!8477 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8477 (currentByte!7560 (_3!583 lt!255226)) (currentByte!7560 thiss!1602))))))

(assert (= (and d!55807 (not res!135480)) b!162507))

(assert (= (and b!162507 res!135481) b!162508))

(declare-fun m!257989 () Bool)

(assert (=> b!162507 m!257989))

(declare-fun m!257991 () Bool)

(assert (=> b!162507 m!257991))

(declare-fun m!257993 () Bool)

(assert (=> b!162508 m!257993))

(assert (=> b!162404 d!55807))

(declare-fun d!55809 () Bool)

(declare-fun res!135482 () Bool)

(declare-fun e!112114 () Bool)

(assert (=> d!55809 (=> res!135482 e!112114)))

(assert (=> d!55809 (= res!135482 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55809 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) e!112114)))

(declare-fun b!162509 () Bool)

(declare-fun e!112115 () Bool)

(assert (=> b!162509 (= e!112114 e!112115)))

(declare-fun res!135483 () Bool)

(assert (=> b!162509 (=> (not res!135483) (not e!112115))))

(assert (=> b!162509 (= res!135483 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162510 () Bool)

(assert (=> b!162510 (= e!112115 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55809 (not res!135482)) b!162509))

(assert (= (and b!162509 res!135483) b!162510))

(assert (=> b!162509 m!257711))

(declare-fun m!257995 () Bool)

(assert (=> b!162509 m!257995))

(declare-fun m!257997 () Bool)

(assert (=> b!162510 m!257997))

(assert (=> b!162387 d!55809))

(assert (=> d!55675 d!55681))

(declare-fun d!55811 () Bool)

(declare-fun res!135484 () Bool)

(declare-fun e!112116 () Bool)

(assert (=> d!55811 (=> res!135484 e!112116)))

(assert (=> d!55811 (= res!135484 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)))))

(assert (=> d!55811 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)) e!112116)))

(declare-fun b!162511 () Bool)

(declare-fun e!112117 () Bool)

(assert (=> b!162511 (= e!112116 e!112117)))

(declare-fun res!135485 () Bool)

(assert (=> b!162511 (=> (not res!135485) (not e!112117))))

(assert (=> b!162511 (= res!135485 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162512 () Bool)

(assert (=> b!162512 (= e!112117 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 thiss!1602)))))

(assert (= (and d!55811 (not res!135484)) b!162511))

(assert (= (and b!162511 res!135485) b!162512))

(assert (=> b!162511 m!257989))

(declare-fun m!257999 () Bool)

(assert (=> b!162511 m!257999))

(declare-fun m!258001 () Bool)

(assert (=> b!162512 m!258001))

(assert (=> b!162361 d!55811))

(assert (=> b!162423 d!55483))

(declare-fun d!55813 () Bool)

(declare-fun res!135486 () Bool)

(declare-fun e!112118 () Bool)

(assert (=> d!55813 (=> res!135486 e!112118)))

(assert (=> d!55813 (= res!135486 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55813 (= (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) e!112118)))

(declare-fun b!162513 () Bool)

(declare-fun e!112119 () Bool)

(assert (=> b!162513 (= e!112118 e!112119)))

(declare-fun res!135487 () Bool)

(assert (=> b!162513 (=> (not res!135487) (not e!112119))))

(assert (=> b!162513 (= res!135487 (= (select (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162514 () Bool)

(assert (=> b!162514 (= e!112119 (arrayRangesEq!554 lt!255218 (array!8034 (store (arr!4523 lt!255218) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 lt!255218)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55813 (not res!135486)) b!162513))

(assert (= (and b!162513 res!135487) b!162514))

(assert (=> b!162513 m!257721))

(declare-fun m!258003 () Bool)

(assert (=> b!162513 m!258003))

(declare-fun m!258005 () Bool)

(assert (=> b!162514 m!258005))

(assert (=> b!162402 d!55813))

(declare-fun d!55815 () Bool)

(declare-fun e!112120 () Bool)

(assert (=> d!55815 e!112120))

(declare-fun res!135488 () Bool)

(assert (=> d!55815 (=> (not res!135488) (not e!112120))))

(declare-fun lt!255748 () (_ BitVec 64))

(declare-fun lt!255746 () (_ BitVec 64))

(declare-fun lt!255747 () (_ BitVec 64))

(assert (=> d!55815 (= res!135488 (= lt!255746 (bvsub lt!255748 lt!255747)))))

(assert (=> d!55815 (or (= (bvand lt!255748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255748 lt!255747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55815 (= lt!255747 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255362))) ((_ sign_extend 32) (currentByte!7560 lt!255362)) ((_ sign_extend 32) (currentBit!7555 lt!255362))))))

(declare-fun lt!255749 () (_ BitVec 64))

(declare-fun lt!255745 () (_ BitVec 64))

(assert (=> d!55815 (= lt!255748 (bvmul lt!255749 lt!255745))))

(assert (=> d!55815 (or (= lt!255749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255745 (bvsdiv (bvmul lt!255749 lt!255745) lt!255749)))))

(assert (=> d!55815 (= lt!255745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55815 (= lt!255749 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255362))))))

(assert (=> d!55815 (= lt!255746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 lt!255362)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 lt!255362))))))

(assert (=> d!55815 (invariant!0 (currentBit!7555 lt!255362) (currentByte!7560 lt!255362) (size!3602 (buf!4060 lt!255362)))))

(assert (=> d!55815 (= (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) lt!255746)))

(declare-fun b!162515 () Bool)

(declare-fun res!135489 () Bool)

(assert (=> b!162515 (=> (not res!135489) (not e!112120))))

(assert (=> b!162515 (= res!135489 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255746))))

(declare-fun b!162516 () Bool)

(declare-fun lt!255750 () (_ BitVec 64))

(assert (=> b!162516 (= e!112120 (bvsle lt!255746 (bvmul lt!255750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162516 (or (= lt!255750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255750)))))

(assert (=> b!162516 (= lt!255750 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255362))))))

(assert (= (and d!55815 res!135488) b!162515))

(assert (= (and b!162515 res!135489) b!162516))

(declare-fun m!258007 () Bool)

(assert (=> d!55815 m!258007))

(declare-fun m!258009 () Bool)

(assert (=> d!55815 m!258009))

(assert (=> b!162408 d!55815))

(assert (=> b!162408 d!55483))

(declare-fun d!55817 () Bool)

(declare-fun e!112121 () Bool)

(assert (=> d!55817 e!112121))

(declare-fun res!135490 () Bool)

(assert (=> d!55817 (=> (not res!135490) (not e!112121))))

(declare-fun lt!255753 () (_ BitVec 64))

(declare-fun lt!255752 () (_ BitVec 64))

(declare-fun lt!255754 () (_ BitVec 64))

(assert (=> d!55817 (= res!135490 (= lt!255752 (bvsub lt!255754 lt!255753)))))

(assert (=> d!55817 (or (= (bvand lt!255754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255754 lt!255753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55817 (= lt!255753 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7825 lt!255656)))) ((_ sign_extend 32) (currentByte!7560 (_2!7825 lt!255656))) ((_ sign_extend 32) (currentBit!7555 (_2!7825 lt!255656)))))))

(declare-fun lt!255755 () (_ BitVec 64))

(declare-fun lt!255751 () (_ BitVec 64))

(assert (=> d!55817 (= lt!255754 (bvmul lt!255755 lt!255751))))

(assert (=> d!55817 (or (= lt!255755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255751 (bvsdiv (bvmul lt!255755 lt!255751) lt!255755)))))

(assert (=> d!55817 (= lt!255751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55817 (= lt!255755 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7825 lt!255656)))))))

(assert (=> d!55817 (= lt!255752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_2!7825 lt!255656))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_2!7825 lt!255656)))))))

(assert (=> d!55817 (invariant!0 (currentBit!7555 (_2!7825 lt!255656)) (currentByte!7560 (_2!7825 lt!255656)) (size!3602 (buf!4060 (_2!7825 lt!255656))))))

(assert (=> d!55817 (= (bitIndex!0 (size!3602 (buf!4060 (_2!7825 lt!255656))) (currentByte!7560 (_2!7825 lt!255656)) (currentBit!7555 (_2!7825 lt!255656))) lt!255752)))

(declare-fun b!162517 () Bool)

(declare-fun res!135491 () Bool)

(assert (=> b!162517 (=> (not res!135491) (not e!112121))))

(assert (=> b!162517 (= res!135491 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255752))))

(declare-fun b!162518 () Bool)

(declare-fun lt!255756 () (_ BitVec 64))

(assert (=> b!162518 (= e!112121 (bvsle lt!255752 (bvmul lt!255756 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162518 (or (= lt!255756 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255756 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255756)))))

(assert (=> b!162518 (= lt!255756 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7825 lt!255656)))))))

(assert (= (and d!55817 res!135490) b!162517))

(assert (= (and b!162517 res!135491) b!162518))

(declare-fun m!258011 () Bool)

(assert (=> d!55817 m!258011))

(declare-fun m!258013 () Bool)

(assert (=> d!55817 m!258013))

(assert (=> b!162385 d!55817))

(declare-fun d!55819 () Bool)

(declare-fun e!112122 () Bool)

(assert (=> d!55819 e!112122))

(declare-fun res!135492 () Bool)

(assert (=> d!55819 (=> (not res!135492) (not e!112122))))

(declare-fun lt!255760 () (_ BitVec 64))

(declare-fun lt!255758 () (_ BitVec 64))

(declare-fun lt!255759 () (_ BitVec 64))

(assert (=> d!55819 (= res!135492 (= lt!255758 (bvsub lt!255760 lt!255759)))))

(assert (=> d!55819 (or (= (bvand lt!255760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255760 lt!255759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55819 (= lt!255759 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))) ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255212))) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255212)))))))

(declare-fun lt!255761 () (_ BitVec 64))

(declare-fun lt!255757 () (_ BitVec 64))

(assert (=> d!55819 (= lt!255760 (bvmul lt!255761 lt!255757))))

(assert (=> d!55819 (or (= lt!255761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255757 (bvsdiv (bvmul lt!255761 lt!255757) lt!255761)))))

(assert (=> d!55819 (= lt!255757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55819 (= lt!255761 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))))))

(assert (=> d!55819 (= lt!255758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255212)))))))

(assert (=> d!55819 (invariant!0 (currentBit!7555 (_1!7820 lt!255212)) (currentByte!7560 (_1!7820 lt!255212)) (size!3602 (buf!4060 (_1!7820 lt!255212))))))

(assert (=> d!55819 (= (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255212))) (currentByte!7560 (_1!7820 lt!255212)) (currentBit!7555 (_1!7820 lt!255212))) lt!255758)))

(declare-fun b!162519 () Bool)

(declare-fun res!135493 () Bool)

(assert (=> b!162519 (=> (not res!135493) (not e!112122))))

(assert (=> b!162519 (= res!135493 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255758))))

(declare-fun b!162520 () Bool)

(declare-fun lt!255762 () (_ BitVec 64))

(assert (=> b!162520 (= e!112122 (bvsle lt!255758 (bvmul lt!255762 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162520 (or (= lt!255762 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255762 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255762)))))

(assert (=> b!162520 (= lt!255762 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))))))

(assert (= (and d!55819 res!135492) b!162519))

(assert (= (and b!162519 res!135493) b!162520))

(declare-fun m!258015 () Bool)

(assert (=> d!55819 m!258015))

(declare-fun m!258017 () Bool)

(assert (=> d!55819 m!258017))

(assert (=> b!162385 d!55819))

(assert (=> b!162426 d!55815))

(assert (=> d!55659 d!55497))

(assert (=> b!162429 d!55485))

(declare-fun b!162522 () Bool)

(declare-fun res!135498 () Bool)

(declare-fun lt!255765 () (_ BitVec 32))

(assert (=> b!162522 (= res!135498 (= lt!255765 #b00000000000000000000000000000000))))

(declare-fun e!112123 () Bool)

(assert (=> b!162522 (=> res!135498 e!112123)))

(declare-fun e!112124 () Bool)

(assert (=> b!162522 (= e!112124 e!112123)))

(declare-fun lt!255764 () tuple4!236)

(declare-fun call!2757 () Bool)

(declare-fun c!8505 () Bool)

(declare-fun bm!2754 () Bool)

(declare-fun lt!255763 () (_ BitVec 32))

(assert (=> bm!2754 (= call!2757 (byteRangesEq!0 (ite c!8505 (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255764)) (select (arr!4523 (buf!4060 lt!255362)) (_4!118 lt!255764))) (ite c!8505 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255764)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255764))) (ite c!8505 lt!255763 #b00000000000000000000000000000000) lt!255765))))

(declare-fun e!112128 () Bool)

(declare-fun b!162523 () Bool)

(assert (=> b!162523 (= e!112128 (arrayRangesEq!554 (buf!4060 lt!255362) (buf!4060 (_3!583 lt!255226)) (_1!7831 lt!255764) (_2!7831 lt!255764)))))

(declare-fun b!162524 () Bool)

(declare-fun e!112125 () Bool)

(declare-fun e!112127 () Bool)

(assert (=> b!162524 (= e!112125 e!112127)))

(assert (=> b!162524 (= c!8505 (= (_3!586 lt!255764) (_4!118 lt!255764)))))

(declare-fun b!162525 () Bool)

(assert (=> b!162525 (= e!112127 e!112124)))

(declare-fun res!135496 () Bool)

(assert (=> b!162525 (= res!135496 (byteRangesEq!0 (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255764)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255764)) lt!255763 #b00000000000000000000000000001000))))

(assert (=> b!162525 (=> (not res!135496) (not e!112124))))

(declare-fun b!162526 () Bool)

(assert (=> b!162526 (= e!112123 call!2757)))

(declare-fun b!162527 () Bool)

(assert (=> b!162527 (= e!112127 call!2757)))

(declare-fun d!55821 () Bool)

(declare-fun res!135494 () Bool)

(declare-fun e!112126 () Bool)

(assert (=> d!55821 (=> res!135494 e!112126)))

(assert (=> d!55821 (= res!135494 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (=> d!55821 (= (arrayBitRangesEq!0 (buf!4060 lt!255362) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))) e!112126)))

(declare-fun b!162521 () Bool)

(assert (=> b!162521 (= e!112126 e!112125)))

(declare-fun res!135495 () Bool)

(assert (=> b!162521 (=> (not res!135495) (not e!112125))))

(assert (=> b!162521 (= res!135495 e!112128)))

(declare-fun res!135497 () Bool)

(assert (=> b!162521 (=> res!135497 e!112128)))

(assert (=> b!162521 (= res!135497 (bvsge (_1!7831 lt!255764) (_2!7831 lt!255764)))))

(assert (=> b!162521 (= lt!255765 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162521 (= lt!255763 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162521 (= lt!255764 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (= (and d!55821 (not res!135494)) b!162521))

(assert (= (and b!162521 (not res!135497)) b!162523))

(assert (= (and b!162521 res!135495) b!162524))

(assert (= (and b!162524 c!8505) b!162527))

(assert (= (and b!162524 (not c!8505)) b!162525))

(assert (= (and b!162525 res!135496) b!162522))

(assert (= (and b!162522 (not res!135498)) b!162526))

(assert (= (or b!162527 b!162526) bm!2754))

(declare-fun m!258019 () Bool)

(assert (=> bm!2754 m!258019))

(declare-fun m!258021 () Bool)

(assert (=> bm!2754 m!258021))

(declare-fun m!258023 () Bool)

(assert (=> bm!2754 m!258023))

(declare-fun m!258025 () Bool)

(assert (=> bm!2754 m!258025))

(declare-fun m!258027 () Bool)

(assert (=> bm!2754 m!258027))

(declare-fun m!258029 () Bool)

(assert (=> b!162523 m!258029))

(assert (=> b!162525 m!258021))

(assert (=> b!162525 m!258027))

(assert (=> b!162525 m!258021))

(assert (=> b!162525 m!258027))

(declare-fun m!258031 () Bool)

(assert (=> b!162525 m!258031))

(assert (=> b!162521 m!257803))

(declare-fun m!258033 () Bool)

(assert (=> b!162521 m!258033))

(assert (=> b!162410 d!55821))

(assert (=> b!162410 d!55815))

(declare-fun b!162529 () Bool)

(declare-fun res!135503 () Bool)

(declare-fun lt!255768 () (_ BitVec 32))

(assert (=> b!162529 (= res!135503 (= lt!255768 #b00000000000000000000000000000000))))

(declare-fun e!112129 () Bool)

(assert (=> b!162529 (=> res!135503 e!112129)))

(declare-fun e!112130 () Bool)

(assert (=> b!162529 (= e!112130 e!112129)))

(declare-fun c!8506 () Bool)

(declare-fun lt!255767 () tuple4!236)

(declare-fun lt!255766 () (_ BitVec 32))

(declare-fun call!2758 () Bool)

(declare-fun bm!2755 () Bool)

(assert (=> bm!2755 (= call!2758 (byteRangesEq!0 (ite c!8506 (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255767)) (select (arr!4523 (buf!4060 lt!255362)) (_4!118 lt!255767))) (ite c!8506 (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255767)) (select (arr!4523 (buf!4060 lt!255362)) (_4!118 lt!255767))) (ite c!8506 lt!255766 #b00000000000000000000000000000000) lt!255768))))

(declare-fun b!162530 () Bool)

(declare-fun e!112134 () Bool)

(assert (=> b!162530 (= e!112134 (arrayRangesEq!554 (buf!4060 lt!255362) (buf!4060 lt!255362) (_1!7831 lt!255767) (_2!7831 lt!255767)))))

(declare-fun b!162531 () Bool)

(declare-fun e!112131 () Bool)

(declare-fun e!112133 () Bool)

(assert (=> b!162531 (= e!112131 e!112133)))

(assert (=> b!162531 (= c!8506 (= (_3!586 lt!255767) (_4!118 lt!255767)))))

(declare-fun b!162532 () Bool)

(assert (=> b!162532 (= e!112133 e!112130)))

(declare-fun res!135501 () Bool)

(assert (=> b!162532 (= res!135501 (byteRangesEq!0 (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255767)) (select (arr!4523 (buf!4060 lt!255362)) (_3!586 lt!255767)) lt!255766 #b00000000000000000000000000001000))))

(assert (=> b!162532 (=> (not res!135501) (not e!112130))))

(declare-fun b!162533 () Bool)

(assert (=> b!162533 (= e!112129 call!2758)))

(declare-fun b!162534 () Bool)

(assert (=> b!162534 (= e!112133 call!2758)))

(declare-fun d!55823 () Bool)

(declare-fun res!135499 () Bool)

(declare-fun e!112132 () Bool)

(assert (=> d!55823 (=> res!135499 e!112132)))

(assert (=> d!55823 (= res!135499 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (=> d!55823 (= (arrayBitRangesEq!0 (buf!4060 lt!255362) (buf!4060 lt!255362) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))) e!112132)))

(declare-fun b!162528 () Bool)

(assert (=> b!162528 (= e!112132 e!112131)))

(declare-fun res!135500 () Bool)

(assert (=> b!162528 (=> (not res!135500) (not e!112131))))

(assert (=> b!162528 (= res!135500 e!112134)))

(declare-fun res!135502 () Bool)

(assert (=> b!162528 (=> res!135502 e!112134)))

(assert (=> b!162528 (= res!135502 (bvsge (_1!7831 lt!255767) (_2!7831 lt!255767)))))

(assert (=> b!162528 (= lt!255768 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162528 (= lt!255766 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162528 (= lt!255767 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (= (and d!55823 (not res!135499)) b!162528))

(assert (= (and b!162528 (not res!135502)) b!162530))

(assert (= (and b!162528 res!135500) b!162531))

(assert (= (and b!162531 c!8506) b!162534))

(assert (= (and b!162531 (not c!8506)) b!162532))

(assert (= (and b!162532 res!135501) b!162529))

(assert (= (and b!162529 (not res!135503)) b!162533))

(assert (= (or b!162534 b!162533) bm!2755))

(declare-fun m!258035 () Bool)

(assert (=> bm!2755 m!258035))

(declare-fun m!258037 () Bool)

(assert (=> bm!2755 m!258037))

(declare-fun m!258039 () Bool)

(assert (=> bm!2755 m!258039))

(assert (=> bm!2755 m!258039))

(assert (=> bm!2755 m!258037))

(declare-fun m!258041 () Bool)

(assert (=> b!162530 m!258041))

(assert (=> b!162532 m!258037))

(assert (=> b!162532 m!258037))

(assert (=> b!162532 m!258037))

(assert (=> b!162532 m!258037))

(declare-fun m!258043 () Bool)

(assert (=> b!162532 m!258043))

(assert (=> b!162528 m!257803))

(assert (=> b!162528 m!258033))

(assert (=> b!162428 d!55823))

(assert (=> b!162428 d!55815))

(assert (=> d!55707 d!55739))

(declare-fun d!55825 () Bool)

(assert (=> d!55825 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55825 true))

(declare-fun _$14!282 () Unit!11186)

(assert (=> d!55825 (= (choose!11 thiss!1602) _$14!282)))

(declare-fun bs!13849 () Bool)

(assert (= bs!13849 d!55825))

(assert (=> bs!13849 m!257383))

(assert (=> d!55707 d!55825))

(declare-fun b!162536 () Bool)

(declare-fun res!135508 () Bool)

(declare-fun lt!255771 () (_ BitVec 32))

(assert (=> b!162536 (= res!135508 (= lt!255771 #b00000000000000000000000000000000))))

(declare-fun e!112135 () Bool)

(assert (=> b!162536 (=> res!135508 e!112135)))

(declare-fun e!112136 () Bool)

(assert (=> b!162536 (= e!112136 e!112135)))

(declare-fun lt!255770 () tuple4!236)

(declare-fun c!8507 () Bool)

(declare-fun lt!255769 () (_ BitVec 32))

(declare-fun call!2759 () Bool)

(declare-fun bm!2756 () Bool)

(assert (=> bm!2756 (= call!2759 (byteRangesEq!0 (ite c!8507 (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_3!586 lt!255770)) (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_4!118 lt!255770))) (ite c!8507 (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_3!586 lt!255770)) (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_4!118 lt!255770))) (ite c!8507 lt!255769 #b00000000000000000000000000000000) lt!255771))))

(declare-fun b!162537 () Bool)

(declare-fun e!112140 () Bool)

(assert (=> b!162537 (= e!112140 (arrayRangesEq!554 (buf!4060 (_1!7820 lt!255368)) (buf!4060 (_2!7820 lt!255368)) (_1!7831 lt!255770) (_2!7831 lt!255770)))))

(declare-fun b!162538 () Bool)

(declare-fun e!112137 () Bool)

(declare-fun e!112139 () Bool)

(assert (=> b!162538 (= e!112137 e!112139)))

(assert (=> b!162538 (= c!8507 (= (_3!586 lt!255770) (_4!118 lt!255770)))))

(declare-fun b!162539 () Bool)

(assert (=> b!162539 (= e!112139 e!112136)))

(declare-fun res!135506 () Bool)

(assert (=> b!162539 (= res!135506 (byteRangesEq!0 (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_3!586 lt!255770)) (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_3!586 lt!255770)) lt!255769 #b00000000000000000000000000001000))))

(assert (=> b!162539 (=> (not res!135506) (not e!112136))))

(declare-fun b!162540 () Bool)

(assert (=> b!162540 (= e!112135 call!2759)))

(declare-fun b!162541 () Bool)

(assert (=> b!162541 (= e!112139 call!2759)))

(declare-fun d!55827 () Bool)

(declare-fun res!135504 () Bool)

(declare-fun e!112138 () Bool)

(assert (=> d!55827 (=> res!135504 e!112138)))

(assert (=> d!55827 (= res!135504 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (=> d!55827 (= (arrayBitRangesEq!0 (buf!4060 (_1!7820 lt!255368)) (buf!4060 (_2!7820 lt!255368)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))) e!112138)))

(declare-fun b!162535 () Bool)

(assert (=> b!162535 (= e!112138 e!112137)))

(declare-fun res!135505 () Bool)

(assert (=> b!162535 (=> (not res!135505) (not e!112137))))

(assert (=> b!162535 (= res!135505 e!112140)))

(declare-fun res!135507 () Bool)

(assert (=> b!162535 (=> res!135507 e!112140)))

(assert (=> b!162535 (= res!135507 (bvsge (_1!7831 lt!255770) (_2!7831 lt!255770)))))

(assert (=> b!162535 (= lt!255771 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162535 (= lt!255769 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162535 (= lt!255770 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (= (and d!55827 (not res!135504)) b!162535))

(assert (= (and b!162535 (not res!135507)) b!162537))

(assert (= (and b!162535 res!135505) b!162538))

(assert (= (and b!162538 c!8507) b!162541))

(assert (= (and b!162538 (not c!8507)) b!162539))

(assert (= (and b!162539 res!135506) b!162536))

(assert (= (and b!162536 (not res!135508)) b!162540))

(assert (= (or b!162541 b!162540) bm!2756))

(declare-fun m!258045 () Bool)

(assert (=> bm!2756 m!258045))

(declare-fun m!258047 () Bool)

(assert (=> bm!2756 m!258047))

(declare-fun m!258049 () Bool)

(assert (=> bm!2756 m!258049))

(declare-fun m!258051 () Bool)

(assert (=> bm!2756 m!258051))

(declare-fun m!258053 () Bool)

(assert (=> bm!2756 m!258053))

(declare-fun m!258055 () Bool)

(assert (=> b!162537 m!258055))

(assert (=> b!162539 m!258047))

(assert (=> b!162539 m!258053))

(assert (=> b!162539 m!258047))

(assert (=> b!162539 m!258053))

(declare-fun m!258057 () Bool)

(assert (=> b!162539 m!258057))

(assert (=> b!162535 m!257717))

(declare-fun m!258059 () Bool)

(assert (=> b!162535 m!258059))

(assert (=> b!162422 d!55827))

(declare-fun d!55829 () Bool)

(declare-fun e!112141 () Bool)

(assert (=> d!55829 e!112141))

(declare-fun res!135509 () Bool)

(assert (=> d!55829 (=> (not res!135509) (not e!112141))))

(declare-fun lt!255773 () (_ BitVec 64))

(declare-fun lt!255774 () (_ BitVec 64))

(declare-fun lt!255775 () (_ BitVec 64))

(assert (=> d!55829 (= res!135509 (= lt!255773 (bvsub lt!255775 lt!255774)))))

(assert (=> d!55829 (or (= (bvand lt!255775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255774 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255775 lt!255774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55829 (= lt!255774 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255368)))) ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255368))) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255368)))))))

(declare-fun lt!255776 () (_ BitVec 64))

(declare-fun lt!255772 () (_ BitVec 64))

(assert (=> d!55829 (= lt!255775 (bvmul lt!255776 lt!255772))))

(assert (=> d!55829 (or (= lt!255776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255772 (bvsdiv (bvmul lt!255776 lt!255772) lt!255776)))))

(assert (=> d!55829 (= lt!255772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55829 (= lt!255776 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255368)))))))

(assert (=> d!55829 (= lt!255773 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255368))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (=> d!55829 (invariant!0 (currentBit!7555 (_1!7820 lt!255368)) (currentByte!7560 (_1!7820 lt!255368)) (size!3602 (buf!4060 (_1!7820 lt!255368))))))

(assert (=> d!55829 (= (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368))) lt!255773)))

(declare-fun b!162542 () Bool)

(declare-fun res!135510 () Bool)

(assert (=> b!162542 (=> (not res!135510) (not e!112141))))

(assert (=> b!162542 (= res!135510 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255773))))

(declare-fun b!162543 () Bool)

(declare-fun lt!255777 () (_ BitVec 64))

(assert (=> b!162543 (= e!112141 (bvsle lt!255773 (bvmul lt!255777 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162543 (or (= lt!255777 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255777 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255777)))))

(assert (=> b!162543 (= lt!255777 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255368)))))))

(assert (= (and d!55829 res!135509) b!162542))

(assert (= (and b!162542 res!135510) b!162543))

(declare-fun m!258061 () Bool)

(assert (=> d!55829 m!258061))

(declare-fun m!258063 () Bool)

(assert (=> d!55829 m!258063))

(assert (=> b!162422 d!55829))

(declare-fun d!55831 () Bool)

(declare-fun res!135511 () Bool)

(declare-fun e!112142 () Bool)

(assert (=> d!55831 (=> res!135511 e!112142)))

(assert (=> d!55831 (= res!135511 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55831 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112142)))

(declare-fun b!162544 () Bool)

(declare-fun e!112143 () Bool)

(assert (=> b!162544 (= e!112142 e!112143)))

(declare-fun res!135512 () Bool)

(assert (=> b!162544 (=> (not res!135512) (not e!112143))))

(assert (=> b!162544 (= res!135512 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162545 () Bool)

(assert (=> b!162545 (= e!112143 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55831 (not res!135511)) b!162544))

(assert (= (and b!162544 res!135512) b!162545))

(assert (=> b!162544 m!257989))

(assert (=> b!162544 m!257999))

(declare-fun m!258065 () Bool)

(assert (=> b!162545 m!258065))

(assert (=> b!162435 d!55831))

(declare-fun b!162547 () Bool)

(declare-fun res!135517 () Bool)

(declare-fun lt!255780 () (_ BitVec 32))

(assert (=> b!162547 (= res!135517 (= lt!255780 #b00000000000000000000000000000000))))

(declare-fun e!112144 () Bool)

(assert (=> b!162547 (=> res!135517 e!112144)))

(declare-fun e!112145 () Bool)

(assert (=> b!162547 (= e!112145 e!112144)))

(declare-fun lt!255779 () tuple4!236)

(declare-fun bm!2757 () Bool)

(declare-fun lt!255778 () (_ BitVec 32))

(declare-fun call!2760 () Bool)

(declare-fun c!8508 () Bool)

(assert (=> bm!2757 (= call!2760 (byteRangesEq!0 (ite c!8508 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255779)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255779))) (ite c!8508 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255779)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255779))) (ite c!8508 lt!255778 #b00000000000000000000000000000000) lt!255780))))

(declare-fun b!162548 () Bool)

(declare-fun e!112149 () Bool)

(assert (=> b!162548 (= e!112149 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 thiss!1602) (_1!7831 lt!255779) (_2!7831 lt!255779)))))

(declare-fun b!162549 () Bool)

(declare-fun e!112146 () Bool)

(declare-fun e!112148 () Bool)

(assert (=> b!162549 (= e!112146 e!112148)))

(assert (=> b!162549 (= c!8508 (= (_3!586 lt!255779) (_4!118 lt!255779)))))

(declare-fun b!162550 () Bool)

(assert (=> b!162550 (= e!112148 e!112145)))

(declare-fun res!135515 () Bool)

(assert (=> b!162550 (= res!135515 (byteRangesEq!0 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255779)) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255779)) lt!255778 #b00000000000000000000000000001000))))

(assert (=> b!162550 (=> (not res!135515) (not e!112145))))

(declare-fun b!162551 () Bool)

(assert (=> b!162551 (= e!112144 call!2760)))

(declare-fun b!162552 () Bool)

(assert (=> b!162552 (= e!112148 call!2760)))

(declare-fun d!55833 () Bool)

(declare-fun res!135513 () Bool)

(declare-fun e!112147 () Bool)

(assert (=> d!55833 (=> res!135513 e!112147)))

(assert (=> d!55833 (= res!135513 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (=> d!55833 (= (arrayBitRangesEq!0 (buf!4060 thiss!1602) (buf!4060 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))) e!112147)))

(declare-fun b!162546 () Bool)

(assert (=> b!162546 (= e!112147 e!112146)))

(declare-fun res!135514 () Bool)

(assert (=> b!162546 (=> (not res!135514) (not e!112146))))

(assert (=> b!162546 (= res!135514 e!112149)))

(declare-fun res!135516 () Bool)

(assert (=> b!162546 (=> res!135516 e!112149)))

(assert (=> b!162546 (= res!135516 (bvsge (_1!7831 lt!255779) (_2!7831 lt!255779)))))

(assert (=> b!162546 (= lt!255780 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162546 (= lt!255778 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162546 (= lt!255779 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(assert (= (and d!55833 (not res!135513)) b!162546))

(assert (= (and b!162546 (not res!135516)) b!162548))

(assert (= (and b!162546 res!135514) b!162549))

(assert (= (and b!162549 c!8508) b!162552))

(assert (= (and b!162549 (not c!8508)) b!162550))

(assert (= (and b!162550 res!135515) b!162547))

(assert (= (and b!162547 (not res!135517)) b!162551))

(assert (= (or b!162552 b!162551) bm!2757))

(declare-fun m!258067 () Bool)

(assert (=> bm!2757 m!258067))

(declare-fun m!258069 () Bool)

(assert (=> bm!2757 m!258069))

(declare-fun m!258071 () Bool)

(assert (=> bm!2757 m!258071))

(assert (=> bm!2757 m!258071))

(assert (=> bm!2757 m!258069))

(declare-fun m!258073 () Bool)

(assert (=> b!162548 m!258073))

(assert (=> b!162550 m!258069))

(assert (=> b!162550 m!258069))

(assert (=> b!162550 m!258069))

(assert (=> b!162550 m!258069))

(declare-fun m!258075 () Bool)

(assert (=> b!162550 m!258075))

(assert (=> b!162546 m!257243))

(assert (=> b!162546 m!257741))

(assert (=> b!162431 d!55833))

(assert (=> b!162431 d!55485))

(assert (=> b!162420 d!55829))

(declare-fun d!55835 () Bool)

(declare-fun e!112150 () Bool)

(assert (=> d!55835 e!112150))

(declare-fun res!135518 () Bool)

(assert (=> d!55835 (=> (not res!135518) (not e!112150))))

(declare-fun lt!255782 () (_ BitVec 64))

(declare-fun lt!255784 () (_ BitVec 64))

(declare-fun lt!255783 () (_ BitVec 64))

(assert (=> d!55835 (= res!135518 (= lt!255782 (bvsub lt!255784 lt!255783)))))

(assert (=> d!55835 (or (= (bvand lt!255784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255784 lt!255783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55835 (= lt!255783 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368)))) ((_ sign_extend 32) (currentByte!7560 (_2!7820 lt!255368))) ((_ sign_extend 32) (currentBit!7555 (_2!7820 lt!255368)))))))

(declare-fun lt!255785 () (_ BitVec 64))

(declare-fun lt!255781 () (_ BitVec 64))

(assert (=> d!55835 (= lt!255784 (bvmul lt!255785 lt!255781))))

(assert (=> d!55835 (or (= lt!255785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255781 (bvsdiv (bvmul lt!255785 lt!255781) lt!255785)))))

(assert (=> d!55835 (= lt!255781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55835 (= lt!255785 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368)))))))

(assert (=> d!55835 (= lt!255782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 (_2!7820 lt!255368))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 (_2!7820 lt!255368)))))))

(assert (=> d!55835 (invariant!0 (currentBit!7555 (_2!7820 lt!255368)) (currentByte!7560 (_2!7820 lt!255368)) (size!3602 (buf!4060 (_2!7820 lt!255368))))))

(assert (=> d!55835 (= (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))) lt!255782)))

(declare-fun b!162553 () Bool)

(declare-fun res!135519 () Bool)

(assert (=> b!162553 (=> (not res!135519) (not e!112150))))

(assert (=> b!162553 (= res!135519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255782))))

(declare-fun b!162554 () Bool)

(declare-fun lt!255786 () (_ BitVec 64))

(assert (=> b!162554 (= e!112150 (bvsle lt!255782 (bvmul lt!255786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162554 (or (= lt!255786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255786)))))

(assert (=> b!162554 (= lt!255786 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368)))))))

(assert (= (and d!55835 res!135518) b!162553))

(assert (= (and b!162553 res!135519) b!162554))

(declare-fun m!258077 () Bool)

(assert (=> d!55835 m!258077))

(declare-fun m!258079 () Bool)

(assert (=> d!55835 m!258079))

(assert (=> b!162420 d!55835))

(declare-fun b!162556 () Bool)

(declare-fun res!135524 () Bool)

(declare-fun lt!255789 () (_ BitVec 32))

(assert (=> b!162556 (= res!135524 (= lt!255789 #b00000000000000000000000000000000))))

(declare-fun e!112151 () Bool)

(assert (=> b!162556 (=> res!135524 e!112151)))

(declare-fun e!112152 () Bool)

(assert (=> b!162556 (= e!112152 e!112151)))

(declare-fun call!2761 () Bool)

(declare-fun bm!2758 () Bool)

(declare-fun lt!255787 () (_ BitVec 32))

(declare-fun c!8509 () Bool)

(declare-fun lt!255788 () tuple4!236)

(assert (=> bm!2758 (= call!2761 (byteRangesEq!0 (ite c!8509 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255788)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255788))) (ite c!8509 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255788)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255788))) (ite c!8509 lt!255787 #b00000000000000000000000000000000) lt!255789))))

(declare-fun b!162557 () Bool)

(declare-fun e!112156 () Bool)

(assert (=> b!162557 (= e!112156 (arrayRangesEq!554 (buf!4060 (_3!583 lt!255226)) (buf!4060 (_3!583 lt!255226)) (_1!7831 lt!255788) (_2!7831 lt!255788)))))

(declare-fun b!162558 () Bool)

(declare-fun e!112153 () Bool)

(declare-fun e!112155 () Bool)

(assert (=> b!162558 (= e!112153 e!112155)))

(assert (=> b!162558 (= c!8509 (= (_3!586 lt!255788) (_4!118 lt!255788)))))

(declare-fun b!162559 () Bool)

(assert (=> b!162559 (= e!112155 e!112152)))

(declare-fun res!135522 () Bool)

(assert (=> b!162559 (= res!135522 (byteRangesEq!0 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255788)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255788)) lt!255787 #b00000000000000000000000000001000))))

(assert (=> b!162559 (=> (not res!135522) (not e!112152))))

(declare-fun b!162560 () Bool)

(assert (=> b!162560 (= e!112151 call!2761)))

(declare-fun b!162561 () Bool)

(assert (=> b!162561 (= e!112155 call!2761)))

(declare-fun d!55837 () Bool)

(declare-fun res!135520 () Bool)

(declare-fun e!112154 () Bool)

(assert (=> d!55837 (=> res!135520 e!112154)))

(assert (=> d!55837 (= res!135520 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(assert (=> d!55837 (= (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))) e!112154)))

(declare-fun b!162555 () Bool)

(assert (=> b!162555 (= e!112154 e!112153)))

(declare-fun res!135521 () Bool)

(assert (=> b!162555 (=> (not res!135521) (not e!112153))))

(assert (=> b!162555 (= res!135521 e!112156)))

(declare-fun res!135523 () Bool)

(assert (=> b!162555 (=> res!135523 e!112156)))

(assert (=> b!162555 (= res!135523 (bvsge (_1!7831 lt!255788) (_2!7831 lt!255788)))))

(assert (=> b!162555 (= lt!255789 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162555 (= lt!255787 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162555 (= lt!255788 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)) (currentBit!7555 (_3!583 lt!255226)))))))

(assert (= (and d!55837 (not res!135520)) b!162555))

(assert (= (and b!162555 (not res!135523)) b!162557))

(assert (= (and b!162555 res!135521) b!162558))

(assert (= (and b!162558 c!8509) b!162561))

(assert (= (and b!162558 (not c!8509)) b!162559))

(assert (= (and b!162559 res!135522) b!162556))

(assert (= (and b!162556 (not res!135524)) b!162560))

(assert (= (or b!162561 b!162560) bm!2758))

(declare-fun m!258081 () Bool)

(assert (=> bm!2758 m!258081))

(declare-fun m!258083 () Bool)

(assert (=> bm!2758 m!258083))

(declare-fun m!258085 () Bool)

(assert (=> bm!2758 m!258085))

(assert (=> bm!2758 m!258085))

(assert (=> bm!2758 m!258083))

(declare-fun m!258087 () Bool)

(assert (=> b!162557 m!258087))

(assert (=> b!162559 m!258083))

(assert (=> b!162559 m!258083))

(assert (=> b!162559 m!258083))

(assert (=> b!162559 m!258083))

(declare-fun m!258089 () Bool)

(assert (=> b!162559 m!258089))

(assert (=> b!162555 m!257241))

(declare-fun m!258091 () Bool)

(assert (=> b!162555 m!258091))

(assert (=> b!162425 d!55837))

(assert (=> b!162425 d!55483))

(assert (=> d!55741 d!55505))

(declare-fun d!55839 () Bool)

(declare-fun res!135525 () Bool)

(declare-fun e!112157 () Bool)

(assert (=> d!55839 (=> res!135525 e!112157)))

(assert (=> d!55839 (= res!135525 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (=> d!55839 (= (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))) e!112157)))

(declare-fun b!162562 () Bool)

(declare-fun e!112158 () Bool)

(assert (=> b!162562 (= e!112157 e!112158)))

(declare-fun res!135526 () Bool)

(assert (=> b!162562 (=> (not res!135526) (not e!112158))))

(assert (=> b!162562 (= res!135526 (= (select (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162563 () Bool)

(assert (=> b!162563 (= e!112158 (arrayRangesEq!554 lt!255218 (array!8034 (store (store (store (arr!4523 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) lt!255214) (currentByte!7560 thiss!1602) lt!255213) (currentByte!7560 (_3!583 lt!255226)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (currentByte!7560 (_3!583 lt!255226)))) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7560 (_3!583 lt!255226))))))

(assert (= (and d!55839 (not res!135525)) b!162562))

(assert (= (and b!162562 res!135526) b!162563))

(declare-fun m!258093 () Bool)

(assert (=> b!162562 m!258093))

(declare-fun m!258095 () Bool)

(assert (=> b!162562 m!258095))

(declare-fun m!258097 () Bool)

(assert (=> b!162563 m!258097))

(assert (=> b!162366 d!55839))

(declare-fun d!55841 () Bool)

(assert (=> d!55841 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))) (tuple4!237 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162367 d!55841))

(assert (=> b!162377 d!55835))

(assert (=> b!162377 d!55483))

(declare-fun d!55843 () Bool)

(declare-fun res!135527 () Bool)

(declare-fun e!112159 () Bool)

(assert (=> d!55843 (=> res!135527 e!112159)))

(assert (=> d!55843 (= res!135527 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55843 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112159)))

(declare-fun b!162564 () Bool)

(declare-fun e!112160 () Bool)

(assert (=> b!162564 (= e!112159 e!112160)))

(declare-fun res!135528 () Bool)

(assert (=> b!162564 (=> (not res!135528) (not e!112160))))

(assert (=> b!162564 (= res!135528 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162565 () Bool)

(assert (=> b!162565 (= e!112160 (arrayRangesEq!554 (buf!4060 thiss!1602) (array!8034 (store (arr!4523 (buf!4060 thiss!1602)) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001) lt!255221) (size!3602 (buf!4060 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55843 (not res!135527)) b!162564))

(assert (= (and b!162564 res!135528) b!162565))

(assert (=> b!162564 m!257989))

(declare-fun m!258099 () Bool)

(assert (=> b!162564 m!258099))

(declare-fun m!258101 () Bool)

(assert (=> b!162565 m!258101))

(assert (=> b!162433 d!55843))

(assert (=> d!55737 d!55713))

(declare-fun d!55845 () Bool)

(assert (=> d!55845 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(assert (=> d!55845 true))

(declare-fun _$15!256 () Unit!11186)

(assert (=> d!55845 (= (choose!30 lt!255362 thiss!1602 (_3!583 lt!255226)) _$15!256)))

(declare-fun bs!13850 () Bool)

(assert (= bs!13850 d!55845))

(assert (=> bs!13850 m!257379))

(assert (=> d!55737 d!55845))

(declare-fun d!55847 () Bool)

(declare-fun res!135530 () Bool)

(declare-fun e!112162 () Bool)

(assert (=> d!55847 (=> (not res!135530) (not e!112162))))

(assert (=> d!55847 (= res!135530 (= (size!3602 (buf!4060 lt!255362)) (size!3602 (buf!4060 thiss!1602))))))

(assert (=> d!55847 (= (isPrefixOf!0 lt!255362 thiss!1602) e!112162)))

(declare-fun b!162566 () Bool)

(declare-fun res!135529 () Bool)

(assert (=> b!162566 (=> (not res!135529) (not e!112162))))

(assert (=> b!162566 (= res!135529 (bvsle (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362)) (bitIndex!0 (size!3602 (buf!4060 thiss!1602)) (currentByte!7560 thiss!1602) (currentBit!7555 thiss!1602))))))

(declare-fun b!162567 () Bool)

(declare-fun e!112161 () Bool)

(assert (=> b!162567 (= e!112162 e!112161)))

(declare-fun res!135531 () Bool)

(assert (=> b!162567 (=> res!135531 e!112161)))

(assert (=> b!162567 (= res!135531 (= (size!3602 (buf!4060 lt!255362)) #b00000000000000000000000000000000))))

(declare-fun b!162568 () Bool)

(assert (=> b!162568 (= e!112161 (arrayBitRangesEq!0 (buf!4060 lt!255362) (buf!4060 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 lt!255362)) (currentByte!7560 lt!255362) (currentBit!7555 lt!255362))))))

(assert (= (and d!55847 res!135530) b!162566))

(assert (= (and b!162566 res!135529) b!162567))

(assert (= (and b!162567 (not res!135531)) b!162568))

(assert (=> b!162566 m!257803))

(assert (=> b!162566 m!257243))

(assert (=> b!162568 m!257803))

(assert (=> b!162568 m!257803))

(declare-fun m!258103 () Bool)

(assert (=> b!162568 m!258103))

(assert (=> d!55737 d!55847))

(assert (=> d!55717 d!55713))

(declare-fun d!55849 () Bool)

(assert (=> d!55849 (isPrefixOf!0 lt!255362 (_3!583 lt!255226))))

(assert (=> d!55849 true))

(declare-fun _$15!257 () Unit!11186)

(assert (=> d!55849 (= (choose!30 lt!255362 (_3!583 lt!255226) (_3!583 lt!255226)) _$15!257)))

(declare-fun bs!13851 () Bool)

(assert (= bs!13851 d!55849))

(assert (=> bs!13851 m!257379))

(assert (=> d!55717 d!55849))

(assert (=> d!55725 d!55729))

(declare-fun d!55851 () Bool)

(assert (=> d!55851 (isPrefixOf!0 (_3!583 lt!255226) (_3!583 lt!255226))))

(assert (=> d!55851 true))

(declare-fun _$14!283 () Unit!11186)

(assert (=> d!55851 (= (choose!11 (_3!583 lt!255226)) _$14!283)))

(declare-fun bs!13852 () Bool)

(assert (= bs!13852 d!55851))

(assert (=> bs!13852 m!257381))

(assert (=> d!55725 d!55851))

(declare-fun d!55853 () Bool)

(assert (=> d!55853 (= (byteRangesEq!0 (ite c!8496 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255626))) (ite c!8496 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255626))) (ite c!8496 lt!255625 #b00000000000000000000000000000000) lt!255627) (or (= (ite c!8496 lt!255625 #b00000000000000000000000000000000) lt!255627) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8496 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255626)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255627))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8496 lt!255625 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8496 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255626)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255627))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8496 lt!255625 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!13853 () Bool)

(assert (= bs!13853 d!55853))

(declare-fun m!258105 () Bool)

(assert (=> bs!13853 m!258105))

(declare-fun m!258107 () Bool)

(assert (=> bs!13853 m!258107))

(assert (=> bm!2745 d!55853))

(declare-fun d!55855 () Bool)

(declare-fun res!135532 () Bool)

(declare-fun e!112163 () Bool)

(assert (=> d!55855 (=> res!135532 e!112163)))

(assert (=> d!55855 (= res!135532 (= (_1!7831 lt!255629) (_2!7831 lt!255629)))))

(assert (=> d!55855 (= (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (_1!7831 lt!255629) (_2!7831 lt!255629)) e!112163)))

(declare-fun b!162569 () Bool)

(declare-fun e!112164 () Bool)

(assert (=> b!162569 (= e!112163 e!112164)))

(declare-fun res!135533 () Bool)

(assert (=> b!162569 (=> (not res!135533) (not e!112164))))

(assert (=> b!162569 (= res!135533 (= (select (arr!4523 (buf!4060 thiss!1602)) (_1!7831 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_1!7831 lt!255629))))))

(declare-fun b!162570 () Bool)

(assert (=> b!162570 (= e!112164 (arrayRangesEq!554 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) (bvadd (_1!7831 lt!255629) #b00000000000000000000000000000001) (_2!7831 lt!255629)))))

(assert (= (and d!55855 (not res!135532)) b!162569))

(assert (= (and b!162569 res!135533) b!162570))

(declare-fun m!258109 () Bool)

(assert (=> b!162569 m!258109))

(declare-fun m!258111 () Bool)

(assert (=> b!162569 m!258111))

(declare-fun m!258113 () Bool)

(assert (=> b!162570 m!258113))

(assert (=> b!162369 d!55855))

(declare-fun d!55857 () Bool)

(declare-fun res!135534 () Bool)

(declare-fun e!112165 () Bool)

(assert (=> d!55857 (=> res!135534 e!112165)))

(assert (=> d!55857 (= res!135534 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (=> d!55857 (= (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)) e!112165)))

(declare-fun b!162571 () Bool)

(declare-fun e!112166 () Bool)

(assert (=> b!162571 (= e!112165 e!112166)))

(declare-fun res!135535 () Bool)

(assert (=> b!162571 (=> (not res!135535) (not e!112166))))

(assert (=> b!162571 (= res!135535 (= (select (arr!4523 (buf!4060 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4523 lt!255218) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162572 () Bool)

(assert (=> b!162572 (= e!112166 (arrayRangesEq!554 (buf!4060 thiss!1602) lt!255218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7560 (_3!583 lt!255226)) #b00000000000000000000000000000001)))))

(assert (= (and d!55857 (not res!135534)) b!162571))

(assert (= (and b!162571 res!135535) b!162572))

(assert (=> b!162571 m!257989))

(assert (=> b!162571 m!258093))

(declare-fun m!258115 () Bool)

(assert (=> b!162572 m!258115))

(assert (=> b!162389 d!55857))

(declare-fun d!55859 () Bool)

(assert (=> d!55859 (= (arrayBitIndices!0 lt!255361 lt!255350) (tuple4!237 ((_ extract 31 0) (bvadd (bvsdiv lt!255361 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!255361 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!255350 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255361 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255350 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162353 d!55859))

(declare-fun d!55861 () Bool)

(assert (=> d!55861 (= (byteRangesEq!0 (ite c!8497 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255629))) (ite c!8497 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255629))) (ite c!8497 lt!255628 #b00000000000000000000000000000000) lt!255630) (or (= (ite c!8497 lt!255628 #b00000000000000000000000000000000) lt!255630) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8497 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255629)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255630))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8497 lt!255628 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8497 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255629)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255630))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8497 lt!255628 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!13854 () Bool)

(assert (= bs!13854 d!55861))

(declare-fun m!258117 () Bool)

(assert (=> bs!13854 m!258117))

(declare-fun m!258119 () Bool)

(assert (=> bs!13854 m!258119))

(assert (=> bm!2746 d!55861))

(declare-fun b!162574 () Bool)

(declare-fun res!135540 () Bool)

(declare-fun lt!255792 () (_ BitVec 32))

(assert (=> b!162574 (= res!135540 (= lt!255792 #b00000000000000000000000000000000))))

(declare-fun e!112167 () Bool)

(assert (=> b!162574 (=> res!135540 e!112167)))

(declare-fun e!112168 () Bool)

(assert (=> b!162574 (= e!112168 e!112167)))

(declare-fun call!2762 () Bool)

(declare-fun lt!255791 () tuple4!236)

(declare-fun bm!2759 () Bool)

(declare-fun c!8510 () Bool)

(declare-fun lt!255790 () (_ BitVec 32))

(assert (=> bm!2759 (= call!2762 (byteRangesEq!0 (ite c!8510 (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_3!586 lt!255791)) (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_4!118 lt!255791))) (ite c!8510 (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255791)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_4!118 lt!255791))) (ite c!8510 lt!255790 #b00000000000000000000000000000000) lt!255792))))

(declare-fun b!162575 () Bool)

(declare-fun e!112172 () Bool)

(assert (=> b!162575 (= e!112172 (arrayRangesEq!554 (buf!4060 (_2!7820 lt!255368)) (buf!4060 (_3!583 lt!255226)) (_1!7831 lt!255791) (_2!7831 lt!255791)))))

(declare-fun b!162576 () Bool)

(declare-fun e!112169 () Bool)

(declare-fun e!112171 () Bool)

(assert (=> b!162576 (= e!112169 e!112171)))

(assert (=> b!162576 (= c!8510 (= (_3!586 lt!255791) (_4!118 lt!255791)))))

(declare-fun b!162577 () Bool)

(assert (=> b!162577 (= e!112171 e!112168)))

(declare-fun res!135538 () Bool)

(assert (=> b!162577 (= res!135538 (byteRangesEq!0 (select (arr!4523 (buf!4060 (_2!7820 lt!255368))) (_3!586 lt!255791)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255791)) lt!255790 #b00000000000000000000000000001000))))

(assert (=> b!162577 (=> (not res!135538) (not e!112168))))

(declare-fun b!162578 () Bool)

(assert (=> b!162578 (= e!112167 call!2762)))

(declare-fun b!162579 () Bool)

(assert (=> b!162579 (= e!112171 call!2762)))

(declare-fun d!55863 () Bool)

(declare-fun res!135536 () Bool)

(declare-fun e!112170 () Bool)

(assert (=> d!55863 (=> res!135536 e!112170)))

(assert (=> d!55863 (= res!135536 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368)))))))

(assert (=> d!55863 (= (arrayBitRangesEq!0 (buf!4060 (_2!7820 lt!255368)) (buf!4060 (_3!583 lt!255226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368)))) e!112170)))

(declare-fun b!162573 () Bool)

(assert (=> b!162573 (= e!112170 e!112169)))

(declare-fun res!135537 () Bool)

(assert (=> b!162573 (=> (not res!135537) (not e!112169))))

(assert (=> b!162573 (= res!135537 e!112172)))

(declare-fun res!135539 () Bool)

(assert (=> b!162573 (=> res!135539 e!112172)))

(assert (=> b!162573 (= res!135539 (bvsge (_1!7831 lt!255791) (_2!7831 lt!255791)))))

(assert (=> b!162573 (= lt!255792 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162573 (= lt!255790 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162573 (= lt!255791 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368)))))))

(assert (= (and d!55863 (not res!135536)) b!162573))

(assert (= (and b!162573 (not res!135539)) b!162575))

(assert (= (and b!162573 res!135537) b!162576))

(assert (= (and b!162576 c!8510) b!162579))

(assert (= (and b!162576 (not c!8510)) b!162577))

(assert (= (and b!162577 res!135538) b!162574))

(assert (= (and b!162574 (not res!135540)) b!162578))

(assert (= (or b!162579 b!162578) bm!2759))

(declare-fun m!258121 () Bool)

(assert (=> bm!2759 m!258121))

(declare-fun m!258123 () Bool)

(assert (=> bm!2759 m!258123))

(declare-fun m!258125 () Bool)

(assert (=> bm!2759 m!258125))

(declare-fun m!258127 () Bool)

(assert (=> bm!2759 m!258127))

(declare-fun m!258129 () Bool)

(assert (=> bm!2759 m!258129))

(declare-fun m!258131 () Bool)

(assert (=> b!162575 m!258131))

(assert (=> b!162577 m!258123))

(assert (=> b!162577 m!258129))

(assert (=> b!162577 m!258123))

(assert (=> b!162577 m!258129))

(declare-fun m!258133 () Bool)

(assert (=> b!162577 m!258133))

(assert (=> b!162573 m!257745))

(declare-fun m!258135 () Bool)

(assert (=> b!162573 m!258135))

(assert (=> b!162379 d!55863))

(assert (=> b!162379 d!55835))

(assert (=> d!55733 d!55735))

(declare-fun d!55865 () Bool)

(assert (=> d!55865 (isPrefixOf!0 lt!255362 lt!255362)))

(assert (=> d!55865 true))

(declare-fun _$14!284 () Unit!11186)

(assert (=> d!55865 (= (choose!11 lt!255362) _$14!284)))

(declare-fun bs!13855 () Bool)

(assert (= bs!13855 d!55865))

(assert (=> bs!13855 m!257391))

(assert (=> d!55733 d!55865))

(assert (=> d!55661 d!55663))

(declare-fun d!55867 () Bool)

(assert (=> d!55867 (arrayBitRangesEq!0 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) lt!255361 lt!255350)))

(assert (=> d!55867 true))

(declare-fun _$19!129 () Unit!11186)

(assert (=> d!55867 (= (choose!8 (buf!4060 thiss!1602) (buf!4060 (_3!583 lt!255226)) lt!255361 lt!255350) _$19!129)))

(declare-fun bs!13856 () Bool)

(assert (= bs!13856 d!55867))

(assert (=> bs!13856 m!257369))

(assert (=> d!55661 d!55867))

(declare-fun d!55869 () Bool)

(assert (=> d!55869 (= (byteRangesEq!0 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629)) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629)) lt!255628 #b00000000000000000000000000001000) (or (= lt!255628 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255629))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255628)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_3!586 lt!255629))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255628)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13857 () Bool)

(assert (= bs!13857 d!55869))

(assert (=> bs!13857 m!257985))

(declare-fun m!258137 () Bool)

(assert (=> bs!13857 m!258137))

(assert (=> b!162371 d!55869))

(declare-fun d!55871 () Bool)

(assert (=> d!55871 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))) ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255212))) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255212))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 (_1!7820 lt!255212)))) ((_ sign_extend 32) (currentByte!7560 (_1!7820 lt!255212))) ((_ sign_extend 32) (currentBit!7555 (_1!7820 lt!255212)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13858 () Bool)

(assert (= bs!13858 d!55871))

(assert (=> bs!13858 m!258015))

(assert (=> d!55679 d!55871))

(declare-fun b!162581 () Bool)

(declare-fun res!135545 () Bool)

(declare-fun lt!255795 () (_ BitVec 32))

(assert (=> b!162581 (= res!135545 (= lt!255795 #b00000000000000000000000000000000))))

(declare-fun e!112173 () Bool)

(assert (=> b!162581 (=> res!135545 e!112173)))

(declare-fun e!112174 () Bool)

(assert (=> b!162581 (= e!112174 e!112173)))

(declare-fun c!8511 () Bool)

(declare-fun bm!2760 () Bool)

(declare-fun lt!255793 () (_ BitVec 32))

(declare-fun lt!255794 () tuple4!236)

(declare-fun call!2763 () Bool)

(assert (=> bm!2760 (= call!2763 (byteRangesEq!0 (ite c!8511 (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_3!586 lt!255794)) (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_4!118 lt!255794))) (ite c!8511 (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255794)) (select (arr!4523 (buf!4060 thiss!1602)) (_4!118 lt!255794))) (ite c!8511 lt!255793 #b00000000000000000000000000000000) lt!255795))))

(declare-fun e!112178 () Bool)

(declare-fun b!162582 () Bool)

(assert (=> b!162582 (= e!112178 (arrayRangesEq!554 (buf!4060 (_1!7820 lt!255368)) (buf!4060 thiss!1602) (_1!7831 lt!255794) (_2!7831 lt!255794)))))

(declare-fun b!162583 () Bool)

(declare-fun e!112175 () Bool)

(declare-fun e!112177 () Bool)

(assert (=> b!162583 (= e!112175 e!112177)))

(assert (=> b!162583 (= c!8511 (= (_3!586 lt!255794) (_4!118 lt!255794)))))

(declare-fun b!162584 () Bool)

(assert (=> b!162584 (= e!112177 e!112174)))

(declare-fun res!135543 () Bool)

(assert (=> b!162584 (= res!135543 (byteRangesEq!0 (select (arr!4523 (buf!4060 (_1!7820 lt!255368))) (_3!586 lt!255794)) (select (arr!4523 (buf!4060 thiss!1602)) (_3!586 lt!255794)) lt!255793 #b00000000000000000000000000001000))))

(assert (=> b!162584 (=> (not res!135543) (not e!112174))))

(declare-fun b!162585 () Bool)

(assert (=> b!162585 (= e!112173 call!2763)))

(declare-fun b!162586 () Bool)

(assert (=> b!162586 (= e!112177 call!2763)))

(declare-fun d!55873 () Bool)

(declare-fun res!135541 () Bool)

(declare-fun e!112176 () Bool)

(assert (=> d!55873 (=> res!135541 e!112176)))

(assert (=> d!55873 (= res!135541 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (=> d!55873 (= (arrayBitRangesEq!0 (buf!4060 (_1!7820 lt!255368)) (buf!4060 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))) e!112176)))

(declare-fun b!162580 () Bool)

(assert (=> b!162580 (= e!112176 e!112175)))

(declare-fun res!135542 () Bool)

(assert (=> b!162580 (=> (not res!135542) (not e!112175))))

(assert (=> b!162580 (= res!135542 e!112178)))

(declare-fun res!135544 () Bool)

(assert (=> b!162580 (=> res!135544 e!112178)))

(assert (=> b!162580 (= res!135544 (bvsge (_1!7831 lt!255794) (_2!7831 lt!255794)))))

(assert (=> b!162580 (= lt!255795 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162580 (= lt!255793 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162580 (= lt!255794 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3602 (buf!4060 (_1!7820 lt!255368))) (currentByte!7560 (_1!7820 lt!255368)) (currentBit!7555 (_1!7820 lt!255368)))))))

(assert (= (and d!55873 (not res!135541)) b!162580))

(assert (= (and b!162580 (not res!135544)) b!162582))

(assert (= (and b!162580 res!135542) b!162583))

(assert (= (and b!162583 c!8511) b!162586))

(assert (= (and b!162583 (not c!8511)) b!162584))

(assert (= (and b!162584 res!135543) b!162581))

(assert (= (and b!162581 (not res!135545)) b!162585))

(assert (= (or b!162586 b!162585) bm!2760))

(declare-fun m!258139 () Bool)

(assert (=> bm!2760 m!258139))

(declare-fun m!258141 () Bool)

(assert (=> bm!2760 m!258141))

(declare-fun m!258143 () Bool)

(assert (=> bm!2760 m!258143))

(declare-fun m!258145 () Bool)

(assert (=> bm!2760 m!258145))

(declare-fun m!258147 () Bool)

(assert (=> bm!2760 m!258147))

(declare-fun m!258149 () Bool)

(assert (=> b!162582 m!258149))

(assert (=> b!162584 m!258141))

(assert (=> b!162584 m!258147))

(assert (=> b!162584 m!258141))

(assert (=> b!162584 m!258147))

(declare-fun m!258151 () Bool)

(assert (=> b!162584 m!258151))

(assert (=> b!162580 m!257717))

(assert (=> b!162580 m!258059))

(assert (=> b!162364 d!55873))

(assert (=> b!162364 d!55829))

(declare-fun d!55875 () Bool)

(declare-fun e!112179 () Bool)

(assert (=> d!55875 e!112179))

(declare-fun res!135546 () Bool)

(assert (=> d!55875 (=> (not res!135546) (not e!112179))))

(declare-fun lt!255797 () (_ BitVec 64))

(declare-fun lt!255799 () (_ BitVec 64))

(declare-fun lt!255798 () (_ BitVec 64))

(assert (=> d!55875 (= res!135546 (= lt!255797 (bvsub lt!255799 lt!255798)))))

(assert (=> d!55875 (or (= (bvand lt!255799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255799 lt!255798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55875 (= lt!255798 (remainingBits!0 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255635))) ((_ sign_extend 32) (currentByte!7560 lt!255635)) ((_ sign_extend 32) (currentBit!7555 lt!255635))))))

(declare-fun lt!255800 () (_ BitVec 64))

(declare-fun lt!255796 () (_ BitVec 64))

(assert (=> d!55875 (= lt!255799 (bvmul lt!255800 lt!255796))))

(assert (=> d!55875 (or (= lt!255800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255796 (bvsdiv (bvmul lt!255800 lt!255796) lt!255800)))))

(assert (=> d!55875 (= lt!255796 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55875 (= lt!255800 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255635))))))

(assert (=> d!55875 (= lt!255797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7560 lt!255635)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7555 lt!255635))))))

(assert (=> d!55875 (invariant!0 (currentBit!7555 lt!255635) (currentByte!7560 lt!255635) (size!3602 (buf!4060 lt!255635)))))

(assert (=> d!55875 (= (bitIndex!0 (size!3602 (buf!4060 lt!255635)) (currentByte!7560 lt!255635) (currentBit!7555 lt!255635)) lt!255797)))

(declare-fun b!162587 () Bool)

(declare-fun res!135547 () Bool)

(assert (=> b!162587 (=> (not res!135547) (not e!112179))))

(assert (=> b!162587 (= res!135547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255797))))

(declare-fun b!162588 () Bool)

(declare-fun lt!255801 () (_ BitVec 64))

(assert (=> b!162588 (= e!112179 (bvsle lt!255797 (bvmul lt!255801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162588 (or (= lt!255801 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255801 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255801)))))

(assert (=> b!162588 (= lt!255801 ((_ sign_extend 32) (size!3602 (buf!4060 lt!255635))))))

(assert (= (and d!55875 res!135546) b!162587))

(assert (= (and b!162587 res!135547) b!162588))

(declare-fun m!258153 () Bool)

(assert (=> d!55875 m!258153))

(declare-fun m!258155 () Bool)

(assert (=> d!55875 m!258155))

(assert (=> d!55673 d!55875))

(assert (=> d!55673 d!55835))

(declare-fun d!55877 () Bool)

(declare-fun lt!255814 () (_ BitVec 32))

(assert (=> d!55877 (= lt!255814 ((_ extract 31 0) (bvsrem (bvsub lt!255351 lt!255366) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!255818 () (_ BitVec 32))

(assert (=> d!55877 (= lt!255818 ((_ extract 31 0) (bvsdiv (bvsub lt!255351 lt!255366) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112185 () Bool)

(assert (=> d!55877 e!112185))

(declare-fun res!135553 () Bool)

(assert (=> d!55877 (=> (not res!135553) (not e!112185))))

(assert (=> d!55877 (= res!135553 (moveBitIndexPrecond!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366)))))

(declare-fun Unit!11215 () Unit!11186)

(declare-fun Unit!11216 () Unit!11186)

(declare-fun Unit!11217 () Unit!11186)

(assert (=> d!55877 (= (moveBitIndex!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366)) (ite (bvslt (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255814) #b00000000000000000000000000000000) (tuple2!14491 Unit!11215 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvsub (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255818) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255814 (currentBit!7555 (_2!7820 lt!255368))))) (ite (bvsge (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255814) #b00000000000000000000000000001000) (tuple2!14491 Unit!11216 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255818 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255814) #b00000000000000000000000000001000))) (tuple2!14491 Unit!11217 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255818) (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255814))))))))

(declare-fun b!162593 () Bool)

(declare-fun e!112184 () Bool)

(assert (=> b!162593 (= e!112185 e!112184)))

(declare-fun res!135552 () Bool)

(assert (=> b!162593 (=> (not res!135552) (not e!112184))))

(declare-fun lt!255816 () (_ BitVec 64))

(declare-fun lt!255819 () tuple2!14490)

(assert (=> b!162593 (= res!135552 (= (bvadd lt!255816 (bvsub lt!255351 lt!255366)) (bitIndex!0 (size!3602 (buf!4060 (_2!7832 lt!255819))) (currentByte!7560 (_2!7832 lt!255819)) (currentBit!7555 (_2!7832 lt!255819)))))))

(assert (=> b!162593 (or (not (= (bvand lt!255816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255351 lt!255366) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255816 (bvsub lt!255351 lt!255366)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162593 (= lt!255816 (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))))))

(declare-fun lt!255815 () (_ BitVec 32))

(declare-fun lt!255817 () (_ BitVec 32))

(declare-fun Unit!11218 () Unit!11186)

(declare-fun Unit!11219 () Unit!11186)

(declare-fun Unit!11220 () Unit!11186)

(assert (=> b!162593 (= lt!255819 (ite (bvslt (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255817) #b00000000000000000000000000000000) (tuple2!14491 Unit!11218 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvsub (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255815) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255817 (currentBit!7555 (_2!7820 lt!255368))))) (ite (bvsge (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255817) #b00000000000000000000000000001000) (tuple2!14491 Unit!11219 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255815 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255817) #b00000000000000000000000000001000))) (tuple2!14491 Unit!11220 (BitStream!6373 (buf!4060 (_2!7820 lt!255368)) (bvadd (currentByte!7560 (_2!7820 lt!255368)) lt!255815) (bvadd (currentBit!7555 (_2!7820 lt!255368)) lt!255817))))))))

(assert (=> b!162593 (= lt!255817 ((_ extract 31 0) (bvsrem (bvsub lt!255351 lt!255366) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162593 (= lt!255815 ((_ extract 31 0) (bvsdiv (bvsub lt!255351 lt!255366) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!162594 () Bool)

(assert (=> b!162594 (= e!112184 (and (= (size!3602 (buf!4060 (_2!7820 lt!255368))) (size!3602 (buf!4060 (_2!7832 lt!255819)))) (= (buf!4060 (_2!7820 lt!255368)) (buf!4060 (_2!7832 lt!255819)))))))

(assert (= (and d!55877 res!135553) b!162593))

(assert (= (and b!162593 res!135552) b!162594))

(assert (=> d!55877 m!257749))

(declare-fun m!258157 () Bool)

(assert (=> b!162593 m!258157))

(assert (=> b!162593 m!257745))

(assert (=> d!55673 d!55877))

(declare-fun d!55881 () Bool)

(declare-fun res!135556 () Bool)

(declare-fun e!112188 () Bool)

(assert (=> d!55881 (=> (not res!135556) (not e!112188))))

(assert (=> d!55881 (= res!135556 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368))))) (bvsub lt!255351 lt!255366)) (bvsle (bvsub lt!255351 lt!255366) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368))))))))))

(assert (=> d!55881 (= (moveBitIndexPrecond!0 (_2!7820 lt!255368) (bvsub lt!255351 lt!255366)) e!112188)))

(declare-fun b!162598 () Bool)

(declare-fun lt!255822 () (_ BitVec 64))

(assert (=> b!162598 (= e!112188 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255822) (bvsle lt!255822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3602 (buf!4060 (_2!7820 lt!255368))))))))))

(assert (=> b!162598 (= lt!255822 (bvadd (bitIndex!0 (size!3602 (buf!4060 (_2!7820 lt!255368))) (currentByte!7560 (_2!7820 lt!255368)) (currentBit!7555 (_2!7820 lt!255368))) (bvsub lt!255351 lt!255366)))))

(assert (= (and d!55881 res!135556) b!162598))

(assert (=> b!162598 m!257745))

(assert (=> d!55673 d!55881))

(assert (=> b!162362 d!55829))

(assert (=> b!162362 d!55485))

(declare-fun d!55883 () Bool)

(declare-fun res!135557 () Bool)

(declare-fun e!112189 () Bool)

(assert (=> d!55883 (=> res!135557 e!112189)))

(assert (=> d!55883 (= res!135557 (= (_1!7831 lt!255626) (_2!7831 lt!255626)))))

(assert (=> d!55883 (= (arrayRangesEq!554 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) (_1!7831 lt!255626) (_2!7831 lt!255626)) e!112189)))

(declare-fun b!162599 () Bool)

(declare-fun e!112190 () Bool)

(assert (=> b!162599 (= e!112189 e!112190)))

(declare-fun res!135558 () Bool)

(assert (=> b!162599 (=> (not res!135558) (not e!112190))))

(assert (=> b!162599 (= res!135558 (= (select (arr!4523 (buf!4060 (_3!583 lt!255226))) (_1!7831 lt!255626)) (select (arr!4523 (buf!4060 thiss!1602)) (_1!7831 lt!255626))))))

(declare-fun b!162600 () Bool)

(assert (=> b!162600 (= e!112190 (arrayRangesEq!554 (buf!4060 (_3!583 lt!255226)) (buf!4060 thiss!1602) (bvadd (_1!7831 lt!255626) #b00000000000000000000000000000001) (_2!7831 lt!255626)))))

(assert (= (and d!55883 (not res!135557)) b!162599))

(assert (= (and b!162599 res!135558) b!162600))

(declare-fun m!258159 () Bool)

(assert (=> b!162599 m!258159))

(declare-fun m!258161 () Bool)

(assert (=> b!162599 m!258161))

(declare-fun m!258163 () Bool)

(assert (=> b!162600 m!258163))

(assert (=> b!162355 d!55883))

(check-sat (not b!162539) (not bm!2756) (not d!55851) (not d!55815) (not d!55877) (not bm!2755) (not b!162568) (not d!55819) (not b!162508) (not b!162525) (not b!162600) (not d!55871) (not d!55845) (not b!162523) (not d!55829) (not b!162546) (not b!162521) (not b!162582) (not b!162575) (not b!162573) (not bm!2759) (not b!162598) (not d!55849) (not d!55875) (not d!55867) (not bm!2758) (not b!162528) (not bm!2757) (not b!162530) (not b!162593) (not b!162555) (not b!162514) (not b!162537) (not b!162545) (not b!162548) (not b!162565) (not b!162532) (not b!162559) (not d!55835) (not b!162557) (not b!162572) (not d!55865) (not b!162510) (not b!162550) (not b!162563) (not b!162570) (not bm!2754) (not d!55817) (not b!162580) (not b!162584) (not b!162512) (not b!162566) (not bm!2760) (not d!55825) (not b!162535) (not b!162577))
(check-sat)
