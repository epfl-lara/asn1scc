; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71162 () Bool)

(assert start!71162)

(declare-fun b!321137 () Bool)

(declare-fun res!263755 () Bool)

(declare-fun e!231228 () Bool)

(assert (=> b!321137 (=> (not res!263755) (not e!231228))))

(declare-datatypes ((array!20308 0))(
  ( (array!20309 (arr!9942 (Array (_ BitVec 32) (_ BitVec 8))) (size!8850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13862 0))(
  ( (BitStream!13863 (buf!7992 array!20308) (currentByte!14745 (_ BitVec 32)) (currentBit!14740 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13862)

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((tuple2!23482 0))(
  ( (tuple2!23483 (_1!13370 (_ BitVec 64)) (_2!13370 BitStream!13862)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23482)

(assert (=> b!321137 (= res!263755 (= (buf!7992 (_2!13370 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7992 thiss!1780)))))

(declare-fun res!263753 () Bool)

(assert (=> start!71162 (=> (not res!263753) (not e!231228))))

(assert (=> start!71162 (= res!263753 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71162 e!231228))

(assert (=> start!71162 true))

(declare-fun e!231227 () Bool)

(declare-fun inv!12 (BitStream!13862) Bool)

(assert (=> start!71162 (and (inv!12 thiss!1780) e!231227)))

(declare-fun b!321136 () Bool)

(declare-fun res!263754 () Bool)

(assert (=> b!321136 (=> (not res!263754) (not e!231228))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321136 (= res!263754 (validate_offset_bits!1 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))) ((_ sign_extend 32) (currentByte!14745 thiss!1780)) ((_ sign_extend 32) (currentBit!14740 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321138 () Bool)

(declare-fun lt!444400 () (_ BitVec 64))

(declare-fun lt!444401 () (_ BitVec 64))

(assert (=> b!321138 (= e!231228 (and (= lt!444400 (bvand ((_ sign_extend 32) nBits!542) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!444400 (bvand (bvadd lt!444401 ((_ sign_extend 32) nBits!542)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!321138 (= lt!444400 (bvand lt!444401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321138 (= lt!444401 (bitIndex!0 (size!8850 (buf!7992 thiss!1780)) (currentByte!14745 thiss!1780) (currentBit!14740 thiss!1780)))))

(declare-fun b!321139 () Bool)

(declare-fun array_inv!8402 (array!20308) Bool)

(assert (=> b!321139 (= e!231227 (array_inv!8402 (buf!7992 thiss!1780)))))

(assert (= (and start!71162 res!263753) b!321136))

(assert (= (and b!321136 res!263754) b!321137))

(assert (= (and b!321137 res!263755) b!321138))

(assert (= start!71162 b!321139))

(declare-fun m!459473 () Bool)

(assert (=> start!71162 m!459473))

(declare-fun m!459475 () Bool)

(assert (=> b!321137 m!459475))

(declare-fun m!459477 () Bool)

(assert (=> b!321136 m!459477))

(declare-fun m!459479 () Bool)

(assert (=> b!321139 m!459479))

(declare-fun m!459481 () Bool)

(assert (=> b!321138 m!459481))

(push 1)

(assert (not b!321137))

(assert (not b!321138))

(assert (not start!71162))

(assert (not b!321136))

(assert (not b!321139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105194 () Bool)

(assert (=> d!105194 (= (array_inv!8402 (buf!7992 thiss!1780)) (bvsge (size!8850 (buf!7992 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321139 d!105194))

(declare-fun d!105196 () Bool)

(declare-fun e!231234 () Bool)

(assert (=> d!105196 e!231234))

(declare-fun res!263767 () Bool)

(assert (=> d!105196 (=> (not res!263767) (not e!231234))))

(declare-fun lt!444437 () (_ BitVec 64))

(declare-fun lt!444435 () (_ BitVec 64))

(declare-fun lt!444434 () (_ BitVec 64))

(assert (=> d!105196 (= res!263767 (= lt!444434 (bvsub lt!444435 lt!444437)))))

(assert (=> d!105196 (or (= (bvand lt!444435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444435 lt!444437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105196 (= lt!444437 (remainingBits!0 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))) ((_ sign_extend 32) (currentByte!14745 thiss!1780)) ((_ sign_extend 32) (currentBit!14740 thiss!1780))))))

(declare-fun lt!444436 () (_ BitVec 64))

(declare-fun lt!444432 () (_ BitVec 64))

(assert (=> d!105196 (= lt!444435 (bvmul lt!444436 lt!444432))))

(assert (=> d!105196 (or (= lt!444436 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444432 (bvsdiv (bvmul lt!444436 lt!444432) lt!444436)))))

(assert (=> d!105196 (= lt!444432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105196 (= lt!444436 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))))))

(assert (=> d!105196 (= lt!444434 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14745 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14740 thiss!1780))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105196 (invariant!0 (currentBit!14740 thiss!1780) (currentByte!14745 thiss!1780) (size!8850 (buf!7992 thiss!1780)))))

(assert (=> d!105196 (= (bitIndex!0 (size!8850 (buf!7992 thiss!1780)) (currentByte!14745 thiss!1780) (currentBit!14740 thiss!1780)) lt!444434)))

(declare-fun b!321150 () Bool)

(declare-fun res!263766 () Bool)

(assert (=> b!321150 (=> (not res!263766) (not e!231234))))

(assert (=> b!321150 (= res!263766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444434))))

(declare-fun b!321151 () Bool)

(declare-fun lt!444433 () (_ BitVec 64))

(assert (=> b!321151 (= e!231234 (bvsle lt!444434 (bvmul lt!444433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321151 (or (= lt!444433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444433)))))

(assert (=> b!321151 (= lt!444433 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))))))

(assert (= (and d!105196 res!263767) b!321150))

(assert (= (and b!321150 res!263766) b!321151))

(declare-fun m!459487 () Bool)

(assert (=> d!105196 m!459487))

(declare-fun m!459489 () Bool)

(assert (=> d!105196 m!459489))

(assert (=> b!321138 d!105196))

(declare-fun b!321214 () Bool)

(declare-fun e!231263 () Bool)

(declare-fun e!231262 () Bool)

(assert (=> b!321214 (= e!231263 e!231262)))

(declare-fun res!263815 () Bool)

(assert (=> b!321214 (=> res!263815 e!231262)))

(assert (=> b!321214 (= res!263815 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321215 () Bool)

(declare-fun e!231264 () tuple2!23482)

(declare-fun lt!444508 () tuple2!23482)

(assert (=> b!321215 (= e!231264 (tuple2!23483 (_1!13370 lt!444508) (_2!13370 lt!444508)))))

(declare-datatypes ((tuple2!23492 0))(
  ( (tuple2!23493 (_1!13375 Bool) (_2!13375 BitStream!13862)) )
))
(declare-fun lt!444506 () tuple2!23492)

(declare-fun readBit!0 (BitStream!13862) tuple2!23492)

(assert (=> b!321215 (= lt!444506 (readBit!0 thiss!1780))))

(assert (=> b!321215 (= lt!444508 (readNBitsLSBFirstsLoop!0 (_2!13375 lt!444506) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13375 lt!444506) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105200 () Bool)

(assert (=> d!105200 e!231263))

(declare-fun res!263814 () Bool)

(assert (=> d!105200 (=> (not res!263814) (not e!231263))))

(declare-fun lt!444504 () tuple2!23482)

(assert (=> d!105200 (= res!263814 (= (buf!7992 (_2!13370 lt!444504)) (buf!7992 thiss!1780)))))

(assert (=> d!105200 (= lt!444504 e!231264)))

(declare-fun c!15403 () Bool)

(assert (=> d!105200 (= c!15403 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105200 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105200 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444504)))

(declare-fun b!321216 () Bool)

(assert (=> b!321216 (= e!231264 (tuple2!23483 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321217 () Bool)

(declare-fun res!263816 () Bool)

(assert (=> b!321217 (=> (not res!263816) (not e!231263))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321217 (= res!263816 (= (bvand (_1!13370 lt!444504) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!444507 () (_ BitVec 64))

(declare-fun b!321218 () Bool)

(declare-datatypes ((tuple2!23494 0))(
  ( (tuple2!23495 (_1!13376 BitStream!13862) (_2!13376 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13862) tuple2!23494)

(assert (=> b!321218 (= e!231262 (= (= (bvand (bvlshr (_1!13370 lt!444504) lt!444507) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13376 (readBitPure!0 thiss!1780))))))

(assert (=> b!321218 (and (bvsge lt!444507 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444507 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321218 (= lt!444507 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321219 () Bool)

(declare-fun res!263817 () Bool)

(assert (=> b!321219 (=> (not res!263817) (not e!231263))))

(assert (=> b!321219 (= res!263817 (= (bvand (_1!13370 lt!444504) (onesLSBLong!0 nBits!542)) (_1!13370 lt!444504)))))

(declare-fun b!321220 () Bool)

(declare-fun res!263818 () Bool)

(assert (=> b!321220 (=> (not res!263818) (not e!231263))))

(declare-fun lt!444509 () (_ BitVec 64))

(declare-fun lt!444505 () (_ BitVec 64))

(assert (=> b!321220 (= res!263818 (= (bitIndex!0 (size!8850 (buf!7992 (_2!13370 lt!444504))) (currentByte!14745 (_2!13370 lt!444504)) (currentBit!14740 (_2!13370 lt!444504))) (bvadd lt!444509 lt!444505)))))

(assert (=> b!321220 (or (not (= (bvand lt!444509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444505 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444509 lt!444505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321220 (= lt!444505 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321220 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321220 (= lt!444509 (bitIndex!0 (size!8850 (buf!7992 thiss!1780)) (currentByte!14745 thiss!1780) (currentBit!14740 thiss!1780)))))

(assert (= (and d!105200 c!15403) b!321216))

(assert (= (and d!105200 (not c!15403)) b!321215))

(assert (= (and d!105200 res!263814) b!321220))

(assert (= (and b!321220 res!263818) b!321217))

(assert (= (and b!321217 res!263816) b!321219))

(assert (= (and b!321219 res!263817) b!321214))

(assert (= (and b!321214 (not res!263815)) b!321218))

(declare-fun m!459519 () Bool)

(assert (=> b!321220 m!459519))

(assert (=> b!321220 m!459481))

(declare-fun m!459521 () Bool)

(assert (=> b!321218 m!459521))

(declare-fun m!459523 () Bool)

(assert (=> b!321217 m!459523))

(declare-fun m!459525 () Bool)

(assert (=> b!321215 m!459525))

(declare-fun m!459527 () Bool)

(assert (=> b!321215 m!459527))

(declare-fun m!459529 () Bool)

(assert (=> b!321219 m!459529))

(assert (=> b!321137 d!105200))

(declare-fun d!105210 () Bool)

(assert (=> d!105210 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14740 thiss!1780) (currentByte!14745 thiss!1780) (size!8850 (buf!7992 thiss!1780))))))

(declare-fun bs!27664 () Bool)

(assert (= bs!27664 d!105210))

(assert (=> bs!27664 m!459489))

(assert (=> start!71162 d!105210))

(declare-fun d!105212 () Bool)

(assert (=> d!105212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))) ((_ sign_extend 32) (currentByte!14745 thiss!1780)) ((_ sign_extend 32) (currentBit!14740 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8850 (buf!7992 thiss!1780))) ((_ sign_extend 32) (currentByte!14745 thiss!1780)) ((_ sign_extend 32) (currentBit!14740 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27665 () Bool)

(assert (= bs!27665 d!105212))

(assert (=> bs!27665 m!459487))

(assert (=> b!321136 d!105212))

(push 1)

(assert (not b!321217))

(assert (not d!105210))

(assert (not d!105212))

(assert (not b!321219))

(assert (not b!321220))

(assert (not b!321215))

(assert (not d!105196))

(assert (not b!321218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

