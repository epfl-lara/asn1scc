; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33942 () Bool)

(assert start!33942)

(declare-fun res!135124 () Bool)

(declare-fun e!111795 () Bool)

(assert (=> start!33942 (=> (not res!135124) (not e!111795))))

(declare-datatypes ((array!8035 0))(
  ( (array!8036 (arr!4524 (Array (_ BitVec 32) (_ BitVec 8))) (size!3603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6374 0))(
  ( (BitStream!6375 (buf!4061 array!8035) (currentByte!7561 (_ BitVec 32)) (currentBit!7556 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6374)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33942 (= res!135124 (validate_offset_byte!0 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) ((_ sign_extend 32) (currentByte!7561 thiss!1602)) ((_ sign_extend 32) (currentBit!7556 thiss!1602))))))

(assert (=> start!33942 e!111795))

(declare-fun e!111790 () Bool)

(declare-fun inv!12 (BitStream!6374) Bool)

(assert (=> start!33942 (and (inv!12 thiss!1602) e!111790)))

(assert (=> start!33942 true))

(declare-fun b!162096 () Bool)

(declare-fun res!135125 () Bool)

(declare-fun e!111788 () Bool)

(assert (=> b!162096 (=> (not res!135125) (not e!111788))))

(declare-datatypes ((Unit!11192 0))(
  ( (Unit!11193) )
))
(declare-datatypes ((tuple3!934 0))(
  ( (tuple3!935 (_1!7822 Unit!11192) (_2!7822 (_ BitVec 8)) (_3!584 BitStream!6374)) )
))
(declare-fun lt!255276 () tuple3!934)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!162096 (= res!135125 (= (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)))))))

(declare-fun b!162097 () Bool)

(declare-fun array_inv!3350 (array!8035) Bool)

(assert (=> b!162097 (= e!111790 (array_inv!3350 (buf!4061 thiss!1602)))))

(declare-fun bm!2738 () Bool)

(declare-fun c!8480 () Bool)

(declare-fun call!2741 () Bool)

(declare-fun arrayRangesEq!555 (array!8035 array!8035 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2738 (= call!2741 (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) #b00000000000000000000000000000000 (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(declare-fun b!162098 () Bool)

(declare-fun res!135121 () Bool)

(assert (=> b!162098 (=> (not res!135121) (not e!111788))))

(declare-fun isPrefixOf!0 (BitStream!6374 BitStream!6374) Bool)

(assert (=> b!162098 (= res!135121 (isPrefixOf!0 thiss!1602 (_3!584 lt!255276)))))

(declare-fun b!162099 () Bool)

(declare-fun e!111794 () Bool)

(declare-fun lt!255263 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162099 (= e!111794 (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602)) lt!255263 #b00000000000000000000000000000000 (currentBit!7556 thiss!1602)))))

(declare-fun b!162100 () Bool)

(declare-fun e!111789 () Bool)

(assert (=> b!162100 (= e!111789 e!111788)))

(declare-fun res!135119 () Bool)

(assert (=> b!162100 (=> (not res!135119) (not e!111788))))

(assert (=> b!162100 (= res!135119 (= (size!3603 (buf!4061 thiss!1602)) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(declare-fun lt!255274 () Unit!11192)

(declare-fun e!111793 () Unit!11192)

(assert (=> b!162100 (= lt!255274 e!111793)))

(declare-fun lt!255268 () Bool)

(assert (=> b!162100 (= c!8480 lt!255268)))

(declare-fun b!162101 () Bool)

(assert (=> b!162101 (= e!111795 (not e!111789))))

(declare-fun res!135120 () Bool)

(assert (=> b!162101 (=> res!135120 e!111789)))

(declare-fun lt!255278 () array!8035)

(assert (=> b!162101 (= res!135120 (not (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001))))))

(declare-fun lt!255277 () (_ BitVec 8))

(assert (=> b!162101 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001))))

(declare-fun lt!255265 () Unit!11192)

(declare-fun arrayUpdatedAtPrefixLemma!163 (array!8035 (_ BitVec 32) (_ BitVec 8)) Unit!11192)

(assert (=> b!162101 (= lt!255265 (arrayUpdatedAtPrefixLemma!163 (buf!4061 thiss!1602) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277))))

(assert (=> b!162101 (= lt!255277 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!255269 () (_ BitVec 8))

(declare-fun lt!255264 () (_ BitVec 32))

(declare-fun lt!255279 () (_ BitVec 32))

(declare-fun lt!255272 () (_ BitVec 8))

(declare-fun Unit!11194 () Unit!11192)

(declare-fun Unit!11195 () Unit!11192)

(assert (=> b!162101 (= lt!255276 (ite lt!255268 (let ((bdg!9767 ((_ extract 7 0) (bvnot lt!255279)))) (let ((bdg!9768 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)))) ((_ sign_extend 24) bdg!9767))))) (tuple3!935 Unit!11194 bdg!9767 (BitStream!6375 (array!8036 (store (arr!4524 (array!8036 (store (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)) bdg!9768) (size!3603 lt!255278))) (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9768) (bvshl ((_ sign_extend 24) v!222) lt!255264)))) (size!3603 (array!8036 (store (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)) bdg!9768) (size!3603 lt!255278)))) (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)) (currentBit!7556 thiss!1602))))) (tuple3!935 Unit!11195 lt!255269 (BitStream!6375 lt!255278 (bvadd #b00000000000000000000000000000001 (currentByte!7561 thiss!1602)) (currentBit!7556 thiss!1602)))))))

(declare-fun lt!255275 () (_ BitVec 32))

(assert (=> b!162101 (= lt!255268 (bvsgt lt!255275 #b00000000000000000000000000000000))))

(assert (=> b!162101 e!111794))

(declare-fun res!135122 () Bool)

(assert (=> b!162101 (=> res!135122 e!111794)))

(assert (=> b!162101 (= res!135122 (bvsge (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> b!162101 (= lt!255278 (array!8036 (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> b!162101 (= lt!255263 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255272) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!255275))))))

(assert (=> b!162101 (= lt!255272 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602))) lt!255279)))))

(assert (=> b!162101 (= lt!255279 ((_ sign_extend 24) lt!255269))))

(assert (=> b!162101 (= lt!255269 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!255264)))))))

(assert (=> b!162101 (= lt!255264 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!255275))))))

(assert (=> b!162101 (= lt!255275 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7556 thiss!1602))))))

(declare-fun b!162102 () Bool)

(declare-fun Unit!11196 () Unit!11192)

(assert (=> b!162102 (= e!111793 Unit!11196)))

(declare-fun lt!255267 () Unit!11192)

(assert (=> b!162102 (= lt!255267 (arrayUpdatedAtPrefixLemma!163 (buf!4061 thiss!1602) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))))))

(assert (=> b!162102 call!2741))

(declare-fun lt!255273 () Unit!11192)

(assert (=> b!162102 (= lt!255273 (arrayUpdatedAtPrefixLemma!163 lt!255278 (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))))))

(assert (=> b!162102 (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276)))))

(declare-fun lt!255271 () Unit!11192)

