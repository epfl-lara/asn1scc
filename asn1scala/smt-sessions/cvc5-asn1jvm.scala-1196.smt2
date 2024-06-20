; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33938 () Bool)

(assert start!33938)

(declare-fun b!162036 () Bool)

(declare-datatypes ((Unit!11180 0))(
  ( (Unit!11181) )
))
(declare-fun e!111741 () Unit!11180)

(declare-fun Unit!11182 () Unit!11180)

(assert (=> b!162036 (= e!111741 Unit!11182)))

(declare-fun lt!255175 () Unit!11180)

(declare-datatypes ((array!8031 0))(
  ( (array!8032 (arr!4522 (Array (_ BitVec 32) (_ BitVec 8))) (size!3601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6370 0))(
  ( (BitStream!6371 (buf!4059 array!8031) (currentByte!7559 (_ BitVec 32)) (currentBit!7554 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6370)

(declare-datatypes ((tuple3!930 0))(
  ( (tuple3!931 (_1!7816 Unit!11180) (_2!7816 (_ BitVec 8)) (_3!582 BitStream!6370)) )
))
(declare-fun lt!255169 () tuple3!930)

(declare-fun arrayUpdatedAtPrefixLemma!161 (array!8031 (_ BitVec 32) (_ BitVec 8)) Unit!11180)

(assert (=> b!162036 (= lt!255175 (arrayUpdatedAtPrefixLemma!161 (buf!4059 thiss!1602) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))))))

(declare-fun arrayRangesEq!553 (array!8031 array!8031 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162036 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169)))))

(declare-fun lt!255176 () Unit!11180)

(declare-fun lt!255164 () array!8031)

(assert (=> b!162036 (= lt!255176 (arrayUpdatedAtPrefixLemma!161 lt!255164 (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))))))

(declare-fun lt!255173 () (_ BitVec 8))

(declare-fun lt!255168 () (_ BitVec 8))

(assert (=> b!162036 (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169)))))

(declare-fun lt!255163 () Unit!11180)

(declare-fun arrayRangesEqTransitive!148 (array!8031 array!8031 array!8031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11180)

(assert (=> b!162036 (= lt!255163 (arrayRangesEqTransitive!148 (buf!4059 thiss!1602) lt!255164 (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(declare-fun res!135079 () Bool)

(assert (=> b!162036 (= res!135079 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(declare-fun e!111743 () Bool)

(assert (=> b!162036 (=> (not res!135079) (not e!111743))))

(assert (=> b!162036 e!111743))

(declare-fun b!162037 () Bool)

(declare-fun e!111746 () Bool)

(declare-fun array_inv!3348 (array!8031) Bool)

(assert (=> b!162037 (= e!111746 (array_inv!3348 (buf!4059 thiss!1602)))))

(declare-datatypes ((tuple2!14468 0))(
  ( (tuple2!14469 (_1!7817 BitStream!6370) (_2!7817 BitStream!6370)) )
))
(declare-fun lt!255167 () tuple2!14468)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun e!111742 () Bool)

(declare-datatypes ((tuple2!14470 0))(
  ( (tuple2!14471 (_1!7818 BitStream!6370) (_2!7818 (_ BitVec 8))) )
))
(declare-fun lt!255174 () tuple2!14470)

(declare-fun b!162038 () Bool)

(assert (=> b!162038 (= e!111742 (and (= (_2!7818 lt!255174) v!222) (= (_1!7818 lt!255174) (_2!7817 lt!255167))))))

(declare-fun readBytePure!0 (BitStream!6370) tuple2!14470)

(assert (=> b!162038 (= lt!255174 (readBytePure!0 (_1!7817 lt!255167)))))

(declare-fun reader!0 (BitStream!6370 BitStream!6370) tuple2!14468)

(assert (=> b!162038 (= lt!255167 (reader!0 thiss!1602 (_3!582 lt!255169)))))

(declare-fun b!162039 () Bool)

(declare-fun Unit!11183 () Unit!11180)

(assert (=> b!162039 (= e!111741 Unit!11183)))

(declare-fun call!2735 () Bool)

(assert (=> b!162039 call!2735))

(declare-fun bm!2732 () Bool)

(assert (=> bm!2732 (= call!2735 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (currentByte!7559 thiss!1602)))))

(declare-fun b!162040 () Bool)

(declare-fun e!111740 () Bool)

(declare-fun e!111747 () Bool)

(assert (=> b!162040 (= e!111740 (not e!111747))))

(declare-fun res!135077 () Bool)

(assert (=> b!162040 (=> res!135077 e!111747)))

(assert (=> b!162040 (= res!135077 (not (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001))))))

(declare-fun lt!255170 () (_ BitVec 8))

(assert (=> b!162040 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001))))

(declare-fun lt!255165 () Unit!11180)

(assert (=> b!162040 (= lt!255165 (arrayUpdatedAtPrefixLemma!161 (buf!4059 thiss!1602) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170))))

(assert (=> b!162040 (= lt!255170 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(declare-fun lt!255177 () (_ BitVec 32))

(declare-fun lt!255171 () (_ BitVec 32))

(declare-fun lt!255162 () Bool)

(declare-fun lt!255161 () (_ BitVec 8))

(declare-fun Unit!11184 () Unit!11180)

(declare-fun Unit!11185 () Unit!11180)

(assert (=> b!162040 (= lt!255169 (ite lt!255162 (let ((bdg!9767 ((_ extract 7 0) (bvnot lt!255171)))) (let ((bdg!9768 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)))) ((_ sign_extend 24) bdg!9767))))) (tuple3!931 Unit!11184 bdg!9767 (BitStream!6371 (array!8032 (store (arr!4522 (array!8032 (store (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)) bdg!9768) (size!3601 lt!255164))) (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9768) (bvshl ((_ sign_extend 24) v!222) lt!255177)))) (size!3601 (array!8032 (store (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)) bdg!9768) (size!3601 lt!255164)))) (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)) (currentBit!7554 thiss!1602))))) (tuple3!931 Unit!11185 lt!255161 (BitStream!6371 lt!255164 (bvadd #b00000000000000000000000000000001 (currentByte!7559 thiss!1602)) (currentBit!7554 thiss!1602)))))))

(declare-fun lt!255166 () (_ BitVec 32))

(assert (=> b!162040 (= lt!255162 (bvsgt lt!255166 #b00000000000000000000000000000000))))

(declare-fun e!111745 () Bool)

(assert (=> b!162040 e!111745))

(declare-fun res!135078 () Bool)

(assert (=> b!162040 (=> res!135078 e!111745)))

(assert (=> b!162040 (= res!135078 (bvsge (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> b!162040 (= lt!255164 (array!8032 (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> b!162040 (= lt!255168 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255173) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!255166))))))

(assert (=> b!162040 (= lt!255173 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602))) lt!255171)))))

(assert (=> b!162040 (= lt!255171 ((_ sign_extend 24) lt!255161))))

(assert (=> b!162040 (= lt!255161 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!255177)))))))

(assert (=> b!162040 (= lt!255177 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!255166))))))

(assert (=> b!162040 (= lt!255166 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7554 thiss!1602))))))

(declare-fun b!162041 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162041 (= e!111745 (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602)) lt!255168 #b00000000000000000000000000000000 (currentBit!7554 thiss!1602)))))

(declare-fun b!162043 () Bool)

(assert (=> b!162043 (= e!111747 e!111742)))

(declare-fun res!135083 () Bool)

(assert (=> b!162043 (=> (not res!135083) (not e!111742))))

(assert (=> b!162043 (= res!135083 (= (size!3601 (buf!4059 thiss!1602)) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(declare-fun lt!255172 () Unit!11180)

(assert (=> b!162043 (= lt!255172 e!111741)))

(declare-fun c!8474 () Bool)

(assert (=> b!162043 (= c!8474 lt!255162)))

(declare-fun b!162044 () Bool)

(declare-fun res!135081 () Bool)

(assert (=> b!162044 (=> (not res!135081) (not e!111742))))

(declare-fun isPrefixOf!0 (BitStream!6370 BitStream!6370) Bool)

(assert (=> b!162044 (= res!135081 (isPrefixOf!0 thiss!1602 (_3!582 lt!255169)))))

(declare-fun b!162045 () Bool)

(assert (=> b!162045 (= e!111743 call!2735)))

(declare-fun b!162042 () Bool)

(declare-fun res!135082 () Bool)

(assert (=> b!162042 (=> (not res!135082) (not e!111742))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!162042 (= res!135082 (= (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)))))))

(declare-fun res!135080 () Bool)

(assert (=> start!33938 (=> (not res!135080) (not e!111740))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33938 (= res!135080 (validate_offset_byte!0 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) ((_ sign_extend 32) (currentByte!7559 thiss!1602)) ((_ sign_extend 32) (currentBit!7554 thiss!1602))))))

(assert (=> start!33938 e!111740))

(declare-fun inv!12 (BitStream!6370) Bool)

(assert (=> start!33938 (and (inv!12 thiss!1602) e!111746)))

(assert (=> start!33938 true))

(assert (= (and start!33938 res!135080) b!162040))

(assert (= (and b!162040 (not res!135078)) b!162041))

(assert (= (and b!162040 (not res!135077)) b!162043))

(assert (= (and b!162043 c!8474) b!162036))

(assert (= (and b!162043 (not c!8474)) b!162039))

(assert (= (and b!162036 res!135079) b!162045))

(assert (= (or b!162045 b!162039) bm!2732))

(assert (= (and b!162043 res!135083) b!162042))

(assert (= (and b!162042 res!135082) b!162044))

(assert (= (and b!162044 res!135081) b!162038))

(assert (= start!33938 b!162037))

(declare-fun m!257143 () Bool)

(assert (=> bm!2732 m!257143))

(declare-fun m!257145 () Bool)

(assert (=> b!162041 m!257145))

(assert (=> b!162041 m!257145))

(declare-fun m!257147 () Bool)

(assert (=> b!162041 m!257147))

(declare-fun m!257149 () Bool)

(assert (=> start!33938 m!257149))

(declare-fun m!257151 () Bool)

(assert (=> start!33938 m!257151))

(declare-fun m!257153 () Bool)

(assert (=> b!162036 m!257153))

(declare-fun m!257155 () Bool)

(assert (=> b!162036 m!257155))

(assert (=> b!162036 m!257155))

(declare-fun m!257157 () Bool)

(assert (=> b!162036 m!257157))

(declare-fun m!257159 () Bool)

(assert (=> b!162036 m!257159))

(declare-fun m!257161 () Bool)

(assert (=> b!162036 m!257161))

(declare-fun m!257163 () Bool)

(assert (=> b!162036 m!257163))

(declare-fun m!257165 () Bool)

(assert (=> b!162036 m!257165))

(declare-fun m!257167 () Bool)

(assert (=> b!162036 m!257167))

(assert (=> b!162036 m!257155))

(declare-fun m!257169 () Bool)

(assert (=> b!162036 m!257169))

(declare-fun m!257171 () Bool)

(assert (=> b!162036 m!257171))

(declare-fun m!257173 () Bool)

(assert (=> b!162036 m!257173))

(declare-fun m!257175 () Bool)

(assert (=> b!162042 m!257175))

(declare-fun m!257177 () Bool)

(assert (=> b!162042 m!257177))

(declare-fun m!257179 () Bool)

(assert (=> b!162037 m!257179))

(declare-fun m!257181 () Bool)

(assert (=> b!162040 m!257181))

(assert (=> b!162040 m!257167))

(declare-fun m!257183 () Bool)

(assert (=> b!162040 m!257183))

(declare-fun m!257185 () Bool)

(assert (=> b!162040 m!257185))

(declare-fun m!257187 () Bool)

(assert (=> b!162040 m!257187))

(declare-fun m!257189 () Bool)

(assert (=> b!162040 m!257189))

(declare-fun m!257191 () Bool)

(assert (=> b!162040 m!257191))

(assert (=> b!162040 m!257163))

(assert (=> b!162040 m!257145))

(declare-fun m!257193 () Bool)

(assert (=> b!162040 m!257193))

(declare-fun m!257195 () Bool)

(assert (=> b!162040 m!257195))

(declare-fun m!257197 () Bool)

(assert (=> b!162040 m!257197))

(declare-fun m!257199 () Bool)

(assert (=> b!162044 m!257199))

(declare-fun m!257201 () Bool)

(assert (=> b!162038 m!257201))

(declare-fun m!257203 () Bool)

(assert (=> b!162038 m!257203))

(push 1)

(assert (not b!162038))

(assert (not b!162037))

(assert (not b!162041))

(assert (not bm!2732))

(assert (not b!162036))

(assert (not start!33938))

(assert (not b!162044))

(assert (not b!162040))

(assert (not b!162042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55529 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55529 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) ((_ sign_extend 32) (currentByte!7559 thiss!1602)) ((_ sign_extend 32) (currentBit!7554 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) ((_ sign_extend 32) (currentByte!7559 thiss!1602)) ((_ sign_extend 32) (currentBit!7554 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13807 () Bool)

(assert (= bs!13807 d!55529))

(declare-fun m!257461 () Bool)

(assert (=> bs!13807 m!257461))

(assert (=> start!33938 d!55529))

(declare-fun d!55535 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55535 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7554 thiss!1602) (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602))))))

(declare-fun bs!13808 () Bool)

(assert (= bs!13808 d!55535))

(declare-fun m!257467 () Bool)

(assert (=> bs!13808 m!257467))

(assert (=> start!33938 d!55535))

(declare-fun d!55539 () Bool)

(declare-fun res!135210 () Bool)

(declare-fun e!111861 () Bool)

(assert (=> d!55539 (=> (not res!135210) (not e!111861))))

