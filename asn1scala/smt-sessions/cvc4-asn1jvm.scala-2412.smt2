; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61430 () Bool)

(assert start!61430)

(declare-fun b!276200 () Bool)

(declare-fun e!196164 () Bool)

(declare-datatypes ((array!15800 0))(
  ( (array!15801 (arr!7836 (Array (_ BitVec 32) (_ BitVec 8))) (size!6843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12500 0))(
  ( (BitStream!12501 (buf!7311 array!15800) (currentByte!13513 (_ BitVec 32)) (currentBit!13508 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12500)

(declare-fun array_inv!6567 (array!15800) Bool)

(assert (=> b!276200 (= e!196164 (array_inv!6567 (buf!7311 bs1!11)))))

(declare-fun b!276201 () Bool)

(declare-fun res!229518 () Bool)

(declare-fun e!196163 () Bool)

(assert (=> b!276201 (=> (not res!229518) (not e!196163))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276201 (= res!229518 (validate_offset_bit!0 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))) ((_ sign_extend 32) (currentByte!13513 bs1!11)) ((_ sign_extend 32) (currentBit!13508 bs1!11))))))

(declare-fun res!229519 () Bool)

(assert (=> start!61430 (=> (not res!229519) (not e!196163))))

(declare-fun bs2!19 () BitStream!12500)

(assert (=> start!61430 (= res!229519 (= (size!6843 (buf!7311 bs1!11)) (size!6843 (buf!7311 bs2!19))))))

(assert (=> start!61430 e!196163))

(declare-fun inv!12 (BitStream!12500) Bool)

(assert (=> start!61430 (and (inv!12 bs1!11) e!196164)))

(declare-fun e!196161 () Bool)

(assert (=> start!61430 (and (inv!12 bs2!19) e!196161)))

(declare-fun b!276202 () Bool)

(declare-fun e!196162 () Bool)

(declare-fun lt!414384 () (_ BitVec 64))

(declare-fun lt!414383 () (_ BitVec 64))

(assert (=> b!276202 (= e!196162 (not (or (not (= lt!414384 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!414384 (bvand lt!414383 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!414382 () (_ BitVec 64))

(assert (=> b!276202 (= lt!414384 (bvand lt!414382 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!22516 0))(
  ( (tuple2!22517 (_1!12296 BitStream!12500) (_2!12296 Bool)) )
))
(declare-fun lt!414380 () tuple2!22516)

(declare-fun readBitPure!0 (BitStream!12500) tuple2!22516)

(assert (=> b!276202 (= lt!414380 (readBitPure!0 (BitStream!12501 (buf!7311 bs2!19) (currentByte!13513 bs1!11) (currentBit!13508 bs1!11))))))

(declare-fun lt!414381 () tuple2!22516)

(assert (=> b!276202 (= lt!414381 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276202 (invariant!0 (currentBit!13508 bs1!11) (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs2!19)))))

(declare-fun b!276203 () Bool)

(assert (=> b!276203 (= e!196163 e!196162)))

(declare-fun res!229517 () Bool)

(assert (=> b!276203 (=> (not res!229517) (not e!196162))))

(declare-fun arrayBitRangesEq!0 (array!15800 array!15800 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276203 (= res!229517 (arrayBitRangesEq!0 (buf!7311 bs1!11) (buf!7311 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414383))))

(assert (=> b!276203 (= lt!414383 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414382))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276203 (= lt!414382 (bitIndex!0 (size!6843 (buf!7311 bs1!11)) (currentByte!13513 bs1!11) (currentBit!13508 bs1!11)))))

(declare-fun b!276204 () Bool)

(assert (=> b!276204 (= e!196161 (array_inv!6567 (buf!7311 bs2!19)))))

(assert (= (and start!61430 res!229519) b!276201))

(assert (= (and b!276201 res!229518) b!276203))

(assert (= (and b!276203 res!229517) b!276202))

(assert (= start!61430 b!276200))

(assert (= start!61430 b!276204))

(declare-fun m!409191 () Bool)

(assert (=> b!276202 m!409191))

(declare-fun m!409193 () Bool)

(assert (=> b!276202 m!409193))

(declare-fun m!409195 () Bool)

(assert (=> b!276202 m!409195))

(declare-fun m!409197 () Bool)

(assert (=> b!276203 m!409197))

(declare-fun m!409199 () Bool)

(assert (=> b!276203 m!409199))

(declare-fun m!409201 () Bool)

(assert (=> start!61430 m!409201))

(declare-fun m!409203 () Bool)

(assert (=> start!61430 m!409203))

(declare-fun m!409205 () Bool)

(assert (=> b!276200 m!409205))

(declare-fun m!409207 () Bool)

(assert (=> b!276204 m!409207))

(declare-fun m!409209 () Bool)

(assert (=> b!276201 m!409209))

(push 1)

(assert (not b!276202))

(assert (not b!276203))

(assert (not b!276201))

(assert (not b!276204))

(assert (not start!61430))

(assert (not b!276200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95094 () Bool)

(declare-datatypes ((tuple2!22520 0))(
  ( (tuple2!22521 (_1!12299 Bool) (_2!12299 BitStream!12500)) )
))
(declare-fun lt!414391 () tuple2!22520)

(declare-fun readBit!0 (BitStream!12500) tuple2!22520)

(assert (=> d!95094 (= lt!414391 (readBit!0 (BitStream!12501 (buf!7311 bs2!19) (currentByte!13513 bs1!11) (currentBit!13508 bs1!11))))))

(assert (=> d!95094 (= (readBitPure!0 (BitStream!12501 (buf!7311 bs2!19) (currentByte!13513 bs1!11) (currentBit!13508 bs1!11))) (tuple2!22517 (_2!12299 lt!414391) (_1!12299 lt!414391)))))

(declare-fun bs!23975 () Bool)

(assert (= bs!23975 d!95094))

(declare-fun m!409215 () Bool)

(assert (=> bs!23975 m!409215))

(assert (=> b!276202 d!95094))

(declare-fun d!95098 () Bool)

(declare-fun lt!414392 () tuple2!22520)

(assert (=> d!95098 (= lt!414392 (readBit!0 bs1!11))))

(assert (=> d!95098 (= (readBitPure!0 bs1!11) (tuple2!22517 (_2!12299 lt!414392) (_1!12299 lt!414392)))))

(declare-fun bs!23976 () Bool)

(assert (= bs!23976 d!95098))

(declare-fun m!409217 () Bool)

(assert (=> bs!23976 m!409217))

(assert (=> b!276202 d!95098))

(declare-fun d!95102 () Bool)

(assert (=> d!95102 (= (invariant!0 (currentBit!13508 bs1!11) (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs2!19))) (and (bvsge (currentBit!13508 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13508 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13513 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs2!19))) (and (= (currentBit!13508 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs2!19)))))))))

(assert (=> b!276202 d!95102))

(declare-fun d!95104 () Bool)

(declare-fun res!229556 () Bool)

(declare-fun e!196214 () Bool)

(assert (=> d!95104 (=> res!229556 e!196214)))

(assert (=> d!95104 (= res!229556 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414383))))

(assert (=> d!95104 (= (arrayBitRangesEq!0 (buf!7311 bs1!11) (buf!7311 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414383) e!196214)))

(declare-fun b!276254 () Bool)

(declare-fun e!196210 () Bool)

(declare-fun e!196213 () Bool)

(assert (=> b!276254 (= e!196210 e!196213)))

(declare-fun c!12620 () Bool)

(declare-datatypes ((tuple4!518 0))(
  ( (tuple4!519 (_1!12300 (_ BitVec 32)) (_2!12300 (_ BitVec 32)) (_3!1039 (_ BitVec 32)) (_4!259 (_ BitVec 32))) )
))
(declare-fun lt!414416 () tuple4!518)

(assert (=> b!276254 (= c!12620 (= (_3!1039 lt!414416) (_4!259 lt!414416)))))

(declare-fun b!276255 () Bool)

(declare-fun e!196211 () Bool)

(assert (=> b!276255 (= e!196213 e!196211)))

(declare-fun lt!414414 () (_ BitVec 32))

(declare-fun res!229555 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276255 (= res!229555 (byteRangesEq!0 (select (arr!7836 (buf!7311 bs1!11)) (_3!1039 lt!414416)) (select (arr!7836 (buf!7311 bs2!19)) (_3!1039 lt!414416)) lt!414414 #b00000000000000000000000000001000))))

(assert (=> b!276255 (=> (not res!229555) (not e!196211))))

(declare-fun b!276256 () Bool)

(declare-fun res!229559 () Bool)

(declare-fun lt!414415 () (_ BitVec 32))

(assert (=> b!276256 (= res!229559 (= lt!414415 #b00000000000000000000000000000000))))

(declare-fun e!196212 () Bool)

(assert (=> b!276256 (=> res!229559 e!196212)))

(assert (=> b!276256 (= e!196211 e!196212)))

(declare-fun b!276257 () Bool)

(assert (=> b!276257 (= e!196214 e!196210)))

(declare-fun res!229557 () Bool)

(assert (=> b!276257 (=> (not res!229557) (not e!196210))))

(declare-fun e!196209 () Bool)

(assert (=> b!276257 (= res!229557 e!196209)))

(declare-fun res!229558 () Bool)

(assert (=> b!276257 (=> res!229558 e!196209)))

(assert (=> b!276257 (= res!229558 (bvsge (_1!12300 lt!414416) (_2!12300 lt!414416)))))

(assert (=> b!276257 (= lt!414415 ((_ extract 31 0) (bvsrem lt!414383 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276257 (= lt!414414 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!518)

(assert (=> b!276257 (= lt!414416 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414383))))

(declare-fun bm!4432 () Bool)

(declare-fun call!4435 () Bool)

(assert (=> bm!4432 (= call!4435 (byteRangesEq!0 (ite c!12620 (select (arr!7836 (buf!7311 bs1!11)) (_3!1039 lt!414416)) (select (arr!7836 (buf!7311 bs1!11)) (_4!259 lt!414416))) (ite c!12620 (select (arr!7836 (buf!7311 bs2!19)) (_3!1039 lt!414416)) (select (arr!7836 (buf!7311 bs2!19)) (_4!259 lt!414416))) (ite c!12620 lt!414414 #b00000000000000000000000000000000) lt!414415))))

(declare-fun b!276258 () Bool)

(assert (=> b!276258 (= e!196212 call!4435)))

(declare-fun b!276259 () Bool)

(assert (=> b!276259 (= e!196213 call!4435)))

(declare-fun b!276260 () Bool)

(declare-fun arrayRangesEq!1152 (array!15800 array!15800 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276260 (= e!196209 (arrayRangesEq!1152 (buf!7311 bs1!11) (buf!7311 bs2!19) (_1!12300 lt!414416) (_2!12300 lt!414416)))))

(assert (= (and d!95104 (not res!229556)) b!276257))

(assert (= (and b!276257 (not res!229558)) b!276260))

(assert (= (and b!276257 res!229557) b!276254))

(assert (= (and b!276254 c!12620) b!276259))

(assert (= (and b!276254 (not c!12620)) b!276255))

(assert (= (and b!276255 res!229555) b!276256))

(assert (= (and b!276256 (not res!229559)) b!276258))

(assert (= (or b!276259 b!276258) bm!4432))

(declare-fun m!409239 () Bool)

(assert (=> b!276255 m!409239))

(declare-fun m!409241 () Bool)

(assert (=> b!276255 m!409241))

(assert (=> b!276255 m!409239))

(assert (=> b!276255 m!409241))

(declare-fun m!409243 () Bool)

(assert (=> b!276255 m!409243))

(declare-fun m!409245 () Bool)

(assert (=> b!276257 m!409245))

(assert (=> bm!4432 m!409239))

(declare-fun m!409247 () Bool)

(assert (=> bm!4432 m!409247))

(declare-fun m!409249 () Bool)

(assert (=> bm!4432 m!409249))

(assert (=> bm!4432 m!409241))

(declare-fun m!409251 () Bool)

(assert (=> bm!4432 m!409251))

(declare-fun m!409253 () Bool)

(assert (=> b!276260 m!409253))

(assert (=> b!276203 d!95104))

(declare-fun d!95112 () Bool)

(declare-fun e!196226 () Bool)

(assert (=> d!95112 e!196226))

(declare-fun res!229575 () Bool)

(assert (=> d!95112 (=> (not res!229575) (not e!196226))))

(declare-fun lt!414450 () (_ BitVec 64))

(declare-fun lt!414453 () (_ BitVec 64))

(declare-fun lt!414451 () (_ BitVec 64))

(assert (=> d!95112 (= res!229575 (= lt!414450 (bvsub lt!414453 lt!414451)))))

(assert (=> d!95112 (or (= (bvand lt!414453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414453 lt!414451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95112 (= lt!414451 (remainingBits!0 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))) ((_ sign_extend 32) (currentByte!13513 bs1!11)) ((_ sign_extend 32) (currentBit!13508 bs1!11))))))

(declare-fun lt!414454 () (_ BitVec 64))

(declare-fun lt!414452 () (_ BitVec 64))

(assert (=> d!95112 (= lt!414453 (bvmul lt!414454 lt!414452))))

(assert (=> d!95112 (or (= lt!414454 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414452 (bvsdiv (bvmul lt!414454 lt!414452) lt!414454)))))

(assert (=> d!95112 (= lt!414452 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95112 (= lt!414454 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))))))

(assert (=> d!95112 (= lt!414450 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13513 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13508 bs1!11))))))

(assert (=> d!95112 (invariant!0 (currentBit!13508 bs1!11) (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs1!11)))))

(assert (=> d!95112 (= (bitIndex!0 (size!6843 (buf!7311 bs1!11)) (currentByte!13513 bs1!11) (currentBit!13508 bs1!11)) lt!414450)))

(declare-fun b!276278 () Bool)

(declare-fun res!229576 () Bool)

(assert (=> b!276278 (=> (not res!229576) (not e!196226))))

(assert (=> b!276278 (= res!229576 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414450))))

(declare-fun b!276279 () Bool)

(declare-fun lt!414455 () (_ BitVec 64))

(assert (=> b!276279 (= e!196226 (bvsle lt!414450 (bvmul lt!414455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276279 (or (= lt!414455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414455)))))

(assert (=> b!276279 (= lt!414455 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))))))

(assert (= (and d!95112 res!229575) b!276278))

(assert (= (and b!276278 res!229576) b!276279))

(declare-fun m!409277 () Bool)

(assert (=> d!95112 m!409277))

(declare-fun m!409279 () Bool)

(assert (=> d!95112 m!409279))

(assert (=> b!276203 d!95112))

(declare-fun d!95124 () Bool)

(assert (=> d!95124 (= (array_inv!6567 (buf!7311 bs2!19)) (bvsge (size!6843 (buf!7311 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276204 d!95124))

(declare-fun d!95126 () Bool)

(assert (=> d!95126 (= (inv!12 bs1!11) (invariant!0 (currentBit!13508 bs1!11) (currentByte!13513 bs1!11) (size!6843 (buf!7311 bs1!11))))))

(declare-fun bs!23982 () Bool)

(assert (= bs!23982 d!95126))

(assert (=> bs!23982 m!409279))

(assert (=> start!61430 d!95126))

(declare-fun d!95128 () Bool)

(assert (=> d!95128 (= (inv!12 bs2!19) (invariant!0 (currentBit!13508 bs2!19) (currentByte!13513 bs2!19) (size!6843 (buf!7311 bs2!19))))))

(declare-fun bs!23983 () Bool)

(assert (= bs!23983 d!95128))

(declare-fun m!409281 () Bool)

(assert (=> bs!23983 m!409281))

(assert (=> start!61430 d!95128))

(declare-fun d!95130 () Bool)

(assert (=> d!95130 (= (array_inv!6567 (buf!7311 bs1!11)) (bvsge (size!6843 (buf!7311 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276200 d!95130))

(declare-fun d!95132 () Bool)

(assert (=> d!95132 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))) ((_ sign_extend 32) (currentByte!13513 bs1!11)) ((_ sign_extend 32) (currentBit!13508 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6843 (buf!7311 bs1!11))) ((_ sign_extend 32) (currentByte!13513 bs1!11)) ((_ sign_extend 32) (currentBit!13508 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23984 () Bool)

(assert (= bs!23984 d!95132))

(assert (=> bs!23984 m!409277))

(assert (=> b!276201 d!95132))

(push 1)

(assert (not d!95128))

(assert (not d!95112))

(assert (not b!276257))

(assert (not d!95126))

(assert (not b!276260))

(assert (not d!95098))

(assert (not d!95094))

(assert (not bm!4432))

(assert (not b!276255))

(assert (not d!95132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

