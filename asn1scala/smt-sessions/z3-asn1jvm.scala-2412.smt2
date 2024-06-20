; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61428 () Bool)

(assert start!61428)

(declare-fun b!276185 () Bool)

(declare-fun e!196146 () Bool)

(declare-datatypes ((array!15798 0))(
  ( (array!15799 (arr!7835 (Array (_ BitVec 32) (_ BitVec 8))) (size!6842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12498 0))(
  ( (BitStream!12499 (buf!7310 array!15798) (currentByte!13512 (_ BitVec 32)) (currentBit!13507 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12498)

(declare-fun array_inv!6566 (array!15798) Bool)

(assert (=> b!276185 (= e!196146 (array_inv!6566 (buf!7310 bs1!11)))))

(declare-fun res!229508 () Bool)

(declare-fun e!196147 () Bool)

(assert (=> start!61428 (=> (not res!229508) (not e!196147))))

(declare-fun bs2!19 () BitStream!12498)

(assert (=> start!61428 (= res!229508 (= (size!6842 (buf!7310 bs1!11)) (size!6842 (buf!7310 bs2!19))))))

(assert (=> start!61428 e!196147))

(declare-fun inv!12 (BitStream!12498) Bool)

(assert (=> start!61428 (and (inv!12 bs1!11) e!196146)))

(declare-fun e!196143 () Bool)

(assert (=> start!61428 (and (inv!12 bs2!19) e!196143)))

(declare-fun b!276186 () Bool)

(declare-fun e!196144 () Bool)

(assert (=> b!276186 (= e!196147 e!196144)))

(declare-fun res!229510 () Bool)

(assert (=> b!276186 (=> (not res!229510) (not e!196144))))

(declare-fun lt!414369 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15798 array!15798 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276186 (= res!229510 (arrayBitRangesEq!0 (buf!7310 bs1!11) (buf!7310 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414369))))

(declare-fun lt!414366 () (_ BitVec 64))

(assert (=> b!276186 (= lt!414369 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414366))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276186 (= lt!414366 (bitIndex!0 (size!6842 (buf!7310 bs1!11)) (currentByte!13512 bs1!11) (currentBit!13507 bs1!11)))))

(declare-fun b!276187 () Bool)

(assert (=> b!276187 (= e!196143 (array_inv!6566 (buf!7310 bs2!19)))))

(declare-fun b!276188 () Bool)

(declare-fun lt!414365 () (_ BitVec 64))

(assert (=> b!276188 (= e!196144 (not (or (not (= lt!414365 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!414365 (bvand lt!414369 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!276188 (= lt!414365 (bvand lt!414366 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!22514 0))(
  ( (tuple2!22515 (_1!12295 BitStream!12498) (_2!12295 Bool)) )
))
(declare-fun lt!414367 () tuple2!22514)

(declare-fun readBitPure!0 (BitStream!12498) tuple2!22514)

(assert (=> b!276188 (= lt!414367 (readBitPure!0 (BitStream!12499 (buf!7310 bs2!19) (currentByte!13512 bs1!11) (currentBit!13507 bs1!11))))))

(declare-fun lt!414368 () tuple2!22514)

(assert (=> b!276188 (= lt!414368 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276188 (invariant!0 (currentBit!13507 bs1!11) (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs2!19)))))

(declare-fun b!276189 () Bool)

(declare-fun res!229509 () Bool)

(assert (=> b!276189 (=> (not res!229509) (not e!196147))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276189 (= res!229509 (validate_offset_bit!0 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))) ((_ sign_extend 32) (currentByte!13512 bs1!11)) ((_ sign_extend 32) (currentBit!13507 bs1!11))))))

(assert (= (and start!61428 res!229508) b!276189))

(assert (= (and b!276189 res!229509) b!276186))

(assert (= (and b!276186 res!229510) b!276188))

(assert (= start!61428 b!276185))

(assert (= start!61428 b!276187))

(declare-fun m!409171 () Bool)

(assert (=> b!276189 m!409171))

(declare-fun m!409173 () Bool)

(assert (=> b!276188 m!409173))

(declare-fun m!409175 () Bool)

(assert (=> b!276188 m!409175))

(declare-fun m!409177 () Bool)

(assert (=> b!276188 m!409177))

(declare-fun m!409179 () Bool)

(assert (=> start!61428 m!409179))

(declare-fun m!409181 () Bool)

(assert (=> start!61428 m!409181))

(declare-fun m!409183 () Bool)

(assert (=> b!276187 m!409183))

(declare-fun m!409185 () Bool)

(assert (=> b!276186 m!409185))

(declare-fun m!409187 () Bool)

(assert (=> b!276186 m!409187))

(declare-fun m!409189 () Bool)

(assert (=> b!276185 m!409189))

(check-sat (not b!276189) (not b!276188) (not b!276186) (not start!61428) (not b!276187) (not b!276185))
(check-sat)
(get-model)

(declare-fun d!95096 () Bool)

(assert (=> d!95096 (= (array_inv!6566 (buf!7310 bs1!11)) (bvsge (size!6842 (buf!7310 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276185 d!95096))

(declare-fun d!95100 () Bool)

(assert (=> d!95100 (= (inv!12 bs1!11) (invariant!0 (currentBit!13507 bs1!11) (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs1!11))))))

(declare-fun bs!23977 () Bool)

(assert (= bs!23977 d!95100))

(declare-fun m!409219 () Bool)

(assert (=> bs!23977 m!409219))

(assert (=> start!61428 d!95100))

(declare-fun d!95106 () Bool)

(assert (=> d!95106 (= (inv!12 bs2!19) (invariant!0 (currentBit!13507 bs2!19) (currentByte!13512 bs2!19) (size!6842 (buf!7310 bs2!19))))))

(declare-fun bs!23978 () Bool)

(assert (= bs!23978 d!95106))

(declare-fun m!409221 () Bool)

(assert (=> bs!23978 m!409221))

(assert (=> start!61428 d!95106))

(declare-fun lt!414417 () (_ BitVec 32))

(declare-fun b!276261 () Bool)

(declare-fun e!196218 () Bool)

(declare-datatypes ((tuple4!520 0))(
  ( (tuple4!521 (_1!12301 (_ BitVec 32)) (_2!12301 (_ BitVec 32)) (_3!1040 (_ BitVec 32)) (_4!260 (_ BitVec 32))) )
))
(declare-fun lt!414419 () tuple4!520)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276261 (= e!196218 (byteRangesEq!0 (select (arr!7835 (buf!7310 bs1!11)) (_4!260 lt!414419)) (select (arr!7835 (buf!7310 bs2!19)) (_4!260 lt!414419)) #b00000000000000000000000000000000 lt!414417))))

(declare-fun d!95108 () Bool)

(declare-fun res!229564 () Bool)

(declare-fun e!196215 () Bool)

(assert (=> d!95108 (=> res!229564 e!196215)))

(assert (=> d!95108 (= res!229564 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414369))))

(assert (=> d!95108 (= (arrayBitRangesEq!0 (buf!7310 bs1!11) (buf!7310 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414369) e!196215)))

(declare-fun b!276262 () Bool)

(declare-fun e!196216 () Bool)

(assert (=> b!276262 (= e!196215 e!196216)))

(declare-fun res!229563 () Bool)

(assert (=> b!276262 (=> (not res!229563) (not e!196216))))

(declare-fun e!196219 () Bool)

(assert (=> b!276262 (= res!229563 e!196219)))

(declare-fun res!229561 () Bool)

(assert (=> b!276262 (=> res!229561 e!196219)))

(assert (=> b!276262 (= res!229561 (bvsge (_1!12301 lt!414419) (_2!12301 lt!414419)))))

(assert (=> b!276262 (= lt!414417 ((_ extract 31 0) (bvsrem lt!414369 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!414418 () (_ BitVec 32))

(assert (=> b!276262 (= lt!414418 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!520)

(assert (=> b!276262 (= lt!414419 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414369))))

(declare-fun b!276263 () Bool)

(declare-fun e!196220 () Bool)

(declare-fun e!196217 () Bool)

(assert (=> b!276263 (= e!196220 e!196217)))

(declare-fun res!229562 () Bool)

(declare-fun call!4436 () Bool)

(assert (=> b!276263 (= res!229562 call!4436)))

(assert (=> b!276263 (=> (not res!229562) (not e!196217))))

(declare-fun b!276264 () Bool)

(declare-fun arrayRangesEq!1153 (array!15798 array!15798 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276264 (= e!196219 (arrayRangesEq!1153 (buf!7310 bs1!11) (buf!7310 bs2!19) (_1!12301 lt!414419) (_2!12301 lt!414419)))))

(declare-fun c!12621 () Bool)

(declare-fun bm!4433 () Bool)

(assert (=> bm!4433 (= call!4436 (byteRangesEq!0 (select (arr!7835 (buf!7310 bs1!11)) (_3!1040 lt!414419)) (select (arr!7835 (buf!7310 bs2!19)) (_3!1040 lt!414419)) lt!414418 (ite c!12621 lt!414417 #b00000000000000000000000000001000)))))

(declare-fun b!276265 () Bool)

(assert (=> b!276265 (= e!196216 e!196220)))

(assert (=> b!276265 (= c!12621 (= (_3!1040 lt!414419) (_4!260 lt!414419)))))

(declare-fun b!276266 () Bool)

(declare-fun res!229560 () Bool)

(assert (=> b!276266 (= res!229560 (= lt!414417 #b00000000000000000000000000000000))))

(assert (=> b!276266 (=> res!229560 e!196218)))

(assert (=> b!276266 (= e!196217 e!196218)))

(declare-fun b!276267 () Bool)

(assert (=> b!276267 (= e!196220 call!4436)))

(assert (= (and d!95108 (not res!229564)) b!276262))

(assert (= (and b!276262 (not res!229561)) b!276264))

(assert (= (and b!276262 res!229563) b!276265))

(assert (= (and b!276265 c!12621) b!276267))

(assert (= (and b!276265 (not c!12621)) b!276263))

(assert (= (and b!276263 res!229562) b!276266))

(assert (= (and b!276266 (not res!229560)) b!276261))

(assert (= (or b!276267 b!276263) bm!4433))

(declare-fun m!409255 () Bool)

(assert (=> b!276261 m!409255))

(declare-fun m!409257 () Bool)

(assert (=> b!276261 m!409257))

(assert (=> b!276261 m!409255))

(assert (=> b!276261 m!409257))

(declare-fun m!409259 () Bool)

(assert (=> b!276261 m!409259))

(declare-fun m!409261 () Bool)

(assert (=> b!276262 m!409261))

(declare-fun m!409263 () Bool)

(assert (=> b!276264 m!409263))

(declare-fun m!409265 () Bool)

(assert (=> bm!4433 m!409265))

(declare-fun m!409267 () Bool)

(assert (=> bm!4433 m!409267))

(assert (=> bm!4433 m!409265))

(assert (=> bm!4433 m!409267))

(declare-fun m!409269 () Bool)

(assert (=> bm!4433 m!409269))

(assert (=> b!276186 d!95108))

(declare-fun d!95114 () Bool)

(declare-fun e!196229 () Bool)

(assert (=> d!95114 e!196229))

(declare-fun res!229582 () Bool)

(assert (=> d!95114 (=> (not res!229582) (not e!196229))))

(declare-fun lt!414468 () (_ BitVec 64))

(declare-fun lt!414473 () (_ BitVec 64))

(declare-fun lt!414469 () (_ BitVec 64))

(assert (=> d!95114 (= res!229582 (= lt!414469 (bvsub lt!414468 lt!414473)))))

(assert (=> d!95114 (or (= (bvand lt!414468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414468 lt!414473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95114 (= lt!414473 (remainingBits!0 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))) ((_ sign_extend 32) (currentByte!13512 bs1!11)) ((_ sign_extend 32) (currentBit!13507 bs1!11))))))

(declare-fun lt!414471 () (_ BitVec 64))

(declare-fun lt!414470 () (_ BitVec 64))

(assert (=> d!95114 (= lt!414468 (bvmul lt!414471 lt!414470))))

(assert (=> d!95114 (or (= lt!414471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414470 (bvsdiv (bvmul lt!414471 lt!414470) lt!414471)))))

(assert (=> d!95114 (= lt!414470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95114 (= lt!414471 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))))))

(assert (=> d!95114 (= lt!414469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13512 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13507 bs1!11))))))

(assert (=> d!95114 (invariant!0 (currentBit!13507 bs1!11) (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs1!11)))))

(assert (=> d!95114 (= (bitIndex!0 (size!6842 (buf!7310 bs1!11)) (currentByte!13512 bs1!11) (currentBit!13507 bs1!11)) lt!414469)))

(declare-fun b!276284 () Bool)

(declare-fun res!229581 () Bool)

(assert (=> b!276284 (=> (not res!229581) (not e!196229))))

(assert (=> b!276284 (= res!229581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414469))))

(declare-fun b!276285 () Bool)

(declare-fun lt!414472 () (_ BitVec 64))

(assert (=> b!276285 (= e!196229 (bvsle lt!414469 (bvmul lt!414472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276285 (or (= lt!414472 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414472 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414472)))))

(assert (=> b!276285 (= lt!414472 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))))))

(assert (= (and d!95114 res!229582) b!276284))

(assert (= (and b!276284 res!229581) b!276285))

(declare-fun m!409283 () Bool)

(assert (=> d!95114 m!409283))

(assert (=> d!95114 m!409219))

(assert (=> b!276186 d!95114))

(declare-fun d!95134 () Bool)

(assert (=> d!95134 (= (array_inv!6566 (buf!7310 bs2!19)) (bvsge (size!6842 (buf!7310 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276187 d!95134))

(declare-fun d!95136 () Bool)

(declare-datatypes ((tuple2!22522 0))(
  ( (tuple2!22523 (_1!12302 Bool) (_2!12302 BitStream!12498)) )
))
(declare-fun lt!414476 () tuple2!22522)

(declare-fun readBit!0 (BitStream!12498) tuple2!22522)

(assert (=> d!95136 (= lt!414476 (readBit!0 (BitStream!12499 (buf!7310 bs2!19) (currentByte!13512 bs1!11) (currentBit!13507 bs1!11))))))

(assert (=> d!95136 (= (readBitPure!0 (BitStream!12499 (buf!7310 bs2!19) (currentByte!13512 bs1!11) (currentBit!13507 bs1!11))) (tuple2!22515 (_2!12302 lt!414476) (_1!12302 lt!414476)))))

(declare-fun bs!23985 () Bool)

(assert (= bs!23985 d!95136))

(declare-fun m!409285 () Bool)

(assert (=> bs!23985 m!409285))

(assert (=> b!276188 d!95136))

(declare-fun d!95138 () Bool)

(declare-fun lt!414477 () tuple2!22522)

(assert (=> d!95138 (= lt!414477 (readBit!0 bs1!11))))

(assert (=> d!95138 (= (readBitPure!0 bs1!11) (tuple2!22515 (_2!12302 lt!414477) (_1!12302 lt!414477)))))

(declare-fun bs!23986 () Bool)

(assert (= bs!23986 d!95138))

(declare-fun m!409287 () Bool)

(assert (=> bs!23986 m!409287))

(assert (=> b!276188 d!95138))

(declare-fun d!95140 () Bool)

(assert (=> d!95140 (= (invariant!0 (currentBit!13507 bs1!11) (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs2!19))) (and (bvsge (currentBit!13507 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13507 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13512 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs2!19))) (and (= (currentBit!13507 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13512 bs1!11) (size!6842 (buf!7310 bs2!19)))))))))

(assert (=> b!276188 d!95140))

(declare-fun d!95142 () Bool)

(assert (=> d!95142 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))) ((_ sign_extend 32) (currentByte!13512 bs1!11)) ((_ sign_extend 32) (currentBit!13507 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6842 (buf!7310 bs1!11))) ((_ sign_extend 32) (currentByte!13512 bs1!11)) ((_ sign_extend 32) (currentBit!13507 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23987 () Bool)

(assert (= bs!23987 d!95142))

(assert (=> bs!23987 m!409283))

(assert (=> b!276189 d!95142))

(check-sat (not d!95100) (not bm!4433) (not d!95136) (not d!95106) (not d!95114) (not d!95138) (not b!276261) (not d!95142) (not b!276264) (not b!276262))