(assert (=> d!55539 (= res!135210 (= (size!3601 (buf!4059 thiss!1602)) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (=> d!55539 (= (isPrefixOf!0 thiss!1602 (_3!582 lt!255169)) e!111861)))

(declare-fun b!162201 () Bool)

(declare-fun res!135211 () Bool)

(assert (=> b!162201 (=> (not res!135211) (not e!111861))))

(assert (=> b!162201 (= res!135211 (bvsle (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun b!162202 () Bool)

(declare-fun e!111862 () Bool)

(assert (=> b!162202 (= e!111861 e!111862)))

(declare-fun res!135209 () Bool)

(assert (=> b!162202 (=> res!135209 e!111862)))

(assert (=> b!162202 (= res!135209 (= (size!3601 (buf!4059 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162203 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8031 array!8031 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162203 (= e!111862 (arrayBitRangesEq!0 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(assert (= (and d!55539 res!135210) b!162201))

(assert (= (and b!162201 res!135211) b!162202))

(assert (= (and b!162202 (not res!135209)) b!162203))

(assert (=> b!162201 m!257177))

(assert (=> b!162201 m!257175))

(assert (=> b!162203 m!257177))

(assert (=> b!162203 m!257177))

(declare-fun m!257481 () Bool)

(assert (=> b!162203 m!257481))

(assert (=> b!162044 d!55539))

(declare-fun d!55547 () Bool)

(declare-fun res!135225 () Bool)

(declare-fun e!111876 () Bool)

(assert (=> d!55547 (=> res!135225 e!111876)))

(assert (=> d!55547 (= res!135225 (= #b00000000000000000000000000000000 (currentByte!7559 thiss!1602)))))

(assert (=> d!55547 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (currentByte!7559 thiss!1602)) e!111876)))

(declare-fun b!162217 () Bool)

(declare-fun e!111877 () Bool)

(assert (=> b!162217 (= e!111876 e!111877)))

(declare-fun res!135226 () Bool)

(assert (=> b!162217 (=> (not res!135226) (not e!111877))))

(assert (=> b!162217 (= res!135226 (= (select (arr!4522 (buf!4059 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) #b00000000000000000000000000000000)))))

(declare-fun b!162218 () Bool)

(assert (=> b!162218 (= e!111877 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)))))

(assert (= (and d!55547 (not res!135225)) b!162217))

(assert (= (and b!162217 res!135226) b!162218))

(declare-fun m!257499 () Bool)

(assert (=> b!162217 m!257499))

(declare-fun m!257501 () Bool)

(assert (=> b!162217 m!257501))

(declare-fun m!257503 () Bool)

(assert (=> b!162218 m!257503))

(assert (=> bm!2732 d!55547))

(declare-fun d!55561 () Bool)

(declare-fun res!135227 () Bool)

(declare-fun e!111878 () Bool)

(assert (=> d!55561 (=> res!135227 e!111878)))

(assert (=> d!55561 (= res!135227 (= #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55561 (= (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!111878)))

(declare-fun b!162219 () Bool)

(declare-fun e!111879 () Bool)

(assert (=> b!162219 (= e!111878 e!111879)))

(declare-fun res!135228 () Bool)

(assert (=> b!162219 (=> (not res!135228) (not e!111879))))

(assert (=> b!162219 (= res!135228 (= (select (arr!4522 (buf!4059 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4522 lt!255164) #b00000000000000000000000000000000)))))

(declare-fun b!162220 () Bool)

(assert (=> b!162220 (= e!111879 (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55561 (not res!135227)) b!162219))

(assert (= (and b!162219 res!135228) b!162220))

(assert (=> b!162219 m!257499))

(declare-fun m!257505 () Bool)

(assert (=> b!162219 m!257505))

(declare-fun m!257507 () Bool)

(assert (=> b!162220 m!257507))

(assert (=> b!162040 d!55561))

(declare-fun d!55563 () Bool)

(declare-fun res!135229 () Bool)

(declare-fun e!111880 () Bool)

(assert (=> d!55563 (=> res!135229 e!111880)))

(assert (=> d!55563 (= res!135229 (= #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55563 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!111880)))

(declare-fun b!162221 () Bool)

(declare-fun e!111881 () Bool)

(assert (=> b!162221 (= e!111880 e!111881)))

(declare-fun res!135230 () Bool)

(assert (=> b!162221 (=> (not res!135230) (not e!111881))))

(assert (=> b!162221 (= res!135230 (= (select (arr!4522 (buf!4059 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162222 () Bool)

(assert (=> b!162222 (= e!111881 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55563 (not res!135229)) b!162221))

(assert (= (and b!162221 res!135230) b!162222))

(assert (=> b!162221 m!257499))

(declare-fun m!257509 () Bool)

(assert (=> b!162221 m!257509))

(declare-fun m!257511 () Bool)

(assert (=> b!162222 m!257511))

(assert (=> b!162040 d!55563))

(declare-fun d!55565 () Bool)

(declare-fun e!111884 () Bool)

(assert (=> d!55565 e!111884))

(declare-fun res!135233 () Bool)

(assert (=> d!55565 (=> (not res!135233) (not e!111884))))

(assert (=> d!55565 (= res!135233 (and (bvsge (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (size!3601 (buf!4059 thiss!1602)))))))

(declare-fun lt!255448 () Unit!11180)

(declare-fun choose!180 (array!8031 (_ BitVec 32) (_ BitVec 8)) Unit!11180)

(assert (=> d!55565 (= lt!255448 (choose!180 (buf!4059 thiss!1602) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170))))

(assert (=> d!55565 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55565 (= (arrayUpdatedAtPrefixLemma!161 (buf!4059 thiss!1602) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) lt!255448)))

(declare-fun b!162225 () Bool)

(assert (=> b!162225 (= e!111884 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55565 res!135233) b!162225))

(declare-fun m!257513 () Bool)

(assert (=> d!55565 m!257513))

(assert (=> b!162225 m!257191))

(assert (=> b!162225 m!257197))

(assert (=> b!162040 d!55565))

(declare-fun d!55567 () Bool)

(declare-fun res!135238 () Bool)

(declare-fun e!111887 () Bool)

(assert (=> d!55567 (=> res!135238 e!111887)))

(assert (=> d!55567 (= res!135238 (= #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55567 (= (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))) e!111887)))

(declare-fun b!162230 () Bool)

(declare-fun e!111888 () Bool)

(assert (=> b!162230 (= e!111887 e!111888)))

(declare-fun res!135239 () Bool)

(assert (=> b!162230 (=> (not res!135239) (not e!111888))))

(assert (=> b!162230 (= res!135239 (= (select (arr!4522 lt!255164) #b00000000000000000000000000000000) (select (arr!4522 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162231 () Bool)

(assert (=> b!162231 (= e!111888 (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55567 (not res!135238)) b!162230))

(assert (= (and b!162230 res!135239) b!162231))

(assert (=> b!162230 m!257505))

(declare-fun m!257515 () Bool)

(assert (=> b!162230 m!257515))

(declare-fun m!257517 () Bool)

(assert (=> b!162231 m!257517))

(assert (=> b!162036 d!55567))

(declare-fun d!55569 () Bool)

(declare-fun res!135240 () Bool)

(declare-fun e!111889 () Bool)

(assert (=> d!55569 (=> res!135240 e!111889)))

(assert (=> d!55569 (= res!135240 (= #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55569 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!111889)))

(declare-fun b!162232 () Bool)

(declare-fun e!111890 () Bool)

(assert (=> b!162232 (= e!111889 e!111890)))

(declare-fun res!135241 () Bool)

(assert (=> b!162232 (=> (not res!135241) (not e!111890))))

(assert (=> b!162232 (= res!135241 (= (select (arr!4522 (buf!4059 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) #b00000000000000000000000000000000)))))

(declare-fun b!162233 () Bool)

(assert (=> b!162233 (= e!111890 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55569 (not res!135240)) b!162232))

(assert (= (and b!162232 res!135241) b!162233))

(assert (=> b!162232 m!257499))

(assert (=> b!162232 m!257501))

(declare-fun m!257519 () Bool)

(assert (=> b!162233 m!257519))

(assert (=> b!162036 d!55569))

(declare-fun d!55571 () Bool)

(assert (=> d!55571 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001))))

(declare-fun lt!255475 () Unit!11180)

(declare-fun choose!181 (array!8031 array!8031 array!8031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11180)

(assert (=> d!55571 (= lt!255475 (choose!181 (buf!4059 thiss!1602) lt!255164 (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55571 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55571 (= (arrayRangesEqTransitive!148 (buf!4059 thiss!1602) lt!255164 (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) lt!255475)))

(declare-fun bs!13810 () Bool)

(assert (= bs!13810 d!55571))

(assert (=> bs!13810 m!257159))

(declare-fun m!257525 () Bool)

(assert (=> bs!13810 m!257525))

(assert (=> b!162036 d!55571))

(declare-fun d!55575 () Bool)

(declare-fun res!135246 () Bool)

(declare-fun e!111893 () Bool)

(assert (=> d!55575 (=> res!135246 e!111893)))

(assert (=> d!55575 (= res!135246 (= #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55575 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))) e!111893)))

(declare-fun b!162238 () Bool)

(declare-fun e!111894 () Bool)

(assert (=> b!162238 (= e!111893 e!111894)))

(declare-fun res!135247 () Bool)

(assert (=> b!162238 (=> (not res!135247) (not e!111894))))

(assert (=> b!162238 (= res!135247 (= (select (arr!4522 (buf!4059 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162239 () Bool)

(assert (=> b!162239 (= e!111894 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55575 (not res!135246)) b!162238))

(assert (= (and b!162238 res!135247) b!162239))

(assert (=> b!162238 m!257499))

(declare-fun m!257527 () Bool)

(assert (=> b!162238 m!257527))

(declare-fun m!257529 () Bool)

(assert (=> b!162239 m!257529))

(assert (=> b!162036 d!55575))

(declare-fun d!55577 () Bool)

(declare-fun e!111895 () Bool)

(assert (=> d!55577 e!111895))

(declare-fun res!135248 () Bool)

(assert (=> d!55577 (=> (not res!135248) (not e!111895))))

(assert (=> d!55577 (= res!135248 (and (bvsge (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000000) (bvslt (currentByte!7559 (_3!582 lt!255169)) (size!3601 lt!255164))))))

(declare-fun lt!255476 () Unit!11180)

(assert (=> d!55577 (= lt!255476 (choose!180 lt!255164 (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))))))

(assert (=> d!55577 (and (bvsle #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))) (bvslt (currentByte!7559 (_3!582 lt!255169)) (size!3601 lt!255164)))))

(assert (=> d!55577 (= (arrayUpdatedAtPrefixLemma!161 lt!255164 (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) lt!255476)))

(declare-fun b!162240 () Bool)

(assert (=> b!162240 (= e!111895 (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55577 res!135248) b!162240))

(assert (=> d!55577 m!257155))

(declare-fun m!257531 () Bool)

(assert (=> d!55577 m!257531))

(declare-fun m!257533 () Bool)

(assert (=> b!162240 m!257533))

(declare-fun m!257535 () Bool)

(assert (=> b!162240 m!257535))

(assert (=> b!162036 d!55577))

(declare-fun d!55579 () Bool)

(declare-fun e!111896 () Bool)

(assert (=> d!55579 e!111896))

(declare-fun res!135249 () Bool)

(assert (=> d!55579 (=> (not res!135249) (not e!111896))))

(assert (=> d!55579 (= res!135249 (and (bvsge (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000000) (bvslt (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 thiss!1602)))))))

(declare-fun lt!255477 () Unit!11180)

(assert (=> d!55579 (= lt!255477 (choose!180 (buf!4059 thiss!1602) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))))))

(assert (=> d!55579 (and (bvsle #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))) (bvslt (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55579 (= (arrayUpdatedAtPrefixLemma!161 (buf!4059 thiss!1602) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) lt!255477)))

(declare-fun b!162241 () Bool)

(assert (=> b!162241 (= e!111896 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55579 res!135249) b!162241))

(assert (=> d!55579 m!257155))

(declare-fun m!257537 () Bool)

(assert (=> d!55579 m!257537))

(assert (=> b!162241 m!257165))

(assert (=> b!162241 m!257161))

(assert (=> b!162036 d!55579))

(declare-fun d!55581 () Bool)

(assert (=> d!55581 (= (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602)) lt!255168 #b00000000000000000000000000000000 (currentBit!7554 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7554 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7554 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!255168) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7554 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13811 () Bool)

(assert (= bs!13811 d!55581))

(declare-fun m!257539 () Bool)

(assert (=> bs!13811 m!257539))

(declare-fun m!257541 () Bool)

(assert (=> bs!13811 m!257541))

(assert (=> b!162041 d!55581))

(declare-fun d!55583 () Bool)

(assert (=> d!55583 (= (array_inv!3348 (buf!4059 thiss!1602)) (bvsge (size!3601 (buf!4059 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!162037 d!55583))

(declare-fun d!55585 () Bool)

(declare-fun e!111899 () Bool)

(assert (=> d!55585 e!111899))

(declare-fun res!135255 () Bool)

(assert (=> d!55585 (=> (not res!135255) (not e!111899))))

(declare-fun lt!255492 () (_ BitVec 64))

(declare-fun lt!255495 () (_ BitVec 64))

(declare-fun lt!255491 () (_ BitVec 64))

(assert (=> d!55585 (= res!135255 (= lt!255491 (bvsub lt!255495 lt!255492)))))

(assert (=> d!55585 (or (= (bvand lt!255495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255495 lt!255492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55585 (= lt!255492 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_3!582 lt!255169)))) ((_ sign_extend 32) (currentByte!7559 (_3!582 lt!255169))) ((_ sign_extend 32) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun lt!255490 () (_ BitVec 64))

(declare-fun lt!255494 () (_ BitVec 64))

(assert (=> d!55585 (= lt!255495 (bvmul lt!255490 lt!255494))))

(assert (=> d!55585 (or (= lt!255490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255494 (bvsdiv (bvmul lt!255490 lt!255494) lt!255490)))))

(assert (=> d!55585 (= lt!255494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55585 (= lt!255490 ((_ sign_extend 32) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (=> d!55585 (= lt!255491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_3!582 lt!255169))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_3!582 lt!255169)))))))

(assert (=> d!55585 (invariant!0 (currentBit!7554 (_3!582 lt!255169)) (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 (_3!582 lt!255169))))))

(assert (=> d!55585 (= (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169))) lt!255491)))

(declare-fun b!162246 () Bool)

(declare-fun res!135254 () Bool)

(assert (=> b!162246 (=> (not res!135254) (not e!111899))))

(assert (=> b!162246 (= res!135254 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255491))))

(declare-fun b!162247 () Bool)

(declare-fun lt!255493 () (_ BitVec 64))

(assert (=> b!162247 (= e!111899 (bvsle lt!255491 (bvmul lt!255493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162247 (or (= lt!255493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255493)))))

(assert (=> b!162247 (= lt!255493 ((_ sign_extend 32) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (= (and d!55585 res!135255) b!162246))

(assert (= (and b!162246 res!135254) b!162247))

(declare-fun m!257543 () Bool)

(assert (=> d!55585 m!257543))

(declare-fun m!257545 () Bool)

(assert (=> d!55585 m!257545))

(assert (=> b!162042 d!55585))

(declare-fun d!55587 () Bool)

(declare-fun e!111900 () Bool)

(assert (=> d!55587 e!111900))

(declare-fun res!135257 () Bool)

(assert (=> d!55587 (=> (not res!135257) (not e!111900))))

(declare-fun lt!255501 () (_ BitVec 64))

(declare-fun lt!255497 () (_ BitVec 64))

(declare-fun lt!255498 () (_ BitVec 64))

(assert (=> d!55587 (= res!135257 (= lt!255497 (bvsub lt!255501 lt!255498)))))

(assert (=> d!55587 (or (= (bvand lt!255501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255501 lt!255498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55587 (= lt!255498 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) ((_ sign_extend 32) (currentByte!7559 thiss!1602)) ((_ sign_extend 32) (currentBit!7554 thiss!1602))))))

(declare-fun lt!255496 () (_ BitVec 64))

(declare-fun lt!255500 () (_ BitVec 64))

(assert (=> d!55587 (= lt!255501 (bvmul lt!255496 lt!255500))))

(assert (=> d!55587 (or (= lt!255496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255500 (bvsdiv (bvmul lt!255496 lt!255500) lt!255496)))))

(assert (=> d!55587 (= lt!255500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55587 (= lt!255496 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55587 (= lt!255497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 thiss!1602))))))

(assert (=> d!55587 (invariant!0 (currentBit!7554 thiss!1602) (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602)))))

(assert (=> d!55587 (= (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) lt!255497)))

(declare-fun b!162248 () Bool)

(declare-fun res!135256 () Bool)

(assert (=> b!162248 (=> (not res!135256) (not e!111900))))

(assert (=> b!162248 (= res!135256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255497))))

(declare-fun b!162249 () Bool)

(declare-fun lt!255499 () (_ BitVec 64))

(assert (=> b!162249 (= e!111900 (bvsle lt!255497 (bvmul lt!255499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162249 (or (= lt!255499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255499)))))

(assert (=> b!162249 (= lt!255499 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))))))

(assert (= (and d!55587 res!135257) b!162248))

(assert (= (and b!162248 res!135256) b!162249))

(assert (=> d!55587 m!257461))

(assert (=> d!55587 m!257467))

(assert (=> b!162042 d!55587))

(declare-fun d!55589 () Bool)

(declare-datatypes ((tuple2!14484 0))(
  ( (tuple2!14485 (_1!7827 (_ BitVec 8)) (_2!7827 BitStream!6370)) )
))
(declare-fun lt!255504 () tuple2!14484)

(declare-fun readByte!0 (BitStream!6370) tuple2!14484)

(assert (=> d!55589 (= lt!255504 (readByte!0 (_1!7817 lt!255167)))))

(assert (=> d!55589 (= (readBytePure!0 (_1!7817 lt!255167)) (tuple2!14471 (_2!7827 lt!255504) (_1!7827 lt!255504)))))

(declare-fun bs!13812 () Bool)

(assert (= bs!13812 d!55589))

(declare-fun m!257547 () Bool)

(assert (=> bs!13812 m!257547))

(assert (=> b!162038 d!55589))

(declare-fun d!55591 () Bool)

(declare-fun e!111906 () Bool)

(assert (=> d!55591 e!111906))

(declare-fun res!135264 () Bool)

(assert (=> d!55591 (=> (not res!135264) (not e!111906))))

(declare-fun lt!255550 () tuple2!14468)

(assert (=> d!55591 (= res!135264 (isPrefixOf!0 (_1!7817 lt!255550) (_2!7817 lt!255550)))))

(declare-fun lt!255552 () BitStream!6370)

(assert (=> d!55591 (= lt!255550 (tuple2!14469 lt!255552 (_3!582 lt!255169)))))

(declare-fun lt!255559 () Unit!11180)

(declare-fun lt!255564 () Unit!11180)

(assert (=> d!55591 (= lt!255559 lt!255564)))

(assert (=> d!55591 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6370 BitStream!6370 BitStream!6370) Unit!11180)

(assert (=> d!55591 (= lt!255564 (lemmaIsPrefixTransitive!0 lt!255552 (_3!582 lt!255169) (_3!582 lt!255169)))))

(declare-fun lt!255549 () Unit!11180)

(declare-fun lt!255553 () Unit!11180)

(assert (=> d!55591 (= lt!255549 lt!255553)))

(assert (=> d!55591 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(assert (=> d!55591 (= lt!255553 (lemmaIsPrefixTransitive!0 lt!255552 thiss!1602 (_3!582 lt!255169)))))

(declare-fun lt!255562 () Unit!11180)

(declare-fun e!111905 () Unit!11180)

(assert (=> d!55591 (= lt!255562 e!111905)))

(declare-fun c!8489 () Bool)

(assert (=> d!55591 (= c!8489 (not (= (size!3601 (buf!4059 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!255556 () Unit!11180)

(declare-fun lt!255555 () Unit!11180)

(assert (=> d!55591 (= lt!255556 lt!255555)))

(assert (=> d!55591 (isPrefixOf!0 (_3!582 lt!255169) (_3!582 lt!255169))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6370) Unit!11180)

(assert (=> d!55591 (= lt!255555 (lemmaIsPrefixRefl!0 (_3!582 lt!255169)))))

(declare-fun lt!255557 () Unit!11180)

(declare-fun lt!255558 () Unit!11180)

(assert (=> d!55591 (= lt!255557 lt!255558)))

(assert (=> d!55591 (= lt!255558 (lemmaIsPrefixRefl!0 (_3!582 lt!255169)))))

(declare-fun lt!255545 () Unit!11180)

(declare-fun lt!255563 () Unit!11180)

(assert (=> d!55591 (= lt!255545 lt!255563)))

(assert (=> d!55591 (isPrefixOf!0 lt!255552 lt!255552)))

(assert (=> d!55591 (= lt!255563 (lemmaIsPrefixRefl!0 lt!255552))))

(declare-fun lt!255548 () Unit!11180)

(declare-fun lt!255561 () Unit!11180)

(assert (=> d!55591 (= lt!255548 lt!255561)))

(assert (=> d!55591 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55591 (= lt!255561 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!55591 (= lt!255552 (BitStream!6371 (buf!4059 (_3!582 lt!255169)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)))))

(assert (=> d!55591 (isPrefixOf!0 thiss!1602 (_3!582 lt!255169))))

(assert (=> d!55591 (= (reader!0 thiss!1602 (_3!582 lt!255169)) lt!255550)))

(declare-fun lt!255554 () (_ BitVec 64))

(declare-fun b!162260 () Bool)

(declare-fun lt!255551 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6370 (_ BitVec 64)) BitStream!6370)

(assert (=> b!162260 (= e!111906 (= (_1!7817 lt!255550) (withMovedBitIndex!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554))))))

(assert (=> b!162260 (or (= (bvand lt!255551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255551 lt!255554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162260 (= lt!255554 (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169))))))

(assert (=> b!162260 (= lt!255551 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)))))

(declare-fun b!162261 () Bool)

(declare-fun lt!255547 () Unit!11180)

(assert (=> b!162261 (= e!111905 lt!255547)))

(declare-fun lt!255560 () (_ BitVec 64))

(assert (=> b!162261 (= lt!255560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!255546 () (_ BitVec 64))

(assert (=> b!162261 (= lt!255546 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8031 array!8031 (_ BitVec 64) (_ BitVec 64)) Unit!11180)

(assert (=> b!162261 (= lt!255547 (arrayBitRangesEqSymmetric!0 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) lt!255560 lt!255546))))

(assert (=> b!162261 (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) lt!255560 lt!255546)))

(declare-fun b!162262 () Bool)

(declare-fun res!135265 () Bool)

(assert (=> b!162262 (=> (not res!135265) (not e!111906))))

(assert (=> b!162262 (= res!135265 (isPrefixOf!0 (_1!7817 lt!255550) thiss!1602))))

(declare-fun b!162263 () Bool)

(declare-fun Unit!11200 () Unit!11180)

(assert (=> b!162263 (= e!111905 Unit!11200)))

(declare-fun b!162264 () Bool)

(declare-fun res!135266 () Bool)

(assert (=> b!162264 (=> (not res!135266) (not e!111906))))

(assert (=> b!162264 (= res!135266 (isPrefixOf!0 (_2!7817 lt!255550) (_3!582 lt!255169)))))

(assert (= (and d!55591 c!8489) b!162261))

(assert (= (and d!55591 (not c!8489)) b!162263))

(assert (= (and d!55591 res!135264) b!162262))

(assert (= (and b!162262 res!135265) b!162264))

(assert (= (and b!162264 res!135266) b!162260))

(assert (=> b!162261 m!257177))

(declare-fun m!257549 () Bool)

(assert (=> b!162261 m!257549))

(declare-fun m!257551 () Bool)

(assert (=> b!162261 m!257551))

(declare-fun m!257553 () Bool)

(assert (=> d!55591 m!257553))

(declare-fun m!257555 () Bool)

(assert (=> d!55591 m!257555))

(declare-fun m!257557 () Bool)

(assert (=> d!55591 m!257557))

(declare-fun m!257559 () Bool)

(assert (=> d!55591 m!257559))

(declare-fun m!257561 () Bool)

(assert (=> d!55591 m!257561))

(declare-fun m!257563 () Bool)

(assert (=> d!55591 m!257563))

(declare-fun m!257565 () Bool)

(assert (=> d!55591 m!257565))

(declare-fun m!257567 () Bool)

(assert (=> d!55591 m!257567))

(declare-fun m!257569 () Bool)

(assert (=> d!55591 m!257569))

(assert (=> d!55591 m!257199))

(declare-fun m!257571 () Bool)

(assert (=> d!55591 m!257571))

(declare-fun m!257573 () Bool)

(assert (=> b!162260 m!257573))

(assert (=> b!162260 m!257175))

(assert (=> b!162260 m!257177))

(declare-fun m!257575 () Bool)

(assert (=> b!162262 m!257575))

(declare-fun m!257577 () Bool)

(assert (=> b!162264 m!257577))

(assert (=> b!162038 d!55591))

(push 1)

(assert (not b!162262))

(assert (not d!55587))

(assert (not d!55589))

(assert (not b!162225))

(assert (not b!162241))

(assert (not b!162261))

(assert (not b!162203))

(assert (not d!55585))

(assert (not b!162220))

(assert (not d!55535))

(assert (not b!162260))

(assert (not b!162240))

(assert (not d!55565))

(assert (not b!162218))

(assert (not b!162233))

(assert (not d!55529))

(assert (not d!55577))

(assert (not d!55571))

(assert (not b!162222))

(assert (not b!162201))

(assert (not b!162264))

(assert (not d!55579))

(assert (not b!162239))

(assert (not b!162231))

(assert (not d!55591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55885 () Bool)

(declare-fun res!135560 () Bool)

(declare-fun e!112191 () Bool)

(assert (=> d!55885 (=> (not res!135560) (not e!112191))))

(assert (=> d!55885 (= res!135560 (= (size!3601 (buf!4059 (_2!7817 lt!255550))) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (=> d!55885 (= (isPrefixOf!0 (_2!7817 lt!255550) (_3!582 lt!255169)) e!112191)))

(declare-fun b!162601 () Bool)

(declare-fun res!135561 () Bool)

(assert (=> b!162601 (=> (not res!135561) (not e!112191))))

(assert (=> b!162601 (= res!135561 (bvsle (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))) (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun b!162602 () Bool)

(declare-fun e!112192 () Bool)

(assert (=> b!162602 (= e!112191 e!112192)))

(declare-fun res!135559 () Bool)

(assert (=> b!162602 (=> res!135559 e!112192)))

(assert (=> b!162602 (= res!135559 (= (size!3601 (buf!4059 (_2!7817 lt!255550))) #b00000000000000000000000000000000))))

(declare-fun b!162603 () Bool)

(assert (=> b!162603 (= e!112192 (arrayBitRangesEq!0 (buf!4059 (_2!7817 lt!255550)) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550)))))))

(assert (= (and d!55885 res!135560) b!162601))

(assert (= (and b!162601 res!135561) b!162602))

(assert (= (and b!162602 (not res!135559)) b!162603))

(declare-fun m!258165 () Bool)

(assert (=> b!162601 m!258165))

(assert (=> b!162601 m!257175))

(assert (=> b!162603 m!258165))

(assert (=> b!162603 m!258165))

(declare-fun m!258167 () Bool)

(assert (=> b!162603 m!258167))

(assert (=> b!162264 d!55885))

(declare-fun d!55887 () Bool)

(assert (=> d!55887 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001))))

(assert (=> d!55887 true))

(declare-fun _$8!143 () Unit!11180)

(assert (=> d!55887 (= (choose!180 (buf!4059 thiss!1602) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) _$8!143)))

(declare-fun bs!13859 () Bool)

(assert (= bs!13859 d!55887))

(assert (=> bs!13859 m!257191))

(assert (=> bs!13859 m!257197))

(assert (=> d!55565 d!55887))

(declare-fun d!55889 () Bool)

(declare-fun res!135563 () Bool)

(declare-fun e!112193 () Bool)

(assert (=> d!55889 (=> (not res!135563) (not e!112193))))

(assert (=> d!55889 (= res!135563 (= (size!3601 (buf!4059 (_1!7817 lt!255550))) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55889 (= (isPrefixOf!0 (_1!7817 lt!255550) thiss!1602) e!112193)))

(declare-fun b!162604 () Bool)

(declare-fun res!135564 () Bool)

(assert (=> b!162604 (=> (not res!135564) (not e!112193))))

(assert (=> b!162604 (= res!135564 (bvsle (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550))) (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(declare-fun b!162605 () Bool)

(declare-fun e!112194 () Bool)

(assert (=> b!162605 (= e!112193 e!112194)))

(declare-fun res!135562 () Bool)

(assert (=> b!162605 (=> res!135562 e!112194)))

(assert (=> b!162605 (= res!135562 (= (size!3601 (buf!4059 (_1!7817 lt!255550))) #b00000000000000000000000000000000))))

(declare-fun b!162606 () Bool)

(assert (=> b!162606 (= e!112194 (arrayBitRangesEq!0 (buf!4059 (_1!7817 lt!255550)) (buf!4059 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(assert (= (and d!55889 res!135563) b!162604))

(assert (= (and b!162604 res!135564) b!162605))

(assert (= (and b!162605 (not res!135562)) b!162606))

(declare-fun m!258169 () Bool)

(assert (=> b!162604 m!258169))

(assert (=> b!162604 m!257177))

(assert (=> b!162606 m!258169))

(assert (=> b!162606 m!258169))

(declare-fun m!258171 () Bool)

(assert (=> b!162606 m!258171))

(assert (=> b!162262 d!55889))

(assert (=> b!162241 d!55575))

(assert (=> b!162201 d!55587))

(assert (=> b!162201 d!55585))

(declare-fun d!55891 () Bool)

(assert (=> d!55891 (= (invariant!0 (currentBit!7554 thiss!1602) (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602))) (and (bvsge (currentBit!7554 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7554 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7559 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602))) (and (= (currentBit!7554 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7559 thiss!1602) (size!3601 (buf!4059 thiss!1602)))))))))

(assert (=> d!55535 d!55891))

(declare-fun d!55893 () Bool)

(assert (=> d!55893 (= (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) ((_ sign_extend 32) (currentByte!7559 thiss!1602)) ((_ sign_extend 32) (currentBit!7554 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3601 (buf!4059 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 thiss!1602)))))))

(assert (=> d!55587 d!55893))

(assert (=> d!55587 d!55891))

(declare-fun d!55895 () Bool)

(declare-fun res!135565 () Bool)

(declare-fun e!112195 () Bool)

(assert (=> d!55895 (=> res!135565 e!112195)))

(assert (=> d!55895 (= res!135565 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55895 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112195)))

(declare-fun b!162607 () Bool)

(declare-fun e!112196 () Bool)

(assert (=> b!162607 (= e!112195 e!112196)))

(declare-fun res!135566 () Bool)

(assert (=> b!162607 (=> (not res!135566) (not e!112196))))

(assert (=> b!162607 (= res!135566 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162608 () Bool)

(assert (=> b!162608 (= e!112196 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55895 (not res!135565)) b!162607))

(assert (= (and b!162607 res!135566) b!162608))

(declare-fun m!258173 () Bool)

(assert (=> b!162607 m!258173))

(declare-fun m!258175 () Bool)

(assert (=> b!162607 m!258175))

(declare-fun m!258177 () Bool)

(assert (=> b!162608 m!258177))

(assert (=> b!162233 d!55895))

(declare-fun d!55897 () Bool)

(assert (=> d!55897 (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169)))))

(assert (=> d!55897 true))

(declare-fun _$8!144 () Unit!11180)

(assert (=> d!55897 (= (choose!180 lt!255164 (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) _$8!144)))

(declare-fun bs!13860 () Bool)

(assert (= bs!13860 d!55897))

(assert (=> bs!13860 m!257533))

(assert (=> bs!13860 m!257535))

(assert (=> d!55577 d!55897))

(declare-fun e!112214 () Bool)

(declare-fun b!162623 () Bool)

(declare-datatypes ((tuple4!238 0))(
  ( (tuple4!239 (_1!7834 (_ BitVec 32)) (_2!7834 (_ BitVec 32)) (_3!587 (_ BitVec 32)) (_4!119 (_ BitVec 32))) )
))
(declare-fun lt!255830 () tuple4!238)

(declare-fun lt!255829 () (_ BitVec 32))

(assert (=> b!162623 (= e!112214 (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255830)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255830)) #b00000000000000000000000000000000 lt!255829))))

(declare-fun c!8514 () Bool)

(declare-fun call!2766 () Bool)

(declare-fun lt!255831 () (_ BitVec 32))

(declare-fun bm!2763 () Bool)

(assert (=> bm!2763 (= call!2766 (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255830)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255830)) lt!255831 (ite c!8514 lt!255829 #b00000000000000000000000000001000)))))

(declare-fun b!162625 () Bool)

(declare-fun e!112210 () Bool)

(declare-fun e!112209 () Bool)

(assert (=> b!162625 (= e!112210 e!112209)))

(declare-fun res!135581 () Bool)

(assert (=> b!162625 (=> (not res!135581) (not e!112209))))

(declare-fun e!112213 () Bool)

(assert (=> b!162625 (= res!135581 e!112213)))

(declare-fun res!135578 () Bool)

(assert (=> b!162625 (=> res!135578 e!112213)))

(assert (=> b!162625 (= res!135578 (bvsge (_1!7834 lt!255830) (_2!7834 lt!255830)))))

(assert (=> b!162625 (= lt!255829 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162625 (= lt!255831 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!238)

(assert (=> b!162625 (= lt!255830 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(declare-fun b!162626 () Bool)

(declare-fun e!112211 () Bool)

(assert (=> b!162626 (= e!112209 e!112211)))

(assert (=> b!162626 (= c!8514 (= (_3!587 lt!255830) (_4!119 lt!255830)))))

(declare-fun b!162627 () Bool)

(assert (=> b!162627 (= e!112211 call!2766)))

(declare-fun b!162624 () Bool)

(declare-fun e!112212 () Bool)

(assert (=> b!162624 (= e!112211 e!112212)))

(declare-fun res!135577 () Bool)

(assert (=> b!162624 (= res!135577 call!2766)))

(assert (=> b!162624 (=> (not res!135577) (not e!112212))))

(declare-fun d!55899 () Bool)

(declare-fun res!135579 () Bool)

(assert (=> d!55899 (=> res!135579 e!112210)))

(assert (=> d!55899 (= res!135579 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(assert (=> d!55899 (= (arrayBitRangesEq!0 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))) e!112210)))

(declare-fun b!162628 () Bool)

(declare-fun res!135580 () Bool)

(assert (=> b!162628 (= res!135580 (= lt!255829 #b00000000000000000000000000000000))))

(assert (=> b!162628 (=> res!135580 e!112214)))

(assert (=> b!162628 (= e!112212 e!112214)))

(declare-fun b!162629 () Bool)

(assert (=> b!162629 (= e!112213 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (_1!7834 lt!255830) (_2!7834 lt!255830)))))

(assert (= (and d!55899 (not res!135579)) b!162625))

(assert (= (and b!162625 (not res!135578)) b!162629))

(assert (= (and b!162625 res!135581) b!162626))

(assert (= (and b!162626 c!8514) b!162627))

(assert (= (and b!162626 (not c!8514)) b!162624))

(assert (= (and b!162624 res!135577) b!162628))

(assert (= (and b!162628 (not res!135580)) b!162623))

(assert (= (or b!162627 b!162624) bm!2763))

(declare-fun m!258179 () Bool)

(assert (=> b!162623 m!258179))

(declare-fun m!258181 () Bool)

(assert (=> b!162623 m!258181))

(assert (=> b!162623 m!258179))

(assert (=> b!162623 m!258181))

(declare-fun m!258183 () Bool)

(assert (=> b!162623 m!258183))

(declare-fun m!258185 () Bool)

(assert (=> bm!2763 m!258185))

(declare-fun m!258187 () Bool)

(assert (=> bm!2763 m!258187))

(assert (=> bm!2763 m!258185))

(assert (=> bm!2763 m!258187))

(declare-fun m!258189 () Bool)

(assert (=> bm!2763 m!258189))

(assert (=> b!162625 m!257177))

(declare-fun m!258191 () Bool)

(assert (=> b!162625 m!258191))

(declare-fun m!258193 () Bool)

(assert (=> b!162629 m!258193))

(assert (=> b!162203 d!55899))

(assert (=> b!162203 d!55587))

(declare-fun d!55901 () Bool)

(assert (=> d!55901 (= (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_3!582 lt!255169)))) ((_ sign_extend 32) (currentByte!7559 (_3!582 lt!255169))) ((_ sign_extend 32) (currentBit!7554 (_3!582 lt!255169)))) (bvsub (bvmul ((_ sign_extend 32) (size!3601 (buf!4059 (_3!582 lt!255169)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_3!582 lt!255169))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_3!582 lt!255169))))))))

(assert (=> d!55585 d!55901))

(declare-fun d!55903 () Bool)

(assert (=> d!55903 (= (invariant!0 (currentBit!7554 (_3!582 lt!255169)) (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 (_3!582 lt!255169)))) (and (bvsge (currentBit!7554 (_3!582 lt!255169)) #b00000000000000000000000000000000) (bvslt (currentBit!7554 (_3!582 lt!255169)) #b00000000000000000000000000001000) (bvsge (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 (_3!582 lt!255169)))) (and (= (currentBit!7554 (_3!582 lt!255169)) #b00000000000000000000000000000000) (= (currentByte!7559 (_3!582 lt!255169)) (size!3601 (buf!4059 (_3!582 lt!255169))))))))))

(assert (=> d!55585 d!55903))

(declare-fun d!55905 () Bool)

(declare-fun res!135582 () Bool)

(declare-fun e!112215 () Bool)

(assert (=> d!55905 (=> res!135582 e!112215)))

(assert (=> d!55905 (= res!135582 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55905 (= (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112215)))

(declare-fun b!162630 () Bool)

(declare-fun e!112216 () Bool)

(assert (=> b!162630 (= e!112215 e!112216)))

(declare-fun res!135583 () Bool)

(assert (=> b!162630 (=> (not res!135583) (not e!112216))))

(assert (=> b!162630 (= res!135583 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162631 () Bool)

(assert (=> b!162631 (= e!112216 (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55905 (not res!135582)) b!162630))

(assert (= (and b!162630 res!135583) b!162631))

(assert (=> b!162630 m!258173))

(declare-fun m!258195 () Bool)

(assert (=> b!162630 m!258195))

(declare-fun m!258197 () Bool)

(assert (=> b!162631 m!258197))

(assert (=> b!162220 d!55905))

(assert (=> d!55571 d!55569))

(declare-fun d!55907 () Bool)

(assert (=> d!55907 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001))))

(assert (=> d!55907 true))

(declare-fun _$16!68 () Unit!11180)

(assert (=> d!55907 (= (choose!181 (buf!4059 thiss!1602) lt!255164 (buf!4059 (_3!582 lt!255169)) #b00000000000000000000000000000000 (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) _$16!68)))

(declare-fun bs!13861 () Bool)

(assert (= bs!13861 d!55907))

(assert (=> bs!13861 m!257159))

(assert (=> d!55571 d!55907))

(declare-fun d!55909 () Bool)

(declare-fun res!135584 () Bool)

(declare-fun e!112217 () Bool)

(assert (=> d!55909 (=> res!135584 e!112217)))

(assert (=> d!55909 (= res!135584 (= #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55909 (= (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169))) e!112217)))

(declare-fun b!162632 () Bool)

(declare-fun e!112218 () Bool)

(assert (=> b!162632 (= e!112217 e!112218)))

(declare-fun res!135585 () Bool)

(assert (=> b!162632 (=> (not res!135585) (not e!112218))))

(assert (=> b!162632 (= res!135585 (= (select (arr!4522 lt!255164) #b00000000000000000000000000000000) (select (arr!4522 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164))) #b00000000000000000000000000000000)))))

(declare-fun b!162633 () Bool)

(assert (=> b!162633 (= e!112218 (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55909 (not res!135584)) b!162632))

(assert (= (and b!162632 res!135585) b!162633))

(assert (=> b!162632 m!257505))

(declare-fun m!258199 () Bool)

(assert (=> b!162632 m!258199))

(declare-fun m!258201 () Bool)

(assert (=> b!162633 m!258201))

(assert (=> b!162240 d!55909))

(declare-fun d!55911 () Bool)

(assert (=> d!55911 (isPrefixOf!0 thiss!1602 thiss!1602)))

(declare-fun lt!255834 () Unit!11180)

(declare-fun choose!11 (BitStream!6370) Unit!11180)

(assert (=> d!55911 (= lt!255834 (choose!11 thiss!1602))))

(assert (=> d!55911 (= (lemmaIsPrefixRefl!0 thiss!1602) lt!255834)))

(declare-fun bs!13863 () Bool)

(assert (= bs!13863 d!55911))

(assert (=> bs!13863 m!257563))

(declare-fun m!258203 () Bool)

(assert (=> bs!13863 m!258203))

(assert (=> d!55591 d!55911))

(declare-fun d!55913 () Bool)

(assert (=> d!55913 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(declare-fun lt!255837 () Unit!11180)

(declare-fun choose!30 (BitStream!6370 BitStream!6370 BitStream!6370) Unit!11180)

(assert (=> d!55913 (= lt!255837 (choose!30 lt!255552 (_3!582 lt!255169) (_3!582 lt!255169)))))

(assert (=> d!55913 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(assert (=> d!55913 (= (lemmaIsPrefixTransitive!0 lt!255552 (_3!582 lt!255169) (_3!582 lt!255169)) lt!255837)))

(declare-fun bs!13864 () Bool)

(assert (= bs!13864 d!55913))

(assert (=> bs!13864 m!257571))

(declare-fun m!258205 () Bool)

(assert (=> bs!13864 m!258205))

(assert (=> bs!13864 m!257571))

(assert (=> d!55591 d!55913))

(declare-fun d!55915 () Bool)

(assert (=> d!55915 (isPrefixOf!0 (_3!582 lt!255169) (_3!582 lt!255169))))

(declare-fun lt!255838 () Unit!11180)

(assert (=> d!55915 (= lt!255838 (choose!11 (_3!582 lt!255169)))))

(assert (=> d!55915 (= (lemmaIsPrefixRefl!0 (_3!582 lt!255169)) lt!255838)))

(declare-fun bs!13865 () Bool)

(assert (= bs!13865 d!55915))

(assert (=> bs!13865 m!257555))

(declare-fun m!258207 () Bool)

(assert (=> bs!13865 m!258207))

(assert (=> d!55591 d!55915))

(declare-fun d!55917 () Bool)

(declare-fun res!135587 () Bool)

(declare-fun e!112219 () Bool)

(assert (=> d!55917 (=> (not res!135587) (not e!112219))))

(assert (=> d!55917 (= res!135587 (= (size!3601 (buf!4059 (_3!582 lt!255169))) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (=> d!55917 (= (isPrefixOf!0 (_3!582 lt!255169) (_3!582 lt!255169)) e!112219)))

(declare-fun b!162634 () Bool)

(declare-fun res!135588 () Bool)

(assert (=> b!162634 (=> (not res!135588) (not e!112219))))

(assert (=> b!162634 (= res!135588 (bvsle (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169))) (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun b!162635 () Bool)

(declare-fun e!112220 () Bool)

(assert (=> b!162635 (= e!112219 e!112220)))

(declare-fun res!135586 () Bool)

(assert (=> b!162635 (=> res!135586 e!112220)))

(assert (=> b!162635 (= res!135586 (= (size!3601 (buf!4059 (_3!582 lt!255169))) #b00000000000000000000000000000000))))

(declare-fun b!162636 () Bool)

(assert (=> b!162636 (= e!112220 (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(assert (= (and d!55917 res!135587) b!162634))

(assert (= (and b!162634 res!135588) b!162635))

(assert (= (and b!162635 (not res!135586)) b!162636))

(assert (=> b!162634 m!257175))

(assert (=> b!162634 m!257175))

(assert (=> b!162636 m!257175))

(assert (=> b!162636 m!257175))

(declare-fun m!258209 () Bool)

(assert (=> b!162636 m!258209))

(assert (=> d!55591 d!55917))

(declare-fun d!55919 () Bool)

(assert (=> d!55919 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(declare-fun lt!255839 () Unit!11180)

(assert (=> d!55919 (= lt!255839 (choose!30 lt!255552 thiss!1602 (_3!582 lt!255169)))))

(assert (=> d!55919 (isPrefixOf!0 lt!255552 thiss!1602)))

(assert (=> d!55919 (= (lemmaIsPrefixTransitive!0 lt!255552 thiss!1602 (_3!582 lt!255169)) lt!255839)))

(declare-fun bs!13866 () Bool)

(assert (= bs!13866 d!55919))

(assert (=> bs!13866 m!257571))

(declare-fun m!258211 () Bool)

(assert (=> bs!13866 m!258211))

(declare-fun m!258213 () Bool)

(assert (=> bs!13866 m!258213))

(assert (=> d!55591 d!55919))

(declare-fun d!55921 () Bool)

(declare-fun res!135590 () Bool)

(declare-fun e!112221 () Bool)

(assert (=> d!55921 (=> (not res!135590) (not e!112221))))

(assert (=> d!55921 (= res!135590 (= (size!3601 (buf!4059 lt!255552)) (size!3601 (buf!4059 lt!255552))))))

(assert (=> d!55921 (= (isPrefixOf!0 lt!255552 lt!255552) e!112221)))

(declare-fun b!162637 () Bool)

(declare-fun res!135591 () Bool)

(assert (=> b!162637 (=> (not res!135591) (not e!112221))))

(assert (=> b!162637 (= res!135591 (bvsle (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(declare-fun b!162638 () Bool)

(declare-fun e!112222 () Bool)

(assert (=> b!162638 (= e!112221 e!112222)))

(declare-fun res!135589 () Bool)

(assert (=> b!162638 (=> res!135589 e!112222)))

(assert (=> b!162638 (= res!135589 (= (size!3601 (buf!4059 lt!255552)) #b00000000000000000000000000000000))))

(declare-fun b!162639 () Bool)

(assert (=> b!162639 (= e!112222 (arrayBitRangesEq!0 (buf!4059 lt!255552) (buf!4059 lt!255552) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(assert (= (and d!55921 res!135590) b!162637))

(assert (= (and b!162637 res!135591) b!162638))

(assert (= (and b!162638 (not res!135589)) b!162639))

(declare-fun m!258215 () Bool)

(assert (=> b!162637 m!258215))

(assert (=> b!162637 m!258215))

(assert (=> b!162639 m!258215))

(assert (=> b!162639 m!258215))

(declare-fun m!258217 () Bool)

(assert (=> b!162639 m!258217))

(assert (=> d!55591 d!55921))

(declare-fun d!55923 () Bool)

(declare-fun res!135593 () Bool)

(declare-fun e!112223 () Bool)

(assert (=> d!55923 (=> (not res!135593) (not e!112223))))

(assert (=> d!55923 (= res!135593 (= (size!3601 (buf!4059 (_1!7817 lt!255550))) (size!3601 (buf!4059 (_2!7817 lt!255550)))))))

(assert (=> d!55923 (= (isPrefixOf!0 (_1!7817 lt!255550) (_2!7817 lt!255550)) e!112223)))

(declare-fun b!162640 () Bool)

(declare-fun res!135594 () Bool)

(assert (=> b!162640 (=> (not res!135594) (not e!112223))))

(assert (=> b!162640 (= res!135594 (bvsle (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550))) (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550)))))))

(declare-fun b!162641 () Bool)

(declare-fun e!112224 () Bool)

(assert (=> b!162641 (= e!112223 e!112224)))

(declare-fun res!135592 () Bool)

(assert (=> b!162641 (=> res!135592 e!112224)))

(assert (=> b!162641 (= res!135592 (= (size!3601 (buf!4059 (_1!7817 lt!255550))) #b00000000000000000000000000000000))))

(declare-fun b!162642 () Bool)

(assert (=> b!162642 (= e!112224 (arrayBitRangesEq!0 (buf!4059 (_1!7817 lt!255550)) (buf!4059 (_2!7817 lt!255550)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(assert (= (and d!55923 res!135593) b!162640))

(assert (= (and b!162640 res!135594) b!162641))

(assert (= (and b!162641 (not res!135592)) b!162642))

(assert (=> b!162640 m!258169))

(assert (=> b!162640 m!258165))

(assert (=> b!162642 m!258169))

(assert (=> b!162642 m!258169))

(declare-fun m!258219 () Bool)

(assert (=> b!162642 m!258219))

(assert (=> d!55591 d!55923))

(declare-fun d!55925 () Bool)

(declare-fun res!135596 () Bool)

(declare-fun e!112225 () Bool)

(assert (=> d!55925 (=> (not res!135596) (not e!112225))))

(assert (=> d!55925 (= res!135596 (= (size!3601 (buf!4059 lt!255552)) (size!3601 (buf!4059 (_3!582 lt!255169)))))))

(assert (=> d!55925 (= (isPrefixOf!0 lt!255552 (_3!582 lt!255169)) e!112225)))

(declare-fun b!162643 () Bool)

(declare-fun res!135597 () Bool)

(assert (=> b!162643 (=> (not res!135597) (not e!112225))))

(assert (=> b!162643 (= res!135597 (bvsle (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun b!162644 () Bool)

(declare-fun e!112226 () Bool)

(assert (=> b!162644 (= e!112225 e!112226)))

(declare-fun res!135595 () Bool)

(assert (=> b!162644 (=> res!135595 e!112226)))

(assert (=> b!162644 (= res!135595 (= (size!3601 (buf!4059 lt!255552)) #b00000000000000000000000000000000))))

(declare-fun b!162645 () Bool)

(assert (=> b!162645 (= e!112226 (arrayBitRangesEq!0 (buf!4059 lt!255552) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(assert (= (and d!55925 res!135596) b!162643))

(assert (= (and b!162643 res!135597) b!162644))

(assert (= (and b!162644 (not res!135595)) b!162645))

(assert (=> b!162643 m!258215))

(assert (=> b!162643 m!257175))

(assert (=> b!162645 m!258215))

(assert (=> b!162645 m!258215))

(declare-fun m!258221 () Bool)

(assert (=> b!162645 m!258221))

(assert (=> d!55591 d!55925))

(declare-fun d!55927 () Bool)

(assert (=> d!55927 (isPrefixOf!0 lt!255552 lt!255552)))

(declare-fun lt!255840 () Unit!11180)

(assert (=> d!55927 (= lt!255840 (choose!11 lt!255552))))

(assert (=> d!55927 (= (lemmaIsPrefixRefl!0 lt!255552) lt!255840)))

(declare-fun bs!13867 () Bool)

(assert (= bs!13867 d!55927))

(assert (=> bs!13867 m!257567))

(declare-fun m!258223 () Bool)

(assert (=> bs!13867 m!258223))

(assert (=> d!55591 d!55927))

(assert (=> d!55591 d!55539))

(declare-fun d!55929 () Bool)

(declare-fun res!135599 () Bool)

(declare-fun e!112227 () Bool)

(assert (=> d!55929 (=> (not res!135599) (not e!112227))))

(assert (=> d!55929 (= res!135599 (= (size!3601 (buf!4059 thiss!1602)) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55929 (= (isPrefixOf!0 thiss!1602 thiss!1602) e!112227)))

(declare-fun b!162646 () Bool)

(declare-fun res!135600 () Bool)

(assert (=> b!162646 (=> (not res!135600) (not e!112227))))

(assert (=> b!162646 (= res!135600 (bvsle (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(declare-fun b!162647 () Bool)

(declare-fun e!112228 () Bool)

(assert (=> b!162647 (= e!112227 e!112228)))

(declare-fun res!135598 () Bool)

(assert (=> b!162647 (=> res!135598 e!112228)))

(assert (=> b!162647 (= res!135598 (= (size!3601 (buf!4059 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162648 () Bool)

(assert (=> b!162648 (= e!112228 (arrayBitRangesEq!0 (buf!4059 thiss!1602) (buf!4059 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(assert (= (and d!55929 res!135599) b!162646))

(assert (= (and b!162646 res!135600) b!162647))

(assert (= (and b!162647 (not res!135598)) b!162648))

(assert (=> b!162646 m!257177))

(assert (=> b!162646 m!257177))

(assert (=> b!162648 m!257177))

(assert (=> b!162648 m!257177))

(declare-fun m!258225 () Bool)

(assert (=> b!162648 m!258225))

(assert (=> d!55591 d!55929))

(declare-fun d!55931 () Bool)

(declare-fun res!135601 () Bool)

(declare-fun e!112229 () Bool)

(assert (=> d!55931 (=> res!135601 e!112229)))

(assert (=> d!55931 (= res!135601 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)))))

(assert (=> d!55931 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)) e!112229)))

(declare-fun b!162649 () Bool)

(declare-fun e!112230 () Bool)

(assert (=> b!162649 (= e!112229 e!112230)))

(declare-fun res!135602 () Bool)

(assert (=> b!162649 (=> (not res!135602) (not e!112230))))

(assert (=> b!162649 (= res!135602 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162650 () Bool)

(assert (=> b!162650 (= e!112230 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)))))

(assert (= (and d!55931 (not res!135601)) b!162649))

(assert (= (and b!162649 res!135602) b!162650))

(assert (=> b!162649 m!258173))

(assert (=> b!162649 m!258175))

(declare-fun m!258227 () Bool)

(assert (=> b!162650 m!258227))

(assert (=> b!162218 d!55931))

(declare-fun d!55933 () Bool)

(declare-fun res!135603 () Bool)

(declare-fun e!112231 () Bool)

(assert (=> d!55933 (=> res!135603 e!112231)))

(assert (=> d!55933 (= res!135603 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55933 (= (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) e!112231)))

(declare-fun b!162651 () Bool)

(declare-fun e!112232 () Bool)

(assert (=> b!162651 (= e!112231 e!112232)))

(declare-fun res!135604 () Bool)

(assert (=> b!162651 (=> (not res!135604) (not e!112232))))

(assert (=> b!162651 (= res!135604 (= (select (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162652 () Bool)

(assert (=> b!162652 (= e!112232 (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55933 (not res!135603)) b!162651))

(assert (= (and b!162651 res!135604) b!162652))

(assert (=> b!162651 m!258195))

(declare-fun m!258229 () Bool)

(assert (=> b!162651 m!258229))

(declare-fun m!258231 () Bool)

(assert (=> b!162652 m!258231))

(assert (=> b!162231 d!55933))

(declare-fun d!55935 () Bool)

(assert (=> d!55935 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7559 (_3!582 lt!255169)))))

(assert (=> d!55935 true))

(declare-fun _$8!145 () Unit!11180)

(assert (=> d!55935 (= (choose!180 (buf!4059 thiss!1602) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) _$8!145)))

(declare-fun bs!13868 () Bool)

(assert (= bs!13868 d!55935))

(assert (=> bs!13868 m!257165))

(assert (=> bs!13868 m!257161))

(assert (=> d!55579 d!55935))

(declare-fun d!55937 () Bool)

(declare-fun res!135605 () Bool)

(declare-fun e!112233 () Bool)

(assert (=> d!55937 (=> res!135605 e!112233)))

(assert (=> d!55937 (= res!135605 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55937 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112233)))

(declare-fun b!162653 () Bool)

(declare-fun e!112234 () Bool)

(assert (=> b!162653 (= e!112233 e!112234)))

(declare-fun res!135606 () Bool)

(assert (=> b!162653 (=> (not res!135606) (not e!112234))))

(assert (=> b!162653 (= res!135606 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162654 () Bool)

(assert (=> b!162654 (= e!112234 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55937 (not res!135605)) b!162653))

(assert (= (and b!162653 res!135606) b!162654))

(assert (=> b!162653 m!258173))

(declare-fun m!258233 () Bool)

(assert (=> b!162653 m!258233))

(declare-fun m!258235 () Bool)

(assert (=> b!162654 m!258235))

(assert (=> b!162222 d!55937))

(assert (=> d!55529 d!55893))

(declare-fun d!55939 () Bool)

(declare-fun res!135607 () Bool)

(declare-fun e!112235 () Bool)

(assert (=> d!55939 (=> res!135607 e!112235)))

(assert (=> d!55939 (= res!135607 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55939 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) e!112235)))

(declare-fun b!162655 () Bool)

(declare-fun e!112236 () Bool)

(assert (=> b!162655 (= e!112235 e!112236)))

(declare-fun res!135608 () Bool)

(assert (=> b!162655 (=> (not res!135608) (not e!112236))))

(assert (=> b!162655 (= res!135608 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162656 () Bool)

(assert (=> b!162656 (= e!112236 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55939 (not res!135607)) b!162655))

(assert (= (and b!162655 res!135608) b!162656))

(assert (=> b!162655 m!258173))

(declare-fun m!258237 () Bool)

(assert (=> b!162655 m!258237))

(declare-fun m!258239 () Bool)

(assert (=> b!162656 m!258239))

(assert (=> b!162239 d!55939))

(declare-fun d!55941 () Bool)

(declare-fun lt!255859 () (_ BitVec 8))

(declare-fun lt!255861 () (_ BitVec 8))

(assert (=> d!55941 (= lt!255859 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_1!7817 lt!255167))) (currentByte!7559 (_1!7817 lt!255167)))) ((_ sign_extend 24) lt!255861))))))

(assert (=> d!55941 (= lt!255861 ((_ extract 7 0) (currentBit!7554 (_1!7817 lt!255167))))))

(declare-fun e!112242 () Bool)

(assert (=> d!55941 e!112242))

(declare-fun res!135615 () Bool)

(assert (=> d!55941 (=> (not res!135615) (not e!112242))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!55941 (= res!135615 (validate_offset_bits!1 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))) ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255167))) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255167))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14494 0))(
  ( (tuple2!14495 (_1!7835 Unit!11180) (_2!7835 (_ BitVec 8))) )
))
(declare-fun Unit!11221 () Unit!11180)

(declare-fun Unit!11222 () Unit!11180)

(assert (=> d!55941 (= (readByte!0 (_1!7817 lt!255167)) (tuple2!14485 (_2!7835 (ite (bvsgt ((_ sign_extend 24) lt!255861) #b00000000000000000000000000000000) (tuple2!14495 Unit!11221 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255859) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_1!7817 lt!255167))) (bvadd (currentByte!7559 (_1!7817 lt!255167)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255861)))))))) (tuple2!14495 Unit!11222 lt!255859))) (BitStream!6371 (buf!4059 (_1!7817 lt!255167)) (bvadd (currentByte!7559 (_1!7817 lt!255167)) #b00000000000000000000000000000001) (currentBit!7554 (_1!7817 lt!255167)))))))

(declare-fun b!162661 () Bool)

(declare-fun e!112241 () Bool)

(assert (=> b!162661 (= e!112242 e!112241)))

(declare-fun res!135614 () Bool)

(assert (=> b!162661 (=> (not res!135614) (not e!112241))))

(declare-fun lt!255856 () tuple2!14484)

(assert (=> b!162661 (= res!135614 (= (buf!4059 (_2!7827 lt!255856)) (buf!4059 (_1!7817 lt!255167))))))

(declare-fun lt!255860 () (_ BitVec 8))

(declare-fun lt!255855 () (_ BitVec 8))

(declare-fun Unit!11223 () Unit!11180)

(declare-fun Unit!11224 () Unit!11180)

(assert (=> b!162661 (= lt!255856 (tuple2!14485 (_2!7835 (ite (bvsgt ((_ sign_extend 24) lt!255860) #b00000000000000000000000000000000) (tuple2!14495 Unit!11223 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255855) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_1!7817 lt!255167))) (bvadd (currentByte!7559 (_1!7817 lt!255167)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255860)))))))) (tuple2!14495 Unit!11224 lt!255855))) (BitStream!6371 (buf!4059 (_1!7817 lt!255167)) (bvadd (currentByte!7559 (_1!7817 lt!255167)) #b00000000000000000000000000000001) (currentBit!7554 (_1!7817 lt!255167)))))))

(assert (=> b!162661 (= lt!255855 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_1!7817 lt!255167))) (currentByte!7559 (_1!7817 lt!255167)))) ((_ sign_extend 24) lt!255860))))))

(assert (=> b!162661 (= lt!255860 ((_ extract 7 0) (currentBit!7554 (_1!7817 lt!255167))))))

(declare-fun lt!255858 () (_ BitVec 64))

(declare-fun b!162662 () Bool)

(declare-fun lt!255857 () (_ BitVec 64))

(assert (=> b!162662 (= e!112241 (= (bitIndex!0 (size!3601 (buf!4059 (_2!7827 lt!255856))) (currentByte!7559 (_2!7827 lt!255856)) (currentBit!7554 (_2!7827 lt!255856))) (bvadd lt!255857 lt!255858)))))

(assert (=> b!162662 (or (not (= (bvand lt!255857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255858 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255857 lt!255858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162662 (= lt!255858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!162662 (= lt!255857 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255167))) (currentByte!7559 (_1!7817 lt!255167)) (currentBit!7554 (_1!7817 lt!255167))))))

(assert (= (and d!55941 res!135615) b!162661))

(assert (= (and b!162661 res!135614) b!162662))

(declare-fun m!258241 () Bool)

(assert (=> d!55941 m!258241))

(declare-fun m!258243 () Bool)

(assert (=> d!55941 m!258243))

(declare-fun m!258245 () Bool)

(assert (=> d!55941 m!258245))

(assert (=> b!162661 m!258245))

(assert (=> b!162661 m!258241))

(declare-fun m!258247 () Bool)

(assert (=> b!162662 m!258247))

(declare-fun m!258249 () Bool)

(assert (=> b!162662 m!258249))

(assert (=> d!55589 d!55941))

(assert (=> b!162261 d!55587))

(declare-fun d!55943 () Bool)

(assert (=> d!55943 (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) lt!255560 lt!255546)))

(declare-fun lt!255864 () Unit!11180)

(declare-fun choose!8 (array!8031 array!8031 (_ BitVec 64) (_ BitVec 64)) Unit!11180)

(assert (=> d!55943 (= lt!255864 (choose!8 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) lt!255560 lt!255546))))

(assert (=> d!55943 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255560) (bvsle lt!255560 lt!255546))))

(assert (=> d!55943 (= (arrayBitRangesEqSymmetric!0 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) lt!255560 lt!255546) lt!255864)))

(declare-fun bs!13869 () Bool)

(assert (= bs!13869 d!55943))

(assert (=> bs!13869 m!257551))

(declare-fun m!258251 () Bool)

(assert (=> bs!13869 m!258251))

(assert (=> b!162261 d!55943))

(declare-fun b!162663 () Bool)

(declare-fun e!112248 () Bool)

(declare-fun lt!255865 () (_ BitVec 32))

(declare-fun lt!255866 () tuple4!238)

(assert (=> b!162663 (= e!112248 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255866)) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255866)) #b00000000000000000000000000000000 lt!255865))))

(declare-fun lt!255867 () (_ BitVec 32))

(declare-fun call!2767 () Bool)

(declare-fun c!8515 () Bool)

(declare-fun bm!2764 () Bool)

(assert (=> bm!2764 (= call!2767 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255866)) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255866)) lt!255867 (ite c!8515 lt!255865 #b00000000000000000000000000001000)))))

(declare-fun b!162665 () Bool)

(declare-fun e!112244 () Bool)

(declare-fun e!112243 () Bool)

(assert (=> b!162665 (= e!112244 e!112243)))

(declare-fun res!135620 () Bool)

(assert (=> b!162665 (=> (not res!135620) (not e!112243))))

(declare-fun e!112247 () Bool)

(assert (=> b!162665 (= res!135620 e!112247)))

(declare-fun res!135617 () Bool)

(assert (=> b!162665 (=> res!135617 e!112247)))

(assert (=> b!162665 (= res!135617 (bvsge (_1!7834 lt!255866) (_2!7834 lt!255866)))))

(assert (=> b!162665 (= lt!255865 ((_ extract 31 0) (bvsrem lt!255546 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162665 (= lt!255867 ((_ extract 31 0) (bvsrem lt!255560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162665 (= lt!255866 (arrayBitIndices!0 lt!255560 lt!255546))))

(declare-fun b!162666 () Bool)

(declare-fun e!112245 () Bool)

(assert (=> b!162666 (= e!112243 e!112245)))

(assert (=> b!162666 (= c!8515 (= (_3!587 lt!255866) (_4!119 lt!255866)))))

(declare-fun b!162667 () Bool)

(assert (=> b!162667 (= e!112245 call!2767)))

(declare-fun b!162664 () Bool)

(declare-fun e!112246 () Bool)

(assert (=> b!162664 (= e!112245 e!112246)))

(declare-fun res!135616 () Bool)

(assert (=> b!162664 (= res!135616 call!2767)))

(assert (=> b!162664 (=> (not res!135616) (not e!112246))))

(declare-fun d!55945 () Bool)

(declare-fun res!135618 () Bool)

(assert (=> d!55945 (=> res!135618 e!112244)))

(assert (=> d!55945 (= res!135618 (bvsge lt!255560 lt!255546))))

(assert (=> d!55945 (= (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) lt!255560 lt!255546) e!112244)))

(declare-fun b!162668 () Bool)

(declare-fun res!135619 () Bool)

(assert (=> b!162668 (= res!135619 (= lt!255865 #b00000000000000000000000000000000))))

(assert (=> b!162668 (=> res!135619 e!112248)))

(assert (=> b!162668 (= e!112246 e!112248)))

(declare-fun b!162669 () Bool)

(assert (=> b!162669 (= e!112247 (arrayRangesEq!553 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) (_1!7834 lt!255866) (_2!7834 lt!255866)))))

(assert (= (and d!55945 (not res!135618)) b!162665))

(assert (= (and b!162665 (not res!135617)) b!162669))

(assert (= (and b!162665 res!135620) b!162666))

(assert (= (and b!162666 c!8515) b!162667))

(assert (= (and b!162666 (not c!8515)) b!162664))

(assert (= (and b!162664 res!135616) b!162668))

(assert (= (and b!162668 (not res!135619)) b!162663))

(assert (= (or b!162667 b!162664) bm!2764))

(declare-fun m!258253 () Bool)

(assert (=> b!162663 m!258253))

(declare-fun m!258255 () Bool)

(assert (=> b!162663 m!258255))

(assert (=> b!162663 m!258253))

(assert (=> b!162663 m!258255))

(declare-fun m!258257 () Bool)

(assert (=> b!162663 m!258257))

(declare-fun m!258259 () Bool)

(assert (=> bm!2764 m!258259))

(declare-fun m!258261 () Bool)

(assert (=> bm!2764 m!258261))

(assert (=> bm!2764 m!258259))

(assert (=> bm!2764 m!258261))

(declare-fun m!258263 () Bool)

(assert (=> bm!2764 m!258263))

(declare-fun m!258265 () Bool)

(assert (=> b!162665 m!258265))

(declare-fun m!258267 () Bool)

(assert (=> b!162669 m!258267))

(assert (=> b!162261 d!55945))

(assert (=> b!162225 d!55563))

(declare-fun d!55947 () Bool)

(declare-fun e!112251 () Bool)

(assert (=> d!55947 e!112251))

(declare-fun res!135623 () Bool)

(assert (=> d!55947 (=> (not res!135623) (not e!112251))))

(declare-fun lt!255872 () BitStream!6370)

(declare-fun lt!255873 () (_ BitVec 64))

(assert (=> d!55947 (= res!135623 (= (bvadd lt!255873 (bvsub lt!255551 lt!255554)) (bitIndex!0 (size!3601 (buf!4059 lt!255872)) (currentByte!7559 lt!255872) (currentBit!7554 lt!255872))))))

(assert (=> d!55947 (or (not (= (bvand lt!255873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255551 lt!255554) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255873 (bvsub lt!255551 lt!255554)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55947 (= lt!255873 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))))))

(declare-datatypes ((tuple2!14496 0))(
  ( (tuple2!14497 (_1!7836 Unit!11180) (_2!7836 BitStream!6370)) )
))
(declare-fun moveBitIndex!0 (BitStream!6370 (_ BitVec 64)) tuple2!14496)

(assert (=> d!55947 (= lt!255872 (_2!7836 (moveBitIndex!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6370 (_ BitVec 64)) Bool)

(assert (=> d!55947 (moveBitIndexPrecond!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554))))

(assert (=> d!55947 (= (withMovedBitIndex!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554)) lt!255872)))

(declare-fun b!162672 () Bool)

(assert (=> b!162672 (= e!112251 (= (size!3601 (buf!4059 (_2!7817 lt!255550))) (size!3601 (buf!4059 lt!255872))))))

(assert (= (and d!55947 res!135623) b!162672))

(declare-fun m!258269 () Bool)

(assert (=> d!55947 m!258269))

(assert (=> d!55947 m!258165))

(declare-fun m!258271 () Bool)

(assert (=> d!55947 m!258271))

(declare-fun m!258273 () Bool)

(assert (=> d!55947 m!258273))

(assert (=> b!162260 d!55947))

(assert (=> b!162260 d!55585))

(assert (=> b!162260 d!55587))

(push 1)

(assert (not b!162623))

(assert (not b!162601))

(assert (not b!162631))

(assert (not b!162662))

(assert (not b!162642))

(assert (not b!162608))

(assert (not b!162603))

(assert (not d!55935))

(assert (not bm!2764))

(assert (not b!162633))

(assert (not b!162648))

(assert (not b!162643))

(assert (not d!55927))

(assert (not b!162625))

(assert (not d!55947))

(assert (not d!55919))

(assert (not b!162663))

(assert (not d!55943))

(assert (not b!162606))

(assert (not b!162650))

(assert (not b!162652))

(assert (not d!55913))

(assert (not b!162604))

(assert (not b!162645))

(assert (not b!162640))

(assert (not d!55907))

(assert (not d!55887))

(assert (not b!162654))

(assert (not d!55915))

(assert (not b!162656))

(assert (not b!162636))

(assert (not d!55941))

(assert (not bm!2763))

(assert (not b!162665))

(assert (not b!162669))

(assert (not b!162639))

(assert (not b!162634))

(assert (not b!162637))

(assert (not b!162629))

(assert (not d!55897))

(assert (not b!162646))

(assert (not d!55911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!55919 d!55925))

(declare-fun d!55949 () Bool)

(assert (=> d!55949 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(assert (=> d!55949 true))

(declare-fun _$15!260 () Unit!11180)

(assert (=> d!55949 (= (choose!30 lt!255552 thiss!1602 (_3!582 lt!255169)) _$15!260)))

(declare-fun bs!13870 () Bool)

(assert (= bs!13870 d!55949))

(assert (=> bs!13870 m!257571))

(assert (=> d!55919 d!55949))

(declare-fun d!55951 () Bool)

(declare-fun res!135625 () Bool)

(declare-fun e!112252 () Bool)

(assert (=> d!55951 (=> (not res!135625) (not e!112252))))

(assert (=> d!55951 (= res!135625 (= (size!3601 (buf!4059 lt!255552)) (size!3601 (buf!4059 thiss!1602))))))

(assert (=> d!55951 (= (isPrefixOf!0 lt!255552 thiss!1602) e!112252)))

(declare-fun b!162673 () Bool)

(declare-fun res!135626 () Bool)

(assert (=> b!162673 (=> (not res!135626) (not e!112252))))

(assert (=> b!162673 (= res!135626 (bvsle (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(declare-fun b!162674 () Bool)

(declare-fun e!112253 () Bool)

(assert (=> b!162674 (= e!112252 e!112253)))

(declare-fun res!135624 () Bool)

(assert (=> b!162674 (=> res!135624 e!112253)))

(assert (=> b!162674 (= res!135624 (= (size!3601 (buf!4059 lt!255552)) #b00000000000000000000000000000000))))

(declare-fun b!162675 () Bool)

(assert (=> b!162675 (= e!112253 (arrayBitRangesEq!0 (buf!4059 lt!255552) (buf!4059 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(assert (= (and d!55951 res!135625) b!162673))

(assert (= (and b!162673 res!135626) b!162674))

(assert (= (and b!162674 (not res!135624)) b!162675))

(assert (=> b!162673 m!258215))

(assert (=> b!162673 m!257177))

(assert (=> b!162675 m!258215))

(assert (=> b!162675 m!258215))

(declare-fun m!258275 () Bool)

(assert (=> b!162675 m!258275))

(assert (=> d!55919 d!55951))

(declare-fun d!55953 () Bool)

(declare-fun res!135627 () Bool)

(declare-fun e!112254 () Bool)

(assert (=> d!55953 (=> res!135627 e!112254)))

(assert (=> d!55953 (= res!135627 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55953 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112254)))

(declare-fun b!162676 () Bool)

(declare-fun e!112255 () Bool)

(assert (=> b!162676 (= e!112254 e!112255)))

(declare-fun res!135628 () Bool)

(assert (=> b!162676 (=> (not res!135628) (not e!112255))))

(assert (=> b!162676 (= res!135628 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162677 () Bool)

(assert (=> b!162677 (= e!112255 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55953 (not res!135627)) b!162676))

(assert (= (and b!162676 res!135628) b!162677))

(declare-fun m!258277 () Bool)

(assert (=> b!162676 m!258277))

(declare-fun m!258279 () Bool)

(assert (=> b!162676 m!258279))

(declare-fun m!258281 () Bool)

(assert (=> b!162677 m!258281))

(assert (=> b!162608 d!55953))

(declare-fun d!55955 () Bool)

(assert (=> d!55955 (= (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255830)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255830)) lt!255831 (ite c!8514 lt!255829 #b00000000000000000000000000001000)) (or (= lt!255831 (ite c!8514 lt!255829 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8514 lt!255829 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255831)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8514 lt!255829 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255831)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13871 () Bool)

(assert (= bs!13871 d!55955))

(declare-fun m!258283 () Bool)

(assert (=> bs!13871 m!258283))

(declare-fun m!258285 () Bool)

(assert (=> bs!13871 m!258285))

(assert (=> bm!2763 d!55955))

(declare-fun e!112261 () Bool)

(declare-fun lt!255875 () tuple4!238)

(declare-fun b!162678 () Bool)

(declare-fun lt!255874 () (_ BitVec 32))

(assert (=> b!162678 (= e!112261 (byteRangesEq!0 (select (arr!4522 (buf!4059 lt!255552)) (_4!119 lt!255875)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255875)) #b00000000000000000000000000000000 lt!255874))))

(declare-fun call!2768 () Bool)

(declare-fun bm!2765 () Bool)

(declare-fun c!8516 () Bool)

(declare-fun lt!255876 () (_ BitVec 32))

(assert (=> bm!2765 (= call!2768 (byteRangesEq!0 (select (arr!4522 (buf!4059 lt!255552)) (_3!587 lt!255875)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255875)) lt!255876 (ite c!8516 lt!255874 #b00000000000000000000000000001000)))))

(declare-fun b!162680 () Bool)

(declare-fun e!112257 () Bool)

(declare-fun e!112256 () Bool)

(assert (=> b!162680 (= e!112257 e!112256)))

(declare-fun res!135633 () Bool)

(assert (=> b!162680 (=> (not res!135633) (not e!112256))))

(declare-fun e!112260 () Bool)

(assert (=> b!162680 (= res!135633 e!112260)))

(declare-fun res!135630 () Bool)

(assert (=> b!162680 (=> res!135630 e!112260)))

(assert (=> b!162680 (= res!135630 (bvsge (_1!7834 lt!255875) (_2!7834 lt!255875)))))

(assert (=> b!162680 (= lt!255874 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162680 (= lt!255876 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162680 (= lt!255875 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(declare-fun b!162681 () Bool)

(declare-fun e!112258 () Bool)

(assert (=> b!162681 (= e!112256 e!112258)))

(assert (=> b!162681 (= c!8516 (= (_3!587 lt!255875) (_4!119 lt!255875)))))

(declare-fun b!162682 () Bool)

(assert (=> b!162682 (= e!112258 call!2768)))

(declare-fun b!162679 () Bool)

(declare-fun e!112259 () Bool)

(assert (=> b!162679 (= e!112258 e!112259)))

(declare-fun res!135629 () Bool)

(assert (=> b!162679 (= res!135629 call!2768)))

(assert (=> b!162679 (=> (not res!135629) (not e!112259))))

(declare-fun d!55957 () Bool)

(declare-fun res!135631 () Bool)

(assert (=> d!55957 (=> res!135631 e!112257)))

(assert (=> d!55957 (= res!135631 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(assert (=> d!55957 (= (arrayBitRangesEq!0 (buf!4059 lt!255552) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))) e!112257)))

(declare-fun b!162683 () Bool)

(declare-fun res!135632 () Bool)

(assert (=> b!162683 (= res!135632 (= lt!255874 #b00000000000000000000000000000000))))

(assert (=> b!162683 (=> res!135632 e!112261)))

(assert (=> b!162683 (= e!112259 e!112261)))

(declare-fun b!162684 () Bool)

(assert (=> b!162684 (= e!112260 (arrayRangesEq!553 (buf!4059 lt!255552) (buf!4059 (_3!582 lt!255169)) (_1!7834 lt!255875) (_2!7834 lt!255875)))))

(assert (= (and d!55957 (not res!135631)) b!162680))

(assert (= (and b!162680 (not res!135630)) b!162684))

(assert (= (and b!162680 res!135633) b!162681))

(assert (= (and b!162681 c!8516) b!162682))

(assert (= (and b!162681 (not c!8516)) b!162679))

(assert (= (and b!162679 res!135629) b!162683))

(assert (= (and b!162683 (not res!135632)) b!162678))

(assert (= (or b!162682 b!162679) bm!2765))

(declare-fun m!258287 () Bool)

(assert (=> b!162678 m!258287))

(declare-fun m!258289 () Bool)

(assert (=> b!162678 m!258289))

(assert (=> b!162678 m!258287))

(assert (=> b!162678 m!258289))

(declare-fun m!258291 () Bool)

(assert (=> b!162678 m!258291))

(declare-fun m!258293 () Bool)

(assert (=> bm!2765 m!258293))

(declare-fun m!258295 () Bool)

(assert (=> bm!2765 m!258295))

(assert (=> bm!2765 m!258293))

(assert (=> bm!2765 m!258295))

(declare-fun m!258297 () Bool)

(assert (=> bm!2765 m!258297))

(assert (=> b!162680 m!258215))

(declare-fun m!258299 () Bool)

(assert (=> b!162680 m!258299))

(declare-fun m!258301 () Bool)

(assert (=> b!162684 m!258301))

(assert (=> b!162645 d!55957))

(declare-fun d!55959 () Bool)

(declare-fun e!112262 () Bool)

(assert (=> d!55959 e!112262))

(declare-fun res!135635 () Bool)

(assert (=> d!55959 (=> (not res!135635) (not e!112262))))

(declare-fun lt!255878 () (_ BitVec 64))

(declare-fun lt!255879 () (_ BitVec 64))

(declare-fun lt!255882 () (_ BitVec 64))

(assert (=> d!55959 (= res!135635 (= lt!255878 (bvsub lt!255882 lt!255879)))))

(assert (=> d!55959 (or (= (bvand lt!255882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255882 lt!255879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55959 (= lt!255879 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255552))) ((_ sign_extend 32) (currentByte!7559 lt!255552)) ((_ sign_extend 32) (currentBit!7554 lt!255552))))))

(declare-fun lt!255877 () (_ BitVec 64))

(declare-fun lt!255881 () (_ BitVec 64))

(assert (=> d!55959 (= lt!255882 (bvmul lt!255877 lt!255881))))

(assert (=> d!55959 (or (= lt!255877 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255881 (bvsdiv (bvmul lt!255877 lt!255881) lt!255877)))))

(assert (=> d!55959 (= lt!255881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55959 (= lt!255877 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255552))))))

(assert (=> d!55959 (= lt!255878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 lt!255552)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 lt!255552))))))

(assert (=> d!55959 (invariant!0 (currentBit!7554 lt!255552) (currentByte!7559 lt!255552) (size!3601 (buf!4059 lt!255552)))))

(assert (=> d!55959 (= (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) lt!255878)))

(declare-fun b!162685 () Bool)

(declare-fun res!135634 () Bool)

(assert (=> b!162685 (=> (not res!135634) (not e!112262))))

(assert (=> b!162685 (= res!135634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255878))))

(declare-fun b!162686 () Bool)

(declare-fun lt!255880 () (_ BitVec 64))

(assert (=> b!162686 (= e!112262 (bvsle lt!255878 (bvmul lt!255880 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162686 (or (= lt!255880 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255880 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255880)))))

(assert (=> b!162686 (= lt!255880 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255552))))))

(assert (= (and d!55959 res!135635) b!162685))

(assert (= (and b!162685 res!135634) b!162686))

(declare-fun m!258303 () Bool)

(assert (=> d!55959 m!258303))

(declare-fun m!258305 () Bool)

(assert (=> d!55959 m!258305))

(assert (=> b!162645 d!55959))

(declare-fun d!55961 () Bool)

(declare-fun res!135636 () Bool)

(declare-fun e!112263 () Bool)

(assert (=> d!55961 (=> res!135636 e!112263)))

(assert (=> d!55961 (= res!135636 (= (_1!7834 lt!255866) (_2!7834 lt!255866)))))

(assert (=> d!55961 (= (arrayRangesEq!553 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) (_1!7834 lt!255866) (_2!7834 lt!255866)) e!112263)))

(declare-fun b!162687 () Bool)

(declare-fun e!112264 () Bool)

(assert (=> b!162687 (= e!112263 e!112264)))

(declare-fun res!135637 () Bool)

(assert (=> b!162687 (=> (not res!135637) (not e!112264))))

(assert (=> b!162687 (= res!135637 (= (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_1!7834 lt!255866)) (select (arr!4522 (buf!4059 thiss!1602)) (_1!7834 lt!255866))))))

(declare-fun b!162688 () Bool)

(assert (=> b!162688 (= e!112264 (arrayRangesEq!553 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) (bvadd (_1!7834 lt!255866) #b00000000000000000000000000000001) (_2!7834 lt!255866)))))

(assert (= (and d!55961 (not res!135636)) b!162687))

(assert (= (and b!162687 res!135637) b!162688))

(declare-fun m!258307 () Bool)

(assert (=> b!162687 m!258307))

(declare-fun m!258309 () Bool)

(assert (=> b!162687 m!258309))

(declare-fun m!258311 () Bool)

(assert (=> b!162688 m!258311))

(assert (=> b!162669 d!55961))

(declare-fun d!55963 () Bool)

(declare-fun res!135638 () Bool)

(declare-fun e!112265 () Bool)

(assert (=> d!55963 (=> res!135638 e!112265)))

(assert (=> d!55963 (= res!135638 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55963 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) e!112265)))

(declare-fun b!162689 () Bool)

(declare-fun e!112266 () Bool)

(assert (=> b!162689 (= e!112265 e!112266)))

(declare-fun res!135639 () Bool)

(assert (=> b!162689 (=> (not res!135639) (not e!112266))))

(assert (=> b!162689 (= res!135639 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162690 () Bool)

(assert (=> b!162690 (= e!112266 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55963 (not res!135638)) b!162689))

(assert (= (and b!162689 res!135639) b!162690))

(assert (=> b!162689 m!258277))

(declare-fun m!258313 () Bool)

(assert (=> b!162689 m!258313))

(declare-fun m!258315 () Bool)

(assert (=> b!162690 m!258315))

(assert (=> b!162656 d!55963))

(assert (=> d!55935 d!55575))

(assert (=> d!55911 d!55929))

(declare-fun d!55965 () Bool)

(assert (=> d!55965 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55965 true))

(declare-fun _$14!287 () Unit!11180)

(assert (=> d!55965 (= (choose!11 thiss!1602) _$14!287)))

(declare-fun bs!13873 () Bool)

(assert (= bs!13873 d!55965))

(assert (=> bs!13873 m!257563))

(assert (=> d!55911 d!55965))

(declare-fun d!55967 () Bool)

(assert (=> d!55967 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))) (tuple4!239 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162625 d!55967))

(assert (=> d!55915 d!55917))

(declare-fun d!55969 () Bool)

(assert (=> d!55969 (isPrefixOf!0 (_3!582 lt!255169) (_3!582 lt!255169))))

(assert (=> d!55969 true))

(declare-fun _$14!288 () Unit!11180)

(assert (=> d!55969 (= (choose!11 (_3!582 lt!255169)) _$14!288)))

(declare-fun bs!13874 () Bool)

(assert (= bs!13874 d!55969))

(assert (=> bs!13874 m!257555))

(assert (=> d!55915 d!55969))

(assert (=> d!55927 d!55921))

(declare-fun d!55971 () Bool)

(assert (=> d!55971 (isPrefixOf!0 lt!255552 lt!255552)))

(assert (=> d!55971 true))

(declare-fun _$14!289 () Unit!11180)

(assert (=> d!55971 (= (choose!11 lt!255552) _$14!289)))

(declare-fun bs!13875 () Bool)

(assert (= bs!13875 d!55971))

(assert (=> bs!13875 m!257567))

(assert (=> d!55927 d!55971))

(declare-fun d!55973 () Bool)

(declare-fun res!135640 () Bool)

(declare-fun e!112267 () Bool)

(assert (=> d!55973 (=> res!135640 e!112267)))

(assert (=> d!55973 (= res!135640 (= (_1!7834 lt!255830) (_2!7834 lt!255830)))))

(assert (=> d!55973 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (_1!7834 lt!255830) (_2!7834 lt!255830)) e!112267)))

(declare-fun b!162691 () Bool)

(declare-fun e!112268 () Bool)

(assert (=> b!162691 (= e!112267 e!112268)))

(declare-fun res!135641 () Bool)

(assert (=> b!162691 (=> (not res!135641) (not e!112268))))

(assert (=> b!162691 (= res!135641 (= (select (arr!4522 (buf!4059 thiss!1602)) (_1!7834 lt!255830)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_1!7834 lt!255830))))))

(declare-fun b!162692 () Bool)

(assert (=> b!162692 (= e!112268 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd (_1!7834 lt!255830) #b00000000000000000000000000000001) (_2!7834 lt!255830)))))

(assert (= (and d!55973 (not res!135640)) b!162691))

(assert (= (and b!162691 res!135641) b!162692))

(declare-fun m!258317 () Bool)

(assert (=> b!162691 m!258317))

(declare-fun m!258319 () Bool)

(assert (=> b!162691 m!258319))

(declare-fun m!258321 () Bool)

(assert (=> b!162692 m!258321))

(assert (=> b!162629 d!55973))

(declare-fun d!55975 () Bool)

(declare-fun e!112269 () Bool)

(assert (=> d!55975 e!112269))

(declare-fun res!135643 () Bool)

(assert (=> d!55975 (=> (not res!135643) (not e!112269))))

(declare-fun lt!255885 () (_ BitVec 64))

(declare-fun lt!255884 () (_ BitVec 64))

(declare-fun lt!255888 () (_ BitVec 64))

(assert (=> d!55975 (= res!135643 (= lt!255884 (bvsub lt!255888 lt!255885)))))

(assert (=> d!55975 (or (= (bvand lt!255888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255888 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255888 lt!255885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55975 (= lt!255885 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255550)))) ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255550))) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255550)))))))

(declare-fun lt!255883 () (_ BitVec 64))

(declare-fun lt!255887 () (_ BitVec 64))

(assert (=> d!55975 (= lt!255888 (bvmul lt!255883 lt!255887))))

(assert (=> d!55975 (or (= lt!255883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255887 (bvsdiv (bvmul lt!255883 lt!255887) lt!255883)))))

(assert (=> d!55975 (= lt!255887 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55975 (= lt!255883 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255550)))))))

(assert (=> d!55975 (= lt!255884 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255550)))))))

(assert (=> d!55975 (invariant!0 (currentBit!7554 (_1!7817 lt!255550)) (currentByte!7559 (_1!7817 lt!255550)) (size!3601 (buf!4059 (_1!7817 lt!255550))))))

(assert (=> d!55975 (= (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550))) lt!255884)))

(declare-fun b!162693 () Bool)

(declare-fun res!135642 () Bool)

(assert (=> b!162693 (=> (not res!135642) (not e!112269))))

(assert (=> b!162693 (= res!135642 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255884))))

(declare-fun b!162694 () Bool)

(declare-fun lt!255886 () (_ BitVec 64))

(assert (=> b!162694 (= e!112269 (bvsle lt!255884 (bvmul lt!255886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162694 (or (= lt!255886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255886)))))

(assert (=> b!162694 (= lt!255886 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255550)))))))

(assert (= (and d!55975 res!135643) b!162693))

(assert (= (and b!162693 res!135642) b!162694))

(declare-fun m!258323 () Bool)

(assert (=> d!55975 m!258323))

(declare-fun m!258325 () Bool)

(assert (=> d!55975 m!258325))

(assert (=> b!162640 d!55975))

(declare-fun d!55977 () Bool)

(declare-fun e!112270 () Bool)

(assert (=> d!55977 e!112270))

(declare-fun res!135645 () Bool)

(assert (=> d!55977 (=> (not res!135645) (not e!112270))))

(declare-fun lt!255891 () (_ BitVec 64))

(declare-fun lt!255890 () (_ BitVec 64))

(declare-fun lt!255894 () (_ BitVec 64))

(assert (=> d!55977 (= res!135645 (= lt!255890 (bvsub lt!255894 lt!255891)))))

(assert (=> d!55977 (or (= (bvand lt!255894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255894 lt!255891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55977 (= lt!255891 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550)))) ((_ sign_extend 32) (currentByte!7559 (_2!7817 lt!255550))) ((_ sign_extend 32) (currentBit!7554 (_2!7817 lt!255550)))))))

(declare-fun lt!255889 () (_ BitVec 64))

(declare-fun lt!255893 () (_ BitVec 64))

(assert (=> d!55977 (= lt!255894 (bvmul lt!255889 lt!255893))))

(assert (=> d!55977 (or (= lt!255889 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255893 (bvsdiv (bvmul lt!255889 lt!255893) lt!255889)))))

(assert (=> d!55977 (= lt!255893 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55977 (= lt!255889 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550)))))))

(assert (=> d!55977 (= lt!255890 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_2!7817 lt!255550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_2!7817 lt!255550)))))))

(assert (=> d!55977 (invariant!0 (currentBit!7554 (_2!7817 lt!255550)) (currentByte!7559 (_2!7817 lt!255550)) (size!3601 (buf!4059 (_2!7817 lt!255550))))))

(assert (=> d!55977 (= (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))) lt!255890)))

(declare-fun b!162695 () Bool)

(declare-fun res!135644 () Bool)

(assert (=> b!162695 (=> (not res!135644) (not e!112270))))

(assert (=> b!162695 (= res!135644 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255890))))

(declare-fun b!162696 () Bool)

(declare-fun lt!255892 () (_ BitVec 64))

(assert (=> b!162696 (= e!112270 (bvsle lt!255890 (bvmul lt!255892 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162696 (or (= lt!255892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255892)))))

(assert (=> b!162696 (= lt!255892 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550)))))))

(assert (= (and d!55977 res!135645) b!162695))

(assert (= (and b!162695 res!135644) b!162696))

(declare-fun m!258327 () Bool)

(assert (=> d!55977 m!258327))

(declare-fun m!258329 () Bool)

(assert (=> d!55977 m!258329))

(assert (=> b!162640 d!55977))

(assert (=> d!55943 d!55945))

(declare-fun d!55979 () Bool)

(assert (=> d!55979 (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 thiss!1602) lt!255560 lt!255546)))

(assert (=> d!55979 true))

(declare-fun _$19!132 () Unit!11180)

(assert (=> d!55979 (= (choose!8 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) lt!255560 lt!255546) _$19!132)))

(declare-fun bs!13876 () Bool)

(assert (= bs!13876 d!55979))

(assert (=> bs!13876 m!257551))

(assert (=> d!55943 d!55979))

(declare-fun d!55981 () Bool)

(declare-fun res!135646 () Bool)

(declare-fun e!112271 () Bool)

(assert (=> d!55981 (=> res!135646 e!112271)))

(assert (=> d!55981 (= res!135646 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)))))

(assert (=> d!55981 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)) e!112271)))

(declare-fun b!162697 () Bool)

(declare-fun e!112272 () Bool)

(assert (=> b!162697 (= e!112271 e!112272)))

(declare-fun res!135647 () Bool)

(assert (=> b!162697 (=> (not res!135647) (not e!112272))))

(assert (=> b!162697 (= res!135647 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162698 () Bool)

(assert (=> b!162698 (= e!112272 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 (_3!582 lt!255169)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 thiss!1602)))))

(assert (= (and d!55981 (not res!135646)) b!162697))

(assert (= (and b!162697 res!135647) b!162698))

(assert (=> b!162697 m!258277))

(assert (=> b!162697 m!258279))

(declare-fun m!258331 () Bool)

(assert (=> b!162698 m!258331))

(assert (=> b!162650 d!55981))

(assert (=> d!55897 d!55909))

(declare-fun d!55983 () Bool)

(assert (=> d!55983 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))) ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255167))) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255167))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))) ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255167))) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255167)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13877 () Bool)

(assert (= bs!13877 d!55983))

(declare-fun m!258333 () Bool)

(assert (=> bs!13877 m!258333))

(assert (=> d!55941 d!55983))

(declare-fun b!162699 () Bool)

(declare-fun lt!255895 () (_ BitVec 32))

(declare-fun lt!255896 () tuple4!238)

(declare-fun e!112278 () Bool)

(assert (=> b!162699 (= e!112278 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_1!7817 lt!255550))) (_4!119 lt!255896)) (select (arr!4522 (buf!4059 (_2!7817 lt!255550))) (_4!119 lt!255896)) #b00000000000000000000000000000000 lt!255895))))

(declare-fun call!2769 () Bool)

(declare-fun lt!255897 () (_ BitVec 32))

(declare-fun c!8517 () Bool)

(declare-fun bm!2766 () Bool)

(assert (=> bm!2766 (= call!2769 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_1!7817 lt!255550))) (_3!587 lt!255896)) (select (arr!4522 (buf!4059 (_2!7817 lt!255550))) (_3!587 lt!255896)) lt!255897 (ite c!8517 lt!255895 #b00000000000000000000000000001000)))))

(declare-fun b!162701 () Bool)

(declare-fun e!112274 () Bool)

(declare-fun e!112273 () Bool)

(assert (=> b!162701 (= e!112274 e!112273)))

(declare-fun res!135652 () Bool)

(assert (=> b!162701 (=> (not res!135652) (not e!112273))))

(declare-fun e!112277 () Bool)

(assert (=> b!162701 (= res!135652 e!112277)))

(declare-fun res!135649 () Bool)

(assert (=> b!162701 (=> res!135649 e!112277)))

(assert (=> b!162701 (= res!135649 (bvsge (_1!7834 lt!255896) (_2!7834 lt!255896)))))

(assert (=> b!162701 (= lt!255895 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162701 (= lt!255897 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162701 (= lt!255896 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(declare-fun b!162702 () Bool)

(declare-fun e!112275 () Bool)

(assert (=> b!162702 (= e!112273 e!112275)))

(assert (=> b!162702 (= c!8517 (= (_3!587 lt!255896) (_4!119 lt!255896)))))

(declare-fun b!162703 () Bool)

(assert (=> b!162703 (= e!112275 call!2769)))

(declare-fun b!162700 () Bool)

(declare-fun e!112276 () Bool)

(assert (=> b!162700 (= e!112275 e!112276)))

(declare-fun res!135648 () Bool)

(assert (=> b!162700 (= res!135648 call!2769)))

(assert (=> b!162700 (=> (not res!135648) (not e!112276))))

(declare-fun d!55985 () Bool)

(declare-fun res!135650 () Bool)

(assert (=> d!55985 (=> res!135650 e!112274)))

(assert (=> d!55985 (= res!135650 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(assert (=> d!55985 (= (arrayBitRangesEq!0 (buf!4059 (_1!7817 lt!255550)) (buf!4059 (_2!7817 lt!255550)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))) e!112274)))

(declare-fun b!162704 () Bool)

(declare-fun res!135651 () Bool)

(assert (=> b!162704 (= res!135651 (= lt!255895 #b00000000000000000000000000000000))))

(assert (=> b!162704 (=> res!135651 e!112278)))

(assert (=> b!162704 (= e!112276 e!112278)))

(declare-fun b!162705 () Bool)

(assert (=> b!162705 (= e!112277 (arrayRangesEq!553 (buf!4059 (_1!7817 lt!255550)) (buf!4059 (_2!7817 lt!255550)) (_1!7834 lt!255896) (_2!7834 lt!255896)))))

(assert (= (and d!55985 (not res!135650)) b!162701))

(assert (= (and b!162701 (not res!135649)) b!162705))

(assert (= (and b!162701 res!135652) b!162702))

(assert (= (and b!162702 c!8517) b!162703))

(assert (= (and b!162702 (not c!8517)) b!162700))

(assert (= (and b!162700 res!135648) b!162704))

(assert (= (and b!162704 (not res!135651)) b!162699))

(assert (= (or b!162703 b!162700) bm!2766))

(declare-fun m!258335 () Bool)

(assert (=> b!162699 m!258335))

(declare-fun m!258337 () Bool)

(assert (=> b!162699 m!258337))

(assert (=> b!162699 m!258335))

(assert (=> b!162699 m!258337))

(declare-fun m!258339 () Bool)

(assert (=> b!162699 m!258339))

(declare-fun m!258341 () Bool)

(assert (=> bm!2766 m!258341))

(declare-fun m!258343 () Bool)

(assert (=> bm!2766 m!258343))

(assert (=> bm!2766 m!258341))

(assert (=> bm!2766 m!258343))

(declare-fun m!258345 () Bool)

(assert (=> bm!2766 m!258345))

(assert (=> b!162701 m!258169))

(declare-fun m!258347 () Bool)

(assert (=> b!162701 m!258347))

(declare-fun m!258349 () Bool)

(assert (=> b!162705 m!258349))

(assert (=> b!162642 d!55985))

(assert (=> b!162642 d!55975))

(declare-fun d!55987 () Bool)

(declare-fun res!135653 () Bool)

(declare-fun e!112279 () Bool)

(assert (=> d!55987 (=> res!135653 e!112279)))

(assert (=> d!55987 (= res!135653 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55987 (= (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112279)))

(declare-fun b!162706 () Bool)

(declare-fun e!112280 () Bool)

(assert (=> b!162706 (= e!112279 e!112280)))

(declare-fun res!135654 () Bool)

(assert (=> b!162706 (=> (not res!135654) (not e!112280))))

(assert (=> b!162706 (= res!135654 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162707 () Bool)

(assert (=> b!162707 (= e!112280 (arrayRangesEq!553 (buf!4059 thiss!1602) (array!8032 (store (arr!4522 (buf!4059 thiss!1602)) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001) lt!255170) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55987 (not res!135653)) b!162706))

(assert (= (and b!162706 res!135654) b!162707))

(assert (=> b!162706 m!258277))

(declare-fun m!258351 () Bool)

(assert (=> b!162706 m!258351))

(declare-fun m!258353 () Bool)

(assert (=> b!162707 m!258353))

(assert (=> b!162654 d!55987))

(assert (=> d!55913 d!55925))

(declare-fun d!55989 () Bool)

(assert (=> d!55989 (isPrefixOf!0 lt!255552 (_3!582 lt!255169))))

(assert (=> d!55989 true))

(declare-fun _$15!261 () Unit!11180)

(assert (=> d!55989 (= (choose!30 lt!255552 (_3!582 lt!255169) (_3!582 lt!255169)) _$15!261)))

(declare-fun bs!13878 () Bool)

(assert (= bs!13878 d!55989))

(assert (=> bs!13878 m!257571))

(assert (=> d!55913 d!55989))

(assert (=> b!162601 d!55977))

(assert (=> b!162601 d!55585))

(declare-fun d!55991 () Bool)

(declare-fun res!135655 () Bool)

(declare-fun e!112281 () Bool)

(assert (=> d!55991 (=> res!135655 e!112281)))

(assert (=> d!55991 (= res!135655 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (=> d!55991 (= (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)) e!112281)))

(declare-fun b!162708 () Bool)

(declare-fun e!112282 () Bool)

(assert (=> b!162708 (= e!112281 e!112282)))

(declare-fun res!135656 () Bool)

(assert (=> b!162708 (=> (not res!135656) (not e!112282))))

(assert (=> b!162708 (= res!135656 (= (select (arr!4522 (buf!4059 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162709 () Bool)

(assert (=> b!162709 (= e!112282 (arrayRangesEq!553 (buf!4059 thiss!1602) lt!255164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7559 (_3!582 lt!255169)) #b00000000000000000000000000000001)))))

(assert (= (and d!55991 (not res!135655)) b!162708))

(assert (= (and b!162708 res!135656) b!162709))

(assert (=> b!162708 m!258277))

(declare-fun m!258355 () Bool)

(assert (=> b!162708 m!258355))

(declare-fun m!258357 () Bool)

(assert (=> b!162709 m!258357))

(assert (=> b!162631 d!55991))

(assert (=> b!162604 d!55975))

(assert (=> b!162604 d!55587))

(declare-fun e!112288 () Bool)

(declare-fun b!162710 () Bool)

(declare-fun lt!255899 () tuple4!238)

(declare-fun lt!255898 () (_ BitVec 32))

(assert (=> b!162710 (= e!112288 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_2!7817 lt!255550))) (_4!119 lt!255899)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255899)) #b00000000000000000000000000000000 lt!255898))))

(declare-fun bm!2767 () Bool)

(declare-fun c!8518 () Bool)

(declare-fun lt!255900 () (_ BitVec 32))

(declare-fun call!2770 () Bool)

(assert (=> bm!2767 (= call!2770 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_2!7817 lt!255550))) (_3!587 lt!255899)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255899)) lt!255900 (ite c!8518 lt!255898 #b00000000000000000000000000001000)))))

(declare-fun b!162712 () Bool)

(declare-fun e!112284 () Bool)

(declare-fun e!112283 () Bool)

(assert (=> b!162712 (= e!112284 e!112283)))

(declare-fun res!135661 () Bool)

(assert (=> b!162712 (=> (not res!135661) (not e!112283))))

(declare-fun e!112287 () Bool)

(assert (=> b!162712 (= res!135661 e!112287)))

(declare-fun res!135658 () Bool)

(assert (=> b!162712 (=> res!135658 e!112287)))

(assert (=> b!162712 (= res!135658 (bvsge (_1!7834 lt!255899) (_2!7834 lt!255899)))))

(assert (=> b!162712 (= lt!255898 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162712 (= lt!255900 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162712 (= lt!255899 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550)))))))

(declare-fun b!162713 () Bool)

(declare-fun e!112285 () Bool)

(assert (=> b!162713 (= e!112283 e!112285)))

(assert (=> b!162713 (= c!8518 (= (_3!587 lt!255899) (_4!119 lt!255899)))))

(declare-fun b!162714 () Bool)

(assert (=> b!162714 (= e!112285 call!2770)))

(declare-fun b!162711 () Bool)

(declare-fun e!112286 () Bool)

(assert (=> b!162711 (= e!112285 e!112286)))

(declare-fun res!135657 () Bool)

(assert (=> b!162711 (= res!135657 call!2770)))

(assert (=> b!162711 (=> (not res!135657) (not e!112286))))

(declare-fun d!55993 () Bool)

(declare-fun res!135659 () Bool)

(assert (=> d!55993 (=> res!135659 e!112284)))

(assert (=> d!55993 (= res!135659 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550)))))))

(assert (=> d!55993 (= (arrayBitRangesEq!0 (buf!4059 (_2!7817 lt!255550)) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550)))) e!112284)))

(declare-fun b!162715 () Bool)

(declare-fun res!135660 () Bool)

(assert (=> b!162715 (= res!135660 (= lt!255898 #b00000000000000000000000000000000))))

(assert (=> b!162715 (=> res!135660 e!112288)))

(assert (=> b!162715 (= e!112286 e!112288)))

(declare-fun b!162716 () Bool)

(assert (=> b!162716 (= e!112287 (arrayRangesEq!553 (buf!4059 (_2!7817 lt!255550)) (buf!4059 (_3!582 lt!255169)) (_1!7834 lt!255899) (_2!7834 lt!255899)))))

(assert (= (and d!55993 (not res!135659)) b!162712))

(assert (= (and b!162712 (not res!135658)) b!162716))

(assert (= (and b!162712 res!135661) b!162713))

(assert (= (and b!162713 c!8518) b!162714))

(assert (= (and b!162713 (not c!8518)) b!162711))

(assert (= (and b!162711 res!135657) b!162715))

(assert (= (and b!162715 (not res!135660)) b!162710))

(assert (= (or b!162714 b!162711) bm!2767))

(declare-fun m!258359 () Bool)

(assert (=> b!162710 m!258359))

(declare-fun m!258361 () Bool)

(assert (=> b!162710 m!258361))

(assert (=> b!162710 m!258359))

(assert (=> b!162710 m!258361))

(declare-fun m!258363 () Bool)

(assert (=> b!162710 m!258363))

(declare-fun m!258365 () Bool)

(assert (=> bm!2767 m!258365))

(declare-fun m!258367 () Bool)

(assert (=> bm!2767 m!258367))

(assert (=> bm!2767 m!258365))

(assert (=> bm!2767 m!258367))

(declare-fun m!258369 () Bool)

(assert (=> bm!2767 m!258369))

(assert (=> b!162712 m!258165))

(declare-fun m!258371 () Bool)

(assert (=> b!162712 m!258371))

(declare-fun m!258373 () Bool)

(assert (=> b!162716 m!258373))

(assert (=> b!162603 d!55993))

(assert (=> b!162603 d!55977))

(assert (=> b!162637 d!55959))

(declare-fun e!112294 () Bool)

(declare-fun lt!255902 () tuple4!238)

(declare-fun lt!255901 () (_ BitVec 32))

(declare-fun b!162717 () Bool)

(assert (=> b!162717 (= e!112294 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_1!7817 lt!255550))) (_4!119 lt!255902)) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255902)) #b00000000000000000000000000000000 lt!255901))))

(declare-fun call!2771 () Bool)

(declare-fun bm!2768 () Bool)

(declare-fun c!8519 () Bool)

(declare-fun lt!255903 () (_ BitVec 32))

(assert (=> bm!2768 (= call!2771 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_1!7817 lt!255550))) (_3!587 lt!255902)) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255902)) lt!255903 (ite c!8519 lt!255901 #b00000000000000000000000000001000)))))

(declare-fun b!162719 () Bool)

(declare-fun e!112290 () Bool)

(declare-fun e!112289 () Bool)

(assert (=> b!162719 (= e!112290 e!112289)))

(declare-fun res!135666 () Bool)

(assert (=> b!162719 (=> (not res!135666) (not e!112289))))

(declare-fun e!112293 () Bool)

(assert (=> b!162719 (= res!135666 e!112293)))

(declare-fun res!135663 () Bool)

(assert (=> b!162719 (=> res!135663 e!112293)))

(assert (=> b!162719 (= res!135663 (bvsge (_1!7834 lt!255902) (_2!7834 lt!255902)))))

(assert (=> b!162719 (= lt!255901 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162719 (= lt!255903 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162719 (= lt!255902 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(declare-fun b!162720 () Bool)

(declare-fun e!112291 () Bool)

(assert (=> b!162720 (= e!112289 e!112291)))

(assert (=> b!162720 (= c!8519 (= (_3!587 lt!255902) (_4!119 lt!255902)))))

(declare-fun b!162721 () Bool)

(assert (=> b!162721 (= e!112291 call!2771)))

(declare-fun b!162718 () Bool)

(declare-fun e!112292 () Bool)

(assert (=> b!162718 (= e!112291 e!112292)))

(declare-fun res!135662 () Bool)

(assert (=> b!162718 (= res!135662 call!2771)))

(assert (=> b!162718 (=> (not res!135662) (not e!112292))))

(declare-fun d!55995 () Bool)

(declare-fun res!135664 () Bool)

(assert (=> d!55995 (=> res!135664 e!112290)))

(assert (=> d!55995 (= res!135664 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))))))

(assert (=> d!55995 (= (arrayBitRangesEq!0 (buf!4059 (_1!7817 lt!255550)) (buf!4059 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255550))) (currentByte!7559 (_1!7817 lt!255550)) (currentBit!7554 (_1!7817 lt!255550)))) e!112290)))

(declare-fun b!162722 () Bool)

(declare-fun res!135665 () Bool)

(assert (=> b!162722 (= res!135665 (= lt!255901 #b00000000000000000000000000000000))))

(assert (=> b!162722 (=> res!135665 e!112294)))

(assert (=> b!162722 (= e!112292 e!112294)))

(declare-fun b!162723 () Bool)

(assert (=> b!162723 (= e!112293 (arrayRangesEq!553 (buf!4059 (_1!7817 lt!255550)) (buf!4059 thiss!1602) (_1!7834 lt!255902) (_2!7834 lt!255902)))))

(assert (= (and d!55995 (not res!135664)) b!162719))

(assert (= (and b!162719 (not res!135663)) b!162723))

(assert (= (and b!162719 res!135666) b!162720))

(assert (= (and b!162720 c!8519) b!162721))

(assert (= (and b!162720 (not c!8519)) b!162718))

(assert (= (and b!162718 res!135662) b!162722))

(assert (= (and b!162722 (not res!135665)) b!162717))

(assert (= (or b!162721 b!162718) bm!2768))

(declare-fun m!258375 () Bool)

(assert (=> b!162717 m!258375))

(declare-fun m!258377 () Bool)

(assert (=> b!162717 m!258377))

(assert (=> b!162717 m!258375))

(assert (=> b!162717 m!258377))

(declare-fun m!258379 () Bool)

(assert (=> b!162717 m!258379))

(declare-fun m!258381 () Bool)

(assert (=> bm!2768 m!258381))

(declare-fun m!258383 () Bool)

(assert (=> bm!2768 m!258383))

(assert (=> bm!2768 m!258381))

(assert (=> bm!2768 m!258383))

(declare-fun m!258385 () Bool)

(assert (=> bm!2768 m!258385))

(assert (=> b!162719 m!258169))

(assert (=> b!162719 m!258347))

(declare-fun m!258387 () Bool)

(assert (=> b!162723 m!258387))

(assert (=> b!162606 d!55995))

(assert (=> b!162606 d!55975))

(declare-fun d!55997 () Bool)

(declare-fun res!135667 () Bool)

(declare-fun e!112295 () Bool)

(assert (=> d!55997 (=> res!135667 e!112295)))

(assert (=> d!55997 (= res!135667 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55997 (= (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) e!112295)))

(declare-fun b!162724 () Bool)

(declare-fun e!112296 () Bool)

(assert (=> b!162724 (= e!112295 e!112296)))

(declare-fun res!135668 () Bool)

(assert (=> b!162724 (=> (not res!135668) (not e!112296))))

(assert (=> b!162724 (= res!135668 (= (select (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162725 () Bool)

(assert (=> b!162725 (= e!112296 (arrayRangesEq!553 lt!255164 (array!8032 (store (store (store (arr!4522 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) lt!255173) (currentByte!7559 thiss!1602) lt!255168) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 (buf!4059 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55997 (not res!135667)) b!162724))

(assert (= (and b!162724 res!135668) b!162725))

(assert (=> b!162724 m!258355))

(declare-fun m!258389 () Bool)

(assert (=> b!162724 m!258389))

(declare-fun m!258391 () Bool)

(assert (=> b!162725 m!258391))

(assert (=> b!162652 d!55997))

(declare-fun d!55999 () Bool)

(declare-fun res!135669 () Bool)

(declare-fun e!112297 () Bool)

(assert (=> d!55999 (=> res!135669 e!112297)))

(assert (=> d!55999 (= res!135669 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (=> d!55999 (= (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))) e!112297)))

(declare-fun b!162726 () Bool)

(declare-fun e!112298 () Bool)

(assert (=> b!162726 (= e!112297 e!112298)))

(declare-fun res!135670 () Bool)

(assert (=> b!162726 (=> (not res!135670) (not e!112298))))

(assert (=> b!162726 (= res!135670 (= (select (arr!4522 lt!255164) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4522 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162727 () Bool)

(assert (=> b!162727 (= e!112298 (arrayRangesEq!553 lt!255164 (array!8032 (store (arr!4522 lt!255164) (currentByte!7559 (_3!582 lt!255169)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)))) (size!3601 lt!255164)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7559 (_3!582 lt!255169))))))

(assert (= (and d!55999 (not res!135669)) b!162726))

(assert (= (and b!162726 res!135670) b!162727))

(assert (=> b!162726 m!258195))

(declare-fun m!258393 () Bool)

(assert (=> b!162726 m!258393))

(declare-fun m!258395 () Bool)

(assert (=> b!162727 m!258395))

(assert (=> b!162633 d!55999))

(declare-fun lt!255905 () tuple4!238)

(declare-fun e!112304 () Bool)

(declare-fun b!162728 () Bool)

(declare-fun lt!255904 () (_ BitVec 32))

(assert (=> b!162728 (= e!112304 (byteRangesEq!0 (select (arr!4522 (buf!4059 lt!255552)) (_4!119 lt!255905)) (select (arr!4522 (buf!4059 lt!255552)) (_4!119 lt!255905)) #b00000000000000000000000000000000 lt!255904))))

(declare-fun bm!2769 () Bool)

(declare-fun call!2772 () Bool)

(declare-fun lt!255906 () (_ BitVec 32))

(declare-fun c!8520 () Bool)

(assert (=> bm!2769 (= call!2772 (byteRangesEq!0 (select (arr!4522 (buf!4059 lt!255552)) (_3!587 lt!255905)) (select (arr!4522 (buf!4059 lt!255552)) (_3!587 lt!255905)) lt!255906 (ite c!8520 lt!255904 #b00000000000000000000000000001000)))))

(declare-fun b!162730 () Bool)

(declare-fun e!112300 () Bool)

(declare-fun e!112299 () Bool)

(assert (=> b!162730 (= e!112300 e!112299)))

(declare-fun res!135675 () Bool)

(assert (=> b!162730 (=> (not res!135675) (not e!112299))))

(declare-fun e!112303 () Bool)

(assert (=> b!162730 (= res!135675 e!112303)))

(declare-fun res!135672 () Bool)

(assert (=> b!162730 (=> res!135672 e!112303)))

(assert (=> b!162730 (= res!135672 (bvsge (_1!7834 lt!255905) (_2!7834 lt!255905)))))

(assert (=> b!162730 (= lt!255904 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162730 (= lt!255906 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162730 (= lt!255905 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(declare-fun b!162731 () Bool)

(declare-fun e!112301 () Bool)

(assert (=> b!162731 (= e!112299 e!112301)))

(assert (=> b!162731 (= c!8520 (= (_3!587 lt!255905) (_4!119 lt!255905)))))

(declare-fun b!162732 () Bool)

(assert (=> b!162732 (= e!112301 call!2772)))

(declare-fun b!162729 () Bool)

(declare-fun e!112302 () Bool)

(assert (=> b!162729 (= e!112301 e!112302)))

(declare-fun res!135671 () Bool)

(assert (=> b!162729 (= res!135671 call!2772)))

(assert (=> b!162729 (=> (not res!135671) (not e!112302))))

(declare-fun d!56001 () Bool)

(declare-fun res!135673 () Bool)

(assert (=> d!56001 (=> res!135673 e!112300)))

(assert (=> d!56001 (= res!135673 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))))))

(assert (=> d!56001 (= (arrayBitRangesEq!0 (buf!4059 lt!255552) (buf!4059 lt!255552) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 lt!255552)) (currentByte!7559 lt!255552) (currentBit!7554 lt!255552))) e!112300)))

(declare-fun b!162733 () Bool)

(declare-fun res!135674 () Bool)

(assert (=> b!162733 (= res!135674 (= lt!255904 #b00000000000000000000000000000000))))

(assert (=> b!162733 (=> res!135674 e!112304)))

(assert (=> b!162733 (= e!112302 e!112304)))

(declare-fun b!162734 () Bool)

(assert (=> b!162734 (= e!112303 (arrayRangesEq!553 (buf!4059 lt!255552) (buf!4059 lt!255552) (_1!7834 lt!255905) (_2!7834 lt!255905)))))

(assert (= (and d!56001 (not res!135673)) b!162730))

(assert (= (and b!162730 (not res!135672)) b!162734))

(assert (= (and b!162730 res!135675) b!162731))

(assert (= (and b!162731 c!8520) b!162732))

(assert (= (and b!162731 (not c!8520)) b!162729))

(assert (= (and b!162729 res!135671) b!162733))

(assert (= (and b!162733 (not res!135674)) b!162728))

(assert (= (or b!162732 b!162729) bm!2769))

(declare-fun m!258397 () Bool)

(assert (=> b!162728 m!258397))

(assert (=> b!162728 m!258397))

(assert (=> b!162728 m!258397))

(assert (=> b!162728 m!258397))

(declare-fun m!258399 () Bool)

(assert (=> b!162728 m!258399))

(declare-fun m!258401 () Bool)

(assert (=> bm!2769 m!258401))

(assert (=> bm!2769 m!258401))

(assert (=> bm!2769 m!258401))

(assert (=> bm!2769 m!258401))

(declare-fun m!258403 () Bool)

(assert (=> bm!2769 m!258403))

(assert (=> b!162730 m!258215))

(assert (=> b!162730 m!258299))

(declare-fun m!258405 () Bool)

(assert (=> b!162734 m!258405))

(assert (=> b!162639 d!56001))

(assert (=> b!162639 d!55959))

(declare-fun d!56003 () Bool)

(assert (=> d!56003 (= (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255866)) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255866)) #b00000000000000000000000000000000 lt!255865) (or (= #b00000000000000000000000000000000 lt!255865) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255866))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255865))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255866))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255865))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13879 () Bool)

(assert (= bs!13879 d!56003))

(declare-fun m!258407 () Bool)

(assert (=> bs!13879 m!258407))

(assert (=> bs!13879 m!257541))

(assert (=> b!162663 d!56003))

(declare-fun d!56005 () Bool)

(declare-fun e!112305 () Bool)

(assert (=> d!56005 e!112305))

(declare-fun res!135677 () Bool)

(assert (=> d!56005 (=> (not res!135677) (not e!112305))))

(declare-fun lt!255912 () (_ BitVec 64))

(declare-fun lt!255908 () (_ BitVec 64))

(declare-fun lt!255909 () (_ BitVec 64))

(assert (=> d!56005 (= res!135677 (= lt!255908 (bvsub lt!255912 lt!255909)))))

(assert (=> d!56005 (or (= (bvand lt!255912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255912 lt!255909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56005 (= lt!255909 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7827 lt!255856)))) ((_ sign_extend 32) (currentByte!7559 (_2!7827 lt!255856))) ((_ sign_extend 32) (currentBit!7554 (_2!7827 lt!255856)))))))

(declare-fun lt!255907 () (_ BitVec 64))

(declare-fun lt!255911 () (_ BitVec 64))

(assert (=> d!56005 (= lt!255912 (bvmul lt!255907 lt!255911))))

(assert (=> d!56005 (or (= lt!255907 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255911 (bvsdiv (bvmul lt!255907 lt!255911) lt!255907)))))

(assert (=> d!56005 (= lt!255911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56005 (= lt!255907 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7827 lt!255856)))))))

(assert (=> d!56005 (= lt!255908 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_2!7827 lt!255856))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_2!7827 lt!255856)))))))

(assert (=> d!56005 (invariant!0 (currentBit!7554 (_2!7827 lt!255856)) (currentByte!7559 (_2!7827 lt!255856)) (size!3601 (buf!4059 (_2!7827 lt!255856))))))

(assert (=> d!56005 (= (bitIndex!0 (size!3601 (buf!4059 (_2!7827 lt!255856))) (currentByte!7559 (_2!7827 lt!255856)) (currentBit!7554 (_2!7827 lt!255856))) lt!255908)))

(declare-fun b!162735 () Bool)

(declare-fun res!135676 () Bool)

(assert (=> b!162735 (=> (not res!135676) (not e!112305))))

(assert (=> b!162735 (= res!135676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255908))))

(declare-fun b!162736 () Bool)

(declare-fun lt!255910 () (_ BitVec 64))

(assert (=> b!162736 (= e!112305 (bvsle lt!255908 (bvmul lt!255910 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162736 (or (= lt!255910 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255910 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255910)))))

(assert (=> b!162736 (= lt!255910 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7827 lt!255856)))))))

(assert (= (and d!56005 res!135677) b!162735))

(assert (= (and b!162735 res!135676) b!162736))

(declare-fun m!258409 () Bool)

(assert (=> d!56005 m!258409))

(declare-fun m!258411 () Bool)

(assert (=> d!56005 m!258411))

(assert (=> b!162662 d!56005))

(declare-fun d!56007 () Bool)

(declare-fun e!112306 () Bool)

(assert (=> d!56007 e!112306))

(declare-fun res!135679 () Bool)

(assert (=> d!56007 (=> (not res!135679) (not e!112306))))

(declare-fun lt!255914 () (_ BitVec 64))

(declare-fun lt!255918 () (_ BitVec 64))

(declare-fun lt!255915 () (_ BitVec 64))

(assert (=> d!56007 (= res!135679 (= lt!255914 (bvsub lt!255918 lt!255915)))))

(assert (=> d!56007 (or (= (bvand lt!255918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255918 lt!255915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56007 (= lt!255915 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))) ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255167))) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255167)))))))

(declare-fun lt!255913 () (_ BitVec 64))

(declare-fun lt!255917 () (_ BitVec 64))

(assert (=> d!56007 (= lt!255918 (bvmul lt!255913 lt!255917))))

(assert (=> d!56007 (or (= lt!255913 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255917 (bvsdiv (bvmul lt!255913 lt!255917) lt!255913)))))

(assert (=> d!56007 (= lt!255917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56007 (= lt!255913 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))))))

(assert (=> d!56007 (= lt!255914 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 (_1!7817 lt!255167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 (_1!7817 lt!255167)))))))

(assert (=> d!56007 (invariant!0 (currentBit!7554 (_1!7817 lt!255167)) (currentByte!7559 (_1!7817 lt!255167)) (size!3601 (buf!4059 (_1!7817 lt!255167))))))

(assert (=> d!56007 (= (bitIndex!0 (size!3601 (buf!4059 (_1!7817 lt!255167))) (currentByte!7559 (_1!7817 lt!255167)) (currentBit!7554 (_1!7817 lt!255167))) lt!255914)))

(declare-fun b!162737 () Bool)

(declare-fun res!135678 () Bool)

(assert (=> b!162737 (=> (not res!135678) (not e!112306))))

(assert (=> b!162737 (= res!135678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255914))))

(declare-fun b!162738 () Bool)

(declare-fun lt!255916 () (_ BitVec 64))

(assert (=> b!162738 (= e!112306 (bvsle lt!255914 (bvmul lt!255916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162738 (or (= lt!255916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255916)))))

(assert (=> b!162738 (= lt!255916 ((_ sign_extend 32) (size!3601 (buf!4059 (_1!7817 lt!255167)))))))

(assert (= (and d!56007 res!135679) b!162737))

(assert (= (and b!162737 res!135678) b!162738))

(assert (=> d!56007 m!258333))

(declare-fun m!258413 () Bool)

(assert (=> d!56007 m!258413))

(assert (=> b!162662 d!56007))

(assert (=> b!162634 d!55585))

(assert (=> b!162646 d!55587))

(declare-fun d!56009 () Bool)

(assert (=> d!56009 (= (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255866)) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255866)) lt!255867 (ite c!8515 lt!255865 #b00000000000000000000000000001000)) (or (= lt!255867 (ite c!8515 lt!255865 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255866))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8515 lt!255865 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255867)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255866))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8515 lt!255865 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255867)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13880 () Bool)

(assert (= bs!13880 d!56009))

(declare-fun m!258415 () Bool)

(assert (=> bs!13880 m!258415))

(declare-fun m!258417 () Bool)

(assert (=> bs!13880 m!258417))

(assert (=> bm!2764 d!56009))

(assert (=> d!55907 d!55569))

(declare-fun lt!255919 () (_ BitVec 32))

(declare-fun b!162739 () Bool)

(declare-fun lt!255920 () tuple4!238)

(declare-fun e!112312 () Bool)

(assert (=> b!162739 (= e!112312 (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255920)) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255920)) #b00000000000000000000000000000000 lt!255919))))

(declare-fun c!8521 () Bool)

(declare-fun call!2773 () Bool)

(declare-fun lt!255921 () (_ BitVec 32))

(declare-fun bm!2770 () Bool)

(assert (=> bm!2770 (= call!2773 (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255920)) (select (arr!4522 (buf!4059 thiss!1602)) (_3!587 lt!255920)) lt!255921 (ite c!8521 lt!255919 #b00000000000000000000000000001000)))))

(declare-fun b!162741 () Bool)

(declare-fun e!112308 () Bool)

(declare-fun e!112307 () Bool)

(assert (=> b!162741 (= e!112308 e!112307)))

(declare-fun res!135684 () Bool)

(assert (=> b!162741 (=> (not res!135684) (not e!112307))))

(declare-fun e!112311 () Bool)

(assert (=> b!162741 (= res!135684 e!112311)))

(declare-fun res!135681 () Bool)

(assert (=> b!162741 (=> res!135681 e!112311)))

(assert (=> b!162741 (= res!135681 (bvsge (_1!7834 lt!255920) (_2!7834 lt!255920)))))

(assert (=> b!162741 (= lt!255919 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162741 (= lt!255921 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162741 (= lt!255920 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(declare-fun b!162742 () Bool)

(declare-fun e!112309 () Bool)

(assert (=> b!162742 (= e!112307 e!112309)))

(assert (=> b!162742 (= c!8521 (= (_3!587 lt!255920) (_4!119 lt!255920)))))

(declare-fun b!162743 () Bool)

(assert (=> b!162743 (= e!112309 call!2773)))

(declare-fun b!162740 () Bool)

(declare-fun e!112310 () Bool)

(assert (=> b!162740 (= e!112309 e!112310)))

(declare-fun res!135680 () Bool)

(assert (=> b!162740 (= res!135680 call!2773)))

(assert (=> b!162740 (=> (not res!135680) (not e!112310))))

(declare-fun d!56011 () Bool)

(declare-fun res!135682 () Bool)

(assert (=> d!56011 (=> res!135682 e!112308)))

(assert (=> d!56011 (= res!135682 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))))))

(assert (=> d!56011 (= (arrayBitRangesEq!0 (buf!4059 thiss!1602) (buf!4059 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 thiss!1602)) (currentByte!7559 thiss!1602) (currentBit!7554 thiss!1602))) e!112308)))

(declare-fun b!162744 () Bool)

(declare-fun res!135683 () Bool)

(assert (=> b!162744 (= res!135683 (= lt!255919 #b00000000000000000000000000000000))))

(assert (=> b!162744 (=> res!135683 e!112312)))

(assert (=> b!162744 (= e!112310 e!112312)))

(declare-fun b!162745 () Bool)

(assert (=> b!162745 (= e!112311 (arrayRangesEq!553 (buf!4059 thiss!1602) (buf!4059 thiss!1602) (_1!7834 lt!255920) (_2!7834 lt!255920)))))

(assert (= (and d!56011 (not res!135682)) b!162741))

(assert (= (and b!162741 (not res!135681)) b!162745))

(assert (= (and b!162741 res!135684) b!162742))

(assert (= (and b!162742 c!8521) b!162743))

(assert (= (and b!162742 (not c!8521)) b!162740))

(assert (= (and b!162740 res!135680) b!162744))

(assert (= (and b!162744 (not res!135683)) b!162739))

(assert (= (or b!162743 b!162740) bm!2770))

(declare-fun m!258419 () Bool)

(assert (=> b!162739 m!258419))

(assert (=> b!162739 m!258419))

(assert (=> b!162739 m!258419))

(assert (=> b!162739 m!258419))

(declare-fun m!258421 () Bool)

(assert (=> b!162739 m!258421))

(declare-fun m!258423 () Bool)

(assert (=> bm!2770 m!258423))

(assert (=> bm!2770 m!258423))

(assert (=> bm!2770 m!258423))

(assert (=> bm!2770 m!258423))

(declare-fun m!258425 () Bool)

(assert (=> bm!2770 m!258425))

(assert (=> b!162741 m!257177))

(assert (=> b!162741 m!258191))

(declare-fun m!258427 () Bool)

(assert (=> b!162745 m!258427))

(assert (=> b!162648 d!56011))

(assert (=> b!162648 d!55587))

(declare-fun b!162746 () Bool)

(declare-fun e!112318 () Bool)

(declare-fun lt!255923 () tuple4!238)

(declare-fun lt!255922 () (_ BitVec 32))

(assert (=> b!162746 (= e!112318 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255923)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255923)) #b00000000000000000000000000000000 lt!255922))))

(declare-fun call!2774 () Bool)

(declare-fun lt!255924 () (_ BitVec 32))

(declare-fun c!8522 () Bool)

(declare-fun bm!2771 () Bool)

(assert (=> bm!2771 (= call!2774 (byteRangesEq!0 (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255923)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_3!587 lt!255923)) lt!255924 (ite c!8522 lt!255922 #b00000000000000000000000000001000)))))

(declare-fun b!162748 () Bool)

(declare-fun e!112314 () Bool)

(declare-fun e!112313 () Bool)

(assert (=> b!162748 (= e!112314 e!112313)))

(declare-fun res!135689 () Bool)

(assert (=> b!162748 (=> (not res!135689) (not e!112313))))

(declare-fun e!112317 () Bool)

(assert (=> b!162748 (= res!135689 e!112317)))

(declare-fun res!135686 () Bool)

(assert (=> b!162748 (=> res!135686 e!112317)))

(assert (=> b!162748 (= res!135686 (bvsge (_1!7834 lt!255923) (_2!7834 lt!255923)))))

(assert (=> b!162748 (= lt!255922 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162748 (= lt!255924 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162748 (= lt!255923 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(declare-fun b!162749 () Bool)

(declare-fun e!112315 () Bool)

(assert (=> b!162749 (= e!112313 e!112315)))

(assert (=> b!162749 (= c!8522 (= (_3!587 lt!255923) (_4!119 lt!255923)))))

(declare-fun b!162750 () Bool)

(assert (=> b!162750 (= e!112315 call!2774)))

(declare-fun b!162747 () Bool)

(declare-fun e!112316 () Bool)

(assert (=> b!162747 (= e!112315 e!112316)))

(declare-fun res!135685 () Bool)

(assert (=> b!162747 (= res!135685 call!2774)))

(assert (=> b!162747 (=> (not res!135685) (not e!112316))))

(declare-fun d!56013 () Bool)

(declare-fun res!135687 () Bool)

(assert (=> d!56013 (=> res!135687 e!112314)))

(assert (=> d!56013 (= res!135687 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))))))

(assert (=> d!56013 (= (arrayBitRangesEq!0 (buf!4059 (_3!582 lt!255169)) (buf!4059 (_3!582 lt!255169)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3601 (buf!4059 (_3!582 lt!255169))) (currentByte!7559 (_3!582 lt!255169)) (currentBit!7554 (_3!582 lt!255169)))) e!112314)))

(declare-fun b!162751 () Bool)

(declare-fun res!135688 () Bool)

(assert (=> b!162751 (= res!135688 (= lt!255922 #b00000000000000000000000000000000))))

(assert (=> b!162751 (=> res!135688 e!112318)))

(assert (=> b!162751 (= e!112316 e!112318)))

(declare-fun b!162752 () Bool)

(assert (=> b!162752 (= e!112317 (arrayRangesEq!553 (buf!4059 (_3!582 lt!255169)) (buf!4059 (_3!582 lt!255169)) (_1!7834 lt!255923) (_2!7834 lt!255923)))))

(assert (= (and d!56013 (not res!135687)) b!162748))

(assert (= (and b!162748 (not res!135686)) b!162752))

(assert (= (and b!162748 res!135689) b!162749))

(assert (= (and b!162749 c!8522) b!162750))

(assert (= (and b!162749 (not c!8522)) b!162747))

(assert (= (and b!162747 res!135685) b!162751))

(assert (= (and b!162751 (not res!135688)) b!162746))

(assert (= (or b!162750 b!162747) bm!2771))

(declare-fun m!258429 () Bool)

(assert (=> b!162746 m!258429))

(assert (=> b!162746 m!258429))

(assert (=> b!162746 m!258429))

(assert (=> b!162746 m!258429))

(declare-fun m!258431 () Bool)

(assert (=> b!162746 m!258431))

(declare-fun m!258433 () Bool)

(assert (=> bm!2771 m!258433))

(assert (=> bm!2771 m!258433))

(assert (=> bm!2771 m!258433))

(assert (=> bm!2771 m!258433))

(declare-fun m!258435 () Bool)

(assert (=> bm!2771 m!258435))

(assert (=> b!162748 m!257175))

(declare-fun m!258437 () Bool)

(assert (=> b!162748 m!258437))

(declare-fun m!258439 () Bool)

(assert (=> b!162752 m!258439))

(assert (=> b!162636 d!56013))

(assert (=> b!162636 d!55585))

(declare-fun d!56015 () Bool)

(assert (=> d!56015 (= (byteRangesEq!0 (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255830)) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255830)) #b00000000000000000000000000000000 lt!255829) (or (= #b00000000000000000000000000000000 lt!255829) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 thiss!1602)) (_4!119 lt!255830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255829))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4522 (buf!4059 (_3!582 lt!255169))) (_4!119 lt!255830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255829))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13881 () Bool)

(assert (= bs!13881 d!56015))

(declare-fun m!258441 () Bool)

(assert (=> bs!13881 m!258441))

(assert (=> bs!13881 m!257541))

(assert (=> b!162623 d!56015))

(declare-fun d!56017 () Bool)

(assert (=> d!56017 (= (arrayBitIndices!0 lt!255560 lt!255546) (tuple4!239 ((_ extract 31 0) (bvadd (bvsdiv lt!255560 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!255560 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!255546 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255560 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255546 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162665 d!56017))

(assert (=> b!162643 d!55959))

(assert (=> b!162643 d!55585))

(assert (=> d!55887 d!55563))

(declare-fun d!56019 () Bool)

(declare-fun e!112319 () Bool)

(assert (=> d!56019 e!112319))

(declare-fun res!135691 () Bool)

(assert (=> d!56019 (=> (not res!135691) (not e!112319))))

(declare-fun lt!255926 () (_ BitVec 64))

(declare-fun lt!255927 () (_ BitVec 64))

(declare-fun lt!255930 () (_ BitVec 64))

(assert (=> d!56019 (= res!135691 (= lt!255926 (bvsub lt!255930 lt!255927)))))

(assert (=> d!56019 (or (= (bvand lt!255930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255930 lt!255927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56019 (= lt!255927 (remainingBits!0 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255872))) ((_ sign_extend 32) (currentByte!7559 lt!255872)) ((_ sign_extend 32) (currentBit!7554 lt!255872))))))

(declare-fun lt!255925 () (_ BitVec 64))

(declare-fun lt!255929 () (_ BitVec 64))

(assert (=> d!56019 (= lt!255930 (bvmul lt!255925 lt!255929))))

(assert (=> d!56019 (or (= lt!255925 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255929 (bvsdiv (bvmul lt!255925 lt!255929) lt!255925)))))

(assert (=> d!56019 (= lt!255929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56019 (= lt!255925 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255872))))))

(assert (=> d!56019 (= lt!255926 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7559 lt!255872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7554 lt!255872))))))

(assert (=> d!56019 (invariant!0 (currentBit!7554 lt!255872) (currentByte!7559 lt!255872) (size!3601 (buf!4059 lt!255872)))))

(assert (=> d!56019 (= (bitIndex!0 (size!3601 (buf!4059 lt!255872)) (currentByte!7559 lt!255872) (currentBit!7554 lt!255872)) lt!255926)))

(declare-fun b!162753 () Bool)

(declare-fun res!135690 () Bool)

(assert (=> b!162753 (=> (not res!135690) (not e!112319))))

(assert (=> b!162753 (= res!135690 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255926))))

(declare-fun b!162754 () Bool)

(declare-fun lt!255928 () (_ BitVec 64))

(assert (=> b!162754 (= e!112319 (bvsle lt!255926 (bvmul lt!255928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162754 (or (= lt!255928 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255928 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255928)))))

(assert (=> b!162754 (= lt!255928 ((_ sign_extend 32) (size!3601 (buf!4059 lt!255872))))))

(assert (= (and d!56019 res!135691) b!162753))

(assert (= (and b!162753 res!135690) b!162754))

(declare-fun m!258443 () Bool)

(assert (=> d!56019 m!258443))

(declare-fun m!258445 () Bool)

(assert (=> d!56019 m!258445))

(assert (=> d!55947 d!56019))

(assert (=> d!55947 d!55977))

(declare-fun d!56021 () Bool)

(declare-fun lt!255945 () (_ BitVec 32))

(assert (=> d!56021 (= lt!255945 ((_ extract 31 0) (bvsrem (bvsub lt!255551 lt!255554) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!255944 () (_ BitVec 32))

(assert (=> d!56021 (= lt!255944 ((_ extract 31 0) (bvsdiv (bvsub lt!255551 lt!255554) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112324 () Bool)

(assert (=> d!56021 e!112324))

(declare-fun res!135697 () Bool)

(assert (=> d!56021 (=> (not res!135697) (not e!112324))))

(assert (=> d!56021 (= res!135697 (moveBitIndexPrecond!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554)))))

(declare-fun Unit!11225 () Unit!11180)

(declare-fun Unit!11226 () Unit!11180)

(declare-fun Unit!11227 () Unit!11180)

(assert (=> d!56021 (= (moveBitIndex!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554)) (ite (bvslt (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255945) #b00000000000000000000000000000000) (tuple2!14497 Unit!11225 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvsub (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255944) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255945 (currentBit!7554 (_2!7817 lt!255550))))) (ite (bvsge (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255945) #b00000000000000000000000000001000) (tuple2!14497 Unit!11226 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255944 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255945) #b00000000000000000000000000001000))) (tuple2!14497 Unit!11227 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255944) (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255945))))))))

(declare-fun b!162759 () Bool)

(declare-fun e!112325 () Bool)

(assert (=> b!162759 (= e!112324 e!112325)))

(declare-fun res!135696 () Bool)

(assert (=> b!162759 (=> (not res!135696) (not e!112325))))

(declare-fun lt!255948 () tuple2!14496)

(declare-fun lt!255946 () (_ BitVec 64))

(assert (=> b!162759 (= res!135696 (= (bvadd lt!255946 (bvsub lt!255551 lt!255554)) (bitIndex!0 (size!3601 (buf!4059 (_2!7836 lt!255948))) (currentByte!7559 (_2!7836 lt!255948)) (currentBit!7554 (_2!7836 lt!255948)))))))

(assert (=> b!162759 (or (not (= (bvand lt!255946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255551 lt!255554) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255946 (bvsub lt!255551 lt!255554)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162759 (= lt!255946 (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))))))

(declare-fun lt!255943 () (_ BitVec 32))

(declare-fun lt!255947 () (_ BitVec 32))

(declare-fun Unit!11228 () Unit!11180)

(declare-fun Unit!11229 () Unit!11180)

(declare-fun Unit!11230 () Unit!11180)

(assert (=> b!162759 (= lt!255948 (ite (bvslt (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255947) #b00000000000000000000000000000000) (tuple2!14497 Unit!11228 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvsub (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255943) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255947 (currentBit!7554 (_2!7817 lt!255550))))) (ite (bvsge (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255947) #b00000000000000000000000000001000) (tuple2!14497 Unit!11229 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255943 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255947) #b00000000000000000000000000001000))) (tuple2!14497 Unit!11230 (BitStream!6371 (buf!4059 (_2!7817 lt!255550)) (bvadd (currentByte!7559 (_2!7817 lt!255550)) lt!255943) (bvadd (currentBit!7554 (_2!7817 lt!255550)) lt!255947))))))))

(assert (=> b!162759 (= lt!255947 ((_ extract 31 0) (bvsrem (bvsub lt!255551 lt!255554) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162759 (= lt!255943 ((_ extract 31 0) (bvsdiv (bvsub lt!255551 lt!255554) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!162760 () Bool)

(assert (=> b!162760 (= e!112325 (and (= (size!3601 (buf!4059 (_2!7817 lt!255550))) (size!3601 (buf!4059 (_2!7836 lt!255948)))) (= (buf!4059 (_2!7817 lt!255550)) (buf!4059 (_2!7836 lt!255948)))))))

(assert (= (and d!56021 res!135697) b!162759))

(assert (= (and b!162759 res!135696) b!162760))

(assert (=> d!56021 m!258273))

(declare-fun m!258447 () Bool)

(assert (=> b!162759 m!258447))

(assert (=> b!162759 m!258165))

(assert (=> d!55947 d!56021))

(declare-fun d!56025 () Bool)

(declare-fun res!135700 () Bool)

(declare-fun e!112328 () Bool)

(assert (=> d!56025 (=> (not res!135700) (not e!112328))))

(assert (=> d!56025 (= res!135700 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550))))) (bvsub lt!255551 lt!255554)) (bvsle (bvsub lt!255551 lt!255554) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550))))))))))

(assert (=> d!56025 (= (moveBitIndexPrecond!0 (_2!7817 lt!255550) (bvsub lt!255551 lt!255554)) e!112328)))

(declare-fun b!162764 () Bool)

(declare-fun lt!255951 () (_ BitVec 64))

(assert (=> b!162764 (= e!112328 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255951) (bvsle lt!255951 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3601 (buf!4059 (_2!7817 lt!255550))))))))))

(assert (=> b!162764 (= lt!255951 (bvadd (bitIndex!0 (size!3601 (buf!4059 (_2!7817 lt!255550))) (currentByte!7559 (_2!7817 lt!255550)) (currentBit!7554 (_2!7817 lt!255550))) (bvsub lt!255551 lt!255554)))))

(assert (= (and d!56025 res!135700) b!162764))

(assert (=> b!162764 m!258165))

(assert (=> d!55947 d!56025))

(push 1)

(assert (not b!162728))

(assert (not d!56021))

(assert (not b!162727))

(assert (not d!56019))

(assert (not bm!2770))

(assert (not b!162707))

(assert (not bm!2766))

(assert (not bm!2768))

(assert (not b!162764))

(assert (not d!55977))

(assert (not b!162748))

(assert (not b!162734))

(assert (not b!162688))

(assert (not bm!2767))

(assert (not d!56007))

(assert (not d!55959))

(assert (not b!162673))

(assert (not b!162725))

(assert (not b!162739))

(assert (not d!55983))

(assert (not d!55949))

(assert (not bm!2769))

(assert (not b!162678))

(assert (not d!56005))

(assert (not d!55975))

(assert (not b!162677))

(assert (not b!162745))

(assert (not b!162723))

(assert (not b!162716))

(assert (not b!162741))

(assert (not d!55969))

(assert (not b!162684))

(assert (not b!162675))

(assert (not b!162705))

(assert (not b!162692))

(assert (not b!162701))

(assert (not d!55979))

(assert (not b!162699))

(assert (not b!162709))

(assert (not d!55971))

(assert (not b!162719))

(assert (not b!162752))

(assert (not b!162730))

(assert (not b!162759))

(assert (not bm!2771))

(assert (not b!162680))

(assert (not bm!2765))

(assert (not b!162746))

(assert (not b!162690))

(assert (not d!55965))

(assert (not b!162717))

(assert (not d!55989))

(assert (not b!162710))

(assert (not b!162698))

(assert (not b!162712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

