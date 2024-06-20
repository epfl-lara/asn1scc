; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49824 () Bool)

(assert start!49824)

(declare-fun b!234720 () Bool)

(declare-fun res!196299 () Bool)

(declare-fun e!162248 () Bool)

(assert (=> b!234720 (=> (not res!196299) (not e!162248))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234720 (= res!196299 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234721 () Bool)

(declare-fun res!196298 () Bool)

(assert (=> b!234721 (=> (not res!196298) (not e!162248))))

(declare-datatypes ((array!12318 0))(
  ( (array!12319 (arr!6399 (Array (_ BitVec 32) (_ BitVec 8))) (size!5412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9788 0))(
  ( (BitStream!9789 (buf!5887 array!12318) (currentByte!10960 (_ BitVec 32)) (currentBit!10955 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9788)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234721 (= res!196298 (validate_offset_bits!1 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun lt!370342 () BitStream!9788)

(declare-fun b!234722 () Bool)

(declare-fun e!162246 () Bool)

(assert (=> b!234722 (= e!162246 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370342))) ((_ sign_extend 32) (currentByte!10960 lt!370342)) ((_ sign_extend 32) (currentBit!10955 lt!370342)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))))

(declare-fun b!234723 () Bool)

(assert (=> b!234723 (= e!162248 e!162246)))

(declare-fun res!196295 () Bool)

(assert (=> b!234723 (=> (not res!196295) (not e!162246))))

(assert (=> b!234723 (= res!196295 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun withMovedBitIndex!0 (BitStream!9788 (_ BitVec 64)) BitStream!9788)

(assert (=> b!234723 (= lt!370342 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19738 0))(
  ( (tuple2!19739 (_1!10773 BitStream!9788) (_2!10773 Bool)) )
))
(declare-fun lt!370343 () tuple2!19738)

(declare-fun readBitPure!0 (BitStream!9788) tuple2!19738)

(assert (=> b!234723 (= lt!370343 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19740 0))(
  ( (tuple2!19741 (_1!10774 BitStream!9788) (_2!10774 (_ BitVec 64))) )
))
(declare-fun lt!370344 () tuple2!19740)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19740)

(assert (=> b!234723 (= lt!370344 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196296 () Bool)

(assert (=> start!49824 (=> (not res!196296) (not e!162248))))

(assert (=> start!49824 (= res!196296 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49824 e!162248))

(assert (=> start!49824 true))

(declare-fun e!162245 () Bool)

(declare-fun inv!12 (BitStream!9788) Bool)

(assert (=> start!49824 (and (inv!12 bs!63) e!162245)))

(declare-fun b!234724 () Bool)

(declare-fun res!196297 () Bool)

(assert (=> b!234724 (=> (not res!196297) (not e!162248))))

(assert (=> b!234724 (= res!196297 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234725 () Bool)

(declare-fun array_inv!5153 (array!12318) Bool)

(assert (=> b!234725 (= e!162245 (array_inv!5153 (buf!5887 bs!63)))))

(assert (= (and start!49824 res!196296) b!234721))

(assert (= (and b!234721 res!196298) b!234720))

(assert (= (and b!234720 res!196299) b!234724))

(assert (= (and b!234724 res!196297) b!234723))

(assert (= (and b!234723 res!196295) b!234722))

(assert (= start!49824 b!234725))

(declare-fun m!357307 () Bool)

(assert (=> b!234725 m!357307))

(declare-fun m!357309 () Bool)

(assert (=> b!234721 m!357309))

(declare-fun m!357311 () Bool)

(assert (=> b!234724 m!357311))

(declare-fun m!357313 () Bool)

(assert (=> start!49824 m!357313))

(declare-fun m!357315 () Bool)

(assert (=> b!234722 m!357315))

(declare-fun m!357317 () Bool)

(assert (=> b!234720 m!357317))

(declare-fun m!357319 () Bool)

(assert (=> b!234723 m!357319))

(declare-fun m!357321 () Bool)

(assert (=> b!234723 m!357321))

(declare-fun m!357323 () Bool)

(assert (=> b!234723 m!357323))

(push 1)

(assert (not b!234724))

(assert (not start!49824))

(assert (not b!234721))

(assert (not b!234723))

(assert (not b!234722))

(assert (not b!234720))

(assert (not b!234725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79086 () Bool)

(assert (=> d!79086 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234720 d!79086))

(declare-fun d!79088 () Bool)

(assert (=> d!79088 (= (array_inv!5153 (buf!5887 bs!63)) (bvsge (size!5412 (buf!5887 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234725 d!79088))

(declare-fun d!79090 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19723 () Bool)

(assert (= bs!19723 d!79090))

(declare-fun m!357325 () Bool)

(assert (=> bs!19723 m!357325))

(assert (=> b!234721 d!79090))

(declare-fun d!79092 () Bool)

(declare-fun e!162251 () Bool)

(assert (=> d!79092 e!162251))

(declare-fun res!196302 () Bool)

(assert (=> d!79092 (=> (not res!196302) (not e!162251))))

(declare-fun lt!370352 () (_ BitVec 64))

(declare-fun lt!370351 () BitStream!9788)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79092 (= res!196302 (= (bvadd lt!370352 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5412 (buf!5887 lt!370351)) (currentByte!10960 lt!370351) (currentBit!10955 lt!370351))))))

(assert (=> d!79092 (or (not (= (bvand lt!370352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370352 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79092 (= lt!370352 (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)))))

(declare-datatypes ((Unit!17287 0))(
  ( (Unit!17288) )
))
(declare-datatypes ((tuple2!19744 0))(
  ( (tuple2!19745 (_1!10776 Unit!17287) (_2!10776 BitStream!9788)) )
))
(declare-fun moveBitIndex!0 (BitStream!9788 (_ BitVec 64)) tuple2!19744)

(assert (=> d!79092 (= lt!370351 (_2!10776 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9788 (_ BitVec 64)) Bool)

(assert (=> d!79092 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79092 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370351)))

(declare-fun b!234728 () Bool)

(assert (=> b!234728 (= e!162251 (= (size!5412 (buf!5887 bs!63)) (size!5412 (buf!5887 lt!370351))))))

(assert (= (and d!79092 res!196302) b!234728))

(declare-fun m!357327 () Bool)

(assert (=> d!79092 m!357327))

(declare-fun m!357329 () Bool)

(assert (=> d!79092 m!357329))

(declare-fun m!357331 () Bool)

(assert (=> d!79092 m!357331))

(declare-fun m!357333 () Bool)

(assert (=> d!79092 m!357333))

(assert (=> b!234723 d!79092))

(declare-fun d!79096 () Bool)

(declare-datatypes ((tuple2!19748 0))(
  ( (tuple2!19749 (_1!10778 Bool) (_2!10778 BitStream!9788)) )
))
(declare-fun lt!370359 () tuple2!19748)

(declare-fun readBit!0 (BitStream!9788) tuple2!19748)

(assert (=> d!79096 (= lt!370359 (readBit!0 bs!63))))

(assert (=> d!79096 (= (readBitPure!0 bs!63) (tuple2!19739 (_2!10778 lt!370359) (_1!10778 lt!370359)))))

(declare-fun bs!19724 () Bool)

(assert (= bs!19724 d!79096))

(declare-fun m!357343 () Bool)

(assert (=> bs!19724 m!357343))

(assert (=> b!234723 d!79096))

(declare-fun d!79100 () Bool)

(declare-datatypes ((tuple2!19752 0))(
  ( (tuple2!19753 (_1!10780 (_ BitVec 64)) (_2!10780 BitStream!9788)) )
))
(declare-fun lt!370365 () tuple2!19752)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19752)

(assert (=> d!79100 (= lt!370365 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79100 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19741 (_2!10780 lt!370365) (_1!10780 lt!370365)))))

(declare-fun bs!19726 () Bool)

(assert (= bs!19726 d!79100))

(declare-fun m!357347 () Bool)

(assert (=> bs!19726 m!357347))

(assert (=> b!234723 d!79100))

(declare-fun d!79104 () Bool)

(assert (=> d!79104 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370342))) ((_ sign_extend 32) (currentByte!10960 lt!370342)) ((_ sign_extend 32) (currentBit!10955 lt!370342)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370342))) ((_ sign_extend 32) (currentByte!10960 lt!370342)) ((_ sign_extend 32) (currentBit!10955 lt!370342))) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))))

(declare-fun bs!19727 () Bool)

(assert (= bs!19727 d!79104))

(declare-fun m!357349 () Bool)

(assert (=> bs!19727 m!357349))

(assert (=> b!234722 d!79104))

(declare-fun d!79106 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79106 (= (inv!12 bs!63) (invariant!0 (currentBit!10955 bs!63) (currentByte!10960 bs!63) (size!5412 (buf!5887 bs!63))))))

(declare-fun bs!19728 () Bool)

(assert (= bs!19728 d!79106))

(declare-fun m!357351 () Bool)

(assert (=> bs!19728 m!357351))

(assert (=> start!49824 d!79106))

(declare-fun d!79108 () Bool)

(assert (=> d!79108 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234724 d!79108))

(push 1)

(assert (not d!79090))

(assert (not d!79104))

(assert (not d!79106))

(assert (not d!79092))

(assert (not d!79096))

(assert (not d!79100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79152 () Bool)

(assert (=> d!79152 (= (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370342))) ((_ sign_extend 32) (currentByte!10960 lt!370342)) ((_ sign_extend 32) (currentBit!10955 lt!370342))) (bvsub (bvmul ((_ sign_extend 32) (size!5412 (buf!5887 lt!370342))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10960 lt!370342)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10955 lt!370342)))))))

(assert (=> d!79104 d!79152))

(declare-fun d!79156 () Bool)

(declare-fun e!162267 () Bool)

(assert (=> d!79156 e!162267))

(declare-fun res!196316 () Bool)

(assert (=> d!79156 (=> (not res!196316) (not e!162267))))

(declare-fun lt!370416 () (_ BitVec 64))

(declare-fun lt!370415 () (_ BitVec 64))

(declare-fun lt!370414 () (_ BitVec 64))

(assert (=> d!79156 (= res!196316 (= lt!370415 (bvsub lt!370414 lt!370416)))))

(assert (=> d!79156 (or (= (bvand lt!370414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370414 lt!370416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79156 (= lt!370416 (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370351))) ((_ sign_extend 32) (currentByte!10960 lt!370351)) ((_ sign_extend 32) (currentBit!10955 lt!370351))))))

(declare-fun lt!370419 () (_ BitVec 64))

(declare-fun lt!370417 () (_ BitVec 64))

(assert (=> d!79156 (= lt!370414 (bvmul lt!370419 lt!370417))))

(assert (=> d!79156 (or (= lt!370419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370417 (bvsdiv (bvmul lt!370419 lt!370417) lt!370419)))))

(assert (=> d!79156 (= lt!370417 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79156 (= lt!370419 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370351))))))

(assert (=> d!79156 (= lt!370415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10960 lt!370351)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10955 lt!370351))))))

