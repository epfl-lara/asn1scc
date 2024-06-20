; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30248 () Bool)

(assert start!30248)

(declare-fun b!155067 () Bool)

(declare-fun e!104372 () Bool)

(declare-datatypes ((array!7035 0))(
  ( (array!7036 (arr!3988 (Array (_ BitVec 32) (_ BitVec 8))) (size!3165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5588 0))(
  ( (BitStream!5589 (buf!3668 array!7035) (currentByte!6702 (_ BitVec 32)) (currentBit!6697 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5588)

(declare-fun array_inv!2954 (array!7035) Bool)

(assert (=> b!155067 (= e!104372 (array_inv!2954 (buf!3668 bs1!10)))))

(declare-fun b!155068 () Bool)

(declare-fun e!104368 () Bool)

(declare-fun e!104370 () Bool)

(assert (=> b!155068 (= e!104368 e!104370)))

(declare-fun res!129715 () Bool)

(assert (=> b!155068 (=> (not res!129715) (not e!104370))))

(declare-fun lt!241439 () (_ BitVec 64))

(assert (=> b!155068 (= res!129715 (bvsle lt!241439 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3165 (buf!3668 bs1!10))))))))

(declare-fun lt!241438 () (_ BitVec 64))

(assert (=> b!155068 (= lt!241439 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241438))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155068 (= lt!241438 (bitIndex!0 (size!3165 (buf!3668 bs1!10)) (currentByte!6702 bs1!10) (currentBit!6697 bs1!10)))))

(declare-fun b!155069 () Bool)

(declare-fun e!104373 () Bool)

(declare-fun bs2!18 () BitStream!5588)

(assert (=> b!155069 (= e!104373 (array_inv!2954 (buf!3668 bs2!18)))))

(declare-fun b!155070 () Bool)

(declare-fun lt!241441 () (_ BitVec 32))

(assert (=> b!155070 (= e!104370 (and (bvsle #b00000000000000000000000000000000 lt!241441) (bvsle lt!241441 (size!3165 (buf!3668 bs1!10))) (or (bvsgt #b00000000000000000000000000000000 (currentByte!6702 bs1!10)) (bvsge (currentByte!6702 bs1!10) lt!241441))))))

(assert (=> b!155070 (= lt!241441 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241438 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13736 0))(
  ( (tuple2!13737 (_1!7279 BitStream!5588) (_2!7279 (_ BitVec 8))) )
))
(declare-fun lt!241440 () tuple2!13736)

(declare-fun readBytePure!0 (BitStream!5588) tuple2!13736)

(assert (=> b!155070 (= lt!241440 (readBytePure!0 (BitStream!5589 (buf!3668 bs2!18) (currentByte!6702 bs1!10) (currentBit!6697 bs1!10))))))

(declare-fun lt!241437 () tuple2!13736)

(assert (=> b!155070 (= lt!241437 (readBytePure!0 bs1!10))))

(declare-fun b!155071 () Bool)

(declare-fun res!129714 () Bool)

(assert (=> b!155071 (=> (not res!129714) (not e!104370))))

(assert (=> b!155071 (= res!129714 (bvsle lt!241439 (bitIndex!0 (size!3165 (buf!3668 bs2!18)) (currentByte!6702 bs2!18) (currentBit!6697 bs2!18))))))

(declare-fun res!129716 () Bool)

(assert (=> start!30248 (=> (not res!129716) (not e!104368))))

(assert (=> start!30248 (= res!129716 (= (size!3165 (buf!3668 bs1!10)) (size!3165 (buf!3668 bs2!18))))))

(assert (=> start!30248 e!104368))

(declare-fun inv!12 (BitStream!5588) Bool)

(assert (=> start!30248 (and (inv!12 bs1!10) e!104372)))

(assert (=> start!30248 (and (inv!12 bs2!18) e!104373)))

(declare-fun b!155072 () Bool)

(declare-fun res!129717 () Bool)

(assert (=> b!155072 (=> (not res!129717) (not e!104370))))

(declare-fun arrayBitRangesEq!0 (array!7035 array!7035 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155072 (= res!129717 (arrayBitRangesEq!0 (buf!3668 bs1!10) (buf!3668 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241439))))

(assert (= (and start!30248 res!129716) b!155068))

(assert (= (and b!155068 res!129715) b!155071))

(assert (= (and b!155071 res!129714) b!155072))

(assert (= (and b!155072 res!129717) b!155070))

(assert (= start!30248 b!155067))

(assert (= start!30248 b!155069))

(declare-fun m!241021 () Bool)

(assert (=> start!30248 m!241021))

(declare-fun m!241023 () Bool)

(assert (=> start!30248 m!241023))

(declare-fun m!241025 () Bool)

(assert (=> b!155071 m!241025))

(declare-fun m!241027 () Bool)

(assert (=> b!155069 m!241027))

(declare-fun m!241029 () Bool)

(assert (=> b!155068 m!241029))

(declare-fun m!241031 () Bool)

(assert (=> b!155070 m!241031))

(declare-fun m!241033 () Bool)

(assert (=> b!155070 m!241033))

(declare-fun m!241035 () Bool)

(assert (=> b!155072 m!241035))

(declare-fun m!241037 () Bool)

(assert (=> b!155067 m!241037))

(push 1)

(assert (not b!155072))

(assert (not b!155067))

(assert (not b!155071))

(assert (not b!155068))

(assert (not b!155069))

(assert (not start!30248))

(assert (not b!155070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51128 () Bool)

(declare-fun e!104380 () Bool)

(assert (=> d!51128 e!104380))

(declare-fun res!129730 () Bool)

(assert (=> d!51128 (=> (not res!129730) (not e!104380))))

(declare-fun lt!241486 () (_ BitVec 64))

(declare-fun lt!241483 () (_ BitVec 64))

(declare-fun lt!241482 () (_ BitVec 64))

(assert (=> d!51128 (= res!129730 (= lt!241482 (bvsub lt!241486 lt!241483)))))

(assert (=> d!51128 (or (= (bvand lt!241486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241486 lt!241483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51128 (= lt!241483 (remainingBits!0 ((_ sign_extend 32) (size!3165 (buf!3668 bs1!10))) ((_ sign_extend 32) (currentByte!6702 bs1!10)) ((_ sign_extend 32) (currentBit!6697 bs1!10))))))

(declare-fun lt!241485 () (_ BitVec 64))

(declare-fun lt!241487 () (_ BitVec 64))

(assert (=> d!51128 (= lt!241486 (bvmul lt!241485 lt!241487))))

(assert (=> d!51128 (or (= lt!241485 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241487 (bvsdiv (bvmul lt!241485 lt!241487) lt!241485)))))

(assert (=> d!51128 (= lt!241487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51128 (= lt!241485 ((_ sign_extend 32) (size!3165 (buf!3668 bs1!10))))))

(assert (=> d!51128 (= lt!241482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6702 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6697 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51128 (invariant!0 (currentBit!6697 bs1!10) (currentByte!6702 bs1!10) (size!3165 (buf!3668 bs1!10)))))

(assert (=> d!51128 (= (bitIndex!0 (size!3165 (buf!3668 bs1!10)) (currentByte!6702 bs1!10) (currentBit!6697 bs1!10)) lt!241482)))

(declare-fun b!155085 () Bool)

(declare-fun res!129731 () Bool)

(assert (=> b!155085 (=> (not res!129731) (not e!104380))))

(assert (=> b!155085 (= res!129731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241482))))

(declare-fun b!155086 () Bool)

(declare-fun lt!241484 () (_ BitVec 64))

(assert (=> b!155086 (= e!104380 (bvsle lt!241482 (bvmul lt!241484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155086 (or (= lt!241484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241484)))))

(assert (=> b!155086 (= lt!241484 ((_ sign_extend 32) (size!3165 (buf!3668 bs1!10))))))

(assert (= (and d!51128 res!129730) b!155085))

(assert (= (and b!155085 res!129731) b!155086))

(declare-fun m!241055 () Bool)

(assert (=> d!51128 m!241055))

(declare-fun m!241057 () Bool)

(assert (=> d!51128 m!241057))

(assert (=> b!155068 d!51128))

(declare-fun d!51146 () Bool)

(assert (=> d!51146 (= (inv!12 bs1!10) (invariant!0 (currentBit!6697 bs1!10) (currentByte!6702 bs1!10) (size!3165 (buf!3668 bs1!10))))))

(declare-fun bs!12521 () Bool)

(assert (= bs!12521 d!51146))

(assert (=> bs!12521 m!241057))

(assert (=> start!30248 d!51146))

(declare-fun d!51148 () Bool)

(assert (=> d!51148 (= (inv!12 bs2!18) (invariant!0 (currentBit!6697 bs2!18) (currentByte!6702 bs2!18) (size!3165 (buf!3668 bs2!18))))))

(declare-fun bs!12522 () Bool)

(assert (= bs!12522 d!51148))

(declare-fun m!241059 () Bool)

(assert (=> bs!12522 m!241059))

(assert (=> start!30248 d!51148))

(declare-fun d!51150 () Bool)

(assert (=> d!51150 (= (array_inv!2954 (buf!3668 bs1!10)) (bvsge (size!3165 (buf!3668 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155067 d!51150))

(declare-fun d!51152 () Bool)

(declare-fun res!129776 () Bool)

(declare-fun e!104431 () Bool)

(assert (=> d!51152 (=> res!129776 e!104431)))

(assert (=> d!51152 (= res!129776 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241439))))

(assert (=> d!51152 (= (arrayBitRangesEq!0 (buf!3668 bs1!10) (buf!3668 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241439) e!104431)))

(declare-fun b!155143 () Bool)

(declare-fun e!104434 () Bool)

(declare-fun e!104433 () Bool)

(assert (=> b!155143 (= e!104434 e!104433)))

(declare-fun lt!241518 () (_ BitVec 32))

(declare-datatypes ((tuple4!220 0))(
  ( (tuple4!221 (_1!7283 (_ BitVec 32)) (_2!7283 (_ BitVec 32)) (_3!413 (_ BitVec 32)) (_4!110 (_ BitVec 32))) )
))
(declare-fun lt!241516 () tuple4!220)

(declare-fun res!129772 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155143 (= res!129772 (byteRangesEq!0 (select (arr!3988 (buf!3668 bs1!10)) (_3!413 lt!241516)) (select (arr!3988 (buf!3668 bs2!18)) (_3!413 lt!241516)) lt!241518 #b00000000000000000000000000001000))))

(assert (=> b!155143 (=> (not res!129772) (not e!104433))))

(declare-fun bm!2237 () Bool)

(declare-fun call!2240 () Bool)

(declare-fun c!8256 () Bool)

(declare-fun lt!241517 () (_ BitVec 32))

(assert (=> bm!2237 (= call!2240 (byteRangesEq!0 (ite c!8256 (select (arr!3988 (buf!3668 bs1!10)) (_3!413 lt!241516)) (select (arr!3988 (buf!3668 bs1!10)) (_4!110 lt!241516))) (ite c!8256 (select (arr!3988 (buf!3668 bs2!18)) (_3!413 lt!241516)) (select (arr!3988 (buf!3668 bs2!18)) (_4!110 lt!241516))) (ite c!8256 lt!241518 #b00000000000000000000000000000000) lt!241517))))

(declare-fun b!155144 () Bool)

(declare-fun e!104430 () Bool)

(assert (=> b!155144 (= e!104431 e!104430)))

(declare-fun res!129775 () Bool)

(assert (=> b!155144 (=> (not res!129775) (not e!104430))))

(declare-fun e!104429 () Bool)

(assert (=> b!155144 (= res!129775 e!104429)))

(declare-fun res!129773 () Bool)

(assert (=> b!155144 (=> res!129773 e!104429)))

(assert (=> b!155144 (= res!129773 (bvsge (_1!7283 lt!241516) (_2!7283 lt!241516)))))

(assert (=> b!155144 (= lt!241517 ((_ extract 31 0) (bvsrem lt!241439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155144 (= lt!241518 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!220)

(assert (=> b!155144 (= lt!241516 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241439))))

(declare-fun b!155145 () Bool)

(assert (=> b!155145 (= e!104434 call!2240)))

(declare-fun b!155146 () Bool)

(declare-fun e!104432 () Bool)

(assert (=> b!155146 (= e!104432 call!2240)))

(declare-fun b!155147 () Bool)

(declare-fun res!129774 () Bool)

(assert (=> b!155147 (= res!129774 (= lt!241517 #b00000000000000000000000000000000))))

(assert (=> b!155147 (=> res!129774 e!104432)))

(assert (=> b!155147 (= e!104433 e!104432)))

(declare-fun b!155148 () Bool)

(assert (=> b!155148 (= e!104430 e!104434)))

(assert (=> b!155148 (= c!8256 (= (_3!413 lt!241516) (_4!110 lt!241516)))))

(declare-fun b!155149 () Bool)

(declare-fun arrayRangesEq!403 (array!7035 array!7035 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155149 (= e!104429 (arrayRangesEq!403 (buf!3668 bs1!10) (buf!3668 bs2!18) (_1!7283 lt!241516) (_2!7283 lt!241516)))))

(assert (= (and d!51152 (not res!129776)) b!155144))

(assert (= (and b!155144 (not res!129773)) b!155149))

(assert (= (and b!155144 res!129775) b!155148))

(assert (= (and b!155148 c!8256) b!155145))

(assert (= (and b!155148 (not c!8256)) b!155143))

(assert (= (and b!155143 res!129772) b!155147))

(assert (= (and b!155147 (not res!129774)) b!155146))

(assert (= (or b!155145 b!155146) bm!2237))

(declare-fun m!241097 () Bool)

(assert (=> b!155143 m!241097))

(declare-fun m!241099 () Bool)

(assert (=> b!155143 m!241099))

(assert (=> b!155143 m!241097))

(assert (=> b!155143 m!241099))

(declare-fun m!241101 () Bool)

(assert (=> b!155143 m!241101))

(declare-fun m!241103 () Bool)

(assert (=> bm!2237 m!241103))

(declare-fun m!241105 () Bool)

(assert (=> bm!2237 m!241105))

(assert (=> bm!2237 m!241099))

(declare-fun m!241107 () Bool)

(assert (=> bm!2237 m!241107))

(assert (=> bm!2237 m!241097))

(declare-fun m!241109 () Bool)

(assert (=> b!155144 m!241109))

(declare-fun m!241111 () Bool)

(assert (=> b!155149 m!241111))

(assert (=> b!155072 d!51152))

(declare-fun d!51160 () Bool)

(declare-fun e!104435 () Bool)

(assert (=> d!51160 e!104435))

(declare-fun res!129777 () Bool)

(assert (=> d!51160 (=> (not res!129777) (not e!104435))))

(declare-fun lt!241519 () (_ BitVec 64))

(declare-fun lt!241523 () (_ BitVec 64))

(declare-fun lt!241520 () (_ BitVec 64))

(assert (=> d!51160 (= res!129777 (= lt!241519 (bvsub lt!241523 lt!241520)))))

(assert (=> d!51160 (or (= (bvand lt!241523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241523 lt!241520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51160 (= lt!241520 (remainingBits!0 ((_ sign_extend 32) (size!3165 (buf!3668 bs2!18))) ((_ sign_extend 32) (currentByte!6702 bs2!18)) ((_ sign_extend 32) (currentBit!6697 bs2!18))))))

(declare-fun lt!241522 () (_ BitVec 64))

(declare-fun lt!241524 () (_ BitVec 64))

(assert (=> d!51160 (= lt!241523 (bvmul lt!241522 lt!241524))))

(assert (=> d!51160 (or (= lt!241522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241524 (bvsdiv (bvmul lt!241522 lt!241524) lt!241522)))))

(assert (=> d!51160 (= lt!241524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51160 (= lt!241522 ((_ sign_extend 32) (size!3165 (buf!3668 bs2!18))))))

(assert (=> d!51160 (= lt!241519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6702 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6697 bs2!18))))))

(assert (=> d!51160 (invariant!0 (currentBit!6697 bs2!18) (currentByte!6702 bs2!18) (size!3165 (buf!3668 bs2!18)))))

(assert (=> d!51160 (= (bitIndex!0 (size!3165 (buf!3668 bs2!18)) (currentByte!6702 bs2!18) (currentBit!6697 bs2!18)) lt!241519)))

(declare-fun b!155150 () Bool)

(declare-fun res!129778 () Bool)

(assert (=> b!155150 (=> (not res!129778) (not e!104435))))

(assert (=> b!155150 (= res!129778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241519))))

(declare-fun b!155151 () Bool)

(declare-fun lt!241521 () (_ BitVec 64))

(assert (=> b!155151 (= e!104435 (bvsle lt!241519 (bvmul lt!241521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155151 (or (= lt!241521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241521)))))

(assert (=> b!155151 (= lt!241521 ((_ sign_extend 32) (size!3165 (buf!3668 bs2!18))))))

(assert (= (and d!51160 res!129777) b!155150))

(assert (= (and b!155150 res!129778) b!155151))

(declare-fun m!241113 () Bool)

(assert (=> d!51160 m!241113))

(assert (=> d!51160 m!241059))

(assert (=> b!155071 d!51160))

(declare-fun d!51162 () Bool)

(declare-datatypes ((tuple2!13742 0))(
  ( (tuple2!13743 (_1!7285 (_ BitVec 8)) (_2!7285 BitStream!5588)) )
))
(declare-fun lt!241545 () tuple2!13742)

(declare-fun readByte!0 (BitStream!5588) tuple2!13742)

(assert (=> d!51162 (= lt!241545 (readByte!0 (BitStream!5589 (buf!3668 bs2!18) (currentByte!6702 bs1!10) (currentBit!6697 bs1!10))))))

(assert (=> d!51162 (= (readBytePure!0 (BitStream!5589 (buf!3668 bs2!18) (currentByte!6702 bs1!10) (currentBit!6697 bs1!10))) (tuple2!13737 (_2!7285 lt!241545) (_1!7285 lt!241545)))))

(declare-fun bs!12525 () Bool)

(assert (= bs!12525 d!51162))

(declare-fun m!241115 () Bool)

(assert (=> bs!12525 m!241115))

(assert (=> b!155070 d!51162))

(declare-fun d!51164 () Bool)

(declare-fun lt!241546 () tuple2!13742)

(assert (=> d!51164 (= lt!241546 (readByte!0 bs1!10))))

(assert (=> d!51164 (= (readBytePure!0 bs1!10) (tuple2!13737 (_2!7285 lt!241546) (_1!7285 lt!241546)))))

(declare-fun bs!12526 () Bool)

(assert (= bs!12526 d!51164))

(declare-fun m!241117 () Bool)

(assert (=> bs!12526 m!241117))

(assert (=> b!155070 d!51164))

(declare-fun d!51166 () Bool)

(assert (=> d!51166 (= (array_inv!2954 (buf!3668 bs2!18)) (bvsge (size!3165 (buf!3668 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155069 d!51166))

(push 1)

(assert (not d!51162))

(assert (not b!155143))

(assert (not bm!2237))

(assert (not b!155144))

(assert (not d!51146))

(assert (not d!51164))

(assert (not d!51148))

(assert (not d!51128))

(assert (not d!51160))

(assert (not b!155149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