(declare-fun arrayRangesEqTransitive!150 (array!8035 array!8035 array!8035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11192)

(assert (=> b!162102 (= lt!255271 (arrayRangesEqTransitive!150 (buf!4061 thiss!1602) lt!255278 (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(declare-fun res!135123 () Bool)

(assert (=> b!162102 (= res!135123 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(declare-fun e!111792 () Bool)

(assert (=> b!162102 (=> (not res!135123) (not e!111792))))

(assert (=> b!162102 e!111792))

(declare-fun b!162103 () Bool)

(declare-fun Unit!11197 () Unit!11192)

(assert (=> b!162103 (= e!111793 Unit!11197)))

(assert (=> b!162103 call!2741))

(declare-fun b!162104 () Bool)

(assert (=> b!162104 (= e!111792 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (currentByte!7561 thiss!1602)))))

(declare-datatypes ((tuple2!14476 0))(
  ( (tuple2!14477 (_1!7823 BitStream!6374) (_2!7823 BitStream!6374)) )
))
(declare-fun lt!255270 () tuple2!14476)

(declare-datatypes ((tuple2!14478 0))(
  ( (tuple2!14479 (_1!7824 BitStream!6374) (_2!7824 (_ BitVec 8))) )
))
(declare-fun lt!255266 () tuple2!14478)

(declare-fun b!162105 () Bool)

(assert (=> b!162105 (= e!111788 (and (= (_2!7824 lt!255266) v!222) (= (_1!7824 lt!255266) (_2!7823 lt!255270))))))

(declare-fun readBytePure!0 (BitStream!6374) tuple2!14478)

(assert (=> b!162105 (= lt!255266 (readBytePure!0 (_1!7823 lt!255270)))))

(declare-fun reader!0 (BitStream!6374 BitStream!6374) tuple2!14476)

(assert (=> b!162105 (= lt!255270 (reader!0 thiss!1602 (_3!584 lt!255276)))))

(assert (= (and start!33942 res!135124) b!162101))

(assert (= (and b!162101 (not res!135122)) b!162099))

(assert (= (and b!162101 (not res!135120)) b!162100))

(assert (= (and b!162100 c!8480) b!162102))

(assert (= (and b!162100 (not c!8480)) b!162103))

(assert (= (and b!162102 res!135123) b!162104))

(assert (= (or b!162102 b!162103) bm!2738))

(assert (= (and b!162100 res!135119) b!162096))

(assert (= (and b!162096 res!135125) b!162098))

(assert (= (and b!162098 res!135121) b!162105))

(assert (= start!33942 b!162097))

(declare-fun m!257267 () Bool)

(assert (=> b!162099 m!257267))

(assert (=> b!162099 m!257267))

(declare-fun m!257269 () Bool)

(assert (=> b!162099 m!257269))

(declare-fun m!257271 () Bool)

(assert (=> b!162096 m!257271))

(declare-fun m!257273 () Bool)

(assert (=> b!162096 m!257273))

(declare-fun m!257275 () Bool)

(assert (=> b!162102 m!257275))

(declare-fun m!257277 () Bool)

(assert (=> b!162102 m!257277))

(declare-fun m!257279 () Bool)

(assert (=> b!162102 m!257279))

(declare-fun m!257281 () Bool)

(assert (=> b!162102 m!257281))

(declare-fun m!257283 () Bool)

(assert (=> b!162102 m!257283))

(declare-fun m!257285 () Bool)

(assert (=> b!162102 m!257285))

(assert (=> b!162102 m!257275))

(declare-fun m!257287 () Bool)

(assert (=> b!162102 m!257287))

(declare-fun m!257289 () Bool)

(assert (=> b!162102 m!257289))

(assert (=> b!162102 m!257275))

(declare-fun m!257291 () Bool)

(assert (=> b!162102 m!257291))

(assert (=> bm!2738 m!257275))

(declare-fun m!257293 () Bool)

(assert (=> bm!2738 m!257293))

(declare-fun m!257295 () Bool)

(assert (=> bm!2738 m!257295))

(declare-fun m!257297 () Bool)

(assert (=> b!162101 m!257297))

(declare-fun m!257299 () Bool)

(assert (=> b!162101 m!257299))

(declare-fun m!257301 () Bool)

(assert (=> b!162101 m!257301))

(declare-fun m!257303 () Bool)

(assert (=> b!162101 m!257303))

(declare-fun m!257305 () Bool)

(assert (=> b!162101 m!257305))

(declare-fun m!257307 () Bool)

(assert (=> b!162101 m!257307))

(assert (=> b!162101 m!257279))

(declare-fun m!257309 () Bool)

(assert (=> b!162101 m!257309))

(declare-fun m!257311 () Bool)

(assert (=> b!162101 m!257311))

(assert (=> b!162101 m!257285))

(assert (=> b!162101 m!257267))

(declare-fun m!257313 () Bool)

(assert (=> b!162101 m!257313))

(declare-fun m!257315 () Bool)

(assert (=> b!162098 m!257315))

(declare-fun m!257317 () Bool)

(assert (=> b!162097 m!257317))

(declare-fun m!257319 () Bool)

(assert (=> b!162104 m!257319))

(declare-fun m!257321 () Bool)

(assert (=> start!33942 m!257321))

(declare-fun m!257323 () Bool)

(assert (=> start!33942 m!257323))

(declare-fun m!257325 () Bool)

(assert (=> b!162105 m!257325))

(declare-fun m!257327 () Bool)

(assert (=> b!162105 m!257327))

(push 1)

(assert (not b!162098))

(assert (not b!162102))

(assert (not b!162101))

(assert (not b!162105))

(assert (not bm!2738))

(assert (not b!162097))

(assert (not b!162099))

(assert (not b!162104))

(assert (not start!33942))

(assert (not b!162096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55517 () Bool)

(declare-datatypes ((tuple2!14482 0))(
  ( (tuple2!14483 (_1!7826 (_ BitVec 8)) (_2!7826 BitStream!6374)) )
))
(declare-fun lt!255377 () tuple2!14482)

(declare-fun readByte!0 (BitStream!6374) tuple2!14482)

(assert (=> d!55517 (= lt!255377 (readByte!0 (_1!7823 lt!255270)))))

(assert (=> d!55517 (= (readBytePure!0 (_1!7823 lt!255270)) (tuple2!14479 (_2!7826 lt!255377) (_1!7826 lt!255377)))))

(declare-fun bs!13803 () Bool)

(assert (= bs!13803 d!55517))

(declare-fun m!257413 () Bool)

(assert (=> bs!13803 m!257413))

(assert (=> b!162105 d!55517))

(declare-fun b!162169 () Bool)

(declare-fun res!135179 () Bool)

(declare-fun e!111837 () Bool)

(assert (=> b!162169 (=> (not res!135179) (not e!111837))))

(declare-fun lt!255428 () tuple2!14476)

(assert (=> b!162169 (= res!135179 (isPrefixOf!0 (_1!7823 lt!255428) thiss!1602))))

(declare-fun b!162170 () Bool)

(declare-fun e!111838 () Unit!11192)

(declare-fun Unit!11199 () Unit!11192)

(assert (=> b!162170 (= e!111838 Unit!11199)))

(declare-fun b!162171 () Bool)

(declare-fun lt!255418 () Unit!11192)

(assert (=> b!162171 (= e!111838 lt!255418)))

(declare-fun lt!255419 () (_ BitVec 64))

(assert (=> b!162171 (= lt!255419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!255436 () (_ BitVec 64))

(assert (=> b!162171 (= lt!255436 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8035 array!8035 (_ BitVec 64) (_ BitVec 64)) Unit!11192)

(assert (=> b!162171 (= lt!255418 (arrayBitRangesEqSymmetric!0 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) lt!255419 lt!255436))))

(declare-fun arrayBitRangesEq!0 (array!8035 array!8035 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162171 (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) lt!255419 lt!255436)))

(declare-fun lt!255434 () (_ BitVec 64))

(declare-fun lt!255421 () (_ BitVec 64))

(declare-fun b!162172 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!6374 (_ BitVec 64)) BitStream!6374)

(assert (=> b!162172 (= e!111837 (= (_1!7823 lt!255428) (withMovedBitIndex!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421))))))

(assert (=> b!162172 (or (= (bvand lt!255434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255434 lt!255421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162172 (= lt!255421 (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276))))))

(assert (=> b!162172 (= lt!255434 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)))))

(declare-fun d!55519 () Bool)

(assert (=> d!55519 e!111837))

(declare-fun res!135180 () Bool)

(assert (=> d!55519 (=> (not res!135180) (not e!111837))))

(assert (=> d!55519 (= res!135180 (isPrefixOf!0 (_1!7823 lt!255428) (_2!7823 lt!255428)))))

(declare-fun lt!255425 () BitStream!6374)

(assert (=> d!55519 (= lt!255428 (tuple2!14477 lt!255425 (_3!584 lt!255276)))))

(declare-fun lt!255437 () Unit!11192)

(declare-fun lt!255422 () Unit!11192)

(assert (=> d!55519 (= lt!255437 lt!255422)))

(assert (=> d!55519 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6374 BitStream!6374 BitStream!6374) Unit!11192)

(assert (=> d!55519 (= lt!255422 (lemmaIsPrefixTransitive!0 lt!255425 (_3!584 lt!255276) (_3!584 lt!255276)))))

(declare-fun lt!255432 () Unit!11192)

(declare-fun lt!255423 () Unit!11192)

(assert (=> d!55519 (= lt!255432 lt!255423)))

(assert (=> d!55519 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(assert (=> d!55519 (= lt!255423 (lemmaIsPrefixTransitive!0 lt!255425 thiss!1602 (_3!584 lt!255276)))))

(declare-fun lt!255435 () Unit!11192)

(assert (=> d!55519 (= lt!255435 e!111838)))

(declare-fun c!8486 () Bool)

(assert (=> d!55519 (= c!8486 (not (= (size!3603 (buf!4061 thiss!1602)) #b00000000000000000000000000000000)))))

(declare-fun lt!255424 () Unit!11192)

(declare-fun lt!255430 () Unit!11192)

(assert (=> d!55519 (= lt!255424 lt!255430)))

(assert (=> d!55519 (isPrefixOf!0 (_3!584 lt!255276) (_3!584 lt!255276))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6374) Unit!11192)

(assert (=> d!55519 (= lt!255430 (lemmaIsPrefixRefl!0 (_3!584 lt!255276)))))

(declare-fun lt!255431 () Unit!11192)

(declare-fun lt!255429 () Unit!11192)

(assert (=> d!55519 (= lt!255431 lt!255429)))

(assert (=> d!55519 (= lt!255429 (lemmaIsPrefixRefl!0 (_3!584 lt!255276)))))

(declare-fun lt!255420 () Unit!11192)

(declare-fun lt!255426 () Unit!11192)

(assert (=> d!55519 (= lt!255420 lt!255426)))

(assert (=> d!55519 (isPrefixOf!0 lt!255425 lt!255425)))

(assert (=> d!55519 (= lt!255426 (lemmaIsPrefixRefl!0 lt!255425))))

(declare-fun lt!255427 () Unit!11192)

(declare-fun lt!255433 () Unit!11192)

(assert (=> d!55519 (= lt!255427 lt!255433)))

(assert (=> d!55519 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55519 (= lt!255433 (lemmaIsPrefixRefl!0 thiss!1602))))

(assert (=> d!55519 (= lt!255425 (BitStream!6375 (buf!4061 (_3!584 lt!255276)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)))))

(assert (=> d!55519 (isPrefixOf!0 thiss!1602 (_3!584 lt!255276))))

(assert (=> d!55519 (= (reader!0 thiss!1602 (_3!584 lt!255276)) lt!255428)))

(declare-fun b!162173 () Bool)

(declare-fun res!135181 () Bool)

(assert (=> b!162173 (=> (not res!135181) (not e!111837))))

(assert (=> b!162173 (= res!135181 (isPrefixOf!0 (_2!7823 lt!255428) (_3!584 lt!255276)))))

(assert (= (and d!55519 c!8486) b!162171))

(assert (= (and d!55519 (not c!8486)) b!162170))

(assert (= (and d!55519 res!135180) b!162169))

(assert (= (and b!162169 res!135179) b!162173))

(assert (= (and b!162173 res!135181) b!162172))

(declare-fun m!257415 () Bool)

(assert (=> d!55519 m!257415))

(declare-fun m!257417 () Bool)

(assert (=> d!55519 m!257417))

(assert (=> d!55519 m!257315))

(declare-fun m!257419 () Bool)

(assert (=> d!55519 m!257419))

(declare-fun m!257421 () Bool)

(assert (=> d!55519 m!257421))

(declare-fun m!257423 () Bool)

(assert (=> d!55519 m!257423))

(declare-fun m!257425 () Bool)

(assert (=> d!55519 m!257425))

(declare-fun m!257427 () Bool)

(assert (=> d!55519 m!257427))

(declare-fun m!257429 () Bool)

(assert (=> d!55519 m!257429))

(declare-fun m!257431 () Bool)

(assert (=> d!55519 m!257431))

(declare-fun m!257433 () Bool)

(assert (=> d!55519 m!257433))

(assert (=> b!162171 m!257273))

(declare-fun m!257435 () Bool)

(assert (=> b!162171 m!257435))

(declare-fun m!257437 () Bool)

(assert (=> b!162171 m!257437))

(declare-fun m!257439 () Bool)

(assert (=> b!162169 m!257439))

(declare-fun m!257441 () Bool)

(assert (=> b!162172 m!257441))

(assert (=> b!162172 m!257271))

(assert (=> b!162172 m!257273))

(declare-fun m!257443 () Bool)

(assert (=> b!162173 m!257443))

(assert (=> b!162105 d!55519))

(declare-fun d!55521 () Bool)

(assert (=> d!55521 (= (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602)) lt!255263 #b00000000000000000000000000000000 (currentBit!7556 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7556 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7556 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!255263) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7556 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13804 () Bool)

(assert (= bs!13804 d!55521))

(declare-fun m!257445 () Bool)

(assert (=> bs!13804 m!257445))

(declare-fun m!257447 () Bool)

(assert (=> bs!13804 m!257447))

(assert (=> b!162099 d!55521))

(declare-fun d!55523 () Bool)

(declare-fun res!135186 () Bool)

(declare-fun e!111843 () Bool)

(assert (=> d!55523 (=> res!135186 e!111843)))

(assert (=> d!55523 (= res!135186 (= #b00000000000000000000000000000000 (currentByte!7561 thiss!1602)))))

(assert (=> d!55523 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (currentByte!7561 thiss!1602)) e!111843)))

(declare-fun b!162178 () Bool)

(declare-fun e!111844 () Bool)

(assert (=> b!162178 (= e!111843 e!111844)))

(declare-fun res!135187 () Bool)

(assert (=> b!162178 (=> (not res!135187) (not e!111844))))

(assert (=> b!162178 (= res!135187 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) #b00000000000000000000000000000000)))))

(declare-fun b!162179 () Bool)

(assert (=> b!162179 (= e!111844 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)))))

(assert (= (and d!55523 (not res!135186)) b!162178))

(assert (= (and b!162178 res!135187) b!162179))

(declare-fun m!257449 () Bool)

(assert (=> b!162178 m!257449))

(declare-fun m!257451 () Bool)

(assert (=> b!162178 m!257451))

(declare-fun m!257453 () Bool)

(assert (=> b!162179 m!257453))

(assert (=> b!162104 d!55523))

(declare-fun d!55525 () Bool)

(declare-fun res!135194 () Bool)

(declare-fun e!111850 () Bool)

(assert (=> d!55525 (=> (not res!135194) (not e!111850))))

(assert (=> d!55525 (= res!135194 (= (size!3603 (buf!4061 thiss!1602)) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (=> d!55525 (= (isPrefixOf!0 thiss!1602 (_3!584 lt!255276)) e!111850)))

(declare-fun b!162186 () Bool)

(declare-fun res!135196 () Bool)

(assert (=> b!162186 (=> (not res!135196) (not e!111850))))

(assert (=> b!162186 (= res!135196 (bvsle (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun b!162187 () Bool)

(declare-fun e!111849 () Bool)

(assert (=> b!162187 (= e!111850 e!111849)))

(declare-fun res!135195 () Bool)

(assert (=> b!162187 (=> res!135195 e!111849)))

(assert (=> b!162187 (= res!135195 (= (size!3603 (buf!4061 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162188 () Bool)

(assert (=> b!162188 (= e!111849 (arrayBitRangesEq!0 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(assert (= (and d!55525 res!135194) b!162186))

(assert (= (and b!162186 res!135196) b!162187))

(assert (= (and b!162187 (not res!135195)) b!162188))

(assert (=> b!162186 m!257273))

(assert (=> b!162186 m!257271))

(assert (=> b!162188 m!257273))

(assert (=> b!162188 m!257273))

(declare-fun m!257455 () Bool)

(assert (=> b!162188 m!257455))

(assert (=> b!162098 d!55525))

(declare-fun d!55527 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55527 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) ((_ sign_extend 32) (currentByte!7561 thiss!1602)) ((_ sign_extend 32) (currentBit!7556 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) ((_ sign_extend 32) (currentByte!7561 thiss!1602)) ((_ sign_extend 32) (currentBit!7556 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13805 () Bool)

(assert (= bs!13805 d!55527))

(declare-fun m!257457 () Bool)

(assert (=> bs!13805 m!257457))

(assert (=> start!33942 d!55527))

(declare-fun d!55531 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55531 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7556 thiss!1602) (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602))))))

(declare-fun bs!13806 () Bool)

(assert (= bs!13806 d!55531))

(declare-fun m!257459 () Bool)

(assert (=> bs!13806 m!257459))

(assert (=> start!33942 d!55531))

(declare-fun d!55533 () Bool)

(declare-fun res!135197 () Bool)

(declare-fun e!111851 () Bool)

(assert (=> d!55533 (=> res!135197 e!111851)))

(assert (=> d!55533 (= res!135197 (= #b00000000000000000000000000000000 (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (=> d!55533 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) #b00000000000000000000000000000000 (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))) e!111851)))

(declare-fun b!162189 () Bool)

(declare-fun e!111852 () Bool)

(assert (=> b!162189 (= e!111851 e!111852)))

(declare-fun res!135198 () Bool)

(assert (=> b!162189 (=> (not res!135198) (not e!111852))))

(assert (=> b!162189 (= res!135198 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276)))) #b00000000000000000000000000000000)))))

(declare-fun b!162190 () Bool)

(assert (=> b!162190 (= e!111852 (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (= (and d!55533 (not res!135197)) b!162189))

(assert (= (and b!162189 res!135198) b!162190))

(assert (=> b!162189 m!257449))

(declare-fun m!257463 () Bool)

(assert (=> b!162189 m!257463))

(declare-fun m!257465 () Bool)

(assert (=> b!162190 m!257465))

(assert (=> bm!2738 d!55533))

(declare-fun d!55537 () Bool)

(declare-fun e!111855 () Bool)

(assert (=> d!55537 e!111855))

(declare-fun res!135201 () Bool)

(assert (=> d!55537 (=> (not res!135201) (not e!111855))))

(assert (=> d!55537 (= res!135201 (and (bvsge (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000000) (bvslt (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 thiss!1602)))))))

(declare-fun lt!255440 () Unit!11192)

(declare-fun choose!178 (array!8035 (_ BitVec 32) (_ BitVec 8)) Unit!11192)

(assert (=> d!55537 (= lt!255440 (choose!178 (buf!4061 thiss!1602) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))))))

(assert (=> d!55537 (and (bvsle #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))) (bvslt (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55537 (= (arrayUpdatedAtPrefixLemma!163 (buf!4061 thiss!1602) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) lt!255440)))

(declare-fun b!162193 () Bool)

(assert (=> b!162193 (= e!111855 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55537 res!135201) b!162193))

(assert (=> d!55537 m!257275))

(declare-fun m!257469 () Bool)

(assert (=> d!55537 m!257469))

(assert (=> b!162193 m!257293))

(declare-fun m!257471 () Bool)

(assert (=> b!162193 m!257471))

(assert (=> b!162102 d!55537))

(declare-fun d!55541 () Bool)

(declare-fun e!111858 () Bool)

(assert (=> d!55541 e!111858))

(declare-fun res!135206 () Bool)

(assert (=> d!55541 (=> (not res!135206) (not e!111858))))

(assert (=> d!55541 (= res!135206 (and (bvsge (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000000) (bvslt (currentByte!7561 (_3!584 lt!255276)) (size!3603 lt!255278))))))

(declare-fun lt!255441 () Unit!11192)

(assert (=> d!55541 (= lt!255441 (choose!178 lt!255278 (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))))))

(assert (=> d!55541 (and (bvsle #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))) (bvslt (currentByte!7561 (_3!584 lt!255276)) (size!3603 lt!255278)))))

(assert (=> d!55541 (= (arrayUpdatedAtPrefixLemma!163 lt!255278 (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) lt!255441)))

(declare-fun b!162198 () Bool)

(assert (=> b!162198 (= e!111858 (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55541 res!135206) b!162198))

(assert (=> d!55541 m!257275))

(declare-fun m!257473 () Bool)

(assert (=> d!55541 m!257473))

(declare-fun m!257475 () Bool)

(assert (=> b!162198 m!257475))

(declare-fun m!257477 () Bool)

(assert (=> b!162198 m!257477))

(assert (=> b!162102 d!55541))

(declare-fun d!55543 () Bool)

(assert (=> d!55543 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001))))

(declare-fun lt!255444 () Unit!11192)

(declare-fun choose!179 (array!8035 array!8035 array!8035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11192)

(assert (=> d!55543 (= lt!255444 (choose!179 (buf!4061 thiss!1602) lt!255278 (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55543 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55543 (= (arrayRangesEqTransitive!150 (buf!4061 thiss!1602) lt!255278 (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) lt!255444)))

(declare-fun bs!13809 () Bool)

(assert (= bs!13809 d!55543))

(assert (=> bs!13809 m!257287))

(declare-fun m!257479 () Bool)

(assert (=> bs!13809 m!257479))

(assert (=> b!162102 d!55543))

(declare-fun d!55545 () Bool)

(declare-fun res!135212 () Bool)

(declare-fun e!111863 () Bool)

(assert (=> d!55545 (=> res!135212 e!111863)))

(assert (=> d!55545 (= res!135212 (= #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55545 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111863)))

(declare-fun b!162204 () Bool)

(declare-fun e!111864 () Bool)

(assert (=> b!162204 (= e!111863 e!111864)))

(declare-fun res!135213 () Bool)

(assert (=> b!162204 (=> (not res!135213) (not e!111864))))

(assert (=> b!162204 (= res!135213 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) #b00000000000000000000000000000000)))))

(declare-fun b!162205 () Bool)

(assert (=> b!162205 (= e!111864 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55545 (not res!135212)) b!162204))

(assert (= (and b!162204 res!135213) b!162205))

(assert (=> b!162204 m!257449))

(assert (=> b!162204 m!257451))

(declare-fun m!257483 () Bool)

(assert (=> b!162205 m!257483))

(assert (=> b!162102 d!55545))

(declare-fun d!55549 () Bool)

(declare-fun res!135214 () Bool)

(declare-fun e!111865 () Bool)

(assert (=> d!55549 (=> res!135214 e!111865)))

(assert (=> d!55549 (= res!135214 (= #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55549 (= (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))) e!111865)))

(declare-fun b!162206 () Bool)

(declare-fun e!111866 () Bool)

(assert (=> b!162206 (= e!111865 e!111866)))

(declare-fun res!135215 () Bool)

(assert (=> b!162206 (=> (not res!135215) (not e!111866))))

(assert (=> b!162206 (= res!135215 (= (select (arr!4524 lt!255278) #b00000000000000000000000000000000) (select (arr!4524 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162207 () Bool)

(assert (=> b!162207 (= e!111866 (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55549 (not res!135214)) b!162206))

(assert (= (and b!162206 res!135215) b!162207))

(declare-fun m!257485 () Bool)

(assert (=> b!162206 m!257485))

(declare-fun m!257487 () Bool)

(assert (=> b!162206 m!257487))

(declare-fun m!257489 () Bool)

(assert (=> b!162207 m!257489))

(assert (=> b!162102 d!55549))

(declare-fun d!55551 () Bool)

(assert (=> d!55551 (= (array_inv!3350 (buf!4061 thiss!1602)) (bvsge (size!3603 (buf!4061 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!162097 d!55551))

(declare-fun d!55553 () Bool)

(declare-fun res!135216 () Bool)

(declare-fun e!111867 () Bool)

(assert (=> d!55553 (=> res!135216 e!111867)))

(assert (=> d!55553 (= res!135216 (= #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55553 (= (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111867)))

(declare-fun b!162208 () Bool)

(declare-fun e!111868 () Bool)

(assert (=> b!162208 (= e!111867 e!111868)))

(declare-fun res!135217 () Bool)

(assert (=> b!162208 (=> (not res!135217) (not e!111868))))

(assert (=> b!162208 (= res!135217 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 lt!255278) #b00000000000000000000000000000000)))))

(declare-fun b!162209 () Bool)

(assert (=> b!162209 (= e!111868 (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55553 (not res!135216)) b!162208))

(assert (= (and b!162208 res!135217) b!162209))

(assert (=> b!162208 m!257449))

(assert (=> b!162208 m!257485))

(declare-fun m!257491 () Bool)

(assert (=> b!162209 m!257491))

(assert (=> b!162101 d!55553))

(declare-fun d!55555 () Bool)

(declare-fun res!135222 () Bool)

(declare-fun e!111873 () Bool)

(assert (=> d!55555 (=> res!135222 e!111873)))

(assert (=> d!55555 (= res!135222 (= #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55555 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111873)))

(declare-fun b!162214 () Bool)

(declare-fun e!111874 () Bool)

(assert (=> b!162214 (= e!111873 e!111874)))

(declare-fun res!135223 () Bool)

(assert (=> b!162214 (=> (not res!135223) (not e!111874))))

(assert (=> b!162214 (= res!135223 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162215 () Bool)

(assert (=> b!162215 (= e!111874 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55555 (not res!135222)) b!162214))

(assert (= (and b!162214 res!135223) b!162215))

(assert (=> b!162214 m!257449))

(declare-fun m!257493 () Bool)

(assert (=> b!162214 m!257493))

(declare-fun m!257495 () Bool)

(assert (=> b!162215 m!257495))

(assert (=> b!162101 d!55555))

(declare-fun d!55557 () Bool)

(declare-fun e!111875 () Bool)

(assert (=> d!55557 e!111875))

(declare-fun res!135224 () Bool)

(assert (=> d!55557 (=> (not res!135224) (not e!111875))))

(assert (=> d!55557 (= res!135224 (and (bvsge (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (size!3603 (buf!4061 thiss!1602)))))))

(declare-fun lt!255445 () Unit!11192)

(assert (=> d!55557 (= lt!255445 (choose!178 (buf!4061 thiss!1602) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277))))

(assert (=> d!55557 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55557 (= (arrayUpdatedAtPrefixLemma!163 (buf!4061 thiss!1602) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) lt!255445)))

(declare-fun b!162216 () Bool)

(assert (=> b!162216 (= e!111875 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55557 res!135224) b!162216))

(declare-fun m!257497 () Bool)

(assert (=> d!55557 m!257497))

(assert (=> b!162216 m!257309))

(assert (=> b!162216 m!257307))

(assert (=> b!162101 d!55557))

(declare-fun d!55559 () Bool)

(declare-fun e!111891 () Bool)

(assert (=> d!55559 e!111891))

(declare-fun res!135243 () Bool)

(assert (=> d!55559 (=> (not res!135243) (not e!111891))))

(declare-fun lt!255462 () (_ BitVec 64))

(declare-fun lt!255466 () (_ BitVec 64))

(declare-fun lt!255465 () (_ BitVec 64))

(assert (=> d!55559 (= res!135243 (= lt!255465 (bvsub lt!255462 lt!255466)))))

(assert (=> d!55559 (or (= (bvand lt!255462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255466 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255462 lt!255466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55559 (= lt!255466 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_3!584 lt!255276)))) ((_ sign_extend 32) (currentByte!7561 (_3!584 lt!255276))) ((_ sign_extend 32) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun lt!255463 () (_ BitVec 64))

(declare-fun lt!255461 () (_ BitVec 64))

(assert (=> d!55559 (= lt!255462 (bvmul lt!255463 lt!255461))))

(assert (=> d!55559 (or (= lt!255463 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255461 (bvsdiv (bvmul lt!255463 lt!255461) lt!255463)))))

(assert (=> d!55559 (= lt!255461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55559 (= lt!255463 ((_ sign_extend 32) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (=> d!55559 (= lt!255465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_3!584 lt!255276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_3!584 lt!255276)))))))

(assert (=> d!55559 (invariant!0 (currentBit!7556 (_3!584 lt!255276)) (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 (_3!584 lt!255276))))))

(assert (=> d!55559 (= (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276))) lt!255465)))

(declare-fun b!162234 () Bool)

(declare-fun res!135242 () Bool)

(assert (=> b!162234 (=> (not res!135242) (not e!111891))))

(assert (=> b!162234 (= res!135242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255465))))

(declare-fun b!162235 () Bool)

(declare-fun lt!255464 () (_ BitVec 64))

(assert (=> b!162235 (= e!111891 (bvsle lt!255465 (bvmul lt!255464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162235 (or (= lt!255464 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255464 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255464)))))

(assert (=> b!162235 (= lt!255464 ((_ sign_extend 32) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (= (and d!55559 res!135243) b!162234))

(assert (= (and b!162234 res!135242) b!162235))

(declare-fun m!257521 () Bool)

(assert (=> d!55559 m!257521))

(declare-fun m!257523 () Bool)

(assert (=> d!55559 m!257523))

(assert (=> b!162096 d!55559))

(declare-fun d!55573 () Bool)

(declare-fun e!111892 () Bool)

(assert (=> d!55573 e!111892))

(declare-fun res!135245 () Bool)

(assert (=> d!55573 (=> (not res!135245) (not e!111892))))

(declare-fun lt!255471 () (_ BitVec 64))

(declare-fun lt!255472 () (_ BitVec 64))

(declare-fun lt!255468 () (_ BitVec 64))

(assert (=> d!55573 (= res!135245 (= lt!255471 (bvsub lt!255468 lt!255472)))))

(assert (=> d!55573 (or (= (bvand lt!255468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255472 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255468 lt!255472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55573 (= lt!255472 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) ((_ sign_extend 32) (currentByte!7561 thiss!1602)) ((_ sign_extend 32) (currentBit!7556 thiss!1602))))))

(declare-fun lt!255469 () (_ BitVec 64))

(declare-fun lt!255467 () (_ BitVec 64))

(assert (=> d!55573 (= lt!255468 (bvmul lt!255469 lt!255467))))

(assert (=> d!55573 (or (= lt!255469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255467 (bvsdiv (bvmul lt!255469 lt!255467) lt!255469)))))

(assert (=> d!55573 (= lt!255467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55573 (= lt!255469 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55573 (= lt!255471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 thiss!1602))))))

(assert (=> d!55573 (invariant!0 (currentBit!7556 thiss!1602) (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602)))))

(assert (=> d!55573 (= (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) lt!255471)))

(declare-fun b!162236 () Bool)

(declare-fun res!135244 () Bool)

(assert (=> b!162236 (=> (not res!135244) (not e!111892))))

(assert (=> b!162236 (= res!135244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255471))))

(declare-fun b!162237 () Bool)

(declare-fun lt!255470 () (_ BitVec 64))

(assert (=> b!162237 (= e!111892 (bvsle lt!255471 (bvmul lt!255470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162237 (or (= lt!255470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255470)))))

(assert (=> b!162237 (= lt!255470 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))))))

(assert (= (and d!55573 res!135245) b!162236))

(assert (= (and b!162236 res!135244) b!162237))

(assert (=> d!55573 m!257457))

(assert (=> d!55573 m!257459))

(assert (=> b!162096 d!55573))

(push 1)

(assert (not d!55573))

(assert (not b!162186))

(assert (not b!162171))

(assert (not b!162188))

(assert (not b!162215))

(assert (not b!162198))

(assert (not b!162207))

(assert (not d!55527))

(assert (not b!162193))

(assert (not d!55541))

(assert (not b!162216))

(assert (not b!162172))

(assert (not b!162173))

(assert (not b!162190))

(assert (not d!55559))

(assert (not b!162209))

(assert (not d!55557))

(assert (not d!55517))

(assert (not b!162179))

(assert (not b!162205))

(assert (not d!55519))

(assert (not d!55543))

(assert (not b!162169))

(assert (not d!55531))

(assert (not d!55537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55593 () Bool)

(declare-fun res!135267 () Bool)

(declare-fun e!111908 () Bool)

(assert (=> d!55593 (=> (not res!135267) (not e!111908))))

(assert (=> d!55593 (= res!135267 (= (size!3603 (buf!4061 (_2!7823 lt!255428))) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (=> d!55593 (= (isPrefixOf!0 (_2!7823 lt!255428) (_3!584 lt!255276)) e!111908)))

(declare-fun b!162265 () Bool)

(declare-fun res!135269 () Bool)

(assert (=> b!162265 (=> (not res!135269) (not e!111908))))

(assert (=> b!162265 (= res!135269 (bvsle (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))) (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun b!162266 () Bool)

(declare-fun e!111907 () Bool)

(assert (=> b!162266 (= e!111908 e!111907)))

(declare-fun res!135268 () Bool)

(assert (=> b!162266 (=> res!135268 e!111907)))

(assert (=> b!162266 (= res!135268 (= (size!3603 (buf!4061 (_2!7823 lt!255428))) #b00000000000000000000000000000000))))

(declare-fun b!162267 () Bool)

(assert (=> b!162267 (= e!111907 (arrayBitRangesEq!0 (buf!4061 (_2!7823 lt!255428)) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428)))))))

(assert (= (and d!55593 res!135267) b!162265))

(assert (= (and b!162265 res!135269) b!162266))

(assert (= (and b!162266 (not res!135268)) b!162267))

(declare-fun m!257579 () Bool)

(assert (=> b!162265 m!257579))

(assert (=> b!162265 m!257271))

(assert (=> b!162267 m!257579))

(assert (=> b!162267 m!257579))

(declare-fun m!257581 () Bool)

(assert (=> b!162267 m!257581))

(assert (=> b!162173 d!55593))

(declare-fun d!55595 () Bool)

(declare-fun e!111911 () Bool)

(assert (=> d!55595 e!111911))

(declare-fun res!135272 () Bool)

(assert (=> d!55595 (=> (not res!135272) (not e!111911))))

(declare-fun lt!255569 () BitStream!6374)

(declare-fun lt!255570 () (_ BitVec 64))

(assert (=> d!55595 (= res!135272 (= (bvadd lt!255570 (bvsub lt!255434 lt!255421)) (bitIndex!0 (size!3603 (buf!4061 lt!255569)) (currentByte!7561 lt!255569) (currentBit!7556 lt!255569))))))

(assert (=> d!55595 (or (not (= (bvand lt!255570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255434 lt!255421) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255570 (bvsub lt!255434 lt!255421)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55595 (= lt!255570 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))))))

(declare-datatypes ((tuple2!14486 0))(
  ( (tuple2!14487 (_1!7828 Unit!11192) (_2!7828 BitStream!6374)) )
))
(declare-fun moveBitIndex!0 (BitStream!6374 (_ BitVec 64)) tuple2!14486)

(assert (=> d!55595 (= lt!255569 (_2!7828 (moveBitIndex!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6374 (_ BitVec 64)) Bool)

(assert (=> d!55595 (moveBitIndexPrecond!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421))))

(assert (=> d!55595 (= (withMovedBitIndex!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421)) lt!255569)))

(declare-fun b!162270 () Bool)

(assert (=> b!162270 (= e!111911 (= (size!3603 (buf!4061 (_2!7823 lt!255428))) (size!3603 (buf!4061 lt!255569))))))

(assert (= (and d!55595 res!135272) b!162270))

(declare-fun m!257583 () Bool)

(assert (=> d!55595 m!257583))

(assert (=> d!55595 m!257579))

(declare-fun m!257585 () Bool)

(assert (=> d!55595 m!257585))

(declare-fun m!257587 () Bool)

(assert (=> d!55595 m!257587))

(assert (=> b!162172 d!55595))

(assert (=> b!162172 d!55559))

(assert (=> b!162172 d!55573))

(declare-fun d!55597 () Bool)

(assert (=> d!55597 (= (invariant!0 (currentBit!7556 thiss!1602) (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602))) (and (bvsge (currentBit!7556 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7556 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7561 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602))) (and (= (currentBit!7556 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7561 thiss!1602) (size!3603 (buf!4061 thiss!1602)))))))))

(assert (=> d!55531 d!55597))

(assert (=> b!162171 d!55573))

(declare-fun d!55599 () Bool)

(assert (=> d!55599 (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) lt!255419 lt!255436)))

(declare-fun lt!255573 () Unit!11192)

(declare-fun choose!8 (array!8035 array!8035 (_ BitVec 64) (_ BitVec 64)) Unit!11192)

(assert (=> d!55599 (= lt!255573 (choose!8 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) lt!255419 lt!255436))))

(assert (=> d!55599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255419) (bvsle lt!255419 lt!255436))))

(assert (=> d!55599 (= (arrayBitRangesEqSymmetric!0 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) lt!255419 lt!255436) lt!255573)))

(declare-fun bs!13813 () Bool)

(assert (= bs!13813 d!55599))

(assert (=> bs!13813 m!257437))

(declare-fun m!257589 () Bool)

(assert (=> bs!13813 m!257589))

(assert (=> b!162171 d!55599))

(declare-fun b!162285 () Bool)

(declare-fun res!135286 () Bool)

(declare-fun lt!255580 () (_ BitVec 32))

(assert (=> b!162285 (= res!135286 (= lt!255580 #b00000000000000000000000000000000))))

(declare-fun e!111929 () Bool)

(assert (=> b!162285 (=> res!135286 e!111929)))

(declare-fun e!111928 () Bool)

(assert (=> b!162285 (= e!111928 e!111929)))

(declare-fun call!2744 () Bool)

(declare-fun bm!2741 () Bool)

(declare-datatypes ((tuple4!234 0))(
  ( (tuple4!235 (_1!7829 (_ BitVec 32)) (_2!7829 (_ BitVec 32)) (_3!585 (_ BitVec 32)) (_4!117 (_ BitVec 32))) )
))
(declare-fun lt!255582 () tuple4!234)

(declare-fun c!8492 () Bool)

(declare-fun lt!255581 () (_ BitVec 32))

(assert (=> bm!2741 (= call!2744 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255582)) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255582)) lt!255581 (ite c!8492 lt!255580 #b00000000000000000000000000001000)))))

(declare-fun b!162286 () Bool)

(declare-fun e!111924 () Bool)

(declare-fun e!111926 () Bool)

(assert (=> b!162286 (= e!111924 e!111926)))

(assert (=> b!162286 (= c!8492 (= (_3!585 lt!255582) (_4!117 lt!255582)))))

(declare-fun b!162287 () Bool)

(assert (=> b!162287 (= e!111929 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255582)) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255582)) #b00000000000000000000000000000000 lt!255580))))

(declare-fun b!162288 () Bool)

(declare-fun e!111927 () Bool)

(assert (=> b!162288 (= e!111927 e!111924)))

(declare-fun res!135285 () Bool)

(assert (=> b!162288 (=> (not res!135285) (not e!111924))))

(declare-fun e!111925 () Bool)

(assert (=> b!162288 (= res!135285 e!111925)))

(declare-fun res!135287 () Bool)

(assert (=> b!162288 (=> res!135287 e!111925)))

(assert (=> b!162288 (= res!135287 (bvsge (_1!7829 lt!255582) (_2!7829 lt!255582)))))

(assert (=> b!162288 (= lt!255580 ((_ extract 31 0) (bvsrem lt!255436 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162288 (= lt!255581 ((_ extract 31 0) (bvsrem lt!255419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!234)

(assert (=> b!162288 (= lt!255582 (arrayBitIndices!0 lt!255419 lt!255436))))

(declare-fun b!162289 () Bool)

(assert (=> b!162289 (= e!111926 e!111928)))

(declare-fun res!135284 () Bool)

(assert (=> b!162289 (= res!135284 call!2744)))

(assert (=> b!162289 (=> (not res!135284) (not e!111928))))

(declare-fun d!55601 () Bool)

(declare-fun res!135283 () Bool)

(assert (=> d!55601 (=> res!135283 e!111927)))

(assert (=> d!55601 (= res!135283 (bvsge lt!255419 lt!255436))))

(assert (=> d!55601 (= (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) lt!255419 lt!255436) e!111927)))

(declare-fun b!162290 () Bool)

(assert (=> b!162290 (= e!111926 call!2744)))

(declare-fun b!162291 () Bool)

(assert (=> b!162291 (= e!111925 (arrayRangesEq!555 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) (_1!7829 lt!255582) (_2!7829 lt!255582)))))

(assert (= (and d!55601 (not res!135283)) b!162288))

(assert (= (and b!162288 (not res!135287)) b!162291))

(assert (= (and b!162288 res!135285) b!162286))

(assert (= (and b!162286 c!8492) b!162290))

(assert (= (and b!162286 (not c!8492)) b!162289))

(assert (= (and b!162289 res!135284) b!162285))

(assert (= (and b!162285 (not res!135286)) b!162287))

(assert (= (or b!162290 b!162289) bm!2741))

(declare-fun m!257591 () Bool)

(assert (=> bm!2741 m!257591))

(declare-fun m!257593 () Bool)

(assert (=> bm!2741 m!257593))

(assert (=> bm!2741 m!257591))

(assert (=> bm!2741 m!257593))

(declare-fun m!257595 () Bool)

(assert (=> bm!2741 m!257595))

(declare-fun m!257597 () Bool)

(assert (=> b!162287 m!257597))

(declare-fun m!257599 () Bool)

(assert (=> b!162287 m!257599))

(assert (=> b!162287 m!257597))

(assert (=> b!162287 m!257599))

(declare-fun m!257601 () Bool)

(assert (=> b!162287 m!257601))

(declare-fun m!257603 () Bool)

(assert (=> b!162288 m!257603))

(declare-fun m!257605 () Bool)

(assert (=> b!162291 m!257605))

(assert (=> b!162171 d!55601))

(declare-fun d!55603 () Bool)

(assert (=> d!55603 (= (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) ((_ sign_extend 32) (currentByte!7561 thiss!1602)) ((_ sign_extend 32) (currentBit!7556 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3603 (buf!4061 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 thiss!1602)))))))

(assert (=> d!55573 d!55603))

(assert (=> d!55573 d!55597))

(assert (=> b!162186 d!55573))

(assert (=> b!162186 d!55559))

(assert (=> b!162216 d!55555))

(declare-fun d!55605 () Bool)

(declare-fun res!135288 () Bool)

(declare-fun e!111930 () Bool)

(assert (=> d!55605 (=> res!135288 e!111930)))

(assert (=> d!55605 (= res!135288 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55605 (= (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111930)))

(declare-fun b!162292 () Bool)

(declare-fun e!111931 () Bool)

(assert (=> b!162292 (= e!111930 e!111931)))

(declare-fun res!135289 () Bool)

(assert (=> b!162292 (=> (not res!135289) (not e!111931))))

(assert (=> b!162292 (= res!135289 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162293 () Bool)

(assert (=> b!162293 (= e!111931 (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55605 (not res!135288)) b!162292))

(assert (= (and b!162292 res!135289) b!162293))

(declare-fun m!257607 () Bool)

(assert (=> b!162292 m!257607))

(declare-fun m!257609 () Bool)

(assert (=> b!162292 m!257609))

(declare-fun m!257611 () Bool)

(assert (=> b!162293 m!257611))

(assert (=> b!162209 d!55605))

(declare-fun d!55607 () Bool)

(assert (=> d!55607 (= (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_3!584 lt!255276)))) ((_ sign_extend 32) (currentByte!7561 (_3!584 lt!255276))) ((_ sign_extend 32) (currentBit!7556 (_3!584 lt!255276)))) (bvsub (bvmul ((_ sign_extend 32) (size!3603 (buf!4061 (_3!584 lt!255276)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_3!584 lt!255276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_3!584 lt!255276))))))))

(assert (=> d!55559 d!55607))

(declare-fun d!55609 () Bool)

(assert (=> d!55609 (= (invariant!0 (currentBit!7556 (_3!584 lt!255276)) (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 (_3!584 lt!255276)))) (and (bvsge (currentBit!7556 (_3!584 lt!255276)) #b00000000000000000000000000000000) (bvslt (currentBit!7556 (_3!584 lt!255276)) #b00000000000000000000000000001000) (bvsge (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 (_3!584 lt!255276)))) (and (= (currentBit!7556 (_3!584 lt!255276)) #b00000000000000000000000000000000) (= (currentByte!7561 (_3!584 lt!255276)) (size!3603 (buf!4061 (_3!584 lt!255276))))))))))

(assert (=> d!55559 d!55609))

(declare-fun d!55611 () Bool)

(assert (=> d!55611 (isPrefixOf!0 lt!255425 lt!255425)))

(declare-fun lt!255585 () Unit!11192)

(declare-fun choose!11 (BitStream!6374) Unit!11192)

(assert (=> d!55611 (= lt!255585 (choose!11 lt!255425))))

(assert (=> d!55611 (= (lemmaIsPrefixRefl!0 lt!255425) lt!255585)))

(declare-fun bs!13815 () Bool)

(assert (= bs!13815 d!55611))

(assert (=> bs!13815 m!257431))

(declare-fun m!257613 () Bool)

(assert (=> bs!13815 m!257613))

(assert (=> d!55519 d!55611))

(declare-fun d!55613 () Bool)

(assert (=> d!55613 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(declare-fun lt!255588 () Unit!11192)

(declare-fun choose!30 (BitStream!6374 BitStream!6374 BitStream!6374) Unit!11192)

(assert (=> d!55613 (= lt!255588 (choose!30 lt!255425 thiss!1602 (_3!584 lt!255276)))))

(assert (=> d!55613 (isPrefixOf!0 lt!255425 thiss!1602)))

(assert (=> d!55613 (= (lemmaIsPrefixTransitive!0 lt!255425 thiss!1602 (_3!584 lt!255276)) lt!255588)))

(declare-fun bs!13816 () Bool)

(assert (= bs!13816 d!55613))

(assert (=> bs!13816 m!257417))

(declare-fun m!257615 () Bool)

(assert (=> bs!13816 m!257615))

(declare-fun m!257617 () Bool)

(assert (=> bs!13816 m!257617))

(assert (=> d!55519 d!55613))

(declare-fun d!55615 () Bool)

(declare-fun res!135290 () Bool)

(declare-fun e!111933 () Bool)

(assert (=> d!55615 (=> (not res!135290) (not e!111933))))

(assert (=> d!55615 (= res!135290 (= (size!3603 (buf!4061 thiss!1602)) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55615 (= (isPrefixOf!0 thiss!1602 thiss!1602) e!111933)))

(declare-fun b!162294 () Bool)

(declare-fun res!135292 () Bool)

(assert (=> b!162294 (=> (not res!135292) (not e!111933))))

(assert (=> b!162294 (= res!135292 (bvsle (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(declare-fun b!162295 () Bool)

(declare-fun e!111932 () Bool)

(assert (=> b!162295 (= e!111933 e!111932)))

(declare-fun res!135291 () Bool)

(assert (=> b!162295 (=> res!135291 e!111932)))

(assert (=> b!162295 (= res!135291 (= (size!3603 (buf!4061 thiss!1602)) #b00000000000000000000000000000000))))

(declare-fun b!162296 () Bool)

(assert (=> b!162296 (= e!111932 (arrayBitRangesEq!0 (buf!4061 thiss!1602) (buf!4061 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(assert (= (and d!55615 res!135290) b!162294))

(assert (= (and b!162294 res!135292) b!162295))

(assert (= (and b!162295 (not res!135291)) b!162296))

(assert (=> b!162294 m!257273))

(assert (=> b!162294 m!257273))

(assert (=> b!162296 m!257273))

(assert (=> b!162296 m!257273))

(declare-fun m!257619 () Bool)

(assert (=> b!162296 m!257619))

(assert (=> d!55519 d!55615))

(declare-fun d!55617 () Bool)

(declare-fun res!135293 () Bool)

(declare-fun e!111935 () Bool)

(assert (=> d!55617 (=> (not res!135293) (not e!111935))))

(assert (=> d!55617 (= res!135293 (= (size!3603 (buf!4061 lt!255425)) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (=> d!55617 (= (isPrefixOf!0 lt!255425 (_3!584 lt!255276)) e!111935)))

(declare-fun b!162297 () Bool)

(declare-fun res!135295 () Bool)

(assert (=> b!162297 (=> (not res!135295) (not e!111935))))

(assert (=> b!162297 (= res!135295 (bvsle (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun b!162298 () Bool)

(declare-fun e!111934 () Bool)

(assert (=> b!162298 (= e!111935 e!111934)))

(declare-fun res!135294 () Bool)

(assert (=> b!162298 (=> res!135294 e!111934)))

(assert (=> b!162298 (= res!135294 (= (size!3603 (buf!4061 lt!255425)) #b00000000000000000000000000000000))))

(declare-fun b!162299 () Bool)

(assert (=> b!162299 (= e!111934 (arrayBitRangesEq!0 (buf!4061 lt!255425) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(assert (= (and d!55617 res!135293) b!162297))

(assert (= (and b!162297 res!135295) b!162298))

(assert (= (and b!162298 (not res!135294)) b!162299))

(declare-fun m!257621 () Bool)

(assert (=> b!162297 m!257621))

(assert (=> b!162297 m!257271))

(assert (=> b!162299 m!257621))

(assert (=> b!162299 m!257621))

(declare-fun m!257623 () Bool)

(assert (=> b!162299 m!257623))

(assert (=> d!55519 d!55617))

(declare-fun d!55619 () Bool)

(assert (=> d!55619 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(declare-fun lt!255589 () Unit!11192)

(assert (=> d!55619 (= lt!255589 (choose!30 lt!255425 (_3!584 lt!255276) (_3!584 lt!255276)))))

(assert (=> d!55619 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(assert (=> d!55619 (= (lemmaIsPrefixTransitive!0 lt!255425 (_3!584 lt!255276) (_3!584 lt!255276)) lt!255589)))

(declare-fun bs!13817 () Bool)

(assert (= bs!13817 d!55619))

(assert (=> bs!13817 m!257417))

(declare-fun m!257625 () Bool)

(assert (=> bs!13817 m!257625))

(assert (=> bs!13817 m!257417))

(assert (=> d!55519 d!55619))

(assert (=> d!55519 d!55525))

(declare-fun d!55621 () Bool)

(declare-fun res!135296 () Bool)

(declare-fun e!111937 () Bool)

(assert (=> d!55621 (=> (not res!135296) (not e!111937))))

(assert (=> d!55621 (= res!135296 (= (size!3603 (buf!4061 (_3!584 lt!255276))) (size!3603 (buf!4061 (_3!584 lt!255276)))))))

(assert (=> d!55621 (= (isPrefixOf!0 (_3!584 lt!255276) (_3!584 lt!255276)) e!111937)))

(declare-fun b!162300 () Bool)

(declare-fun res!135298 () Bool)

(assert (=> b!162300 (=> (not res!135298) (not e!111937))))

(assert (=> b!162300 (= res!135298 (bvsle (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276))) (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun b!162301 () Bool)

(declare-fun e!111936 () Bool)

(assert (=> b!162301 (= e!111937 e!111936)))

(declare-fun res!135297 () Bool)

(assert (=> b!162301 (=> res!135297 e!111936)))

(assert (=> b!162301 (= res!135297 (= (size!3603 (buf!4061 (_3!584 lt!255276))) #b00000000000000000000000000000000))))

(declare-fun b!162302 () Bool)

(assert (=> b!162302 (= e!111936 (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(assert (= (and d!55621 res!135296) b!162300))

(assert (= (and b!162300 res!135298) b!162301))

(assert (= (and b!162301 (not res!135297)) b!162302))

(assert (=> b!162300 m!257271))

(assert (=> b!162300 m!257271))

(assert (=> b!162302 m!257271))

(assert (=> b!162302 m!257271))

(declare-fun m!257627 () Bool)

(assert (=> b!162302 m!257627))

(assert (=> d!55519 d!55621))

(declare-fun d!55623 () Bool)

(declare-fun res!135299 () Bool)

(declare-fun e!111939 () Bool)

(assert (=> d!55623 (=> (not res!135299) (not e!111939))))

(assert (=> d!55623 (= res!135299 (= (size!3603 (buf!4061 (_1!7823 lt!255428))) (size!3603 (buf!4061 (_2!7823 lt!255428)))))))

(assert (=> d!55623 (= (isPrefixOf!0 (_1!7823 lt!255428) (_2!7823 lt!255428)) e!111939)))

(declare-fun b!162303 () Bool)

(declare-fun res!135301 () Bool)

(assert (=> b!162303 (=> (not res!135301) (not e!111939))))

(assert (=> b!162303 (= res!135301 (bvsle (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428))) (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428)))))))

(declare-fun b!162304 () Bool)

(declare-fun e!111938 () Bool)

(assert (=> b!162304 (= e!111939 e!111938)))

(declare-fun res!135300 () Bool)

(assert (=> b!162304 (=> res!135300 e!111938)))

(assert (=> b!162304 (= res!135300 (= (size!3603 (buf!4061 (_1!7823 lt!255428))) #b00000000000000000000000000000000))))

(declare-fun b!162305 () Bool)

(assert (=> b!162305 (= e!111938 (arrayBitRangesEq!0 (buf!4061 (_1!7823 lt!255428)) (buf!4061 (_2!7823 lt!255428)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(assert (= (and d!55623 res!135299) b!162303))

(assert (= (and b!162303 res!135301) b!162304))

(assert (= (and b!162304 (not res!135300)) b!162305))

(declare-fun m!257629 () Bool)

(assert (=> b!162303 m!257629))

(assert (=> b!162303 m!257579))

(assert (=> b!162305 m!257629))

(assert (=> b!162305 m!257629))

(declare-fun m!257631 () Bool)

(assert (=> b!162305 m!257631))

(assert (=> d!55519 d!55623))

(declare-fun d!55625 () Bool)

(assert (=> d!55625 (isPrefixOf!0 thiss!1602 thiss!1602)))

(declare-fun lt!255590 () Unit!11192)

(assert (=> d!55625 (= lt!255590 (choose!11 thiss!1602))))

(assert (=> d!55625 (= (lemmaIsPrefixRefl!0 thiss!1602) lt!255590)))

(declare-fun bs!13818 () Bool)

(assert (= bs!13818 d!55625))

(assert (=> bs!13818 m!257421))

(declare-fun m!257633 () Bool)

(assert (=> bs!13818 m!257633))

(assert (=> d!55519 d!55625))

(declare-fun d!55627 () Bool)

(assert (=> d!55627 (isPrefixOf!0 (_3!584 lt!255276) (_3!584 lt!255276))))

(declare-fun lt!255591 () Unit!11192)

(assert (=> d!55627 (= lt!255591 (choose!11 (_3!584 lt!255276)))))

(assert (=> d!55627 (= (lemmaIsPrefixRefl!0 (_3!584 lt!255276)) lt!255591)))

(declare-fun bs!13819 () Bool)

(assert (= bs!13819 d!55627))

(assert (=> bs!13819 m!257425))

(declare-fun m!257635 () Bool)

(assert (=> bs!13819 m!257635))

(assert (=> d!55519 d!55627))

(declare-fun d!55629 () Bool)

(declare-fun res!135302 () Bool)

(declare-fun e!111941 () Bool)

(assert (=> d!55629 (=> (not res!135302) (not e!111941))))

(assert (=> d!55629 (= res!135302 (= (size!3603 (buf!4061 lt!255425)) (size!3603 (buf!4061 lt!255425))))))

(assert (=> d!55629 (= (isPrefixOf!0 lt!255425 lt!255425) e!111941)))

(declare-fun b!162306 () Bool)

(declare-fun res!135304 () Bool)

(assert (=> b!162306 (=> (not res!135304) (not e!111941))))

(assert (=> b!162306 (= res!135304 (bvsle (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(declare-fun b!162307 () Bool)

(declare-fun e!111940 () Bool)

(assert (=> b!162307 (= e!111941 e!111940)))

(declare-fun res!135303 () Bool)

(assert (=> b!162307 (=> res!135303 e!111940)))

(assert (=> b!162307 (= res!135303 (= (size!3603 (buf!4061 lt!255425)) #b00000000000000000000000000000000))))

(declare-fun b!162308 () Bool)

(assert (=> b!162308 (= e!111940 (arrayBitRangesEq!0 (buf!4061 lt!255425) (buf!4061 lt!255425) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(assert (= (and d!55629 res!135302) b!162306))

(assert (= (and b!162306 res!135304) b!162307))

(assert (= (and b!162307 (not res!135303)) b!162308))

(assert (=> b!162306 m!257621))

(assert (=> b!162306 m!257621))

(assert (=> b!162308 m!257621))

(assert (=> b!162308 m!257621))

(declare-fun m!257637 () Bool)

(assert (=> b!162308 m!257637))

(assert (=> d!55519 d!55629))

(declare-fun b!162309 () Bool)

(declare-fun res!135308 () Bool)

(declare-fun lt!255592 () (_ BitVec 32))

(assert (=> b!162309 (= res!135308 (= lt!255592 #b00000000000000000000000000000000))))

(declare-fun e!111947 () Bool)

(assert (=> b!162309 (=> res!135308 e!111947)))

(declare-fun e!111946 () Bool)

(assert (=> b!162309 (= e!111946 e!111947)))

(declare-fun lt!255593 () (_ BitVec 32))

(declare-fun call!2745 () Bool)

(declare-fun c!8493 () Bool)

(declare-fun lt!255594 () tuple4!234)

(declare-fun bm!2742 () Bool)

(assert (=> bm!2742 (= call!2745 (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255594)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255594)) lt!255593 (ite c!8493 lt!255592 #b00000000000000000000000000001000)))))

(declare-fun b!162310 () Bool)

(declare-fun e!111942 () Bool)

(declare-fun e!111944 () Bool)

(assert (=> b!162310 (= e!111942 e!111944)))

(assert (=> b!162310 (= c!8493 (= (_3!585 lt!255594) (_4!117 lt!255594)))))

(declare-fun b!162311 () Bool)

(assert (=> b!162311 (= e!111947 (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255594)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255594)) #b00000000000000000000000000000000 lt!255592))))

(declare-fun b!162312 () Bool)

(declare-fun e!111945 () Bool)

(assert (=> b!162312 (= e!111945 e!111942)))

(declare-fun res!135307 () Bool)

(assert (=> b!162312 (=> (not res!135307) (not e!111942))))

(declare-fun e!111943 () Bool)

(assert (=> b!162312 (= res!135307 e!111943)))

(declare-fun res!135309 () Bool)

(assert (=> b!162312 (=> res!135309 e!111943)))

(assert (=> b!162312 (= res!135309 (bvsge (_1!7829 lt!255594) (_2!7829 lt!255594)))))

(assert (=> b!162312 (= lt!255592 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162312 (= lt!255593 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162312 (= lt!255594 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(declare-fun b!162313 () Bool)

(assert (=> b!162313 (= e!111944 e!111946)))

(declare-fun res!135306 () Bool)

(assert (=> b!162313 (= res!135306 call!2745)))

(assert (=> b!162313 (=> (not res!135306) (not e!111946))))

(declare-fun d!55631 () Bool)

(declare-fun res!135305 () Bool)

(assert (=> d!55631 (=> res!135305 e!111945)))

(assert (=> d!55631 (= res!135305 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(assert (=> d!55631 (= (arrayBitRangesEq!0 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))) e!111945)))

(declare-fun b!162314 () Bool)

(assert (=> b!162314 (= e!111944 call!2745)))

(declare-fun b!162315 () Bool)

(assert (=> b!162315 (= e!111943 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (_1!7829 lt!255594) (_2!7829 lt!255594)))))

(assert (= (and d!55631 (not res!135305)) b!162312))

(assert (= (and b!162312 (not res!135309)) b!162315))

(assert (= (and b!162312 res!135307) b!162310))

(assert (= (and b!162310 c!8493) b!162314))

(assert (= (and b!162310 (not c!8493)) b!162313))

(assert (= (and b!162313 res!135306) b!162309))

(assert (= (and b!162309 (not res!135308)) b!162311))

(assert (= (or b!162314 b!162313) bm!2742))

(declare-fun m!257639 () Bool)

(assert (=> bm!2742 m!257639))

(declare-fun m!257641 () Bool)

(assert (=> bm!2742 m!257641))

(assert (=> bm!2742 m!257639))

(assert (=> bm!2742 m!257641))

(declare-fun m!257643 () Bool)

(assert (=> bm!2742 m!257643))

(declare-fun m!257645 () Bool)

(assert (=> b!162311 m!257645))

(declare-fun m!257647 () Bool)

(assert (=> b!162311 m!257647))

(assert (=> b!162311 m!257645))

(assert (=> b!162311 m!257647))

(declare-fun m!257649 () Bool)

(assert (=> b!162311 m!257649))

(assert (=> b!162312 m!257273))

(declare-fun m!257651 () Bool)

(assert (=> b!162312 m!257651))

(declare-fun m!257653 () Bool)

(assert (=> b!162315 m!257653))

(assert (=> b!162188 d!55631))

(assert (=> b!162188 d!55573))

(declare-fun d!55633 () Bool)

(declare-fun res!135310 () Bool)

(declare-fun e!111948 () Bool)

(assert (=> d!55633 (=> res!135310 e!111948)))

(assert (=> d!55633 (= res!135310 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55633 (= (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) e!111948)))

(declare-fun b!162316 () Bool)

(declare-fun e!111949 () Bool)

(assert (=> b!162316 (= e!111948 e!111949)))

(declare-fun res!135311 () Bool)

(assert (=> b!162316 (=> (not res!135311) (not e!111949))))

(assert (=> b!162316 (= res!135311 (= (select (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162317 () Bool)

(assert (=> b!162317 (= e!111949 (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55633 (not res!135310)) b!162316))

(assert (= (and b!162316 res!135311) b!162317))

(assert (=> b!162316 m!257609))

(declare-fun m!257655 () Bool)

(assert (=> b!162316 m!257655))

(declare-fun m!257657 () Bool)

(assert (=> b!162317 m!257657))

(assert (=> b!162207 d!55633))

(declare-fun d!55635 () Bool)

(assert (=> d!55635 (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276)))))

(assert (=> d!55635 true))

(declare-fun _$8!133 () Unit!11192)

(assert (=> d!55635 (= (choose!178 lt!255278 (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) _$8!133)))

(declare-fun bs!13820 () Bool)

(assert (= bs!13820 d!55635))

(assert (=> bs!13820 m!257475))

(assert (=> bs!13820 m!257477))

(assert (=> d!55541 d!55635))

(assert (=> d!55527 d!55603))

(declare-fun d!55637 () Bool)

(assert (=> d!55637 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276)))))

(assert (=> d!55637 true))

(declare-fun _$8!134 () Unit!11192)

(assert (=> d!55637 (= (choose!178 (buf!4061 thiss!1602) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) _$8!134)))

(declare-fun bs!13821 () Bool)

(assert (= bs!13821 d!55637))

(assert (=> bs!13821 m!257293))

(assert (=> bs!13821 m!257471))

(assert (=> d!55537 d!55637))

(assert (=> d!55543 d!55545))

(declare-fun d!55639 () Bool)

(assert (=> d!55639 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001))))

(assert (=> d!55639 true))

(declare-fun _$16!62 () Unit!11192)

(assert (=> d!55639 (= (choose!179 (buf!4061 thiss!1602) lt!255278 (buf!4061 (_3!584 lt!255276)) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) _$16!62)))

(declare-fun bs!13822 () Bool)

(assert (= bs!13822 d!55639))

(assert (=> bs!13822 m!257287))

(assert (=> d!55543 d!55639))

(declare-fun d!55641 () Bool)

(declare-fun res!135312 () Bool)

(declare-fun e!111950 () Bool)

(assert (=> d!55641 (=> res!135312 e!111950)))

(assert (=> d!55641 (= res!135312 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)))))

(assert (=> d!55641 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)) e!111950)))

(declare-fun b!162318 () Bool)

(declare-fun e!111951 () Bool)

(assert (=> b!162318 (= e!111950 e!111951)))

(declare-fun res!135313 () Bool)

(assert (=> b!162318 (=> (not res!135313) (not e!111951))))

(assert (=> b!162318 (= res!135313 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162319 () Bool)

(assert (=> b!162319 (= e!111951 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)))))

(assert (= (and d!55641 (not res!135312)) b!162318))

(assert (= (and b!162318 res!135313) b!162319))

(assert (=> b!162318 m!257607))

(declare-fun m!257659 () Bool)

(assert (=> b!162318 m!257659))

(declare-fun m!257661 () Bool)

(assert (=> b!162319 m!257661))

(assert (=> b!162179 d!55641))

(declare-fun d!55643 () Bool)

(declare-fun res!135314 () Bool)

(declare-fun e!111952 () Bool)

(assert (=> d!55643 (=> res!135314 e!111952)))

(assert (=> d!55643 (= res!135314 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55643 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111952)))

(declare-fun b!162320 () Bool)

(declare-fun e!111953 () Bool)

(assert (=> b!162320 (= e!111952 e!111953)))

(declare-fun res!135315 () Bool)

(assert (=> b!162320 (=> (not res!135315) (not e!111953))))

(assert (=> b!162320 (= res!135315 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162321 () Bool)

(assert (=> b!162321 (= e!111953 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55643 (not res!135314)) b!162320))

(assert (= (and b!162320 res!135315) b!162321))

(assert (=> b!162320 m!257607))

(declare-fun m!257663 () Bool)

(assert (=> b!162320 m!257663))

(declare-fun m!257665 () Bool)

(assert (=> b!162321 m!257665))

(assert (=> b!162215 d!55643))

(declare-fun d!55645 () Bool)

(declare-fun res!135316 () Bool)

(declare-fun e!111954 () Bool)

(assert (=> d!55645 (=> res!135316 e!111954)))

(assert (=> d!55645 (= res!135316 (= #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55645 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))) e!111954)))

(declare-fun b!162322 () Bool)

(declare-fun e!111955 () Bool)

(assert (=> b!162322 (= e!111954 e!111955)))

(declare-fun res!135317 () Bool)

(assert (=> b!162322 (=> (not res!135317) (not e!111955))))

(assert (=> b!162322 (= res!135317 (= (select (arr!4524 (buf!4061 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4524 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162323 () Bool)

(assert (=> b!162323 (= e!111955 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55645 (not res!135316)) b!162322))

(assert (= (and b!162322 res!135317) b!162323))

(assert (=> b!162322 m!257449))

(declare-fun m!257667 () Bool)

(assert (=> b!162322 m!257667))

(declare-fun m!257669 () Bool)

(assert (=> b!162323 m!257669))

(assert (=> b!162193 d!55645))

(declare-fun d!55647 () Bool)

(declare-fun res!135318 () Bool)

(declare-fun e!111956 () Bool)

(assert (=> d!55647 (=> res!135318 e!111956)))

(assert (=> d!55647 (= res!135318 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55647 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!111956)))

(declare-fun b!162324 () Bool)

(declare-fun e!111957 () Bool)

(assert (=> b!162324 (= e!111956 e!111957)))

(declare-fun res!135319 () Bool)

(assert (=> b!162324 (=> (not res!135319) (not e!111957))))

(assert (=> b!162324 (= res!135319 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162325 () Bool)

(assert (=> b!162325 (= e!111957 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55647 (not res!135318)) b!162324))

(assert (= (and b!162324 res!135319) b!162325))

(assert (=> b!162324 m!257607))

(assert (=> b!162324 m!257659))

(declare-fun m!257671 () Bool)

(assert (=> b!162325 m!257671))

(assert (=> b!162205 d!55647))

(declare-fun d!55649 () Bool)

(declare-fun res!135320 () Bool)

(declare-fun e!111958 () Bool)

(assert (=> d!55649 (=> res!135320 e!111958)))

(assert (=> d!55649 (= res!135320 (= #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55649 (= (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) #b00000000000000000000000000000000 (currentByte!7561 (_3!584 lt!255276))) e!111958)))

(declare-fun b!162326 () Bool)

(declare-fun e!111959 () Bool)

(assert (=> b!162326 (= e!111958 e!111959)))

(declare-fun res!135321 () Bool)

(assert (=> b!162326 (=> (not res!135321) (not e!111959))))

(assert (=> b!162326 (= res!135321 (= (select (arr!4524 lt!255278) #b00000000000000000000000000000000) (select (arr!4524 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278))) #b00000000000000000000000000000000)))))

(declare-fun b!162327 () Bool)

(assert (=> b!162327 (= e!111959 (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55649 (not res!135320)) b!162326))

(assert (= (and b!162326 res!135321) b!162327))

(assert (=> b!162326 m!257485))

(declare-fun m!257673 () Bool)

(assert (=> b!162326 m!257673))

(declare-fun m!257675 () Bool)

(assert (=> b!162327 m!257675))

(assert (=> b!162198 d!55649))

(declare-fun d!55651 () Bool)

(declare-fun lt!255613 () (_ BitVec 8))

(declare-fun lt!255611 () (_ BitVec 8))

(assert (=> d!55651 (= lt!255613 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_1!7823 lt!255270))) (currentByte!7561 (_1!7823 lt!255270)))) ((_ sign_extend 24) lt!255611))))))

(assert (=> d!55651 (= lt!255611 ((_ extract 7 0) (currentBit!7556 (_1!7823 lt!255270))))))

(declare-fun e!111964 () Bool)

(assert (=> d!55651 e!111964))

(declare-fun res!135327 () Bool)

(assert (=> d!55651 (=> (not res!135327) (not e!111964))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!55651 (= res!135327 (validate_offset_bits!1 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))) ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255270))) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255270))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14488 0))(
  ( (tuple2!14489 (_1!7830 Unit!11192) (_2!7830 (_ BitVec 8))) )
))
(declare-fun Unit!11201 () Unit!11192)

(declare-fun Unit!11202 () Unit!11192)

(assert (=> d!55651 (= (readByte!0 (_1!7823 lt!255270)) (tuple2!14483 (_2!7830 (ite (bvsgt ((_ sign_extend 24) lt!255611) #b00000000000000000000000000000000) (tuple2!14489 Unit!11201 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255613) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_1!7823 lt!255270))) (bvadd (currentByte!7561 (_1!7823 lt!255270)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255611)))))))) (tuple2!14489 Unit!11202 lt!255613))) (BitStream!6375 (buf!4061 (_1!7823 lt!255270)) (bvadd (currentByte!7561 (_1!7823 lt!255270)) #b00000000000000000000000000000001) (currentBit!7556 (_1!7823 lt!255270)))))))

(declare-fun b!162332 () Bool)

(declare-fun e!111965 () Bool)

(assert (=> b!162332 (= e!111964 e!111965)))

(declare-fun res!135328 () Bool)

(assert (=> b!162332 (=> (not res!135328) (not e!111965))))

(declare-fun lt!255610 () tuple2!14482)

(assert (=> b!162332 (= res!135328 (= (buf!4061 (_2!7826 lt!255610)) (buf!4061 (_1!7823 lt!255270))))))

(declare-fun lt!255609 () (_ BitVec 8))

(declare-fun lt!255615 () (_ BitVec 8))

(declare-fun Unit!11203 () Unit!11192)

(declare-fun Unit!11204 () Unit!11192)

(assert (=> b!162332 (= lt!255610 (tuple2!14483 (_2!7830 (ite (bvsgt ((_ sign_extend 24) lt!255615) #b00000000000000000000000000000000) (tuple2!14489 Unit!11203 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255609) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_1!7823 lt!255270))) (bvadd (currentByte!7561 (_1!7823 lt!255270)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!255615)))))))) (tuple2!14489 Unit!11204 lt!255609))) (BitStream!6375 (buf!4061 (_1!7823 lt!255270)) (bvadd (currentByte!7561 (_1!7823 lt!255270)) #b00000000000000000000000000000001) (currentBit!7556 (_1!7823 lt!255270)))))))

(assert (=> b!162332 (= lt!255609 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_1!7823 lt!255270))) (currentByte!7561 (_1!7823 lt!255270)))) ((_ sign_extend 24) lt!255615))))))

(assert (=> b!162332 (= lt!255615 ((_ extract 7 0) (currentBit!7556 (_1!7823 lt!255270))))))

(declare-fun b!162333 () Bool)

(declare-fun lt!255612 () (_ BitVec 64))

(declare-fun lt!255614 () (_ BitVec 64))

(assert (=> b!162333 (= e!111965 (= (bitIndex!0 (size!3603 (buf!4061 (_2!7826 lt!255610))) (currentByte!7561 (_2!7826 lt!255610)) (currentBit!7556 (_2!7826 lt!255610))) (bvadd lt!255614 lt!255612)))))

(assert (=> b!162333 (or (not (= (bvand lt!255614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255612 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255614 lt!255612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162333 (= lt!255612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!162333 (= lt!255614 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255270))) (currentByte!7561 (_1!7823 lt!255270)) (currentBit!7556 (_1!7823 lt!255270))))))

(assert (= (and d!55651 res!135327) b!162332))

(assert (= (and b!162332 res!135328) b!162333))

(declare-fun m!257677 () Bool)

(assert (=> d!55651 m!257677))

(declare-fun m!257679 () Bool)

(assert (=> d!55651 m!257679))

(declare-fun m!257681 () Bool)

(assert (=> d!55651 m!257681))

(assert (=> b!162332 m!257681))

(assert (=> b!162332 m!257677))

(declare-fun m!257683 () Bool)

(assert (=> b!162333 m!257683))

(declare-fun m!257685 () Bool)

(assert (=> b!162333 m!257685))

(assert (=> d!55517 d!55651))

(declare-fun d!55653 () Bool)

(assert (=> d!55653 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001))))

(assert (=> d!55653 true))

(declare-fun _$8!135 () Unit!11192)

(assert (=> d!55653 (= (choose!178 (buf!4061 thiss!1602) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) _$8!135)))

(declare-fun bs!13823 () Bool)

(assert (= bs!13823 d!55653))

(assert (=> bs!13823 m!257309))

(assert (=> bs!13823 m!257307))

(assert (=> d!55557 d!55653))

(declare-fun d!55655 () Bool)

(declare-fun res!135329 () Bool)

(declare-fun e!111967 () Bool)

(assert (=> d!55655 (=> (not res!135329) (not e!111967))))

(assert (=> d!55655 (= res!135329 (= (size!3603 (buf!4061 (_1!7823 lt!255428))) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55655 (= (isPrefixOf!0 (_1!7823 lt!255428) thiss!1602) e!111967)))

(declare-fun b!162334 () Bool)

(declare-fun res!135331 () Bool)

(assert (=> b!162334 (=> (not res!135331) (not e!111967))))

(assert (=> b!162334 (= res!135331 (bvsle (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428))) (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(declare-fun b!162335 () Bool)

(declare-fun e!111966 () Bool)

(assert (=> b!162335 (= e!111967 e!111966)))

(declare-fun res!135330 () Bool)

(assert (=> b!162335 (=> res!135330 e!111966)))

(assert (=> b!162335 (= res!135330 (= (size!3603 (buf!4061 (_1!7823 lt!255428))) #b00000000000000000000000000000000))))

(declare-fun b!162336 () Bool)

(assert (=> b!162336 (= e!111966 (arrayBitRangesEq!0 (buf!4061 (_1!7823 lt!255428)) (buf!4061 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(assert (= (and d!55655 res!135329) b!162334))

(assert (= (and b!162334 res!135331) b!162335))

(assert (= (and b!162335 (not res!135330)) b!162336))

(assert (=> b!162334 m!257629))

(assert (=> b!162334 m!257273))

(assert (=> b!162336 m!257629))

(assert (=> b!162336 m!257629))

(declare-fun m!257687 () Bool)

(assert (=> b!162336 m!257687))

(assert (=> b!162169 d!55655))

(declare-fun d!55657 () Bool)

(declare-fun res!135332 () Bool)

(declare-fun e!111968 () Bool)

(assert (=> d!55657 (=> res!135332 e!111968)))

(assert (=> d!55657 (= res!135332 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (=> d!55657 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))) e!111968)))

(declare-fun b!162337 () Bool)

(declare-fun e!111969 () Bool)

(assert (=> b!162337 (= e!111968 e!111969)))

(declare-fun res!135333 () Bool)

(assert (=> b!162337 (=> (not res!135333) (not e!111969))))

(assert (=> b!162337 (= res!135333 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162338 () Bool)

(assert (=> b!162338 (= e!111969 (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (= (and d!55657 (not res!135332)) b!162337))

(assert (= (and b!162337 res!135333) b!162338))

(assert (=> b!162337 m!257607))

(declare-fun m!257689 () Bool)

(assert (=> b!162337 m!257689))

(declare-fun m!257691 () Bool)

(assert (=> b!162338 m!257691))

(assert (=> b!162190 d!55657))

(push 1)

(assert (not d!55639))

(assert (not d!55619))

(assert (not b!162302))

(assert (not b!162319))

(assert (not b!162297))

(assert (not b!162325))

(assert (not b!162334))

(assert (not d!55613))

(assert (not b!162312))

(assert (not b!162265))

(assert (not b!162311))

(assert (not d!55653))

(assert (not b!162315))

(assert (not b!162296))

(assert (not bm!2742))

(assert (not b!162323))

(assert (not bm!2741))

(assert (not b!162300))

(assert (not d!55599))

(assert (not b!162306))

(assert (not b!162308))

(assert (not b!162327))

(assert (not d!55611))

(assert (not b!162333))

(assert (not b!162299))

(assert (not b!162305))

(assert (not d!55627))

(assert (not d!55635))

(assert (not b!162321))

(assert (not b!162287))

(assert (not b!162317))

(assert (not b!162303))

(assert (not b!162336))

(assert (not b!162291))

(assert (not b!162338))

(assert (not b!162267))

(assert (not d!55625))

(assert (not b!162288))

(assert (not d!55637))

(assert (not b!162293))

(assert (not d!55651))

(assert (not b!162294))

(assert (not d!55595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!55635 d!55649))

(declare-fun b!162390 () Bool)

(declare-fun res!135381 () Bool)

(declare-fun lt!255658 () (_ BitVec 32))

(assert (=> b!162390 (= res!135381 (= lt!255658 #b00000000000000000000000000000000))))

(declare-fun e!112020 () Bool)

(assert (=> b!162390 (=> res!135381 e!112020)))

(declare-fun e!112019 () Bool)

(assert (=> b!162390 (= e!112019 e!112020)))

(declare-fun lt!255660 () tuple4!234)

(declare-fun bm!2747 () Bool)

(declare-fun c!8498 () Bool)

(declare-fun call!2750 () Bool)

(declare-fun lt!255659 () (_ BitVec 32))

(assert (=> bm!2747 (= call!2750 (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255660)) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255660)) lt!255659 (ite c!8498 lt!255658 #b00000000000000000000000000001000)))))

(declare-fun b!162391 () Bool)

(declare-fun e!112015 () Bool)

(declare-fun e!112017 () Bool)

(assert (=> b!162391 (= e!112015 e!112017)))

(assert (=> b!162391 (= c!8498 (= (_3!585 lt!255660) (_4!117 lt!255660)))))

(declare-fun b!162392 () Bool)

(assert (=> b!162392 (= e!112020 (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255660)) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255660)) #b00000000000000000000000000000000 lt!255658))))

(declare-fun b!162393 () Bool)

(declare-fun e!112018 () Bool)

(assert (=> b!162393 (= e!112018 e!112015)))

(declare-fun res!135380 () Bool)

(assert (=> b!162393 (=> (not res!135380) (not e!112015))))

(declare-fun e!112016 () Bool)

(assert (=> b!162393 (= res!135380 e!112016)))

(declare-fun res!135382 () Bool)

(assert (=> b!162393 (=> res!135382 e!112016)))

(assert (=> b!162393 (= res!135382 (bvsge (_1!7829 lt!255660) (_2!7829 lt!255660)))))

(assert (=> b!162393 (= lt!255658 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162393 (= lt!255659 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162393 (= lt!255660 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(declare-fun b!162394 () Bool)

(assert (=> b!162394 (= e!112017 e!112019)))

(declare-fun res!135379 () Bool)

(assert (=> b!162394 (= res!135379 call!2750)))

(assert (=> b!162394 (=> (not res!135379) (not e!112019))))

(declare-fun d!55689 () Bool)

(declare-fun res!135378 () Bool)

(assert (=> d!55689 (=> res!135378 e!112018)))

(assert (=> d!55689 (= res!135378 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(assert (=> d!55689 (= (arrayBitRangesEq!0 (buf!4061 thiss!1602) (buf!4061 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))) e!112018)))

(declare-fun b!162395 () Bool)

(assert (=> b!162395 (= e!112017 call!2750)))

(declare-fun b!162396 () Bool)

(assert (=> b!162396 (= e!112016 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 thiss!1602) (_1!7829 lt!255660) (_2!7829 lt!255660)))))

(assert (= (and d!55689 (not res!135378)) b!162393))

(assert (= (and b!162393 (not res!135382)) b!162396))

(assert (= (and b!162393 res!135380) b!162391))

(assert (= (and b!162391 c!8498) b!162395))

(assert (= (and b!162391 (not c!8498)) b!162394))

(assert (= (and b!162394 res!135379) b!162390))

(assert (= (and b!162390 (not res!135381)) b!162392))

(assert (= (or b!162395 b!162394) bm!2747))

(declare-fun m!257769 () Bool)

(assert (=> bm!2747 m!257769))

(assert (=> bm!2747 m!257769))

(assert (=> bm!2747 m!257769))

(assert (=> bm!2747 m!257769))

(declare-fun m!257771 () Bool)

(assert (=> bm!2747 m!257771))

(declare-fun m!257773 () Bool)

(assert (=> b!162392 m!257773))

(assert (=> b!162392 m!257773))

(assert (=> b!162392 m!257773))

(assert (=> b!162392 m!257773))

(declare-fun m!257775 () Bool)

(assert (=> b!162392 m!257775))

(assert (=> b!162393 m!257273))

(assert (=> b!162393 m!257651))

(declare-fun m!257777 () Bool)

(assert (=> b!162396 m!257777))

(assert (=> b!162296 d!55689))

(assert (=> b!162296 d!55573))

(declare-fun d!55693 () Bool)

(declare-fun e!112021 () Bool)

(assert (=> d!55693 e!112021))

(declare-fun res!135384 () Bool)

(assert (=> d!55693 (=> (not res!135384) (not e!112021))))

(declare-fun lt!255665 () (_ BitVec 64))

(declare-fun lt!255662 () (_ BitVec 64))

(declare-fun lt!255666 () (_ BitVec 64))

(assert (=> d!55693 (= res!135384 (= lt!255665 (bvsub lt!255662 lt!255666)))))

(assert (=> d!55693 (or (= (bvand lt!255662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255662 lt!255666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55693 (= lt!255666 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255428)))) ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255428))) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255428)))))))

(declare-fun lt!255663 () (_ BitVec 64))

(declare-fun lt!255661 () (_ BitVec 64))

(assert (=> d!55693 (= lt!255662 (bvmul lt!255663 lt!255661))))

(assert (=> d!55693 (or (= lt!255663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255661 (bvsdiv (bvmul lt!255663 lt!255661) lt!255663)))))

(assert (=> d!55693 (= lt!255661 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55693 (= lt!255663 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255428)))))))

(assert (=> d!55693 (= lt!255665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255428))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255428)))))))

(assert (=> d!55693 (invariant!0 (currentBit!7556 (_1!7823 lt!255428)) (currentByte!7561 (_1!7823 lt!255428)) (size!3603 (buf!4061 (_1!7823 lt!255428))))))

(assert (=> d!55693 (= (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428))) lt!255665)))

(declare-fun b!162397 () Bool)

(declare-fun res!135383 () Bool)

(assert (=> b!162397 (=> (not res!135383) (not e!112021))))

(assert (=> b!162397 (= res!135383 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255665))))

(declare-fun b!162398 () Bool)

(declare-fun lt!255664 () (_ BitVec 64))

(assert (=> b!162398 (= e!112021 (bvsle lt!255665 (bvmul lt!255664 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162398 (or (= lt!255664 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255664 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255664)))))

(assert (=> b!162398 (= lt!255664 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255428)))))))

(assert (= (and d!55693 res!135384) b!162397))

(assert (= (and b!162397 res!135383) b!162398))

(declare-fun m!257779 () Bool)

(assert (=> d!55693 m!257779))

(declare-fun m!257781 () Bool)

(assert (=> d!55693 m!257781))

(assert (=> b!162303 d!55693))

(declare-fun d!55699 () Bool)

(declare-fun e!112022 () Bool)

(assert (=> d!55699 e!112022))

(declare-fun res!135386 () Bool)

(assert (=> d!55699 (=> (not res!135386) (not e!112022))))

(declare-fun lt!255671 () (_ BitVec 64))

(declare-fun lt!255672 () (_ BitVec 64))

(declare-fun lt!255668 () (_ BitVec 64))

(assert (=> d!55699 (= res!135386 (= lt!255671 (bvsub lt!255668 lt!255672)))))

(assert (=> d!55699 (or (= (bvand lt!255668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255672 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255668 lt!255672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55699 (= lt!255672 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428)))) ((_ sign_extend 32) (currentByte!7561 (_2!7823 lt!255428))) ((_ sign_extend 32) (currentBit!7556 (_2!7823 lt!255428)))))))

(declare-fun lt!255669 () (_ BitVec 64))

(declare-fun lt!255667 () (_ BitVec 64))

(assert (=> d!55699 (= lt!255668 (bvmul lt!255669 lt!255667))))

(assert (=> d!55699 (or (= lt!255669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255667 (bvsdiv (bvmul lt!255669 lt!255667) lt!255669)))))

(assert (=> d!55699 (= lt!255667 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55699 (= lt!255669 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428)))))))

(assert (=> d!55699 (= lt!255671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_2!7823 lt!255428))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_2!7823 lt!255428)))))))

(assert (=> d!55699 (invariant!0 (currentBit!7556 (_2!7823 lt!255428)) (currentByte!7561 (_2!7823 lt!255428)) (size!3603 (buf!4061 (_2!7823 lt!255428))))))

(assert (=> d!55699 (= (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))) lt!255671)))

(declare-fun b!162399 () Bool)

(declare-fun res!135385 () Bool)

(assert (=> b!162399 (=> (not res!135385) (not e!112022))))

(assert (=> b!162399 (= res!135385 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255671))))

(declare-fun b!162400 () Bool)

(declare-fun lt!255670 () (_ BitVec 64))

(assert (=> b!162400 (= e!112022 (bvsle lt!255671 (bvmul lt!255670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162400 (or (= lt!255670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255670)))))

(assert (=> b!162400 (= lt!255670 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428)))))))

(assert (= (and d!55699 res!135386) b!162399))

(assert (= (and b!162399 res!135385) b!162400))

(declare-fun m!257785 () Bool)

(assert (=> d!55699 m!257785))

(declare-fun m!257789 () Bool)

(assert (=> d!55699 m!257789))

(assert (=> b!162303 d!55699))

(assert (=> d!55653 d!55555))

(assert (=> b!162294 d!55573))

(assert (=> d!55613 d!55617))

(declare-fun d!55705 () Bool)

(assert (=> d!55705 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(assert (=> d!55705 true))

(declare-fun _$15!252 () Unit!11192)

(assert (=> d!55705 (= (choose!30 lt!255425 thiss!1602 (_3!584 lt!255276)) _$15!252)))

(declare-fun bs!13828 () Bool)

(assert (= bs!13828 d!55705))

(assert (=> bs!13828 m!257417))

(assert (=> d!55613 d!55705))

(declare-fun d!55709 () Bool)

(declare-fun res!135391 () Bool)

(declare-fun e!112028 () Bool)

(assert (=> d!55709 (=> (not res!135391) (not e!112028))))

(assert (=> d!55709 (= res!135391 (= (size!3603 (buf!4061 lt!255425)) (size!3603 (buf!4061 thiss!1602))))))

(assert (=> d!55709 (= (isPrefixOf!0 lt!255425 thiss!1602) e!112028)))

(declare-fun b!162405 () Bool)

(declare-fun res!135393 () Bool)

(assert (=> b!162405 (=> (not res!135393) (not e!112028))))

(assert (=> b!162405 (= res!135393 (bvsle (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))))))

(declare-fun b!162406 () Bool)

(declare-fun e!112027 () Bool)

(assert (=> b!162406 (= e!112028 e!112027)))

(declare-fun res!135392 () Bool)

(assert (=> b!162406 (=> res!135392 e!112027)))

(assert (=> b!162406 (= res!135392 (= (size!3603 (buf!4061 lt!255425)) #b00000000000000000000000000000000))))

(declare-fun b!162407 () Bool)

(assert (=> b!162407 (= e!112027 (arrayBitRangesEq!0 (buf!4061 lt!255425) (buf!4061 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(assert (= (and d!55709 res!135391) b!162405))

(assert (= (and b!162405 res!135393) b!162406))

(assert (= (and b!162406 (not res!135392)) b!162407))

(assert (=> b!162405 m!257621))

(assert (=> b!162405 m!257273))

(assert (=> b!162407 m!257621))

(assert (=> b!162407 m!257621))

(declare-fun m!257795 () Bool)

(assert (=> b!162407 m!257795))

(assert (=> d!55613 d!55709))

(declare-fun d!55711 () Bool)

(assert (=> d!55711 (= (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255582)) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255582)) lt!255581 (ite c!8492 lt!255580 #b00000000000000000000000000001000)) (or (= lt!255581 (ite c!8492 lt!255580 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255582))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8492 lt!255580 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255581)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255582))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8492 lt!255580 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255581)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13831 () Bool)

(assert (= bs!13831 d!55711))

(declare-fun m!257799 () Bool)

(assert (=> bs!13831 m!257799))

(declare-fun m!257801 () Bool)

(assert (=> bs!13831 m!257801))

(assert (=> bm!2741 d!55711))

(assert (=> b!162265 d!55699))

(assert (=> b!162265 d!55559))

(declare-fun b!162411 () Bool)

(declare-fun res!135400 () Bool)

(declare-fun lt!255676 () (_ BitVec 32))

(assert (=> b!162411 (= res!135400 (= lt!255676 #b00000000000000000000000000000000))))

(declare-fun e!112036 () Bool)

(assert (=> b!162411 (=> res!135400 e!112036)))

(declare-fun e!112035 () Bool)

(assert (=> b!162411 (= e!112035 e!112036)))

(declare-fun call!2751 () Bool)

(declare-fun bm!2748 () Bool)

(declare-fun lt!255678 () tuple4!234)

(declare-fun lt!255677 () (_ BitVec 32))

(declare-fun c!8499 () Bool)

(assert (=> bm!2748 (= call!2751 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_1!7823 lt!255428))) (_3!585 lt!255678)) (select (arr!4524 (buf!4061 (_2!7823 lt!255428))) (_3!585 lt!255678)) lt!255677 (ite c!8499 lt!255676 #b00000000000000000000000000001000)))))

(declare-fun b!162412 () Bool)

(declare-fun e!112031 () Bool)

(declare-fun e!112033 () Bool)

(assert (=> b!162412 (= e!112031 e!112033)))

(assert (=> b!162412 (= c!8499 (= (_3!585 lt!255678) (_4!117 lt!255678)))))

(declare-fun b!162413 () Bool)

(assert (=> b!162413 (= e!112036 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_1!7823 lt!255428))) (_4!117 lt!255678)) (select (arr!4524 (buf!4061 (_2!7823 lt!255428))) (_4!117 lt!255678)) #b00000000000000000000000000000000 lt!255676))))

(declare-fun b!162414 () Bool)

(declare-fun e!112034 () Bool)

(assert (=> b!162414 (= e!112034 e!112031)))

(declare-fun res!135399 () Bool)

(assert (=> b!162414 (=> (not res!135399) (not e!112031))))

(declare-fun e!112032 () Bool)

(assert (=> b!162414 (= res!135399 e!112032)))

(declare-fun res!135401 () Bool)

(assert (=> b!162414 (=> res!135401 e!112032)))

(assert (=> b!162414 (= res!135401 (bvsge (_1!7829 lt!255678) (_2!7829 lt!255678)))))

(assert (=> b!162414 (= lt!255676 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162414 (= lt!255677 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162414 (= lt!255678 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(declare-fun b!162415 () Bool)

(assert (=> b!162415 (= e!112033 e!112035)))

(declare-fun res!135398 () Bool)

(assert (=> b!162415 (= res!135398 call!2751)))

(assert (=> b!162415 (=> (not res!135398) (not e!112035))))

(declare-fun d!55715 () Bool)

(declare-fun res!135397 () Bool)

(assert (=> d!55715 (=> res!135397 e!112034)))

(assert (=> d!55715 (= res!135397 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(assert (=> d!55715 (= (arrayBitRangesEq!0 (buf!4061 (_1!7823 lt!255428)) (buf!4061 (_2!7823 lt!255428)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))) e!112034)))

(declare-fun b!162416 () Bool)

(assert (=> b!162416 (= e!112033 call!2751)))

(declare-fun b!162417 () Bool)

(assert (=> b!162417 (= e!112032 (arrayRangesEq!555 (buf!4061 (_1!7823 lt!255428)) (buf!4061 (_2!7823 lt!255428)) (_1!7829 lt!255678) (_2!7829 lt!255678)))))

(assert (= (and d!55715 (not res!135397)) b!162414))

(assert (= (and b!162414 (not res!135401)) b!162417))

(assert (= (and b!162414 res!135399) b!162412))

(assert (= (and b!162412 c!8499) b!162416))

(assert (= (and b!162412 (not c!8499)) b!162415))

(assert (= (and b!162415 res!135398) b!162411))

(assert (= (and b!162411 (not res!135400)) b!162413))

(assert (= (or b!162416 b!162415) bm!2748))

(declare-fun m!257807 () Bool)

(assert (=> bm!2748 m!257807))

(declare-fun m!257809 () Bool)

(assert (=> bm!2748 m!257809))

(assert (=> bm!2748 m!257807))

(assert (=> bm!2748 m!257809))

(declare-fun m!257811 () Bool)

(assert (=> bm!2748 m!257811))

(declare-fun m!257813 () Bool)

(assert (=> b!162413 m!257813))

(declare-fun m!257815 () Bool)

(assert (=> b!162413 m!257815))

(assert (=> b!162413 m!257813))

(assert (=> b!162413 m!257815))

(declare-fun m!257817 () Bool)

(assert (=> b!162413 m!257817))

(assert (=> b!162414 m!257629))

(declare-fun m!257819 () Bool)

(assert (=> b!162414 m!257819))

(declare-fun m!257821 () Bool)

(assert (=> b!162417 m!257821))

(assert (=> b!162305 d!55715))

(assert (=> b!162305 d!55693))

(declare-fun d!55719 () Bool)

(declare-fun res!135402 () Bool)

(declare-fun e!112037 () Bool)

(assert (=> d!55719 (=> res!135402 e!112037)))

(assert (=> d!55719 (= res!135402 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (=> d!55719 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))) e!112037)))

(declare-fun b!162418 () Bool)

(declare-fun e!112038 () Bool)

(assert (=> b!162418 (= e!112037 e!112038)))

(declare-fun res!135403 () Bool)

(assert (=> b!162418 (=> (not res!135403) (not e!112038))))

(assert (=> b!162418 (= res!135403 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162419 () Bool)

(assert (=> b!162419 (= e!112038 (arrayRangesEq!555 (buf!4061 thiss!1602) (ite c!8480 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8480 (currentByte!7561 (_3!584 lt!255276)) (currentByte!7561 thiss!1602))))))

(assert (= (and d!55719 (not res!135402)) b!162418))

(assert (= (and b!162418 res!135403) b!162419))

(declare-fun m!257823 () Bool)

(assert (=> b!162418 m!257823))

(declare-fun m!257825 () Bool)

(assert (=> b!162418 m!257825))

(declare-fun m!257827 () Bool)

(assert (=> b!162419 m!257827))

(assert (=> b!162338 d!55719))

(declare-fun d!55721 () Bool)

(assert (=> d!55721 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))) ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255270))) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255270))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))) ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255270))) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255270)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13832 () Bool)

(assert (= bs!13832 d!55721))

(declare-fun m!257829 () Bool)

(assert (=> bs!13832 m!257829))

(assert (=> d!55651 d!55721))

(assert (=> d!55599 d!55601))

(declare-fun d!55723 () Bool)

(assert (=> d!55723 (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) lt!255419 lt!255436)))

(assert (=> d!55723 true))

(declare-fun _$19!126 () Unit!11192)

(assert (=> d!55723 (= (choose!8 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) lt!255419 lt!255436) _$19!126)))

(declare-fun bs!13835 () Bool)

(assert (= bs!13835 d!55723))

(assert (=> bs!13835 m!257437))

(assert (=> d!55599 d!55723))

(declare-fun d!55731 () Bool)

(assert (=> d!55731 (= (arrayBitIndices!0 lt!255419 lt!255436) (tuple4!235 ((_ extract 31 0) (bvadd (bvsdiv lt!255419 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!255419 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!255436 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255419 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!255436 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162288 d!55731))

(declare-fun d!55747 () Bool)

(declare-fun e!112051 () Bool)

(assert (=> d!55747 e!112051))

(declare-fun res!135421 () Bool)

(assert (=> d!55747 (=> (not res!135421) (not e!112051))))

(declare-fun lt!255686 () (_ BitVec 64))

(declare-fun lt!255690 () (_ BitVec 64))

(declare-fun lt!255689 () (_ BitVec 64))

(assert (=> d!55747 (= res!135421 (= lt!255689 (bvsub lt!255686 lt!255690)))))

(assert (=> d!55747 (or (= (bvand lt!255686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255686 lt!255690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55747 (= lt!255690 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255425))) ((_ sign_extend 32) (currentByte!7561 lt!255425)) ((_ sign_extend 32) (currentBit!7556 lt!255425))))))

(declare-fun lt!255687 () (_ BitVec 64))

(declare-fun lt!255685 () (_ BitVec 64))

(assert (=> d!55747 (= lt!255686 (bvmul lt!255687 lt!255685))))

(assert (=> d!55747 (or (= lt!255687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255685 (bvsdiv (bvmul lt!255687 lt!255685) lt!255687)))))

(assert (=> d!55747 (= lt!255685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55747 (= lt!255687 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255425))))))

(assert (=> d!55747 (= lt!255689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 lt!255425)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 lt!255425))))))

(assert (=> d!55747 (invariant!0 (currentBit!7556 lt!255425) (currentByte!7561 lt!255425) (size!3603 (buf!4061 lt!255425)))))

(assert (=> d!55747 (= (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) lt!255689)))

(declare-fun b!162436 () Bool)

(declare-fun res!135420 () Bool)

(assert (=> b!162436 (=> (not res!135420) (not e!112051))))

(assert (=> b!162436 (= res!135420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255689))))

(declare-fun b!162437 () Bool)

(declare-fun lt!255688 () (_ BitVec 64))

(assert (=> b!162437 (= e!112051 (bvsle lt!255689 (bvmul lt!255688 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162437 (or (= lt!255688 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255688 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255688)))))

(assert (=> b!162437 (= lt!255688 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255425))))))

(assert (= (and d!55747 res!135421) b!162436))

(assert (= (and b!162436 res!135420) b!162437))

(declare-fun m!257855 () Bool)

(assert (=> d!55747 m!257855))

(declare-fun m!257857 () Bool)

(assert (=> d!55747 m!257857))

(assert (=> b!162306 d!55747))

(declare-fun d!55749 () Bool)

(declare-fun res!135422 () Bool)

(declare-fun e!112052 () Bool)

(assert (=> d!55749 (=> res!135422 e!112052)))

(assert (=> d!55749 (= res!135422 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55749 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!112052)))

(declare-fun b!162438 () Bool)

(declare-fun e!112053 () Bool)

(assert (=> b!162438 (= e!112052 e!112053)))

(declare-fun res!135423 () Bool)

(assert (=> b!162438 (=> (not res!135423) (not e!112053))))

(assert (=> b!162438 (= res!135423 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162439 () Bool)

(assert (=> b!162439 (= e!112053 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001) lt!255277) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55749 (not res!135422)) b!162438))

(assert (= (and b!162438 res!135423) b!162439))

(assert (=> b!162438 m!257823))

(declare-fun m!257859 () Bool)

(assert (=> b!162438 m!257859))

(declare-fun m!257861 () Bool)

(assert (=> b!162439 m!257861))

(assert (=> b!162321 d!55749))

(declare-fun d!55751 () Bool)

(assert (=> d!55751 (= (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255582)) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255582)) #b00000000000000000000000000000000 lt!255580) (or (= #b00000000000000000000000000000000 lt!255580) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255582))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255580))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255582))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255580))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13839 () Bool)

(assert (= bs!13839 d!55751))

(declare-fun m!257863 () Bool)

(assert (=> bs!13839 m!257863))

(assert (=> bs!13839 m!257447))

(assert (=> b!162287 d!55751))

(declare-fun b!162440 () Bool)

(declare-fun res!135427 () Bool)

(declare-fun lt!255691 () (_ BitVec 32))

(assert (=> b!162440 (= res!135427 (= lt!255691 #b00000000000000000000000000000000))))

(declare-fun e!112059 () Bool)

(assert (=> b!162440 (=> res!135427 e!112059)))

(declare-fun e!112058 () Bool)

(assert (=> b!162440 (= e!112058 e!112059)))

(declare-fun c!8500 () Bool)

(declare-fun call!2752 () Bool)

(declare-fun lt!255693 () tuple4!234)

(declare-fun lt!255692 () (_ BitVec 32))

(declare-fun bm!2749 () Bool)

(assert (=> bm!2749 (= call!2752 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_2!7823 lt!255428))) (_3!585 lt!255693)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255693)) lt!255692 (ite c!8500 lt!255691 #b00000000000000000000000000001000)))))

(declare-fun b!162441 () Bool)

(declare-fun e!112054 () Bool)

(declare-fun e!112056 () Bool)

(assert (=> b!162441 (= e!112054 e!112056)))

(assert (=> b!162441 (= c!8500 (= (_3!585 lt!255693) (_4!117 lt!255693)))))

(declare-fun b!162442 () Bool)

(assert (=> b!162442 (= e!112059 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_2!7823 lt!255428))) (_4!117 lt!255693)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255693)) #b00000000000000000000000000000000 lt!255691))))

(declare-fun b!162443 () Bool)

(declare-fun e!112057 () Bool)

(assert (=> b!162443 (= e!112057 e!112054)))

(declare-fun res!135426 () Bool)

(assert (=> b!162443 (=> (not res!135426) (not e!112054))))

(declare-fun e!112055 () Bool)

(assert (=> b!162443 (= res!135426 e!112055)))

(declare-fun res!135428 () Bool)

(assert (=> b!162443 (=> res!135428 e!112055)))

(assert (=> b!162443 (= res!135428 (bvsge (_1!7829 lt!255693) (_2!7829 lt!255693)))))

(assert (=> b!162443 (= lt!255691 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162443 (= lt!255692 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162443 (= lt!255693 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428)))))))

(declare-fun b!162444 () Bool)

(assert (=> b!162444 (= e!112056 e!112058)))

(declare-fun res!135425 () Bool)

(assert (=> b!162444 (= res!135425 call!2752)))

(assert (=> b!162444 (=> (not res!135425) (not e!112058))))

(declare-fun d!55753 () Bool)

(declare-fun res!135424 () Bool)

(assert (=> d!55753 (=> res!135424 e!112057)))

(assert (=> d!55753 (= res!135424 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428)))))))

(assert (=> d!55753 (= (arrayBitRangesEq!0 (buf!4061 (_2!7823 lt!255428)) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428)))) e!112057)))

(declare-fun b!162445 () Bool)

(assert (=> b!162445 (= e!112056 call!2752)))

(declare-fun b!162446 () Bool)

(assert (=> b!162446 (= e!112055 (arrayRangesEq!555 (buf!4061 (_2!7823 lt!255428)) (buf!4061 (_3!584 lt!255276)) (_1!7829 lt!255693) (_2!7829 lt!255693)))))

(assert (= (and d!55753 (not res!135424)) b!162443))

(assert (= (and b!162443 (not res!135428)) b!162446))

(assert (= (and b!162443 res!135426) b!162441))

(assert (= (and b!162441 c!8500) b!162445))

(assert (= (and b!162441 (not c!8500)) b!162444))

(assert (= (and b!162444 res!135425) b!162440))

(assert (= (and b!162440 (not res!135427)) b!162442))

(assert (= (or b!162445 b!162444) bm!2749))

(declare-fun m!257865 () Bool)

(assert (=> bm!2749 m!257865))

(declare-fun m!257867 () Bool)

(assert (=> bm!2749 m!257867))

(assert (=> bm!2749 m!257865))

(assert (=> bm!2749 m!257867))

(declare-fun m!257869 () Bool)

(assert (=> bm!2749 m!257869))

(declare-fun m!257871 () Bool)

(assert (=> b!162442 m!257871))

(declare-fun m!257873 () Bool)

(assert (=> b!162442 m!257873))

(assert (=> b!162442 m!257871))

(assert (=> b!162442 m!257873))

(declare-fun m!257875 () Bool)

(assert (=> b!162442 m!257875))

(assert (=> b!162443 m!257579))

(declare-fun m!257877 () Bool)

(assert (=> b!162443 m!257877))

(declare-fun m!257879 () Bool)

(assert (=> b!162446 m!257879))

(assert (=> b!162267 d!55753))

(assert (=> b!162267 d!55699))

(declare-fun d!55755 () Bool)

(declare-fun res!135429 () Bool)

(declare-fun e!112060 () Bool)

(assert (=> d!55755 (=> res!135429 e!112060)))

(assert (=> d!55755 (= res!135429 (= (_1!7829 lt!255582) (_2!7829 lt!255582)))))

(assert (=> d!55755 (= (arrayRangesEq!555 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) (_1!7829 lt!255582) (_2!7829 lt!255582)) e!112060)))

(declare-fun b!162447 () Bool)

(declare-fun e!112061 () Bool)

(assert (=> b!162447 (= e!112060 e!112061)))

(declare-fun res!135430 () Bool)

(assert (=> b!162447 (=> (not res!135430) (not e!112061))))

(assert (=> b!162447 (= res!135430 (= (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_1!7829 lt!255582)) (select (arr!4524 (buf!4061 thiss!1602)) (_1!7829 lt!255582))))))

(declare-fun b!162448 () Bool)

(assert (=> b!162448 (= e!112061 (arrayRangesEq!555 (buf!4061 (_3!584 lt!255276)) (buf!4061 thiss!1602) (bvadd (_1!7829 lt!255582) #b00000000000000000000000000000001) (_2!7829 lt!255582)))))

(assert (= (and d!55755 (not res!135429)) b!162447))

(assert (= (and b!162447 res!135430) b!162448))

(declare-fun m!257881 () Bool)

(assert (=> b!162447 m!257881))

(declare-fun m!257883 () Bool)

(assert (=> b!162447 m!257883))

(declare-fun m!257885 () Bool)

(assert (=> b!162448 m!257885))

(assert (=> b!162291 d!55755))

(assert (=> d!55625 d!55615))

(declare-fun d!55757 () Bool)

(assert (=> d!55757 (isPrefixOf!0 thiss!1602 thiss!1602)))

(assert (=> d!55757 true))

(declare-fun _$14!277 () Unit!11192)

(assert (=> d!55757 (= (choose!11 thiss!1602) _$14!277)))

(declare-fun bs!13841 () Bool)

(assert (= bs!13841 d!55757))

(assert (=> bs!13841 m!257421))

(assert (=> d!55625 d!55757))

(declare-fun d!55759 () Bool)

(assert (=> d!55759 (= (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255594)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255594)) lt!255593 (ite c!8493 lt!255592 #b00000000000000000000000000001000)) (or (= lt!255593 (ite c!8493 lt!255592 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255594))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8493 lt!255592 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255593)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255594))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8493 lt!255592 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!255593)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13842 () Bool)

(assert (= bs!13842 d!55759))

(declare-fun m!257887 () Bool)

(assert (=> bs!13842 m!257887))

(declare-fun m!257889 () Bool)

(assert (=> bs!13842 m!257889))

(assert (=> bm!2742 d!55759))

(declare-fun d!55761 () Bool)

(declare-fun res!135431 () Bool)

(declare-fun e!112062 () Bool)

(assert (=> d!55761 (=> res!135431 e!112062)))

(assert (=> d!55761 (= res!135431 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55761 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!112062)))

(declare-fun b!162449 () Bool)

(declare-fun e!112063 () Bool)

(assert (=> b!162449 (= e!112062 e!112063)))

(declare-fun res!135432 () Bool)

(assert (=> b!162449 (=> (not res!135432) (not e!112063))))

(assert (=> b!162449 (= res!135432 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162450 () Bool)

(assert (=> b!162450 (= e!112063 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55761 (not res!135431)) b!162449))

(assert (= (and b!162449 res!135432) b!162450))

(assert (=> b!162449 m!257823))

(declare-fun m!257891 () Bool)

(assert (=> b!162449 m!257891))

(declare-fun m!257893 () Bool)

(assert (=> b!162450 m!257893))

(assert (=> b!162325 d!55761))

(declare-fun b!162451 () Bool)

(declare-fun res!135436 () Bool)

(declare-fun lt!255694 () (_ BitVec 32))

(assert (=> b!162451 (= res!135436 (= lt!255694 #b00000000000000000000000000000000))))

(declare-fun e!112069 () Bool)

(assert (=> b!162451 (=> res!135436 e!112069)))

(declare-fun e!112068 () Bool)

(assert (=> b!162451 (= e!112068 e!112069)))

(declare-fun call!2753 () Bool)

(declare-fun c!8501 () Bool)

(declare-fun bm!2750 () Bool)

(declare-fun lt!255695 () (_ BitVec 32))

(declare-fun lt!255696 () tuple4!234)

(assert (=> bm!2750 (= call!2753 (byteRangesEq!0 (select (arr!4524 (buf!4061 lt!255425)) (_3!585 lt!255696)) (select (arr!4524 (buf!4061 lt!255425)) (_3!585 lt!255696)) lt!255695 (ite c!8501 lt!255694 #b00000000000000000000000000001000)))))

(declare-fun b!162452 () Bool)

(declare-fun e!112064 () Bool)

(declare-fun e!112066 () Bool)

(assert (=> b!162452 (= e!112064 e!112066)))

(assert (=> b!162452 (= c!8501 (= (_3!585 lt!255696) (_4!117 lt!255696)))))

(declare-fun b!162453 () Bool)

(assert (=> b!162453 (= e!112069 (byteRangesEq!0 (select (arr!4524 (buf!4061 lt!255425)) (_4!117 lt!255696)) (select (arr!4524 (buf!4061 lt!255425)) (_4!117 lt!255696)) #b00000000000000000000000000000000 lt!255694))))

(declare-fun b!162454 () Bool)

(declare-fun e!112067 () Bool)

(assert (=> b!162454 (= e!112067 e!112064)))

(declare-fun res!135435 () Bool)

(assert (=> b!162454 (=> (not res!135435) (not e!112064))))

(declare-fun e!112065 () Bool)

(assert (=> b!162454 (= res!135435 e!112065)))

(declare-fun res!135437 () Bool)

(assert (=> b!162454 (=> res!135437 e!112065)))

(assert (=> b!162454 (= res!135437 (bvsge (_1!7829 lt!255696) (_2!7829 lt!255696)))))

(assert (=> b!162454 (= lt!255694 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162454 (= lt!255695 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162454 (= lt!255696 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(declare-fun b!162455 () Bool)

(assert (=> b!162455 (= e!112066 e!112068)))

(declare-fun res!135434 () Bool)

(assert (=> b!162455 (= res!135434 call!2753)))

(assert (=> b!162455 (=> (not res!135434) (not e!112068))))

(declare-fun d!55763 () Bool)

(declare-fun res!135433 () Bool)

(assert (=> d!55763 (=> res!135433 e!112067)))

(assert (=> d!55763 (= res!135433 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(assert (=> d!55763 (= (arrayBitRangesEq!0 (buf!4061 lt!255425) (buf!4061 lt!255425) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))) e!112067)))

(declare-fun b!162456 () Bool)

(assert (=> b!162456 (= e!112066 call!2753)))

(declare-fun b!162457 () Bool)

(assert (=> b!162457 (= e!112065 (arrayRangesEq!555 (buf!4061 lt!255425) (buf!4061 lt!255425) (_1!7829 lt!255696) (_2!7829 lt!255696)))))

(assert (= (and d!55763 (not res!135433)) b!162454))

(assert (= (and b!162454 (not res!135437)) b!162457))

(assert (= (and b!162454 res!135435) b!162452))

(assert (= (and b!162452 c!8501) b!162456))

(assert (= (and b!162452 (not c!8501)) b!162455))

(assert (= (and b!162455 res!135434) b!162451))

(assert (= (and b!162451 (not res!135436)) b!162453))

(assert (= (or b!162456 b!162455) bm!2750))

(declare-fun m!257895 () Bool)

(assert (=> bm!2750 m!257895))

(assert (=> bm!2750 m!257895))

(assert (=> bm!2750 m!257895))

(assert (=> bm!2750 m!257895))

(declare-fun m!257897 () Bool)

(assert (=> bm!2750 m!257897))

(declare-fun m!257899 () Bool)

(assert (=> b!162453 m!257899))

(assert (=> b!162453 m!257899))

(assert (=> b!162453 m!257899))

(assert (=> b!162453 m!257899))

(declare-fun m!257901 () Bool)

(assert (=> b!162453 m!257901))

(assert (=> b!162454 m!257621))

(declare-fun m!257903 () Bool)

(assert (=> b!162454 m!257903))

(declare-fun m!257905 () Bool)

(assert (=> b!162457 m!257905))

(assert (=> b!162308 d!55763))

(assert (=> b!162308 d!55747))

(declare-fun b!162458 () Bool)

(declare-fun res!135441 () Bool)

(declare-fun lt!255697 () (_ BitVec 32))

(assert (=> b!162458 (= res!135441 (= lt!255697 #b00000000000000000000000000000000))))

(declare-fun e!112075 () Bool)

(assert (=> b!162458 (=> res!135441 e!112075)))

(declare-fun e!112074 () Bool)

(assert (=> b!162458 (= e!112074 e!112075)))

(declare-fun c!8502 () Bool)

(declare-fun lt!255698 () (_ BitVec 32))

(declare-fun bm!2751 () Bool)

(declare-fun call!2754 () Bool)

(declare-fun lt!255699 () tuple4!234)

(assert (=> bm!2751 (= call!2754 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255699)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255699)) lt!255698 (ite c!8502 lt!255697 #b00000000000000000000000000001000)))))

(declare-fun b!162459 () Bool)

(declare-fun e!112070 () Bool)

(declare-fun e!112072 () Bool)

(assert (=> b!162459 (= e!112070 e!112072)))

(assert (=> b!162459 (= c!8502 (= (_3!585 lt!255699) (_4!117 lt!255699)))))

(declare-fun b!162460 () Bool)

(assert (=> b!162460 (= e!112075 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255699)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255699)) #b00000000000000000000000000000000 lt!255697))))

(declare-fun b!162461 () Bool)

(declare-fun e!112073 () Bool)

(assert (=> b!162461 (= e!112073 e!112070)))

(declare-fun res!135440 () Bool)

(assert (=> b!162461 (=> (not res!135440) (not e!112070))))

(declare-fun e!112071 () Bool)

(assert (=> b!162461 (= res!135440 e!112071)))

(declare-fun res!135442 () Bool)

(assert (=> b!162461 (=> res!135442 e!112071)))

(assert (=> b!162461 (= res!135442 (bvsge (_1!7829 lt!255699) (_2!7829 lt!255699)))))

(assert (=> b!162461 (= lt!255697 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162461 (= lt!255698 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162461 (= lt!255699 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(declare-fun b!162462 () Bool)

(assert (=> b!162462 (= e!112072 e!112074)))

(declare-fun res!135439 () Bool)

(assert (=> b!162462 (= res!135439 call!2754)))

(assert (=> b!162462 (=> (not res!135439) (not e!112074))))

(declare-fun d!55765 () Bool)

(declare-fun res!135438 () Bool)

(assert (=> d!55765 (=> res!135438 e!112073)))

(assert (=> d!55765 (= res!135438 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))))))

(assert (=> d!55765 (= (arrayBitRangesEq!0 (buf!4061 (_3!584 lt!255276)) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)) (currentBit!7556 (_3!584 lt!255276)))) e!112073)))

(declare-fun b!162463 () Bool)

(assert (=> b!162463 (= e!112072 call!2754)))

(declare-fun b!162464 () Bool)

(assert (=> b!162464 (= e!112071 (arrayRangesEq!555 (buf!4061 (_3!584 lt!255276)) (buf!4061 (_3!584 lt!255276)) (_1!7829 lt!255699) (_2!7829 lt!255699)))))

(assert (= (and d!55765 (not res!135438)) b!162461))

(assert (= (and b!162461 (not res!135442)) b!162464))

(assert (= (and b!162461 res!135440) b!162459))

(assert (= (and b!162459 c!8502) b!162463))

(assert (= (and b!162459 (not c!8502)) b!162462))

(assert (= (and b!162462 res!135439) b!162458))

(assert (= (and b!162458 (not res!135441)) b!162460))

(assert (= (or b!162463 b!162462) bm!2751))

(declare-fun m!257907 () Bool)

(assert (=> bm!2751 m!257907))

(assert (=> bm!2751 m!257907))

(assert (=> bm!2751 m!257907))

(assert (=> bm!2751 m!257907))

(declare-fun m!257909 () Bool)

(assert (=> bm!2751 m!257909))

(declare-fun m!257911 () Bool)

(assert (=> b!162460 m!257911))

(assert (=> b!162460 m!257911))

(assert (=> b!162460 m!257911))

(assert (=> b!162460 m!257911))

(declare-fun m!257913 () Bool)

(assert (=> b!162460 m!257913))

(assert (=> b!162461 m!257271))

(declare-fun m!257915 () Bool)

(assert (=> b!162461 m!257915))

(declare-fun m!257917 () Bool)

(assert (=> b!162464 m!257917))

(assert (=> b!162302 d!55765))

(assert (=> b!162302 d!55559))

(assert (=> b!162334 d!55693))

(assert (=> b!162334 d!55573))

(assert (=> d!55637 d!55645))

(assert (=> b!162297 d!55747))

(assert (=> b!162297 d!55559))

(declare-fun d!55767 () Bool)

(declare-fun e!112076 () Bool)

(assert (=> d!55767 e!112076))

(declare-fun res!135444 () Bool)

(assert (=> d!55767 (=> (not res!135444) (not e!112076))))

(declare-fun lt!255705 () (_ BitVec 64))

(declare-fun lt!255704 () (_ BitVec 64))

(declare-fun lt!255701 () (_ BitVec 64))

(assert (=> d!55767 (= res!135444 (= lt!255704 (bvsub lt!255701 lt!255705)))))

(assert (=> d!55767 (or (= (bvand lt!255701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255701 lt!255705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55767 (= lt!255705 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255569))) ((_ sign_extend 32) (currentByte!7561 lt!255569)) ((_ sign_extend 32) (currentBit!7556 lt!255569))))))

(declare-fun lt!255702 () (_ BitVec 64))

(declare-fun lt!255700 () (_ BitVec 64))

(assert (=> d!55767 (= lt!255701 (bvmul lt!255702 lt!255700))))

(assert (=> d!55767 (or (= lt!255702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255700 (bvsdiv (bvmul lt!255702 lt!255700) lt!255702)))))

(assert (=> d!55767 (= lt!255700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55767 (= lt!255702 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255569))))))

(assert (=> d!55767 (= lt!255704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 lt!255569)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 lt!255569))))))

(assert (=> d!55767 (invariant!0 (currentBit!7556 lt!255569) (currentByte!7561 lt!255569) (size!3603 (buf!4061 lt!255569)))))

(assert (=> d!55767 (= (bitIndex!0 (size!3603 (buf!4061 lt!255569)) (currentByte!7561 lt!255569) (currentBit!7556 lt!255569)) lt!255704)))

(declare-fun b!162465 () Bool)

(declare-fun res!135443 () Bool)

(assert (=> b!162465 (=> (not res!135443) (not e!112076))))

(assert (=> b!162465 (= res!135443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255704))))

(declare-fun b!162466 () Bool)

(declare-fun lt!255703 () (_ BitVec 64))

(assert (=> b!162466 (= e!112076 (bvsle lt!255704 (bvmul lt!255703 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162466 (or (= lt!255703 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255703 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255703)))))

(assert (=> b!162466 (= lt!255703 ((_ sign_extend 32) (size!3603 (buf!4061 lt!255569))))))

(assert (= (and d!55767 res!135444) b!162465))

(assert (= (and b!162465 res!135443) b!162466))

(declare-fun m!257919 () Bool)

(assert (=> d!55767 m!257919))

(declare-fun m!257921 () Bool)

(assert (=> d!55767 m!257921))

(assert (=> d!55595 d!55767))

(assert (=> d!55595 d!55699))

(declare-fun d!55769 () Bool)

(declare-fun lt!255722 () (_ BitVec 32))

(assert (=> d!55769 (= lt!255722 ((_ extract 31 0) (bvsrem (bvsub lt!255434 lt!255421) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!255718 () (_ BitVec 32))

(assert (=> d!55769 (= lt!255718 ((_ extract 31 0) (bvsdiv (bvsub lt!255434 lt!255421) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112081 () Bool)

(assert (=> d!55769 e!112081))

(declare-fun res!135450 () Bool)

(assert (=> d!55769 (=> (not res!135450) (not e!112081))))

(assert (=> d!55769 (= res!135450 (moveBitIndexPrecond!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421)))))

(declare-fun Unit!11209 () Unit!11192)

(declare-fun Unit!11210 () Unit!11192)

(declare-fun Unit!11211 () Unit!11192)

(assert (=> d!55769 (= (moveBitIndex!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421)) (ite (bvslt (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255722) #b00000000000000000000000000000000) (tuple2!14487 Unit!11209 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvsub (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255718) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255722 (currentBit!7556 (_2!7823 lt!255428))))) (ite (bvsge (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255722) #b00000000000000000000000000001000) (tuple2!14487 Unit!11210 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255718 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255722) #b00000000000000000000000000001000))) (tuple2!14487 Unit!11211 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255718) (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255722))))))))

(declare-fun b!162471 () Bool)

(declare-fun e!112082 () Bool)

(assert (=> b!162471 (= e!112081 e!112082)))

(declare-fun res!135449 () Bool)

(assert (=> b!162471 (=> (not res!135449) (not e!112082))))

(declare-fun lt!255719 () (_ BitVec 64))

(declare-fun lt!255720 () tuple2!14486)

(assert (=> b!162471 (= res!135449 (= (bvadd lt!255719 (bvsub lt!255434 lt!255421)) (bitIndex!0 (size!3603 (buf!4061 (_2!7828 lt!255720))) (currentByte!7561 (_2!7828 lt!255720)) (currentBit!7556 (_2!7828 lt!255720)))))))

(assert (=> b!162471 (or (not (= (bvand lt!255719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255434 lt!255421) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!255719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!255719 (bvsub lt!255434 lt!255421)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!162471 (= lt!255719 (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))))))

(declare-fun lt!255721 () (_ BitVec 32))

(declare-fun lt!255723 () (_ BitVec 32))

(declare-fun Unit!11212 () Unit!11192)

(declare-fun Unit!11213 () Unit!11192)

(declare-fun Unit!11214 () Unit!11192)

(assert (=> b!162471 (= lt!255720 (ite (bvslt (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255721) #b00000000000000000000000000000000) (tuple2!14487 Unit!11212 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvsub (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255723) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!255721 (currentBit!7556 (_2!7823 lt!255428))))) (ite (bvsge (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255721) #b00000000000000000000000000001000) (tuple2!14487 Unit!11213 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255723 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255721) #b00000000000000000000000000001000))) (tuple2!14487 Unit!11214 (BitStream!6375 (buf!4061 (_2!7823 lt!255428)) (bvadd (currentByte!7561 (_2!7823 lt!255428)) lt!255723) (bvadd (currentBit!7556 (_2!7823 lt!255428)) lt!255721))))))))

(assert (=> b!162471 (= lt!255721 ((_ extract 31 0) (bvsrem (bvsub lt!255434 lt!255421) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162471 (= lt!255723 ((_ extract 31 0) (bvsdiv (bvsub lt!255434 lt!255421) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!162472 () Bool)

(assert (=> b!162472 (= e!112082 (and (= (size!3603 (buf!4061 (_2!7823 lt!255428))) (size!3603 (buf!4061 (_2!7828 lt!255720)))) (= (buf!4061 (_2!7823 lt!255428)) (buf!4061 (_2!7828 lt!255720)))))))

(assert (= (and d!55769 res!135450) b!162471))

(assert (= (and b!162471 res!135449) b!162472))

(assert (=> d!55769 m!257587))

(declare-fun m!257923 () Bool)

(assert (=> b!162471 m!257923))

(assert (=> b!162471 m!257579))

(assert (=> d!55595 d!55769))

(declare-fun d!55773 () Bool)

(declare-fun res!135453 () Bool)

(declare-fun e!112085 () Bool)

(assert (=> d!55773 (=> (not res!135453) (not e!112085))))

(assert (=> d!55773 (= res!135453 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428))))) (bvsub lt!255434 lt!255421)) (bvsle (bvsub lt!255434 lt!255421) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428))))))))))

(assert (=> d!55773 (= (moveBitIndexPrecond!0 (_2!7823 lt!255428) (bvsub lt!255434 lt!255421)) e!112085)))

(declare-fun b!162476 () Bool)

(declare-fun lt!255726 () (_ BitVec 64))

(assert (=> b!162476 (= e!112085 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255726) (bvsle lt!255726 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7823 lt!255428))))))))))

(assert (=> b!162476 (= lt!255726 (bvadd (bitIndex!0 (size!3603 (buf!4061 (_2!7823 lt!255428))) (currentByte!7561 (_2!7823 lt!255428)) (currentBit!7556 (_2!7823 lt!255428))) (bvsub lt!255434 lt!255421)))))

(assert (= (and d!55773 res!135453) b!162476))

(assert (=> b!162476 m!257579))

(assert (=> d!55595 d!55773))

(declare-fun d!55775 () Bool)

(assert (=> d!55775 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602))) (tuple4!235 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3603 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) (currentBit!7556 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!162312 d!55775))

(declare-fun d!55777 () Bool)

(assert (=> d!55777 (= (byteRangesEq!0 (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255594)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255594)) #b00000000000000000000000000000000 lt!255592) (or (= #b00000000000000000000000000000000 lt!255592) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255594))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255592))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255594))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!255592))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13843 () Bool)

(assert (= bs!13843 d!55777))

(declare-fun m!257925 () Bool)

(assert (=> bs!13843 m!257925))

(assert (=> bs!13843 m!257447))

(assert (=> b!162311 d!55777))

(assert (=> d!55611 d!55629))

(declare-fun d!55779 () Bool)

(assert (=> d!55779 (isPrefixOf!0 lt!255425 lt!255425)))

(assert (=> d!55779 true))

(declare-fun _$14!278 () Unit!11192)

(assert (=> d!55779 (= (choose!11 lt!255425) _$14!278)))

(declare-fun bs!13844 () Bool)

(assert (= bs!13844 d!55779))

(assert (=> bs!13844 m!257431))

(assert (=> d!55611 d!55779))

(assert (=> b!162300 d!55559))

(declare-fun d!55781 () Bool)

(declare-fun e!112086 () Bool)

(assert (=> d!55781 e!112086))

(declare-fun res!135455 () Bool)

(assert (=> d!55781 (=> (not res!135455) (not e!112086))))

(declare-fun lt!255732 () (_ BitVec 64))

(declare-fun lt!255728 () (_ BitVec 64))

(declare-fun lt!255731 () (_ BitVec 64))

(assert (=> d!55781 (= res!135455 (= lt!255731 (bvsub lt!255728 lt!255732)))))

(assert (=> d!55781 (or (= (bvand lt!255728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255728 lt!255732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55781 (= lt!255732 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7826 lt!255610)))) ((_ sign_extend 32) (currentByte!7561 (_2!7826 lt!255610))) ((_ sign_extend 32) (currentBit!7556 (_2!7826 lt!255610)))))))

(declare-fun lt!255729 () (_ BitVec 64))

(declare-fun lt!255727 () (_ BitVec 64))

(assert (=> d!55781 (= lt!255728 (bvmul lt!255729 lt!255727))))

(assert (=> d!55781 (or (= lt!255729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255727 (bvsdiv (bvmul lt!255729 lt!255727) lt!255729)))))

(assert (=> d!55781 (= lt!255727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55781 (= lt!255729 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7826 lt!255610)))))))

(assert (=> d!55781 (= lt!255731 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_2!7826 lt!255610))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_2!7826 lt!255610)))))))

(assert (=> d!55781 (invariant!0 (currentBit!7556 (_2!7826 lt!255610)) (currentByte!7561 (_2!7826 lt!255610)) (size!3603 (buf!4061 (_2!7826 lt!255610))))))

(assert (=> d!55781 (= (bitIndex!0 (size!3603 (buf!4061 (_2!7826 lt!255610))) (currentByte!7561 (_2!7826 lt!255610)) (currentBit!7556 (_2!7826 lt!255610))) lt!255731)))

(declare-fun b!162477 () Bool)

(declare-fun res!135454 () Bool)

(assert (=> b!162477 (=> (not res!135454) (not e!112086))))

(assert (=> b!162477 (= res!135454 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255731))))

(declare-fun b!162478 () Bool)

(declare-fun lt!255730 () (_ BitVec 64))

(assert (=> b!162478 (= e!112086 (bvsle lt!255731 (bvmul lt!255730 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162478 (or (= lt!255730 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255730 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255730)))))

(assert (=> b!162478 (= lt!255730 ((_ sign_extend 32) (size!3603 (buf!4061 (_2!7826 lt!255610)))))))

(assert (= (and d!55781 res!135455) b!162477))

(assert (= (and b!162477 res!135454) b!162478))

(declare-fun m!257927 () Bool)

(assert (=> d!55781 m!257927))

(declare-fun m!257929 () Bool)

(assert (=> d!55781 m!257929))

(assert (=> b!162333 d!55781))

(declare-fun d!55783 () Bool)

(declare-fun e!112087 () Bool)

(assert (=> d!55783 e!112087))

(declare-fun res!135457 () Bool)

(assert (=> d!55783 (=> (not res!135457) (not e!112087))))

(declare-fun lt!255738 () (_ BitVec 64))

(declare-fun lt!255734 () (_ BitVec 64))

(declare-fun lt!255737 () (_ BitVec 64))

(assert (=> d!55783 (= res!135457 (= lt!255737 (bvsub lt!255734 lt!255738)))))

(assert (=> d!55783 (or (= (bvand lt!255734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255734 lt!255738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55783 (= lt!255738 (remainingBits!0 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))) ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255270))) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255270)))))))

(declare-fun lt!255735 () (_ BitVec 64))

(declare-fun lt!255733 () (_ BitVec 64))

(assert (=> d!55783 (= lt!255734 (bvmul lt!255735 lt!255733))))

(assert (=> d!55783 (or (= lt!255735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255733 (bvsdiv (bvmul lt!255735 lt!255733) lt!255735)))))

(assert (=> d!55783 (= lt!255733 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55783 (= lt!255735 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))))))

(assert (=> d!55783 (= lt!255737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7561 (_1!7823 lt!255270))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7556 (_1!7823 lt!255270)))))))

(assert (=> d!55783 (invariant!0 (currentBit!7556 (_1!7823 lt!255270)) (currentByte!7561 (_1!7823 lt!255270)) (size!3603 (buf!4061 (_1!7823 lt!255270))))))

(assert (=> d!55783 (= (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255270))) (currentByte!7561 (_1!7823 lt!255270)) (currentBit!7556 (_1!7823 lt!255270))) lt!255737)))

(declare-fun b!162479 () Bool)

(declare-fun res!135456 () Bool)

(assert (=> b!162479 (=> (not res!135456) (not e!112087))))

(assert (=> b!162479 (= res!135456 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255737))))

(declare-fun b!162480 () Bool)

(declare-fun lt!255736 () (_ BitVec 64))

(assert (=> b!162480 (= e!112087 (bvsle lt!255737 (bvmul lt!255736 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162480 (or (= lt!255736 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255736 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255736)))))

(assert (=> b!162480 (= lt!255736 ((_ sign_extend 32) (size!3603 (buf!4061 (_1!7823 lt!255270)))))))

(assert (= (and d!55783 res!135457) b!162479))

(assert (= (and b!162479 res!135456) b!162480))

(assert (=> d!55783 m!257829))

(declare-fun m!257931 () Bool)

(assert (=> d!55783 m!257931))

(assert (=> b!162333 d!55783))

(assert (=> d!55627 d!55621))

(declare-fun d!55785 () Bool)

(assert (=> d!55785 (isPrefixOf!0 (_3!584 lt!255276) (_3!584 lt!255276))))

(assert (=> d!55785 true))

(declare-fun _$14!279 () Unit!11192)

(assert (=> d!55785 (= (choose!11 (_3!584 lt!255276)) _$14!279)))

(declare-fun bs!13845 () Bool)

(assert (= bs!13845 d!55785))

(assert (=> bs!13845 m!257425))

(assert (=> d!55627 d!55785))

(declare-fun d!55787 () Bool)

(declare-fun res!135458 () Bool)

(declare-fun e!112088 () Bool)

(assert (=> d!55787 (=> res!135458 e!112088)))

(assert (=> d!55787 (= res!135458 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)))))

(assert (=> d!55787 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)) e!112088)))

(declare-fun b!162481 () Bool)

(declare-fun e!112089 () Bool)

(assert (=> b!162481 (= e!112088 e!112089)))

(declare-fun res!135459 () Bool)

(assert (=> b!162481 (=> (not res!135459) (not e!112089))))

(assert (=> b!162481 (= res!135459 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162482 () Bool)

(assert (=> b!162482 (= e!112089 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 thiss!1602)))))

(assert (= (and d!55787 (not res!135458)) b!162481))

(assert (= (and b!162481 res!135459) b!162482))

(assert (=> b!162481 m!257823))

(assert (=> b!162481 m!257891))

(declare-fun m!257933 () Bool)

(assert (=> b!162482 m!257933))

(assert (=> b!162319 d!55787))

(declare-fun d!55789 () Bool)

(declare-fun res!135460 () Bool)

(declare-fun e!112090 () Bool)

(assert (=> d!55789 (=> res!135460 e!112090)))

(assert (=> d!55789 (= res!135460 (= (_1!7829 lt!255594) (_2!7829 lt!255594)))))

(assert (=> d!55789 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (_1!7829 lt!255594) (_2!7829 lt!255594)) e!112090)))

(declare-fun b!162483 () Bool)

(declare-fun e!112091 () Bool)

(assert (=> b!162483 (= e!112090 e!112091)))

(declare-fun res!135461 () Bool)

(assert (=> b!162483 (=> (not res!135461) (not e!112091))))

(assert (=> b!162483 (= res!135461 (= (select (arr!4524 (buf!4061 thiss!1602)) (_1!7829 lt!255594)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_1!7829 lt!255594))))))

(declare-fun b!162484 () Bool)

(assert (=> b!162484 (= e!112091 (arrayRangesEq!555 (buf!4061 thiss!1602) (buf!4061 (_3!584 lt!255276)) (bvadd (_1!7829 lt!255594) #b00000000000000000000000000000001) (_2!7829 lt!255594)))))

(assert (= (and d!55789 (not res!135460)) b!162483))

(assert (= (and b!162483 res!135461) b!162484))

(declare-fun m!257935 () Bool)

(assert (=> b!162483 m!257935))

(declare-fun m!257937 () Bool)

(assert (=> b!162483 m!257937))

(declare-fun m!257939 () Bool)

(assert (=> b!162484 m!257939))

(assert (=> b!162315 d!55789))

(declare-fun b!162485 () Bool)

(declare-fun res!135465 () Bool)

(declare-fun lt!255739 () (_ BitVec 32))

(assert (=> b!162485 (= res!135465 (= lt!255739 #b00000000000000000000000000000000))))

(declare-fun e!112097 () Bool)

(assert (=> b!162485 (=> res!135465 e!112097)))

(declare-fun e!112096 () Bool)

(assert (=> b!162485 (= e!112096 e!112097)))

(declare-fun lt!255741 () tuple4!234)

(declare-fun call!2755 () Bool)

(declare-fun bm!2752 () Bool)

(declare-fun c!8503 () Bool)

(declare-fun lt!255740 () (_ BitVec 32))

(assert (=> bm!2752 (= call!2755 (byteRangesEq!0 (select (arr!4524 (buf!4061 lt!255425)) (_3!585 lt!255741)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_3!585 lt!255741)) lt!255740 (ite c!8503 lt!255739 #b00000000000000000000000000001000)))))

(declare-fun b!162486 () Bool)

(declare-fun e!112092 () Bool)

(declare-fun e!112094 () Bool)

(assert (=> b!162486 (= e!112092 e!112094)))

(assert (=> b!162486 (= c!8503 (= (_3!585 lt!255741) (_4!117 lt!255741)))))

(declare-fun b!162487 () Bool)

(assert (=> b!162487 (= e!112097 (byteRangesEq!0 (select (arr!4524 (buf!4061 lt!255425)) (_4!117 lt!255741)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (_4!117 lt!255741)) #b00000000000000000000000000000000 lt!255739))))

(declare-fun b!162488 () Bool)

(declare-fun e!112095 () Bool)

(assert (=> b!162488 (= e!112095 e!112092)))

(declare-fun res!135464 () Bool)

(assert (=> b!162488 (=> (not res!135464) (not e!112092))))

(declare-fun e!112093 () Bool)

(assert (=> b!162488 (= res!135464 e!112093)))

(declare-fun res!135466 () Bool)

(assert (=> b!162488 (=> res!135466 e!112093)))

(assert (=> b!162488 (= res!135466 (bvsge (_1!7829 lt!255741) (_2!7829 lt!255741)))))

(assert (=> b!162488 (= lt!255739 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162488 (= lt!255740 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162488 (= lt!255741 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(declare-fun b!162489 () Bool)

(assert (=> b!162489 (= e!112094 e!112096)))

(declare-fun res!135463 () Bool)

(assert (=> b!162489 (= res!135463 call!2755)))

(assert (=> b!162489 (=> (not res!135463) (not e!112096))))

(declare-fun d!55791 () Bool)

(declare-fun res!135462 () Bool)

(assert (=> d!55791 (=> res!135462 e!112095)))

(assert (=> d!55791 (= res!135462 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))))))

(assert (=> d!55791 (= (arrayBitRangesEq!0 (buf!4061 lt!255425) (buf!4061 (_3!584 lt!255276)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 lt!255425)) (currentByte!7561 lt!255425) (currentBit!7556 lt!255425))) e!112095)))

(declare-fun b!162490 () Bool)

(assert (=> b!162490 (= e!112094 call!2755)))

(declare-fun b!162491 () Bool)

(assert (=> b!162491 (= e!112093 (arrayRangesEq!555 (buf!4061 lt!255425) (buf!4061 (_3!584 lt!255276)) (_1!7829 lt!255741) (_2!7829 lt!255741)))))

(assert (= (and d!55791 (not res!135462)) b!162488))

(assert (= (and b!162488 (not res!135466)) b!162491))

(assert (= (and b!162488 res!135464) b!162486))

(assert (= (and b!162486 c!8503) b!162490))

(assert (= (and b!162486 (not c!8503)) b!162489))

(assert (= (and b!162489 res!135463) b!162485))

(assert (= (and b!162485 (not res!135465)) b!162487))

(assert (= (or b!162490 b!162489) bm!2752))

(declare-fun m!257941 () Bool)

(assert (=> bm!2752 m!257941))

(declare-fun m!257943 () Bool)

(assert (=> bm!2752 m!257943))

(assert (=> bm!2752 m!257941))

(assert (=> bm!2752 m!257943))

(declare-fun m!257945 () Bool)

(assert (=> bm!2752 m!257945))

(declare-fun m!257947 () Bool)

(assert (=> b!162487 m!257947))

(declare-fun m!257949 () Bool)

(assert (=> b!162487 m!257949))

(assert (=> b!162487 m!257947))

(assert (=> b!162487 m!257949))

(declare-fun m!257951 () Bool)

(assert (=> b!162487 m!257951))

(assert (=> b!162488 m!257621))

(assert (=> b!162488 m!257903))

(declare-fun m!257953 () Bool)

(assert (=> b!162491 m!257953))

(assert (=> b!162299 d!55791))

(assert (=> b!162299 d!55747))

(declare-fun b!162492 () Bool)

(declare-fun res!135470 () Bool)

(declare-fun lt!255742 () (_ BitVec 32))

(assert (=> b!162492 (= res!135470 (= lt!255742 #b00000000000000000000000000000000))))

(declare-fun e!112103 () Bool)

(assert (=> b!162492 (=> res!135470 e!112103)))

(declare-fun e!112102 () Bool)

(assert (=> b!162492 (= e!112102 e!112103)))

(declare-fun call!2756 () Bool)

(declare-fun lt!255743 () (_ BitVec 32))

(declare-fun lt!255744 () tuple4!234)

(declare-fun c!8504 () Bool)

(declare-fun bm!2753 () Bool)

(assert (=> bm!2753 (= call!2756 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_1!7823 lt!255428))) (_3!585 lt!255744)) (select (arr!4524 (buf!4061 thiss!1602)) (_3!585 lt!255744)) lt!255743 (ite c!8504 lt!255742 #b00000000000000000000000000001000)))))

(declare-fun b!162493 () Bool)

(declare-fun e!112098 () Bool)

(declare-fun e!112100 () Bool)

(assert (=> b!162493 (= e!112098 e!112100)))

(assert (=> b!162493 (= c!8504 (= (_3!585 lt!255744) (_4!117 lt!255744)))))

(declare-fun b!162494 () Bool)

(assert (=> b!162494 (= e!112103 (byteRangesEq!0 (select (arr!4524 (buf!4061 (_1!7823 lt!255428))) (_4!117 lt!255744)) (select (arr!4524 (buf!4061 thiss!1602)) (_4!117 lt!255744)) #b00000000000000000000000000000000 lt!255742))))

(declare-fun b!162495 () Bool)

(declare-fun e!112101 () Bool)

(assert (=> b!162495 (= e!112101 e!112098)))

(declare-fun res!135469 () Bool)

(assert (=> b!162495 (=> (not res!135469) (not e!112098))))

(declare-fun e!112099 () Bool)

(assert (=> b!162495 (= res!135469 e!112099)))

(declare-fun res!135471 () Bool)

(assert (=> b!162495 (=> res!135471 e!112099)))

(assert (=> b!162495 (= res!135471 (bvsge (_1!7829 lt!255744) (_2!7829 lt!255744)))))

(assert (=> b!162495 (= lt!255742 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162495 (= lt!255743 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162495 (= lt!255744 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(declare-fun b!162496 () Bool)

(assert (=> b!162496 (= e!112100 e!112102)))

(declare-fun res!135468 () Bool)

(assert (=> b!162496 (= res!135468 call!2756)))

(assert (=> b!162496 (=> (not res!135468) (not e!112102))))

(declare-fun d!55793 () Bool)

(declare-fun res!135467 () Bool)

(assert (=> d!55793 (=> res!135467 e!112101)))

(assert (=> d!55793 (= res!135467 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))))))

(assert (=> d!55793 (= (arrayBitRangesEq!0 (buf!4061 (_1!7823 lt!255428)) (buf!4061 thiss!1602) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3603 (buf!4061 (_1!7823 lt!255428))) (currentByte!7561 (_1!7823 lt!255428)) (currentBit!7556 (_1!7823 lt!255428)))) e!112101)))

(declare-fun b!162497 () Bool)

(assert (=> b!162497 (= e!112100 call!2756)))

(declare-fun b!162498 () Bool)

(assert (=> b!162498 (= e!112099 (arrayRangesEq!555 (buf!4061 (_1!7823 lt!255428)) (buf!4061 thiss!1602) (_1!7829 lt!255744) (_2!7829 lt!255744)))))

(assert (= (and d!55793 (not res!135467)) b!162495))

(assert (= (and b!162495 (not res!135471)) b!162498))

(assert (= (and b!162495 res!135469) b!162493))

(assert (= (and b!162493 c!8504) b!162497))

(assert (= (and b!162493 (not c!8504)) b!162496))

(assert (= (and b!162496 res!135468) b!162492))

(assert (= (and b!162492 (not res!135470)) b!162494))

(assert (= (or b!162497 b!162496) bm!2753))

(declare-fun m!257955 () Bool)

(assert (=> bm!2753 m!257955))

(declare-fun m!257957 () Bool)

(assert (=> bm!2753 m!257957))

(assert (=> bm!2753 m!257955))

(assert (=> bm!2753 m!257957))

(declare-fun m!257959 () Bool)

(assert (=> bm!2753 m!257959))

(declare-fun m!257961 () Bool)

(assert (=> b!162494 m!257961))

(declare-fun m!257963 () Bool)

(assert (=> b!162494 m!257963))

(assert (=> b!162494 m!257961))

(assert (=> b!162494 m!257963))

(declare-fun m!257965 () Bool)

(assert (=> b!162494 m!257965))

(assert (=> b!162495 m!257629))

(assert (=> b!162495 m!257819))

(declare-fun m!257967 () Bool)

(assert (=> b!162498 m!257967))

(assert (=> b!162336 d!55793))

(assert (=> b!162336 d!55693))

(declare-fun d!55795 () Bool)

(declare-fun res!135472 () Bool)

(declare-fun e!112104 () Bool)

(assert (=> d!55795 (=> res!135472 e!112104)))

(assert (=> d!55795 (= res!135472 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55795 (= (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) e!112104)))

(declare-fun b!162499 () Bool)

(declare-fun e!112105 () Bool)

(assert (=> b!162499 (= e!112104 e!112105)))

(declare-fun res!135473 () Bool)

(assert (=> b!162499 (=> (not res!135473) (not e!112105))))

(assert (=> b!162499 (= res!135473 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162500 () Bool)

(assert (=> b!162500 (= e!112105 (arrayRangesEq!555 (buf!4061 thiss!1602) (array!8036 (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55795 (not res!135472)) b!162499))

(assert (= (and b!162499 res!135473) b!162500))

(assert (=> b!162499 m!257607))

(declare-fun m!257969 () Bool)

(assert (=> b!162499 m!257969))

(declare-fun m!257971 () Bool)

(assert (=> b!162500 m!257971))

(assert (=> b!162323 d!55795))

(declare-fun d!55797 () Bool)

(declare-fun res!135474 () Bool)

(declare-fun e!112106 () Bool)

(assert (=> d!55797 (=> res!135474 e!112106)))

(assert (=> d!55797 (= res!135474 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55797 (= (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) e!112106)))

(declare-fun b!162501 () Bool)

(declare-fun e!112107 () Bool)

(assert (=> b!162501 (= e!112106 e!112107)))

(declare-fun res!135475 () Bool)

(assert (=> b!162501 (=> (not res!135475) (not e!112107))))

(assert (=> b!162501 (= res!135475 (= (select (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162502 () Bool)

(assert (=> b!162502 (= e!112107 (arrayRangesEq!555 lt!255278 (array!8036 (store (store (store (arr!4524 (buf!4061 thiss!1602)) (currentByte!7561 thiss!1602) lt!255272) (currentByte!7561 thiss!1602) lt!255263) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 (buf!4061 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55797 (not res!135474)) b!162501))

(assert (= (and b!162501 res!135475) b!162502))

(declare-fun m!257973 () Bool)

(assert (=> b!162501 m!257973))

(declare-fun m!257975 () Bool)

(assert (=> b!162501 m!257975))

(declare-fun m!257977 () Bool)

(assert (=> b!162502 m!257977))

(assert (=> b!162317 d!55797))

(assert (=> d!55639 d!55545))

(assert (=> d!55619 d!55617))

(declare-fun d!55799 () Bool)

(assert (=> d!55799 (isPrefixOf!0 lt!255425 (_3!584 lt!255276))))

(assert (=> d!55799 true))

(declare-fun _$15!253 () Unit!11192)

(assert (=> d!55799 (= (choose!30 lt!255425 (_3!584 lt!255276) (_3!584 lt!255276)) _$15!253)))

(declare-fun bs!13846 () Bool)

(assert (= bs!13846 d!55799))

(assert (=> bs!13846 m!257417))

(assert (=> d!55619 d!55799))

(declare-fun d!55801 () Bool)

(declare-fun res!135476 () Bool)

(declare-fun e!112108 () Bool)

(assert (=> d!55801 (=> res!135476 e!112108)))

(assert (=> d!55801 (= res!135476 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (=> d!55801 (= (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)) e!112108)))

(declare-fun b!162503 () Bool)

(declare-fun e!112109 () Bool)

(assert (=> b!162503 (= e!112108 e!112109)))

(declare-fun res!135477 () Bool)

(assert (=> b!162503 (=> (not res!135477) (not e!112109))))

(assert (=> b!162503 (= res!135477 (= (select (arr!4524 (buf!4061 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!162504 () Bool)

(assert (=> b!162504 (= e!112109 (arrayRangesEq!555 (buf!4061 thiss!1602) lt!255278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7561 (_3!584 lt!255276)) #b00000000000000000000000000000001)))))

(assert (= (and d!55801 (not res!135476)) b!162503))

(assert (= (and b!162503 res!135477) b!162504))

(assert (=> b!162503 m!257823))

(assert (=> b!162503 m!257973))

(declare-fun m!257979 () Bool)

(assert (=> b!162504 m!257979))

(assert (=> b!162293 d!55801))

(declare-fun d!55803 () Bool)

(declare-fun res!135478 () Bool)

(declare-fun e!112110 () Bool)

(assert (=> d!55803 (=> res!135478 e!112110)))

(assert (=> d!55803 (= res!135478 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (=> d!55803 (= (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))) e!112110)))

(declare-fun b!162505 () Bool)

(declare-fun e!112111 () Bool)

(assert (=> b!162505 (= e!112110 e!112111)))

(declare-fun res!135479 () Bool)

(assert (=> b!162505 (=> (not res!135479) (not e!112111))))

(assert (=> b!162505 (= res!135479 (= (select (arr!4524 lt!255278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4524 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!162506 () Bool)

(assert (=> b!162506 (= e!112111 (arrayRangesEq!555 lt!255278 (array!8036 (store (arr!4524 lt!255278) (currentByte!7561 (_3!584 lt!255276)) (select (arr!4524 (buf!4061 (_3!584 lt!255276))) (currentByte!7561 (_3!584 lt!255276)))) (size!3603 lt!255278)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7561 (_3!584 lt!255276))))))

(assert (= (and d!55803 (not res!135478)) b!162505))

(assert (= (and b!162505 res!135479) b!162506))

(assert (=> b!162505 m!257609))

(declare-fun m!257981 () Bool)

(assert (=> b!162505 m!257981))

(declare-fun m!257983 () Bool)

(assert (=> b!162506 m!257983))

(assert (=> b!162327 d!55803))

(push 1)

(assert (not b!162457))

(assert (not bm!2750))

(assert (not d!55781))

(assert (not b!162413))

(assert (not b!162405))

(assert (not b!162417))

(assert (not d!55785))

(assert (not b!162506))

(assert (not b!162393))

(assert (not b!162439))

(assert (not bm!2748))

(assert (not d!55779))

(assert (not bm!2753))

(assert (not b!162464))

(assert (not b!162453))

(assert (not d!55757))

(assert (not b!162443))

(assert (not d!55747))

(assert (not bm!2747))

(assert (not d!55699))

(assert (not b!162450))

(assert (not b!162448))

(assert (not d!55767))

(assert (not d!55799))

(assert (not b!162407))

(assert (not d!55705))

(assert (not b!162419))

(assert (not b!162500))

(assert (not b!162495))

(assert (not b!162442))

(assert (not d!55693))

(assert (not b!162487))

(assert (not b!162396))

(assert (not b!162482))

(assert (not d!55769))

(assert (not b!162454))

(assert (not d!55721))

(assert (not b!162498))

(assert (not b!162460))

(assert (not bm!2751))

(assert (not bm!2749))

(assert (not b!162502))

(assert (not d!55723))

(assert (not b!162461))

(assert (not b!162484))

(assert (not bm!2752))

(assert (not b!162392))

(assert (not b!162491))

(assert (not b!162488))

(assert (not d!55783))

(assert (not b!162504))

(assert (not b!162446))

(assert (not b!162414))

(assert (not b!162494))

(assert (not b!162476))

(assert (not b!162471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