(assert (=> d!79156 (invariant!0 (currentBit!10955 lt!370351) (currentByte!10960 lt!370351) (size!5412 (buf!5887 lt!370351)))))

(assert (=> d!79156 (= (bitIndex!0 (size!5412 (buf!5887 lt!370351)) (currentByte!10960 lt!370351) (currentBit!10955 lt!370351)) lt!370415)))

(declare-fun b!234742 () Bool)

(declare-fun res!196317 () Bool)

(assert (=> b!234742 (=> (not res!196317) (not e!162267))))

(assert (=> b!234742 (= res!196317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370415))))

(declare-fun b!234743 () Bool)

(declare-fun lt!370418 () (_ BitVec 64))

(assert (=> b!234743 (= e!162267 (bvsle lt!370415 (bvmul lt!370418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234743 (or (= lt!370418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370418)))))

(assert (=> b!234743 (= lt!370418 ((_ sign_extend 32) (size!5412 (buf!5887 lt!370351))))))

(assert (= (and d!79156 res!196316) b!234742))

(assert (= (and b!234742 res!196317) b!234743))

(declare-fun m!357389 () Bool)

(assert (=> d!79156 m!357389))

(declare-fun m!357391 () Bool)

(assert (=> d!79156 m!357391))

(assert (=> d!79092 d!79156))

(declare-fun d!79160 () Bool)

(declare-fun e!162268 () Bool)

(assert (=> d!79160 e!162268))

(declare-fun res!196318 () Bool)

(assert (=> d!79160 (=> (not res!196318) (not e!162268))))

(declare-fun lt!370421 () (_ BitVec 64))

(declare-fun lt!370422 () (_ BitVec 64))

(declare-fun lt!370420 () (_ BitVec 64))

(assert (=> d!79160 (= res!196318 (= lt!370421 (bvsub lt!370420 lt!370422)))))

(assert (=> d!79160 (or (= (bvand lt!370420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370420 lt!370422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79160 (= lt!370422 (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63))))))

(declare-fun lt!370425 () (_ BitVec 64))

(declare-fun lt!370423 () (_ BitVec 64))

(assert (=> d!79160 (= lt!370420 (bvmul lt!370425 lt!370423))))

(assert (=> d!79160 (or (= lt!370425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370423 (bvsdiv (bvmul lt!370425 lt!370423) lt!370425)))))

(assert (=> d!79160 (= lt!370423 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79160 (= lt!370425 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))))))

(assert (=> d!79160 (= lt!370421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10960 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10955 bs!63))))))

