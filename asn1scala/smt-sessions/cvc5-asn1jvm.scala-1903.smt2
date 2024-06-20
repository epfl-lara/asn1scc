; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49820 () Bool)

(assert start!49820)

(declare-fun res!196267 () Bool)

(declare-fun e!162224 () Bool)

(assert (=> start!49820 (=> (not res!196267) (not e!162224))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49820 (= res!196267 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49820 e!162224))

(assert (=> start!49820 true))

(declare-datatypes ((array!12314 0))(
  ( (array!12315 (arr!6397 (Array (_ BitVec 32) (_ BitVec 8))) (size!5410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9784 0))(
  ( (BitStream!9785 (buf!5885 array!12314) (currentByte!10958 (_ BitVec 32)) (currentBit!10953 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9784)

(declare-fun e!162222 () Bool)

(declare-fun inv!12 (BitStream!9784) Bool)

(assert (=> start!49820 (and (inv!12 bs!63) e!162222)))

(declare-fun b!234684 () Bool)

(declare-fun res!196265 () Bool)

(assert (=> b!234684 (=> (not res!196265) (not e!162224))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234684 (= res!196265 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun lt!370325 () BitStream!9784)

(declare-fun e!162221 () Bool)

(declare-fun b!234685 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234685 (= e!162221 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370325))) ((_ sign_extend 32) (currentByte!10958 lt!370325)) ((_ sign_extend 32) (currentBit!10953 lt!370325)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))))

(declare-fun b!234686 () Bool)

(declare-fun res!196269 () Bool)

(assert (=> b!234686 (=> (not res!196269) (not e!162224))))

(assert (=> b!234686 (= res!196269 (validate_offset_bits!1 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234687 () Bool)

(assert (=> b!234687 (= e!162224 e!162221)))

(declare-fun res!196266 () Bool)

(assert (=> b!234687 (=> (not res!196266) (not e!162221))))

(assert (=> b!234687 (= res!196266 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun withMovedBitIndex!0 (BitStream!9784 (_ BitVec 64)) BitStream!9784)

(assert (=> b!234687 (= lt!370325 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19730 0))(
  ( (tuple2!19731 (_1!10769 BitStream!9784) (_2!10769 Bool)) )
))
(declare-fun lt!370326 () tuple2!19730)

(declare-fun readBitPure!0 (BitStream!9784) tuple2!19730)

(assert (=> b!234687 (= lt!370326 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19732 0))(
  ( (tuple2!19733 (_1!10770 BitStream!9784) (_2!10770 (_ BitVec 64))) )
))
(declare-fun lt!370324 () tuple2!19732)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19732)

(assert (=> b!234687 (= lt!370324 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234688 () Bool)

(declare-fun array_inv!5151 (array!12314) Bool)

(assert (=> b!234688 (= e!162222 (array_inv!5151 (buf!5885 bs!63)))))

(declare-fun b!234689 () Bool)

(declare-fun res!196268 () Bool)

(assert (=> b!234689 (=> (not res!196268) (not e!162224))))

(assert (=> b!234689 (= res!196268 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!49820 res!196267) b!234686))

(assert (= (and b!234686 res!196269) b!234689))

(assert (= (and b!234689 res!196268) b!234684))

(assert (= (and b!234684 res!196265) b!234687))

(assert (= (and b!234687 res!196266) b!234685))

(assert (= start!49820 b!234688))

(declare-fun m!357271 () Bool)

(assert (=> start!49820 m!357271))

(declare-fun m!357273 () Bool)

(assert (=> b!234689 m!357273))

(declare-fun m!357275 () Bool)

(assert (=> b!234688 m!357275))

(declare-fun m!357277 () Bool)

(assert (=> b!234687 m!357277))

(declare-fun m!357279 () Bool)

(assert (=> b!234687 m!357279))

(declare-fun m!357281 () Bool)

(assert (=> b!234687 m!357281))

(declare-fun m!357283 () Bool)

(assert (=> b!234684 m!357283))

(declare-fun m!357285 () Bool)

(assert (=> b!234686 m!357285))

(declare-fun m!357287 () Bool)

(assert (=> b!234685 m!357287))

(push 1)

(assert (not start!49820))

(assert (not b!234686))

(assert (not b!234684))

(assert (not b!234685))

(assert (not b!234688))

(assert (not b!234687))

(assert (not b!234689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79094 () Bool)

(declare-fun e!162254 () Bool)

(assert (=> d!79094 e!162254))

(declare-fun res!196305 () Bool)

(assert (=> d!79094 (=> (not res!196305) (not e!162254))))

(declare-fun lt!370356 () (_ BitVec 64))

(declare-fun lt!370355 () BitStream!9784)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79094 (= res!196305 (= (bvadd lt!370356 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5410 (buf!5885 lt!370355)) (currentByte!10958 lt!370355) (currentBit!10953 lt!370355))))))

(assert (=> d!79094 (or (not (= (bvand lt!370356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370356 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79094 (= lt!370356 (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)))))

(declare-datatypes ((Unit!17285 0))(
  ( (Unit!17286) )
))
(declare-datatypes ((tuple2!19742 0))(
  ( (tuple2!19743 (_1!10775 Unit!17285) (_2!10775 BitStream!9784)) )
))
(declare-fun moveBitIndex!0 (BitStream!9784 (_ BitVec 64)) tuple2!19742)

(assert (=> d!79094 (= lt!370355 (_2!10775 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9784 (_ BitVec 64)) Bool)

(assert (=> d!79094 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79094 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370355)))

(declare-fun b!234731 () Bool)

(assert (=> b!234731 (= e!162254 (= (size!5410 (buf!5885 bs!63)) (size!5410 (buf!5885 lt!370355))))))

(assert (= (and d!79094 res!196305) b!234731))

(declare-fun m!357335 () Bool)

(assert (=> d!79094 m!357335))

(declare-fun m!357337 () Bool)

(assert (=> d!79094 m!357337))

(declare-fun m!357339 () Bool)

(assert (=> d!79094 m!357339))

(declare-fun m!357341 () Bool)

(assert (=> d!79094 m!357341))

(assert (=> b!234687 d!79094))

(declare-fun d!79098 () Bool)

(declare-datatypes ((tuple2!19746 0))(
  ( (tuple2!19747 (_1!10777 Bool) (_2!10777 BitStream!9784)) )
))
(declare-fun lt!370362 () tuple2!19746)

(declare-fun readBit!0 (BitStream!9784) tuple2!19746)

(assert (=> d!79098 (= lt!370362 (readBit!0 bs!63))))

(assert (=> d!79098 (= (readBitPure!0 bs!63) (tuple2!19731 (_2!10777 lt!370362) (_1!10777 lt!370362)))))

(declare-fun bs!19725 () Bool)

(assert (= bs!19725 d!79098))

(declare-fun m!357345 () Bool)

(assert (=> bs!19725 m!357345))

(assert (=> b!234687 d!79098))

(declare-fun d!79102 () Bool)

(declare-datatypes ((tuple2!19750 0))(
  ( (tuple2!19751 (_1!10779 (_ BitVec 64)) (_2!10779 BitStream!9784)) )
))
(declare-fun lt!370368 () tuple2!19750)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19750)

(assert (=> d!79102 (= lt!370368 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79102 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19733 (_2!10779 lt!370368) (_1!10779 lt!370368)))))

(declare-fun bs!19729 () Bool)

(assert (= bs!19729 d!79102))

(declare-fun m!357353 () Bool)

(assert (=> bs!19729 m!357353))

(assert (=> b!234687 d!79102))

(declare-fun d!79110 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19730 () Bool)

(assert (= bs!19730 d!79110))

(declare-fun m!357355 () Bool)

(assert (=> bs!19730 m!357355))

(assert (=> b!234686 d!79110))

(declare-fun d!79112 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79112 (= (inv!12 bs!63) (invariant!0 (currentBit!10953 bs!63) (currentByte!10958 bs!63) (size!5410 (buf!5885 bs!63))))))

(declare-fun bs!19731 () Bool)

(assert (= bs!19731 d!79112))

(declare-fun m!357357 () Bool)

(assert (=> bs!19731 m!357357))

(assert (=> start!49820 d!79112))

(declare-fun d!79114 () Bool)

(assert (=> d!79114 (= (array_inv!5151 (buf!5885 bs!63)) (bvsge (size!5410 (buf!5885 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234688 d!79114))

(declare-fun d!79116 () Bool)

(assert (=> d!79116 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234684 d!79116))

(declare-fun d!79118 () Bool)

(assert (=> d!79118 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234689 d!79118))

(declare-fun d!79120 () Bool)

(assert (=> d!79120 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370325))) ((_ sign_extend 32) (currentByte!10958 lt!370325)) ((_ sign_extend 32) (currentBit!10953 lt!370325)) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370325))) ((_ sign_extend 32) (currentByte!10958 lt!370325)) ((_ sign_extend 32) (currentBit!10953 lt!370325))) ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))))

(declare-fun bs!19732 () Bool)

(assert (= bs!19732 d!79120))

(declare-fun m!357359 () Bool)

(assert (=> bs!19732 m!357359))

(assert (=> b!234685 d!79120))

(push 1)

(assert (not d!79098))

(assert (not d!79094))

(assert (not d!79112))

(assert (not d!79120))

(assert (not d!79110))

(assert (not d!79102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79146 () Bool)

(assert (=> d!79146 (= (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10958 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10953 bs!63)))))))

(assert (=> d!79110 d!79146))

(declare-fun d!79148 () Bool)

(assert (=> d!79148 (= (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370325))) ((_ sign_extend 32) (currentByte!10958 lt!370325)) ((_ sign_extend 32) (currentBit!10953 lt!370325))) (bvsub (bvmul ((_ sign_extend 32) (size!5410 (buf!5885 lt!370325))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10958 lt!370325)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10953 lt!370325)))))))