(assert (=> d!79160 (invariant!0 (currentBit!10955 bs!63) (currentByte!10960 bs!63) (size!5412 (buf!5887 bs!63)))))

(assert (=> d!79160 (= (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)) lt!370421)))

(declare-fun b!234744 () Bool)

(declare-fun res!196319 () Bool)

(assert (=> b!234744 (=> (not res!196319) (not e!162268))))

(assert (=> b!234744 (= res!196319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370421))))

(declare-fun b!234745 () Bool)

(declare-fun lt!370424 () (_ BitVec 64))

(assert (=> b!234745 (= e!162268 (bvsle lt!370421 (bvmul lt!370424 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234745 (or (= lt!370424 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370424 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370424)))))

(assert (=> b!234745 (= lt!370424 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))))))

(assert (= (and d!79160 res!196318) b!234744))

(assert (= (and b!234744 res!196319) b!234745))

(assert (=> d!79160 m!357325))

(assert (=> d!79160 m!357351))

(assert (=> d!79092 d!79160))

(declare-fun d!79162 () Bool)

(declare-fun lt!370505 () (_ BitVec 32))

(assert (=> d!79162 (= lt!370505 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!370509 () (_ BitVec 32))

(assert (=> d!79162 (= lt!370509 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162294 () Bool)

(assert (=> d!79162 e!162294))

(declare-fun res!196359 () Bool)

(assert (=> d!79162 (=> (not res!196359) (not e!162294))))

(assert (=> d!79162 (= res!196359 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17297 () Unit!17287)

(declare-fun Unit!17298 () Unit!17287)

(declare-fun Unit!17299 () Unit!17287)

(assert (=> d!79162 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!10955 bs!63) lt!370505) #b00000000000000000000000000000000) (tuple2!19745 Unit!17297 (BitStream!9789 (buf!5887 bs!63) (bvsub (bvadd (currentByte!10960 bs!63) lt!370509) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370505 (currentBit!10955 bs!63)))) (ite (bvsge (bvadd (currentBit!10955 bs!63) lt!370505) #b00000000000000000000000000001000) (tuple2!19745 Unit!17298 (BitStream!9789 (buf!5887 bs!63) (bvadd (currentByte!10960 bs!63) lt!370509 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10955 bs!63) lt!370505) #b00000000000000000000000000001000))) (tuple2!19745 Unit!17299 (BitStream!9789 (buf!5887 bs!63) (bvadd (currentByte!10960 bs!63) lt!370509) (bvadd (currentBit!10955 bs!63) lt!370505))))))))

(declare-fun b!234796 () Bool)

(declare-fun e!162293 () Bool)

(assert (=> b!234796 (= e!162294 e!162293)))

(declare-fun res!196358 () Bool)

(assert (=> b!234796 (=> (not res!196358) (not e!162293))))

(declare-fun lt!370508 () (_ BitVec 64))

(declare-fun lt!370504 () tuple2!19744)

(assert (=> b!234796 (= res!196358 (= (bvadd lt!370508 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5412 (buf!5887 (_2!10776 lt!370504))) (currentByte!10960 (_2!10776 lt!370504)) (currentBit!10955 (_2!10776 lt!370504)))))))

(assert (=> b!234796 (or (not (= (bvand lt!370508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370508 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234796 (= lt!370508 (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)))))

(declare-fun lt!370506 () (_ BitVec 32))

(declare-fun lt!370507 () (_ BitVec 32))

(declare-fun Unit!17300 () Unit!17287)

(declare-fun Unit!17303 () Unit!17287)

(declare-fun Unit!17305 () Unit!17287)

(assert (=> b!234796 (= lt!370504 (ite (bvslt (bvadd (currentBit!10955 bs!63) lt!370506) #b00000000000000000000000000000000) (tuple2!19745 Unit!17300 (BitStream!9789 (buf!5887 bs!63) (bvsub (bvadd (currentByte!10960 bs!63) lt!370507) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370506 (currentBit!10955 bs!63)))) (ite (bvsge (bvadd (currentBit!10955 bs!63) lt!370506) #b00000000000000000000000000001000) (tuple2!19745 Unit!17303 (BitStream!9789 (buf!5887 bs!63) (bvadd (currentByte!10960 bs!63) lt!370507 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10955 bs!63) lt!370506) #b00000000000000000000000000001000))) (tuple2!19745 Unit!17305 (BitStream!9789 (buf!5887 bs!63) (bvadd (currentByte!10960 bs!63) lt!370507) (bvadd (currentBit!10955 bs!63) lt!370506))))))))

(assert (=> b!234796 (= lt!370506 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234796 (= lt!370507 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!234797 () Bool)

(assert (=> b!234797 (= e!162293 (and (= (size!5412 (buf!5887 bs!63)) (size!5412 (buf!5887 (_2!10776 lt!370504)))) (= (buf!5887 bs!63) (buf!5887 (_2!10776 lt!370504)))))))

(assert (= (and d!79162 res!196359) b!234796))

(assert (= (and b!234796 res!196358) b!234797))

(assert (=> d!79162 m!357333))

(declare-fun m!357401 () Bool)

(assert (=> b!234796 m!357401))

(assert (=> b!234796 m!357329))

(assert (=> d!79092 d!79162))

(declare-fun d!79172 () Bool)

(declare-fun res!196366 () Bool)

(declare-fun e!162299 () Bool)

(assert (=> d!79172 (=> (not res!196366) (not e!162299))))

(assert (=> d!79172 (= res!196366 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63)))))))))

(assert (=> d!79172 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162299)))

(declare-fun b!234805 () Bool)

(declare-fun lt!370524 () (_ BitVec 64))

(assert (=> b!234805 (= e!162299 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370524) (bvsle lt!370524 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63)))))))))

(assert (=> b!234805 (= lt!370524 (bvadd (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79172 res!196366) b!234805))

(assert (=> b!234805 m!357329))

(assert (=> d!79092 d!79172))

(declare-fun d!79178 () Bool)

(assert (=> d!79178 (= (invariant!0 (currentBit!10955 bs!63) (currentByte!10960 bs!63) (size!5412 (buf!5887 bs!63))) (and (bvsge (currentBit!10955 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10955 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10960 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10960 bs!63) (size!5412 (buf!5887 bs!63))) (and (= (currentBit!10955 bs!63) #b00000000000000000000000000000000) (= (currentByte!10960 bs!63) (size!5412 (buf!5887 bs!63)))))))))

(assert (=> d!79106 d!79178))

(declare-fun d!79180 () Bool)

(assert (=> d!79180 (= (remainingBits!0 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10960 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10955 bs!63)))))))

(assert (=> d!79090 d!79180))

(declare-fun d!79184 () Bool)

(declare-fun e!162323 () Bool)

(assert (=> d!79184 e!162323))

(declare-fun res!196400 () Bool)

(assert (=> d!79184 (=> (not res!196400) (not e!162323))))

(declare-fun lt!370608 () tuple2!19752)

(assert (=> d!79184 (= res!196400 (= (buf!5887 (_2!10780 lt!370608)) (buf!5887 bs!63)))))

(declare-fun e!162324 () tuple2!19752)

(assert (=> d!79184 (= lt!370608 e!162324)))

(declare-fun c!11275 () Bool)

(assert (=> d!79184 (= c!11275 (= nBits!274 i!546))))

(assert (=> d!79184 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79184 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370608)))

(declare-fun b!234840 () Bool)

(declare-fun lt!370606 () tuple2!19752)

(assert (=> b!234840 (= e!162324 (tuple2!19753 (_1!10780 lt!370606) (_2!10780 lt!370606)))))

(declare-fun lt!370610 () tuple2!19748)

(assert (=> b!234840 (= lt!370610 (readBit!0 bs!63))))

(assert (=> b!234840 (= lt!370606 (readNLeastSignificantBitsLoop!0 (_2!10778 lt!370610) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10778 lt!370610) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234841 () Bool)

(declare-fun e!162322 () Bool)

(assert (=> b!234841 (= e!162323 e!162322)))

(declare-fun res!196401 () Bool)

(assert (=> b!234841 (=> res!196401 e!162322)))

(assert (=> b!234841 (= res!196401 (bvsge i!546 nBits!274))))

(declare-fun b!234842 () Bool)

(declare-fun res!196398 () Bool)

(assert (=> b!234842 (=> (not res!196398) (not e!162323))))

(declare-fun lt!370609 () (_ BitVec 64))

(declare-fun lt!370604 () (_ BitVec 64))

(assert (=> b!234842 (= res!196398 (= (bvlshr (_1!10780 lt!370608) lt!370609) (bvlshr acc!118 lt!370604)))))

(assert (=> b!234842 (and (bvsge lt!370604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370604 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234842 (= lt!370604 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234842 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234842 (and (bvsge lt!370609 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370609 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234842 (= lt!370609 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234842 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!234843 () Bool)

(declare-fun res!196397 () Bool)

(assert (=> b!234843 (=> (not res!196397) (not e!162323))))

(declare-fun lt!370603 () (_ BitVec 64))

(declare-fun lt!370605 () (_ BitVec 64))

(assert (=> b!234843 (= res!196397 (= (bitIndex!0 (size!5412 (buf!5887 (_2!10780 lt!370608))) (currentByte!10960 (_2!10780 lt!370608)) (currentBit!10955 (_2!10780 lt!370608))) (bvadd lt!370603 lt!370605)))))

(assert (=> b!234843 (or (not (= (bvand lt!370603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370605 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370603 lt!370605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234843 (= lt!370605 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234843 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234843 (= lt!370603 (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)))))

(declare-fun b!234844 () Bool)

(declare-fun res!196399 () Bool)

(assert (=> b!234844 (=> (not res!196399) (not e!162323))))

(assert (=> b!234844 (= res!196399 (= (bvand (_1!10780 lt!370608) (onesLSBLong!0 nBits!274)) (_1!10780 lt!370608)))))

(declare-fun b!234845 () Bool)

(assert (=> b!234845 (= e!162324 (tuple2!19753 acc!118 bs!63))))

(declare-fun b!234846 () Bool)

(declare-fun lt!370607 () (_ BitVec 64))

(assert (=> b!234846 (= e!162322 (= (= (bvand (bvlshr (_1!10780 lt!370608) lt!370607) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10773 (readBitPure!0 bs!63))))))

(assert (=> b!234846 (and (bvsge lt!370607 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370607 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370611 () (_ BitVec 32))

(assert (=> b!234846 (= lt!370607 ((_ sign_extend 32) (bvsub lt!370611 i!546)))))

(assert (=> b!234846 (or (= (bvand lt!370611 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370611 #b10000000000000000000000000000000) (bvand (bvsub lt!370611 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234846 (= lt!370611 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234846 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!79184 c!11275) b!234845))

(assert (= (and d!79184 (not c!11275)) b!234840))

(assert (= (and d!79184 res!196400) b!234843))

(assert (= (and b!234843 res!196397) b!234842))

(assert (= (and b!234842 res!196398) b!234844))

(assert (= (and b!234844 res!196399) b!234841))

(assert (= (and b!234841 (not res!196401)) b!234846))

(assert (=> b!234840 m!357343))

(declare-fun m!357415 () Bool)

(assert (=> b!234840 m!357415))

(declare-fun m!357417 () Bool)

(assert (=> b!234843 m!357417))

(assert (=> b!234843 m!357329))

(assert (=> b!234844 m!357311))

(assert (=> b!234846 m!357321))

(assert (=> d!79100 d!79184))

(declare-fun d!79196 () Bool)

(declare-fun e!162343 () Bool)

(assert (=> d!79196 e!162343))

(declare-fun res!196412 () Bool)

(assert (=> d!79196 (=> (not res!196412) (not e!162343))))

(declare-fun increaseBitIndex!0 (BitStream!9788) tuple2!19744)

(assert (=> d!79196 (= res!196412 (= (buf!5887 (_2!10776 (increaseBitIndex!0 bs!63))) (buf!5887 bs!63)))))

(declare-fun lt!370648 () Bool)

(assert (=> d!79196 (= lt!370648 (not (= (bvand ((_ sign_extend 24) (select (arr!6399 (buf!5887 bs!63)) (currentByte!10960 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10955 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370650 () tuple2!19748)

(assert (=> d!79196 (= lt!370650 (tuple2!19749 (not (= (bvand ((_ sign_extend 24) (select (arr!6399 (buf!5887 bs!63)) (currentByte!10960 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10955 bs!63)))) #b00000000000000000000000000000000)) (_2!10776 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79196 (validate_offset_bit!0 ((_ sign_extend 32) (size!5412 (buf!5887 bs!63))) ((_ sign_extend 32) (currentByte!10960 bs!63)) ((_ sign_extend 32) (currentBit!10955 bs!63)))))

(assert (=> d!79196 (= (readBit!0 bs!63) lt!370650)))

(declare-fun lt!370652 () (_ BitVec 64))

(declare-fun lt!370646 () (_ BitVec 64))

(declare-fun b!234859 () Bool)

(assert (=> b!234859 (= e!162343 (= (bitIndex!0 (size!5412 (buf!5887 (_2!10776 (increaseBitIndex!0 bs!63)))) (currentByte!10960 (_2!10776 (increaseBitIndex!0 bs!63))) (currentBit!10955 (_2!10776 (increaseBitIndex!0 bs!63)))) (bvadd lt!370652 lt!370646)))))

(assert (=> b!234859 (or (not (= (bvand lt!370652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370646 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370652 lt!370646) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234859 (= lt!370646 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234859 (= lt!370652 (bitIndex!0 (size!5412 (buf!5887 bs!63)) (currentByte!10960 bs!63) (currentBit!10955 bs!63)))))

(declare-fun lt!370649 () Bool)

(assert (=> b!234859 (= lt!370649 (not (= (bvand ((_ sign_extend 24) (select (arr!6399 (buf!5887 bs!63)) (currentByte!10960 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10955 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370647 () Bool)

(assert (=> b!234859 (= lt!370647 (not (= (bvand ((_ sign_extend 24) (select (arr!6399 (buf!5887 bs!63)) (currentByte!10960 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10955 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370651 () Bool)

(assert (=> b!234859 (= lt!370651 (not (= (bvand ((_ sign_extend 24) (select (arr!6399 (buf!5887 bs!63)) (currentByte!10960 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10955 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79196 res!196412) b!234859))

(declare-fun m!357419 () Bool)

(assert (=> d!79196 m!357419))

(declare-fun m!357421 () Bool)

(assert (=> d!79196 m!357421))

(declare-fun m!357423 () Bool)

(assert (=> d!79196 m!357423))

(declare-fun m!357425 () Bool)

(assert (=> d!79196 m!357425))

(assert (=> b!234859 m!357419))

(assert (=> b!234859 m!357329))

(assert (=> b!234859 m!357423))

(declare-fun m!357427 () Bool)

(assert (=> b!234859 m!357427))

(assert (=> b!234859 m!357421))

(assert (=> d!79096 d!79196))

(push 1)

(assert (not b!234796))

(assert (not b!234846))

(assert (not d!79196))

(assert (not d!79156))

(assert (not b!234805))

(assert (not b!234843))

(assert (not b!234859))

(assert (not d!79162))

(assert (not d!79160))

(assert (not b!234844))

(assert (not b!234840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