(assert (=> d!79120 d!79148))

(declare-fun d!79150 () Bool)

(declare-fun e!162264 () Bool)

(assert (=> d!79150 e!162264))

(declare-fun res!196311 () Bool)

(assert (=> d!79150 (=> (not res!196311) (not e!162264))))

(declare-fun increaseBitIndex!0 (BitStream!9784) tuple2!19742)

(assert (=> d!79150 (= res!196311 (= (buf!5885 (_2!10775 (increaseBitIndex!0 bs!63))) (buf!5885 bs!63)))))

(declare-fun lt!370395 () Bool)

(assert (=> d!79150 (= lt!370395 (not (= (bvand ((_ sign_extend 24) (select (arr!6397 (buf!5885 bs!63)) (currentByte!10958 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10953 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370400 () tuple2!19746)

(assert (=> d!79150 (= lt!370400 (tuple2!19747 (not (= (bvand ((_ sign_extend 24) (select (arr!6397 (buf!5885 bs!63)) (currentByte!10958 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10953 bs!63)))) #b00000000000000000000000000000000)) (_2!10775 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79150 (validate_offset_bit!0 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63)))))

(assert (=> d!79150 (= (readBit!0 bs!63) lt!370400)))

(declare-fun lt!370396 () (_ BitVec 64))

(declare-fun b!234737 () Bool)

(declare-fun lt!370398 () (_ BitVec 64))

(assert (=> b!234737 (= e!162264 (= (bitIndex!0 (size!5410 (buf!5885 (_2!10775 (increaseBitIndex!0 bs!63)))) (currentByte!10958 (_2!10775 (increaseBitIndex!0 bs!63))) (currentBit!10953 (_2!10775 (increaseBitIndex!0 bs!63)))) (bvadd lt!370398 lt!370396)))))

(assert (=> b!234737 (or (not (= (bvand lt!370398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370396 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370398 lt!370396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234737 (= lt!370396 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234737 (= lt!370398 (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)))))

(declare-fun lt!370399 () Bool)

(assert (=> b!234737 (= lt!370399 (not (= (bvand ((_ sign_extend 24) (select (arr!6397 (buf!5885 bs!63)) (currentByte!10958 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10953 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370401 () Bool)

(assert (=> b!234737 (= lt!370401 (not (= (bvand ((_ sign_extend 24) (select (arr!6397 (buf!5885 bs!63)) (currentByte!10958 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10953 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370397 () Bool)

(assert (=> b!234737 (= lt!370397 (not (= (bvand ((_ sign_extend 24) (select (arr!6397 (buf!5885 bs!63)) (currentByte!10958 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10953 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79150 res!196311) b!234737))

(declare-fun m!357379 () Bool)

(assert (=> d!79150 m!357379))

(declare-fun m!357381 () Bool)

(assert (=> d!79150 m!357381))

(declare-fun m!357383 () Bool)

(assert (=> d!79150 m!357383))

(declare-fun m!357385 () Bool)

(assert (=> d!79150 m!357385))

(declare-fun m!357387 () Bool)

(assert (=> b!234737 m!357387))

(assert (=> b!234737 m!357379))

(assert (=> b!234737 m!357337))

(assert (=> b!234737 m!357381))

(assert (=> b!234737 m!357383))

(assert (=> d!79098 d!79150))

(declare-fun d!79154 () Bool)

(assert (=> d!79154 (= (invariant!0 (currentBit!10953 bs!63) (currentByte!10958 bs!63) (size!5410 (buf!5885 bs!63))) (and (bvsge (currentBit!10953 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10953 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10958 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10958 bs!63) (size!5410 (buf!5885 bs!63))) (and (= (currentBit!10953 bs!63) #b00000000000000000000000000000000) (= (currentByte!10958 bs!63) (size!5410 (buf!5885 bs!63)))))))))

(assert (=> d!79112 d!79154))

(declare-fun b!234787 () Bool)

(declare-fun res!196351 () Bool)

(declare-fun e!162291 () Bool)

(assert (=> b!234787 (=> (not res!196351) (not e!162291))))

(declare-fun lt!370493 () tuple2!19750)

(declare-fun lt!370498 () (_ BitVec 64))

(declare-fun lt!370497 () (_ BitVec 64))

(assert (=> b!234787 (= res!196351 (= (bvlshr (_1!10779 lt!370493) lt!370498) (bvlshr acc!118 lt!370497)))))

(assert (=> b!234787 (and (bvsge lt!370497 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370497 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234787 (= lt!370497 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234787 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234787 (and (bvsge lt!370498 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370498 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234787 (= lt!370498 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234787 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!234788 () Bool)

(declare-fun e!162292 () tuple2!19750)

(declare-fun lt!370500 () tuple2!19750)

(assert (=> b!234788 (= e!162292 (tuple2!19751 (_1!10779 lt!370500) (_2!10779 lt!370500)))))

(declare-fun lt!370501 () tuple2!19746)

(assert (=> b!234788 (= lt!370501 (readBit!0 bs!63))))

(assert (=> b!234788 (= lt!370500 (readNLeastSignificantBitsLoop!0 (_2!10777 lt!370501) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10777 lt!370501) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234790 () Bool)

(declare-fun e!162290 () Bool)

(assert (=> b!234790 (= e!162291 e!162290)))

(declare-fun res!196352 () Bool)

(assert (=> b!234790 (=> res!196352 e!162290)))

(assert (=> b!234790 (= res!196352 (bvsge i!546 nBits!274))))

(declare-fun b!234791 () Bool)

(declare-fun lt!370499 () (_ BitVec 64))

(assert (=> b!234791 (= e!162290 (= (= (bvand (bvlshr (_1!10779 lt!370493) lt!370499) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10769 (readBitPure!0 bs!63))))))

(assert (=> b!234791 (and (bvsge lt!370499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370499 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370494 () (_ BitVec 32))

(assert (=> b!234791 (= lt!370499 ((_ sign_extend 32) (bvsub lt!370494 i!546)))))

(assert (=> b!234791 (or (= (bvand lt!370494 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370494 #b10000000000000000000000000000000) (bvand (bvsub lt!370494 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234791 (= lt!370494 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234791 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!234792 () Bool)

(declare-fun res!196355 () Bool)

(assert (=> b!234792 (=> (not res!196355) (not e!162291))))

(assert (=> b!234792 (= res!196355 (= (bvand (_1!10779 lt!370493) (onesLSBLong!0 nBits!274)) (_1!10779 lt!370493)))))

(declare-fun b!234793 () Bool)

(assert (=> b!234793 (= e!162292 (tuple2!19751 acc!118 bs!63))))

(declare-fun b!234789 () Bool)

(declare-fun res!196353 () Bool)

(assert (=> b!234789 (=> (not res!196353) (not e!162291))))

(declare-fun lt!370496 () (_ BitVec 64))

(declare-fun lt!370495 () (_ BitVec 64))

(assert (=> b!234789 (= res!196353 (= (bitIndex!0 (size!5410 (buf!5885 (_2!10779 lt!370493))) (currentByte!10958 (_2!10779 lt!370493)) (currentBit!10953 (_2!10779 lt!370493))) (bvadd lt!370496 lt!370495)))))

(assert (=> b!234789 (or (not (= (bvand lt!370496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370495 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370496 lt!370495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234789 (= lt!370495 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234789 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234789 (= lt!370496 (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)))))

(declare-fun d!79158 () Bool)

(assert (=> d!79158 e!162291))

(declare-fun res!196354 () Bool)

(assert (=> d!79158 (=> (not res!196354) (not e!162291))))

(assert (=> d!79158 (= res!196354 (= (buf!5885 (_2!10779 lt!370493)) (buf!5885 bs!63)))))

(assert (=> d!79158 (= lt!370493 e!162292)))

(declare-fun c!11272 () Bool)

(assert (=> d!79158 (= c!11272 (= nBits!274 i!546))))

(assert (=> d!79158 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79158 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370493)))

(assert (= (and d!79158 c!11272) b!234793))

(assert (= (and d!79158 (not c!11272)) b!234788))

(assert (= (and d!79158 res!196354) b!234789))

(assert (= (and b!234789 res!196353) b!234787))

(assert (= (and b!234787 res!196351) b!234792))

(assert (= (and b!234792 res!196355) b!234790))

(assert (= (and b!234790 (not res!196352)) b!234791))

(assert (=> b!234788 m!357345))

(declare-fun m!357397 () Bool)

(assert (=> b!234788 m!357397))

(assert (=> b!234791 m!357279))

(assert (=> b!234792 m!357283))

(declare-fun m!357399 () Bool)

(assert (=> b!234789 m!357399))

(assert (=> b!234789 m!357337))

(assert (=> d!79102 d!79158))

(declare-fun d!79170 () Bool)

(declare-fun e!162302 () Bool)

(assert (=> d!79170 e!162302))

(declare-fun res!196372 () Bool)

(assert (=> d!79170 (=> (not res!196372) (not e!162302))))

(declare-fun lt!370540 () (_ BitVec 64))

(declare-fun lt!370538 () (_ BitVec 64))

(declare-fun lt!370537 () (_ BitVec 64))

(assert (=> d!79170 (= res!196372 (= lt!370540 (bvsub lt!370538 lt!370537)))))

(assert (=> d!79170 (or (= (bvand lt!370538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370538 lt!370537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79170 (= lt!370537 (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370355))) ((_ sign_extend 32) (currentByte!10958 lt!370355)) ((_ sign_extend 32) (currentBit!10953 lt!370355))))))

(declare-fun lt!370542 () (_ BitVec 64))

(declare-fun lt!370539 () (_ BitVec 64))

(assert (=> d!79170 (= lt!370538 (bvmul lt!370542 lt!370539))))

(assert (=> d!79170 (or (= lt!370542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370539 (bvsdiv (bvmul lt!370542 lt!370539) lt!370542)))))

(assert (=> d!79170 (= lt!370539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79170 (= lt!370542 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370355))))))

(assert (=> d!79170 (= lt!370540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10958 lt!370355)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10953 lt!370355))))))

(assert (=> d!79170 (invariant!0 (currentBit!10953 lt!370355) (currentByte!10958 lt!370355) (size!5410 (buf!5885 lt!370355)))))

(assert (=> d!79170 (= (bitIndex!0 (size!5410 (buf!5885 lt!370355)) (currentByte!10958 lt!370355) (currentBit!10953 lt!370355)) lt!370540)))

(declare-fun b!234810 () Bool)

(declare-fun res!196371 () Bool)

(assert (=> b!234810 (=> (not res!196371) (not e!162302))))

(assert (=> b!234810 (= res!196371 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370540))))

(declare-fun b!234811 () Bool)

(declare-fun lt!370541 () (_ BitVec 64))

(assert (=> b!234811 (= e!162302 (bvsle lt!370540 (bvmul lt!370541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234811 (or (= lt!370541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370541)))))

(assert (=> b!234811 (= lt!370541 ((_ sign_extend 32) (size!5410 (buf!5885 lt!370355))))))

(assert (= (and d!79170 res!196372) b!234810))

(assert (= (and b!234810 res!196371) b!234811))

(declare-fun m!357407 () Bool)

(assert (=> d!79170 m!357407))

(declare-fun m!357409 () Bool)

(assert (=> d!79170 m!357409))

(assert (=> d!79094 d!79170))

(declare-fun d!79186 () Bool)

(declare-fun e!162303 () Bool)

(assert (=> d!79186 e!162303))

(declare-fun res!196374 () Bool)

(assert (=> d!79186 (=> (not res!196374) (not e!162303))))

(declare-fun lt!370546 () (_ BitVec 64))

(declare-fun lt!370544 () (_ BitVec 64))

(declare-fun lt!370543 () (_ BitVec 64))

(assert (=> d!79186 (= res!196374 (= lt!370546 (bvsub lt!370544 lt!370543)))))

(assert (=> d!79186 (or (= (bvand lt!370544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370543 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370544 lt!370543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79186 (= lt!370543 (remainingBits!0 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))) ((_ sign_extend 32) (currentByte!10958 bs!63)) ((_ sign_extend 32) (currentBit!10953 bs!63))))))

(declare-fun lt!370548 () (_ BitVec 64))

(declare-fun lt!370545 () (_ BitVec 64))

(assert (=> d!79186 (= lt!370544 (bvmul lt!370548 lt!370545))))

(assert (=> d!79186 (or (= lt!370548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370545 (bvsdiv (bvmul lt!370548 lt!370545) lt!370548)))))

(assert (=> d!79186 (= lt!370545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79186 (= lt!370548 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))))))

(assert (=> d!79186 (= lt!370546 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10958 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10953 bs!63))))))

(assert (=> d!79186 (invariant!0 (currentBit!10953 bs!63) (currentByte!10958 bs!63) (size!5410 (buf!5885 bs!63)))))

(assert (=> d!79186 (= (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)) lt!370546)))

(declare-fun b!234812 () Bool)

(declare-fun res!196373 () Bool)

(assert (=> b!234812 (=> (not res!196373) (not e!162303))))

(assert (=> b!234812 (= res!196373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370546))))

(declare-fun b!234813 () Bool)

(declare-fun lt!370547 () (_ BitVec 64))

(assert (=> b!234813 (= e!162303 (bvsle lt!370546 (bvmul lt!370547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234813 (or (= lt!370547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370547)))))

(assert (=> b!234813 (= lt!370547 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63))))))

(assert (= (and d!79186 res!196374) b!234812))

(assert (= (and b!234812 res!196373) b!234813))

(assert (=> d!79186 m!357355))

(assert (=> d!79186 m!357357))

(assert (=> d!79094 d!79186))

(declare-fun d!79188 () Bool)

(declare-fun lt!370593 () (_ BitVec 32))

(assert (=> d!79188 (= lt!370593 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!370596 () (_ BitVec 32))

(assert (=> d!79188 (= lt!370596 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162318 () Bool)

(assert (=> d!79188 e!162318))

(declare-fun res!196394 () Bool)

(assert (=> d!79188 (=> (not res!196394) (not e!162318))))

(assert (=> d!79188 (= res!196394 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17291 () Unit!17285)

(declare-fun Unit!17292 () Unit!17285)

(declare-fun Unit!17293 () Unit!17285)

(assert (=> d!79188 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!10953 bs!63) lt!370593) #b00000000000000000000000000000000) (tuple2!19743 Unit!17291 (BitStream!9785 (buf!5885 bs!63) (bvsub (bvadd (currentByte!10958 bs!63) lt!370596) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370593 (currentBit!10953 bs!63)))) (ite (bvsge (bvadd (currentBit!10953 bs!63) lt!370593) #b00000000000000000000000000001000) (tuple2!19743 Unit!17292 (BitStream!9785 (buf!5885 bs!63) (bvadd (currentByte!10958 bs!63) lt!370596 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10953 bs!63) lt!370593) #b00000000000000000000000000001000))) (tuple2!19743 Unit!17293 (BitStream!9785 (buf!5885 bs!63) (bvadd (currentByte!10958 bs!63) lt!370596) (bvadd (currentBit!10953 bs!63) lt!370593))))))))

(declare-fun b!234836 () Bool)

(declare-fun e!162319 () Bool)

(assert (=> b!234836 (= e!162318 e!162319)))

(declare-fun res!196393 () Bool)

(assert (=> b!234836 (=> (not res!196393) (not e!162319))))

(declare-fun lt!370595 () (_ BitVec 64))

(declare-fun lt!370592 () tuple2!19742)

(assert (=> b!234836 (= res!196393 (= (bvadd lt!370595 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5410 (buf!5885 (_2!10775 lt!370592))) (currentByte!10958 (_2!10775 lt!370592)) (currentBit!10953 (_2!10775 lt!370592)))))))

(assert (=> b!234836 (or (not (= (bvand lt!370595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370595 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234836 (= lt!370595 (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)))))

(declare-fun lt!370591 () (_ BitVec 32))

(declare-fun lt!370594 () (_ BitVec 32))

(declare-fun Unit!17294 () Unit!17285)

(declare-fun Unit!17295 () Unit!17285)

(declare-fun Unit!17296 () Unit!17285)

(assert (=> b!234836 (= lt!370592 (ite (bvslt (bvadd (currentBit!10953 bs!63) lt!370591) #b00000000000000000000000000000000) (tuple2!19743 Unit!17294 (BitStream!9785 (buf!5885 bs!63) (bvsub (bvadd (currentByte!10958 bs!63) lt!370594) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!370591 (currentBit!10953 bs!63)))) (ite (bvsge (bvadd (currentBit!10953 bs!63) lt!370591) #b00000000000000000000000000001000) (tuple2!19743 Unit!17295 (BitStream!9785 (buf!5885 bs!63) (bvadd (currentByte!10958 bs!63) lt!370594 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!10953 bs!63) lt!370591) #b00000000000000000000000000001000))) (tuple2!19743 Unit!17296 (BitStream!9785 (buf!5885 bs!63) (bvadd (currentByte!10958 bs!63) lt!370594) (bvadd (currentBit!10953 bs!63) lt!370591))))))))

(assert (=> b!234836 (= lt!370591 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234836 (= lt!370594 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!234837 () Bool)

(assert (=> b!234837 (= e!162319 (and (= (size!5410 (buf!5885 bs!63)) (size!5410 (buf!5885 (_2!10775 lt!370592)))) (= (buf!5885 bs!63) (buf!5885 (_2!10775 lt!370592)))))))

(assert (= (and d!79188 res!196394) b!234836))

(assert (= (and b!234836 res!196393) b!234837))

(assert (=> d!79188 m!357341))

(declare-fun m!357411 () Bool)

(assert (=> b!234836 m!357411))

(assert (=> b!234836 m!357337))

(assert (=> d!79094 d!79188))

(declare-fun d!79192 () Bool)

(declare-fun res!196404 () Bool)

(declare-fun e!162327 () Bool)

(assert (=> d!79192 (=> (not res!196404) (not e!162327))))

(assert (=> d!79192 (= res!196404 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63)))))))))

(assert (=> d!79192 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162327)))

(declare-fun b!234850 () Bool)

(declare-fun lt!370614 () (_ BitVec 64))

(assert (=> b!234850 (= e!162327 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370614) (bvsle lt!370614 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5410 (buf!5885 bs!63)))))))))

(assert (=> b!234850 (= lt!370614 (bvadd (bitIndex!0 (size!5410 (buf!5885 bs!63)) (currentByte!10958 bs!63) (currentBit!10953 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79192 res!196404) b!234850))

(assert (=> b!234850 m!357337))

(assert (=> d!79094 d!79192))

(push 1)

(assert (not d!79188))

(assert (not b!234792))

(assert (not d!79170))

(assert (not b!234737))

(assert (not d!79150))

(assert (not b!234850))

(assert (not b!234791))

(assert (not b!234788))

(assert (not d!79186))

(assert (not b!234836))

(assert (not b!234789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

