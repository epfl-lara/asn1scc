; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50054 () Bool)

(assert start!50054)

(declare-fun b!235361 () Bool)

(declare-fun res!196794 () Bool)

(declare-fun e!162677 () Bool)

(assert (=> b!235361 (=> (not res!196794) (not e!162677))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((array!12383 0))(
  ( (array!12384 (arr!6427 (Array (_ BitVec 32) (_ BitVec 8))) (size!5440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9844 0))(
  ( (BitStream!9845 (buf!5915 array!12383) (currentByte!11006 (_ BitVec 32)) (currentBit!11001 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9844)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235361 (= res!196794 (validate_offset_bits!1 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235362 () Bool)

(declare-fun e!162680 () (_ BitVec 64))

(assert (=> b!235362 (= e!162680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235363 () Bool)

(assert (=> b!235363 (= e!162680 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun res!196793 () Bool)

(assert (=> start!50054 (=> (not res!196793) (not e!162677))))

(assert (=> start!50054 (= res!196793 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50054 e!162677))

(assert (=> start!50054 true))

(declare-fun e!162678 () Bool)

(declare-fun inv!12 (BitStream!9844) Bool)

(assert (=> start!50054 (and (inv!12 bs!63) e!162678)))

(declare-fun b!235364 () Bool)

(declare-fun res!196791 () Bool)

(assert (=> b!235364 (=> (not res!196791) (not e!162677))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235364 (= res!196791 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235365 () Bool)

(declare-datatypes ((tuple2!19892 0))(
  ( (tuple2!19893 (_1!10850 BitStream!9844) (_2!10850 (_ BitVec 64))) )
))
(declare-fun lt!370971 () tuple2!19892)

(declare-fun lt!370970 () tuple2!19892)

(assert (=> b!235365 (= e!162677 (or (not (= (_2!10850 lt!370971) (_2!10850 lt!370970))) (not (= (_1!10850 lt!370971) (_1!10850 lt!370970)))))))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19892)

(declare-fun withMovedBitIndex!0 (BitStream!9844 (_ BitVec 64)) BitStream!9844)

(assert (=> b!235365 (= lt!370970 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162680)))))

(declare-fun c!11296 () Bool)

(declare-datatypes ((tuple2!19894 0))(
  ( (tuple2!19895 (_1!10851 BitStream!9844) (_2!10851 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9844) tuple2!19894)

(assert (=> b!235365 (= c!11296 (_2!10851 (readBitPure!0 bs!63)))))

(assert (=> b!235365 (= lt!370971 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235366 () Bool)

(declare-fun array_inv!5181 (array!12383) Bool)

(assert (=> b!235366 (= e!162678 (array_inv!5181 (buf!5915 bs!63)))))

(declare-fun b!235367 () Bool)

(declare-fun res!196792 () Bool)

(assert (=> b!235367 (=> (not res!196792) (not e!162677))))

(assert (=> b!235367 (= res!196792 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50054 res!196793) b!235361))

(assert (= (and b!235361 res!196794) b!235367))

(assert (= (and b!235367 res!196792) b!235364))

(assert (= (and b!235364 res!196791) b!235365))

(assert (= (and b!235365 c!11296) b!235363))

(assert (= (and b!235365 (not c!11296)) b!235362))

(assert (= start!50054 b!235366))

(declare-fun m!357985 () Bool)

(assert (=> start!50054 m!357985))

(declare-fun m!357987 () Bool)

(assert (=> b!235364 m!357987))

(declare-fun m!357989 () Bool)

(assert (=> b!235365 m!357989))

(assert (=> b!235365 m!357989))

(declare-fun m!357991 () Bool)

(assert (=> b!235365 m!357991))

(declare-fun m!357993 () Bool)

(assert (=> b!235365 m!357993))

(declare-fun m!357995 () Bool)

(assert (=> b!235365 m!357995))

(declare-fun m!357997 () Bool)

(assert (=> b!235361 m!357997))

(declare-fun m!357999 () Bool)

(assert (=> b!235367 m!357999))

(declare-fun m!358001 () Bool)

(assert (=> b!235366 m!358001))

(push 1)

(assert (not b!235364))

(assert (not b!235365))

(assert (not b!235367))

(assert (not start!50054))

(assert (not b!235361))

(assert (not b!235366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79360 () Bool)

(declare-datatypes ((tuple2!19910 0))(
  ( (tuple2!19911 (_1!10859 (_ BitVec 64)) (_2!10859 BitStream!9844)) )
))
(declare-fun lt!370999 () tuple2!19910)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19910)

(assert (=> d!79360 (= lt!370999 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162680)))))

(assert (=> d!79360 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162680)) (tuple2!19893 (_2!10859 lt!370999) (_1!10859 lt!370999)))))

(declare-fun bs!19806 () Bool)

(assert (= bs!19806 d!79360))

(assert (=> bs!19806 m!357989))

(declare-fun m!358057 () Bool)

(assert (=> bs!19806 m!358057))

(assert (=> b!235365 d!79360))

(declare-fun d!79362 () Bool)

(declare-fun e!162710 () Bool)

(assert (=> d!79362 e!162710))

(declare-fun res!196824 () Bool)

(assert (=> d!79362 (=> (not res!196824) (not e!162710))))

(declare-fun lt!371008 () (_ BitVec 64))

(declare-fun lt!371007 () BitStream!9844)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79362 (= res!196824 (= (bvadd lt!371008 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5440 (buf!5915 lt!371007)) (currentByte!11006 lt!371007) (currentBit!11001 lt!371007))))))

(assert (=> d!79362 (or (not (= (bvand lt!371008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371008 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79362 (= lt!371008 (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)))))

(declare-datatypes ((Unit!17323 0))(
  ( (Unit!17324) )
))
(declare-datatypes ((tuple2!19912 0))(
  ( (tuple2!19913 (_1!10860 Unit!17323) (_2!10860 BitStream!9844)) )
))
(declare-fun moveBitIndex!0 (BitStream!9844 (_ BitVec 64)) tuple2!19912)

(assert (=> d!79362 (= lt!371007 (_2!10860 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9844 (_ BitVec 64)) Bool)

(assert (=> d!79362 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79362 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!371007)))

(declare-fun b!235415 () Bool)

(assert (=> b!235415 (= e!162710 (= (size!5440 (buf!5915 bs!63)) (size!5440 (buf!5915 lt!371007))))))

(assert (= (and d!79362 res!196824) b!235415))

(declare-fun m!358065 () Bool)

(assert (=> d!79362 m!358065))

(declare-fun m!358067 () Bool)

(assert (=> d!79362 m!358067))

(declare-fun m!358069 () Bool)

(assert (=> d!79362 m!358069))

(declare-fun m!358071 () Bool)

(assert (=> d!79362 m!358071))

(assert (=> b!235365 d!79362))

(declare-fun d!79376 () Bool)

(declare-datatypes ((tuple2!19914 0))(
  ( (tuple2!19915 (_1!10861 Bool) (_2!10861 BitStream!9844)) )
))
(declare-fun lt!371011 () tuple2!19914)

(declare-fun readBit!0 (BitStream!9844) tuple2!19914)

(assert (=> d!79376 (= lt!371011 (readBit!0 bs!63))))

(assert (=> d!79376 (= (readBitPure!0 bs!63) (tuple2!19895 (_2!10861 lt!371011) (_1!10861 lt!371011)))))

(declare-fun bs!19810 () Bool)

(assert (= bs!19810 d!79376))

(declare-fun m!358073 () Bool)

(assert (=> bs!19810 m!358073))

(assert (=> b!235365 d!79376))

(declare-fun lt!371012 () tuple2!19910)

(declare-fun d!79378 () Bool)

(assert (=> d!79378 (= lt!371012 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79378 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19893 (_2!10859 lt!371012) (_1!10859 lt!371012)))))

(declare-fun bs!19811 () Bool)

(assert (= bs!19811 d!79378))

(declare-fun m!358075 () Bool)

(assert (=> bs!19811 m!358075))

(assert (=> b!235365 d!79378))

(declare-fun d!79380 () Bool)

(assert (=> d!79380 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!235364 d!79380))

(declare-fun d!79382 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19812 () Bool)

(assert (= bs!19812 d!79382))

(declare-fun m!358077 () Bool)

(assert (=> bs!19812 m!358077))

(assert (=> b!235361 d!79382))

(declare-fun d!79384 () Bool)

(assert (=> d!79384 (= (array_inv!5181 (buf!5915 bs!63)) (bvsge (size!5440 (buf!5915 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!235366 d!79384))

(declare-fun d!79386 () Bool)

(assert (=> d!79386 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!235367 d!79386))

(declare-fun d!79388 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79388 (= (inv!12 bs!63) (invariant!0 (currentBit!11001 bs!63) (currentByte!11006 bs!63) (size!5440 (buf!5915 bs!63))))))

(declare-fun bs!19813 () Bool)

(assert (= bs!19813 d!79388))

(declare-fun m!358079 () Bool)

(assert (=> bs!19813 m!358079))

(assert (=> start!50054 d!79388))

(push 1)

(assert (not d!79378))

(assert (not d!79362))

(assert (not d!79382))

(assert (not d!79388))

(assert (not d!79360))

(assert (not d!79376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79412 () Bool)

(assert (=> d!79412 (= (invariant!0 (currentBit!11001 bs!63) (currentByte!11006 bs!63) (size!5440 (buf!5915 bs!63))) (and (bvsge (currentBit!11001 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!11001 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!11006 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!11006 bs!63) (size!5440 (buf!5915 bs!63))) (and (= (currentBit!11001 bs!63) #b00000000000000000000000000000000) (= (currentByte!11006 bs!63) (size!5440 (buf!5915 bs!63)))))))))

(assert (=> d!79388 d!79412))

(declare-fun b!235456 () Bool)

(declare-fun e!162748 () tuple2!19910)

(declare-fun lt!371126 () tuple2!19910)

(assert (=> b!235456 (= e!162748 (tuple2!19911 (_1!10859 lt!371126) (_2!10859 lt!371126)))))

(declare-fun lt!371124 () tuple2!19914)

(assert (=> b!235456 (= lt!371124 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!235456 (= lt!371126 (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371124) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162680) (ite (_1!10861 lt!371124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79414 () Bool)

(declare-fun e!162747 () Bool)

(assert (=> d!79414 e!162747))

(declare-fun res!196861 () Bool)

(assert (=> d!79414 (=> (not res!196861) (not e!162747))))

(declare-fun lt!371125 () tuple2!19910)

(assert (=> d!79414 (= res!196861 (= (buf!5915 (_2!10859 lt!371125)) (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79414 (= lt!371125 e!162748)))

(declare-fun c!11305 () Bool)

(assert (=> d!79414 (= c!11305 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(assert (=> d!79414 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)) (bvsle (bvadd #b00000000000000000000000000000001 i!546) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79414 (= (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162680)) lt!371125)))

(declare-fun b!235457 () Bool)

(declare-fun res!196860 () Bool)

(assert (=> b!235457 (=> (not res!196860) (not e!162747))))

(declare-fun lt!371128 () (_ BitVec 64))

(declare-fun lt!371122 () (_ BitVec 64))

(assert (=> b!235457 (= res!196860 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371125))) (currentByte!11006 (_2!10859 lt!371125)) (currentBit!11001 (_2!10859 lt!371125))) (bvadd lt!371128 lt!371122)))))

(assert (=> b!235457 (or (not (= (bvand lt!371128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371122 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371128 lt!371122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235457 (= lt!371122 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235457 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235457 (= lt!371128 (bitIndex!0 (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!235458 () Bool)

(declare-fun res!196862 () Bool)

(assert (=> b!235458 (=> (not res!196862) (not e!162747))))

(assert (=> b!235458 (= res!196862 (= (bvand (_1!10859 lt!371125) (onesLSBLong!0 nBits!274)) (_1!10859 lt!371125)))))

(declare-fun lt!371129 () (_ BitVec 64))

(declare-fun b!235459 () Bool)

(declare-fun e!162746 () Bool)

(assert (=> b!235459 (= e!162746 (= (= (bvand (bvlshr (_1!10859 lt!371125) lt!371129) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10851 (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!235459 (and (bvsge lt!371129 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371129 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371121 () (_ BitVec 32))

(assert (=> b!235459 (= lt!371129 ((_ sign_extend 32) (bvsub lt!371121 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235459 (or (= (bvand lt!371121 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand lt!371121 #b10000000000000000000000000000000) (bvand (bvsub lt!371121 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235459 (= lt!371121 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235459 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235460 () Bool)

(assert (=> b!235460 (= e!162748 (tuple2!19911 (bvor acc!118 e!162680) (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!235461 () Bool)

(assert (=> b!235461 (= e!162747 e!162746)))

(declare-fun res!196863 () Bool)

(assert (=> b!235461 (=> res!196863 e!162746)))

(assert (=> b!235461 (= res!196863 (bvsge (bvadd #b00000000000000000000000000000001 i!546) nBits!274))))

(declare-fun b!235462 () Bool)

(declare-fun res!196864 () Bool)

(assert (=> b!235462 (=> (not res!196864) (not e!162747))))

(declare-fun lt!371127 () (_ BitVec 64))

(declare-fun lt!371123 () (_ BitVec 64))

(assert (=> b!235462 (= res!196864 (= (bvlshr (_1!10859 lt!371125) lt!371123) (bvlshr (bvor acc!118 e!162680) lt!371127)))))

(assert (=> b!235462 (and (bvsge lt!371127 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371127 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235462 (= lt!371127 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235462 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235462 (and (bvsge lt!371123 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371123 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235462 (= lt!371123 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235462 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (= (and d!79414 c!11305) b!235460))

(assert (= (and d!79414 (not c!11305)) b!235456))

(assert (= (and d!79414 res!196861) b!235457))

(assert (= (and b!235457 res!196860) b!235462))

(assert (= (and b!235462 res!196864) b!235458))

(assert (= (and b!235458 res!196862) b!235461))

(assert (= (and b!235461 (not res!196863)) b!235459))

(assert (=> b!235456 m!357989))

(declare-fun m!358109 () Bool)

(assert (=> b!235456 m!358109))

(declare-fun m!358111 () Bool)

(assert (=> b!235456 m!358111))

(declare-fun m!358113 () Bool)

(assert (=> b!235457 m!358113))

(declare-fun m!358115 () Bool)

(assert (=> b!235457 m!358115))

(assert (=> b!235458 m!357987))

(assert (=> b!235459 m!357989))

(declare-fun m!358117 () Bool)

(assert (=> b!235459 m!358117))

(assert (=> d!79360 d!79414))

(declare-fun b!235464 () Bool)

(declare-fun e!162752 () tuple2!19910)

(declare-fun lt!371142 () tuple2!19910)

(assert (=> b!235464 (= e!162752 (tuple2!19911 (_1!10859 lt!371142) (_2!10859 lt!371142)))))

(declare-fun lt!371140 () tuple2!19914)

(assert (=> b!235464 (= lt!371140 (readBit!0 bs!63))))

(assert (=> b!235464 (= lt!371142 (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371140) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10861 lt!371140) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79420 () Bool)

(declare-fun e!162751 () Bool)

(assert (=> d!79420 e!162751))

(declare-fun res!196867 () Bool)

(assert (=> d!79420 (=> (not res!196867) (not e!162751))))

(declare-fun lt!371141 () tuple2!19910)

(assert (=> d!79420 (= res!196867 (= (buf!5915 (_2!10859 lt!371141)) (buf!5915 bs!63)))))

(assert (=> d!79420 (= lt!371141 e!162752)))

(declare-fun c!11306 () Bool)

(assert (=> d!79420 (= c!11306 (= nBits!274 i!546))))

(assert (=> d!79420 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79420 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!371141)))

(declare-fun b!235465 () Bool)

(declare-fun res!196866 () Bool)

(assert (=> b!235465 (=> (not res!196866) (not e!162751))))

(declare-fun lt!371144 () (_ BitVec 64))

(declare-fun lt!371138 () (_ BitVec 64))

(assert (=> b!235465 (= res!196866 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371141))) (currentByte!11006 (_2!10859 lt!371141)) (currentBit!11001 (_2!10859 lt!371141))) (bvadd lt!371144 lt!371138)))))

(assert (=> b!235465 (or (not (= (bvand lt!371144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371138 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371144 lt!371138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235465 (= lt!371138 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235465 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235465 (= lt!371144 (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)))))

(declare-fun b!235466 () Bool)

(declare-fun res!196868 () Bool)

(assert (=> b!235466 (=> (not res!196868) (not e!162751))))

(assert (=> b!235466 (= res!196868 (= (bvand (_1!10859 lt!371141) (onesLSBLong!0 nBits!274)) (_1!10859 lt!371141)))))

(declare-fun e!162750 () Bool)

(declare-fun b!235467 () Bool)

(declare-fun lt!371145 () (_ BitVec 64))

(assert (=> b!235467 (= e!162750 (= (= (bvand (bvlshr (_1!10859 lt!371141) lt!371145) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10851 (readBitPure!0 bs!63))))))

(assert (=> b!235467 (and (bvsge lt!371145 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371145 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371137 () (_ BitVec 32))

(assert (=> b!235467 (= lt!371145 ((_ sign_extend 32) (bvsub lt!371137 i!546)))))

(assert (=> b!235467 (or (= (bvand lt!371137 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!371137 #b10000000000000000000000000000000) (bvand (bvsub lt!371137 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235467 (= lt!371137 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235467 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235468 () Bool)

(assert (=> b!235468 (= e!162752 (tuple2!19911 acc!118 bs!63))))

(declare-fun b!235469 () Bool)

(assert (=> b!235469 (= e!162751 e!162750)))

(declare-fun res!196869 () Bool)

(assert (=> b!235469 (=> res!196869 e!162750)))

(assert (=> b!235469 (= res!196869 (bvsge i!546 nBits!274))))

(declare-fun b!235470 () Bool)

(declare-fun res!196870 () Bool)

(assert (=> b!235470 (=> (not res!196870) (not e!162751))))

(declare-fun lt!371143 () (_ BitVec 64))

(declare-fun lt!371139 () (_ BitVec 64))

(assert (=> b!235470 (= res!196870 (= (bvlshr (_1!10859 lt!371141) lt!371139) (bvlshr acc!118 lt!371143)))))

(assert (=> b!235470 (and (bvsge lt!371143 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371143 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235470 (= lt!371143 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235470 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235470 (and (bvsge lt!371139 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371139 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235470 (= lt!371139 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235470 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (= (and d!79420 c!11306) b!235468))

(assert (= (and d!79420 (not c!11306)) b!235464))

(assert (= (and d!79420 res!196867) b!235465))

(assert (= (and b!235465 res!196866) b!235470))

(assert (= (and b!235470 res!196870) b!235466))

(assert (= (and b!235466 res!196868) b!235469))

(assert (= (and b!235469 (not res!196869)) b!235467))

(assert (=> b!235464 m!358073))

(declare-fun m!358129 () Bool)

(assert (=> b!235464 m!358129))

(declare-fun m!358131 () Bool)

(assert (=> b!235465 m!358131))

(assert (=> b!235465 m!358067))

(assert (=> b!235466 m!357987))

(assert (=> b!235467 m!357993))

(assert (=> d!79378 d!79420))

(declare-fun d!79424 () Bool)

(declare-fun e!162771 () Bool)

(assert (=> d!79424 e!162771))

(declare-fun res!196893 () Bool)

(assert (=> d!79424 (=> (not res!196893) (not e!162771))))

(declare-fun increaseBitIndex!0 (BitStream!9844) tuple2!19912)

(assert (=> d!79424 (= res!196893 (= (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63))) (buf!5915 bs!63)))))

(declare-fun lt!371196 () Bool)

(assert (=> d!79424 (= lt!371196 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 bs!63)) (currentByte!11006 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371200 () tuple2!19914)

(assert (=> d!79424 (= lt!371200 (tuple2!19915 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 bs!63)) (currentByte!11006 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 bs!63)))) #b00000000000000000000000000000000)) (_2!10860 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79424 (validate_offset_bit!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63)))))

(assert (=> d!79424 (= (readBit!0 bs!63) lt!371200)))

(declare-fun lt!371202 () (_ BitVec 64))

(declare-fun b!235501 () Bool)

(declare-fun lt!371199 () (_ BitVec 64))

(assert (=> b!235501 (= e!162771 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63)))) (currentByte!11006 (_2!10860 (increaseBitIndex!0 bs!63))) (currentBit!11001 (_2!10860 (increaseBitIndex!0 bs!63)))) (bvadd lt!371199 lt!371202)))))

(assert (=> b!235501 (or (not (= (bvand lt!371199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371199 lt!371202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235501 (= lt!371202 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235501 (= lt!371199 (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)))))

(declare-fun lt!371197 () Bool)

(assert (=> b!235501 (= lt!371197 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 bs!63)) (currentByte!11006 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371198 () Bool)

(assert (=> b!235501 (= lt!371198 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 bs!63)) (currentByte!11006 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371201 () Bool)

(assert (=> b!235501 (= lt!371201 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 bs!63)) (currentByte!11006 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79424 res!196893) b!235501))

(declare-fun m!358147 () Bool)

(assert (=> d!79424 m!358147))

(declare-fun m!358149 () Bool)

(assert (=> d!79424 m!358149))

(declare-fun m!358151 () Bool)

(assert (=> d!79424 m!358151))

(declare-fun m!358153 () Bool)

(assert (=> d!79424 m!358153))

(assert (=> b!235501 m!358067))

(assert (=> b!235501 m!358149))

(assert (=> b!235501 m!358151))

(declare-fun m!358155 () Bool)

(assert (=> b!235501 m!358155))

(assert (=> b!235501 m!358147))

(assert (=> d!79376 d!79424))

(declare-fun d!79428 () Bool)

(assert (=> d!79428 (= (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 bs!63)))))))

(assert (=> d!79382 d!79428))

(declare-fun d!79430 () Bool)

(declare-fun e!162774 () Bool)

(assert (=> d!79430 e!162774))

(declare-fun res!196898 () Bool)

(assert (=> d!79430 (=> (not res!196898) (not e!162774))))

(declare-fun lt!371216 () (_ BitVec 64))

(declare-fun lt!371215 () (_ BitVec 64))

(declare-fun lt!371220 () (_ BitVec 64))

(assert (=> d!79430 (= res!196898 (= lt!371220 (bvsub lt!371215 lt!371216)))))

(assert (=> d!79430 (or (= (bvand lt!371215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371215 lt!371216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79430 (= lt!371216 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 lt!371007))) ((_ sign_extend 32) (currentByte!11006 lt!371007)) ((_ sign_extend 32) (currentBit!11001 lt!371007))))))

(declare-fun lt!371218 () (_ BitVec 64))

(declare-fun lt!371217 () (_ BitVec 64))

(assert (=> d!79430 (= lt!371215 (bvmul lt!371218 lt!371217))))

(assert (=> d!79430 (or (= lt!371218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371217 (bvsdiv (bvmul lt!371218 lt!371217) lt!371218)))))

(assert (=> d!79430 (= lt!371217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79430 (= lt!371218 ((_ sign_extend 32) (size!5440 (buf!5915 lt!371007))))))

(assert (=> d!79430 (= lt!371220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 lt!371007)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 lt!371007))))))

(assert (=> d!79430 (invariant!0 (currentBit!11001 lt!371007) (currentByte!11006 lt!371007) (size!5440 (buf!5915 lt!371007)))))

(assert (=> d!79430 (= (bitIndex!0 (size!5440 (buf!5915 lt!371007)) (currentByte!11006 lt!371007) (currentBit!11001 lt!371007)) lt!371220)))

(declare-fun b!235506 () Bool)

(declare-fun res!196899 () Bool)

(assert (=> b!235506 (=> (not res!196899) (not e!162774))))

(assert (=> b!235506 (= res!196899 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371220))))

(declare-fun b!235507 () Bool)

(declare-fun lt!371219 () (_ BitVec 64))

(assert (=> b!235507 (= e!162774 (bvsle lt!371220 (bvmul lt!371219 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235507 (or (= lt!371219 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371219 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371219)))))

(assert (=> b!235507 (= lt!371219 ((_ sign_extend 32) (size!5440 (buf!5915 lt!371007))))))

(assert (= (and d!79430 res!196898) b!235506))

(assert (= (and b!235506 res!196899) b!235507))

(declare-fun m!358157 () Bool)

(assert (=> d!79430 m!358157))

(declare-fun m!358159 () Bool)

(assert (=> d!79430 m!358159))

(assert (=> d!79362 d!79430))

(declare-fun d!79432 () Bool)

(declare-fun e!162775 () Bool)

(assert (=> d!79432 e!162775))

(declare-fun res!196900 () Bool)

(assert (=> d!79432 (=> (not res!196900) (not e!162775))))

(declare-fun lt!371222 () (_ BitVec 64))

(declare-fun lt!371226 () (_ BitVec 64))

(declare-fun lt!371221 () (_ BitVec 64))

(assert (=> d!79432 (= res!196900 (= lt!371226 (bvsub lt!371221 lt!371222)))))

(assert (=> d!79432 (or (= (bvand lt!371221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371221 lt!371222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79432 (= lt!371222 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))))))

(declare-fun lt!371224 () (_ BitVec 64))

(declare-fun lt!371223 () (_ BitVec 64))

(assert (=> d!79432 (= lt!371221 (bvmul lt!371224 lt!371223))))

(assert (=> d!79432 (or (= lt!371224 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371223 (bvsdiv (bvmul lt!371224 lt!371223) lt!371224)))))

(assert (=> d!79432 (= lt!371223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79432 (= lt!371224 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))))))

(assert (=> d!79432 (= lt!371226 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 bs!63))))))

(assert (=> d!79432 (invariant!0 (currentBit!11001 bs!63) (currentByte!11006 bs!63) (size!5440 (buf!5915 bs!63)))))

(assert (=> d!79432 (= (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)) lt!371226)))

(declare-fun b!235508 () Bool)

(declare-fun res!196901 () Bool)

(assert (=> b!235508 (=> (not res!196901) (not e!162775))))

(assert (=> b!235508 (= res!196901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371226))))

(declare-fun b!235509 () Bool)

(declare-fun lt!371225 () (_ BitVec 64))

(assert (=> b!235509 (= e!162775 (bvsle lt!371226 (bvmul lt!371225 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235509 (or (= lt!371225 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371225 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371225)))))

(assert (=> b!235509 (= lt!371225 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))))))

(assert (= (and d!79432 res!196900) b!235508))

(assert (= (and b!235508 res!196901) b!235509))

(assert (=> d!79432 m!358077))

(assert (=> d!79432 m!358079))

(assert (=> d!79362 d!79432))

(declare-fun d!79434 () Bool)

(declare-fun lt!371304 () (_ BitVec 32))

(assert (=> d!79434 (= lt!371304 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!371300 () (_ BitVec 32))

(assert (=> d!79434 (= lt!371300 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162796 () Bool)

(assert (=> d!79434 e!162796))

(declare-fun res!196934 () Bool)

(assert (=> d!79434 (=> (not res!196934) (not e!162796))))

(assert (=> d!79434 (= res!196934 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17333 () Unit!17323)

(declare-fun Unit!17334 () Unit!17323)

(declare-fun Unit!17335 () Unit!17323)

(assert (=> d!79434 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11001 bs!63) lt!371304) #b00000000000000000000000000000000) (tuple2!19913 Unit!17333 (BitStream!9845 (buf!5915 bs!63) (bvsub (bvadd (currentByte!11006 bs!63) lt!371300) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371304 (currentBit!11001 bs!63)))) (ite (bvsge (bvadd (currentBit!11001 bs!63) lt!371304) #b00000000000000000000000000001000) (tuple2!19913 Unit!17334 (BitStream!9845 (buf!5915 bs!63) (bvadd (currentByte!11006 bs!63) lt!371300 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11001 bs!63) lt!371304) #b00000000000000000000000000001000))) (tuple2!19913 Unit!17335 (BitStream!9845 (buf!5915 bs!63) (bvadd (currentByte!11006 bs!63) lt!371300) (bvadd (currentBit!11001 bs!63) lt!371304))))))))

(declare-fun b!235550 () Bool)

(declare-fun e!162797 () Bool)

(assert (=> b!235550 (= e!162796 e!162797)))

(declare-fun res!196935 () Bool)

(assert (=> b!235550 (=> (not res!196935) (not e!162797))))

(declare-fun lt!371299 () (_ BitVec 64))

(declare-fun lt!371302 () tuple2!19912)

(assert (=> b!235550 (= res!196935 (= (bvadd lt!371299 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5440 (buf!5915 (_2!10860 lt!371302))) (currentByte!11006 (_2!10860 lt!371302)) (currentBit!11001 (_2!10860 lt!371302)))))))

(assert (=> b!235550 (or (not (= (bvand lt!371299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371299 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235550 (= lt!371299 (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)))))

(declare-fun lt!371303 () (_ BitVec 32))

(declare-fun lt!371301 () (_ BitVec 32))

(declare-fun Unit!17336 () Unit!17323)

(declare-fun Unit!17337 () Unit!17323)

(declare-fun Unit!17338 () Unit!17323)

(assert (=> b!235550 (= lt!371302 (ite (bvslt (bvadd (currentBit!11001 bs!63) lt!371303) #b00000000000000000000000000000000) (tuple2!19913 Unit!17336 (BitStream!9845 (buf!5915 bs!63) (bvsub (bvadd (currentByte!11006 bs!63) lt!371301) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371303 (currentBit!11001 bs!63)))) (ite (bvsge (bvadd (currentBit!11001 bs!63) lt!371303) #b00000000000000000000000000001000) (tuple2!19913 Unit!17337 (BitStream!9845 (buf!5915 bs!63) (bvadd (currentByte!11006 bs!63) lt!371301 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11001 bs!63) lt!371303) #b00000000000000000000000000001000))) (tuple2!19913 Unit!17338 (BitStream!9845 (buf!5915 bs!63) (bvadd (currentByte!11006 bs!63) lt!371301) (bvadd (currentBit!11001 bs!63) lt!371303))))))))

(assert (=> b!235550 (= lt!371303 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235550 (= lt!371301 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!235551 () Bool)

(assert (=> b!235551 (= e!162797 (and (= (size!5440 (buf!5915 bs!63)) (size!5440 (buf!5915 (_2!10860 lt!371302)))) (= (buf!5915 bs!63) (buf!5915 (_2!10860 lt!371302)))))))

(assert (= (and d!79434 res!196934) b!235550))

(assert (= (and b!235550 res!196935) b!235551))

(assert (=> d!79434 m!358071))

(declare-fun m!358179 () Bool)

(assert (=> b!235550 m!358179))

(assert (=> b!235550 m!358067))

(assert (=> d!79362 d!79434))

(declare-fun d!79452 () Bool)

(declare-fun res!196938 () Bool)

(declare-fun e!162800 () Bool)

(assert (=> d!79452 (=> (not res!196938) (not e!162800))))

(assert (=> d!79452 (= res!196938 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63)))))))))

(assert (=> d!79452 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162800)))

(declare-fun b!235555 () Bool)

(declare-fun lt!371307 () (_ BitVec 64))

(assert (=> b!235555 (= e!162800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371307) (bvsle lt!371307 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63)))))))))

(assert (=> b!235555 (= lt!371307 (bvadd (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79452 res!196938) b!235555))

(assert (=> b!235555 m!358067))

(assert (=> d!79362 d!79452))

(push 1)

(assert (not d!79430))

(assert (not d!79424))

(assert (not b!235465))

(assert (not b!235459))

(assert (not d!79432))

(assert (not b!235501))

(assert (not b!235458))

(assert (not b!235550))

(assert (not b!235466))

(assert (not d!79434))

(assert (not b!235467))

(assert (not b!235457))

(assert (not b!235555))

(assert (not b!235456))

(assert (not b!235464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79508 () Bool)

(declare-fun e!162840 () Bool)

(assert (=> d!79508 e!162840))

(declare-fun res!197002 () Bool)

(assert (=> d!79508 (=> (not res!197002) (not e!162840))))

(assert (=> d!79508 (= res!197002 (= (buf!5915 (_2!10860 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371471 () Bool)

(assert (=> d!79508 (= lt!371471 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371475 () tuple2!19914)

(assert (=> d!79508 (= lt!371475 (tuple2!19915 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10860 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79508 (validate_offset_bit!0 ((_ sign_extend 32) (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79508 (= (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!371475)))

(declare-fun lt!371477 () (_ BitVec 64))

(declare-fun b!235628 () Bool)

(declare-fun lt!371474 () (_ BitVec 64))

(assert (=> b!235628 (= e!162840 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!11006 (_2!10860 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!11001 (_2!10860 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!371474 lt!371477)))))

(assert (=> b!235628 (or (not (= (bvand lt!371474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371477 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371474 lt!371477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235628 (= lt!371477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235628 (= lt!371474 (bitIndex!0 (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371472 () Bool)

(assert (=> b!235628 (= lt!371472 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371473 () Bool)

(assert (=> b!235628 (= lt!371473 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371476 () Bool)

(assert (=> b!235628 (= lt!371476 (not (= (bvand ((_ sign_extend 24) (select (arr!6427 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!79508 res!197002) b!235628))

(assert (=> d!79508 m!357989))

(declare-fun m!358291 () Bool)

(assert (=> d!79508 m!358291))

(declare-fun m!358293 () Bool)

(assert (=> d!79508 m!358293))

(declare-fun m!358295 () Bool)

(assert (=> d!79508 m!358295))

(declare-fun m!358297 () Bool)

(assert (=> d!79508 m!358297))

(assert (=> b!235628 m!358115))

(assert (=> b!235628 m!358293))

(assert (=> b!235628 m!358295))

(declare-fun m!358299 () Bool)

(assert (=> b!235628 m!358299))

(assert (=> b!235628 m!357989))

(assert (=> b!235628 m!358291))

(assert (=> b!235456 d!79508))

(declare-fun b!235629 () Bool)

(declare-fun e!162843 () tuple2!19910)

(declare-fun lt!371483 () tuple2!19910)

(assert (=> b!235629 (= e!162843 (tuple2!19911 (_1!10859 lt!371483) (_2!10859 lt!371483)))))

(declare-fun lt!371481 () tuple2!19914)

(assert (=> b!235629 (= lt!371481 (readBit!0 (_2!10861 lt!371124)))))

(assert (=> b!235629 (= lt!371483 (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371481) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!118 e!162680) (ite (_1!10861 lt!371124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10861 lt!371481) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79510 () Bool)

(declare-fun e!162842 () Bool)

(assert (=> d!79510 e!162842))

(declare-fun res!197004 () Bool)

(assert (=> d!79510 (=> (not res!197004) (not e!162842))))

(declare-fun lt!371482 () tuple2!19910)

(assert (=> d!79510 (= res!197004 (= (buf!5915 (_2!10859 lt!371482)) (buf!5915 (_2!10861 lt!371124))))))

(assert (=> d!79510 (= lt!371482 e!162843)))

(declare-fun c!11319 () Bool)

(assert (=> d!79510 (= c!11319 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79510 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79510 (= (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371124) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162680) (ite (_1!10861 lt!371124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371482)))

(declare-fun b!235630 () Bool)

(declare-fun res!197003 () Bool)

(assert (=> b!235630 (=> (not res!197003) (not e!162842))))

(declare-fun lt!371479 () (_ BitVec 64))

(declare-fun lt!371485 () (_ BitVec 64))

(assert (=> b!235630 (= res!197003 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371482))) (currentByte!11006 (_2!10859 lt!371482)) (currentBit!11001 (_2!10859 lt!371482))) (bvadd lt!371485 lt!371479)))))

(assert (=> b!235630 (or (not (= (bvand lt!371485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371479 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371485 lt!371479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235630 (= lt!371479 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235630 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235630 (= lt!371485 (bitIndex!0 (size!5440 (buf!5915 (_2!10861 lt!371124))) (currentByte!11006 (_2!10861 lt!371124)) (currentBit!11001 (_2!10861 lt!371124))))))

(declare-fun b!235631 () Bool)

(declare-fun res!197005 () Bool)

(assert (=> b!235631 (=> (not res!197005) (not e!162842))))

(assert (=> b!235631 (= res!197005 (= (bvand (_1!10859 lt!371482) (onesLSBLong!0 nBits!274)) (_1!10859 lt!371482)))))

(declare-fun e!162841 () Bool)

(declare-fun lt!371486 () (_ BitVec 64))

(declare-fun b!235632 () Bool)

(assert (=> b!235632 (= e!162841 (= (= (bvand (bvlshr (_1!10859 lt!371482) lt!371486) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10851 (readBitPure!0 (_2!10861 lt!371124)))))))

(assert (=> b!235632 (and (bvsge lt!371486 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371486 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371478 () (_ BitVec 32))

(assert (=> b!235632 (= lt!371486 ((_ sign_extend 32) (bvsub lt!371478 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235632 (or (= (bvand lt!371478 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371478 #b10000000000000000000000000000000) (bvand (bvsub lt!371478 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235632 (= lt!371478 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235632 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235633 () Bool)

(assert (=> b!235633 (= e!162843 (tuple2!19911 (bvor (bvor acc!118 e!162680) (ite (_1!10861 lt!371124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10861 lt!371124)))))

(declare-fun b!235634 () Bool)

(assert (=> b!235634 (= e!162842 e!162841)))

(declare-fun res!197006 () Bool)

(assert (=> b!235634 (=> res!197006 e!162841)))

(assert (=> b!235634 (= res!197006 (bvsge (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274))))

(declare-fun b!235635 () Bool)

(declare-fun res!197007 () Bool)

(assert (=> b!235635 (=> (not res!197007) (not e!162842))))

(declare-fun lt!371484 () (_ BitVec 64))

(declare-fun lt!371480 () (_ BitVec 64))

(assert (=> b!235635 (= res!197007 (= (bvlshr (_1!10859 lt!371482) lt!371480) (bvlshr (bvor (bvor acc!118 e!162680) (ite (_1!10861 lt!371124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371484)))))

(assert (=> b!235635 (and (bvsge lt!371484 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371484 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235635 (= lt!371484 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235635 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235635 (and (bvsge lt!371480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371480 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235635 (= lt!371480 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235635 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (= (and d!79510 c!11319) b!235633))

(assert (= (and d!79510 (not c!11319)) b!235629))

(assert (= (and d!79510 res!197004) b!235630))

(assert (= (and b!235630 res!197003) b!235635))

(assert (= (and b!235635 res!197007) b!235631))

(assert (= (and b!235631 res!197005) b!235634))

(assert (= (and b!235634 (not res!197006)) b!235632))

(declare-fun m!358301 () Bool)

(assert (=> b!235629 m!358301))

(declare-fun m!358303 () Bool)

(assert (=> b!235629 m!358303))

(declare-fun m!358305 () Bool)

(assert (=> b!235630 m!358305))

(declare-fun m!358307 () Bool)

(assert (=> b!235630 m!358307))

(assert (=> b!235631 m!357987))

(declare-fun m!358309 () Bool)

(assert (=> b!235632 m!358309))

(assert (=> b!235456 d!79510))

(declare-fun d!79512 () Bool)

(declare-fun e!162844 () Bool)

(assert (=> d!79512 e!162844))

(declare-fun res!197008 () Bool)

(assert (=> d!79512 (=> (not res!197008) (not e!162844))))

(declare-fun lt!371488 () (_ BitVec 64))

(declare-fun lt!371487 () (_ BitVec 64))

(declare-fun lt!371492 () (_ BitVec 64))

(assert (=> d!79512 (= res!197008 (= lt!371492 (bvsub lt!371487 lt!371488)))))

(assert (=> d!79512 (or (= (bvand lt!371487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371487 lt!371488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79512 (= lt!371488 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63))))) ((_ sign_extend 32) (currentByte!11006 (_2!10860 (increaseBitIndex!0 bs!63)))) ((_ sign_extend 32) (currentBit!11001 (_2!10860 (increaseBitIndex!0 bs!63))))))))

(declare-fun lt!371490 () (_ BitVec 64))

(declare-fun lt!371489 () (_ BitVec 64))

(assert (=> d!79512 (= lt!371487 (bvmul lt!371490 lt!371489))))

(assert (=> d!79512 (or (= lt!371490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371489 (bvsdiv (bvmul lt!371490 lt!371489) lt!371490)))))

(assert (=> d!79512 (= lt!371489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79512 (= lt!371490 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79512 (= lt!371492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 (_2!10860 (increaseBitIndex!0 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 (_2!10860 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79512 (invariant!0 (currentBit!11001 (_2!10860 (increaseBitIndex!0 bs!63))) (currentByte!11006 (_2!10860 (increaseBitIndex!0 bs!63))) (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63)))))))

(assert (=> d!79512 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63)))) (currentByte!11006 (_2!10860 (increaseBitIndex!0 bs!63))) (currentBit!11001 (_2!10860 (increaseBitIndex!0 bs!63)))) lt!371492)))

(declare-fun b!235636 () Bool)

(declare-fun res!197009 () Bool)

(assert (=> b!235636 (=> (not res!197009) (not e!162844))))

(assert (=> b!235636 (= res!197009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371492))))

(declare-fun b!235637 () Bool)

(declare-fun lt!371491 () (_ BitVec 64))

(assert (=> b!235637 (= e!162844 (bvsle lt!371492 (bvmul lt!371491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235637 (or (= lt!371491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371491)))))

(assert (=> b!235637 (= lt!371491 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 (increaseBitIndex!0 bs!63))))))))

(assert (= (and d!79512 res!197008) b!235636))

(assert (= (and b!235636 res!197009) b!235637))

(declare-fun m!358311 () Bool)

(assert (=> d!79512 m!358311))

(declare-fun m!358313 () Bool)

(assert (=> d!79512 m!358313))

(assert (=> b!235501 d!79512))

(declare-fun d!79514 () Bool)

(declare-fun e!162847 () Bool)

(assert (=> d!79514 e!162847))

(declare-fun res!197015 () Bool)

(assert (=> d!79514 (=> (not res!197015) (not e!162847))))

(declare-fun lt!371507 () (_ BitVec 64))

(declare-fun lt!371504 () (_ BitVec 64))

(declare-fun lt!371506 () tuple2!19912)

(assert (=> d!79514 (= res!197015 (= (bvadd lt!371504 lt!371507) (bitIndex!0 (size!5440 (buf!5915 (_2!10860 lt!371506))) (currentByte!11006 (_2!10860 lt!371506)) (currentBit!11001 (_2!10860 lt!371506)))))))

(assert (=> d!79514 (or (not (= (bvand lt!371504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371507 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371504 lt!371507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79514 (= lt!371507 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79514 (= lt!371504 (bitIndex!0 (size!5440 (buf!5915 bs!63)) (currentByte!11006 bs!63) (currentBit!11001 bs!63)))))

(declare-fun Unit!17349 () Unit!17323)

(declare-fun Unit!17350 () Unit!17323)

(assert (=> d!79514 (= lt!371506 (ite (bvslt (currentBit!11001 bs!63) #b00000000000000000000000000000111) (tuple2!19913 Unit!17349 (BitStream!9845 (buf!5915 bs!63) (currentByte!11006 bs!63) (bvadd (currentBit!11001 bs!63) #b00000000000000000000000000000001))) (tuple2!19913 Unit!17350 (BitStream!9845 (buf!5915 bs!63) (bvadd (currentByte!11006 bs!63) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79514 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79514 (= (increaseBitIndex!0 bs!63) lt!371506)))

(declare-fun b!235642 () Bool)

(declare-fun res!197014 () Bool)

(assert (=> b!235642 (=> (not res!197014) (not e!162847))))

(declare-fun lt!371505 () (_ BitVec 64))

(declare-fun lt!371503 () (_ BitVec 64))

(assert (=> b!235642 (= res!197014 (= (bvsub lt!371505 lt!371503) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!235642 (or (= (bvand lt!371505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371505 lt!371503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235642 (= lt!371503 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 lt!371506)))) ((_ sign_extend 32) (currentByte!11006 (_2!10860 lt!371506))) ((_ sign_extend 32) (currentBit!11001 (_2!10860 lt!371506)))))))

(assert (=> b!235642 (= lt!371505 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))))))

(declare-fun b!235643 () Bool)

(assert (=> b!235643 (= e!162847 (= (size!5440 (buf!5915 bs!63)) (size!5440 (buf!5915 (_2!10860 lt!371506)))))))

(assert (= (and d!79514 res!197015) b!235642))

(assert (= (and b!235642 res!197014) b!235643))

(declare-fun m!358315 () Bool)

(assert (=> d!79514 m!358315))

(assert (=> d!79514 m!358067))

(assert (=> d!79514 m!358077))

(declare-fun m!358317 () Bool)

(assert (=> b!235642 m!358317))

(assert (=> b!235642 m!358077))

(assert (=> b!235501 d!79514))

(assert (=> b!235501 d!79432))

(declare-fun d!79516 () Bool)

(declare-fun e!162848 () Bool)

(assert (=> d!79516 e!162848))

(declare-fun res!197016 () Bool)

(assert (=> d!79516 (=> (not res!197016) (not e!162848))))

(declare-fun lt!371509 () (_ BitVec 64))

(declare-fun lt!371513 () (_ BitVec 64))

(declare-fun lt!371508 () (_ BitVec 64))

(assert (=> d!79516 (= res!197016 (= lt!371513 (bvsub lt!371508 lt!371509)))))

(assert (=> d!79516 (or (= (bvand lt!371508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371508 lt!371509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79516 (= lt!371509 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371125)))) ((_ sign_extend 32) (currentByte!11006 (_2!10859 lt!371125))) ((_ sign_extend 32) (currentBit!11001 (_2!10859 lt!371125)))))))

(declare-fun lt!371511 () (_ BitVec 64))

(declare-fun lt!371510 () (_ BitVec 64))

(assert (=> d!79516 (= lt!371508 (bvmul lt!371511 lt!371510))))

(assert (=> d!79516 (or (= lt!371511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371510 (bvsdiv (bvmul lt!371511 lt!371510) lt!371511)))))

(assert (=> d!79516 (= lt!371510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79516 (= lt!371511 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371125)))))))

(assert (=> d!79516 (= lt!371513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 (_2!10859 lt!371125))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 (_2!10859 lt!371125)))))))

(assert (=> d!79516 (invariant!0 (currentBit!11001 (_2!10859 lt!371125)) (currentByte!11006 (_2!10859 lt!371125)) (size!5440 (buf!5915 (_2!10859 lt!371125))))))

(assert (=> d!79516 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371125))) (currentByte!11006 (_2!10859 lt!371125)) (currentBit!11001 (_2!10859 lt!371125))) lt!371513)))

(declare-fun b!235644 () Bool)

(declare-fun res!197017 () Bool)

(assert (=> b!235644 (=> (not res!197017) (not e!162848))))

(assert (=> b!235644 (= res!197017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371513))))

(declare-fun b!235645 () Bool)

(declare-fun lt!371512 () (_ BitVec 64))

(assert (=> b!235645 (= e!162848 (bvsle lt!371513 (bvmul lt!371512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235645 (or (= lt!371512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371512)))))

(assert (=> b!235645 (= lt!371512 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371125)))))))

(assert (= (and d!79516 res!197016) b!235644))

(assert (= (and b!235644 res!197017) b!235645))

(declare-fun m!358319 () Bool)

(assert (=> d!79516 m!358319))

(declare-fun m!358321 () Bool)

(assert (=> d!79516 m!358321))

(assert (=> b!235457 d!79516))

(declare-fun d!79518 () Bool)

(declare-fun e!162849 () Bool)

(assert (=> d!79518 e!162849))

(declare-fun res!197018 () Bool)

(assert (=> d!79518 (=> (not res!197018) (not e!162849))))

(declare-fun lt!371519 () (_ BitVec 64))

(declare-fun lt!371514 () (_ BitVec 64))

(declare-fun lt!371515 () (_ BitVec 64))

(assert (=> d!79518 (= res!197018 (= lt!371519 (bvsub lt!371514 lt!371515)))))

(assert (=> d!79518 (or (= (bvand lt!371514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371514 lt!371515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79518 (= lt!371515 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!371517 () (_ BitVec 64))

(declare-fun lt!371516 () (_ BitVec 64))

(assert (=> d!79518 (= lt!371514 (bvmul lt!371517 lt!371516))))

(assert (=> d!79518 (or (= lt!371517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371516 (bvsdiv (bvmul lt!371517 lt!371516) lt!371517)))))

(assert (=> d!79518 (= lt!371516 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79518 (= lt!371517 ((_ sign_extend 32) (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79518 (= lt!371519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79518 (invariant!0 (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79518 (= (bitIndex!0 (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11006 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11001 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!371519)))

(declare-fun b!235646 () Bool)

(declare-fun res!197019 () Bool)

(assert (=> b!235646 (=> (not res!197019) (not e!162849))))

(assert (=> b!235646 (= res!197019 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371519))))

(declare-fun b!235647 () Bool)

(declare-fun lt!371518 () (_ BitVec 64))

(assert (=> b!235647 (= e!162849 (bvsle lt!371519 (bvmul lt!371518 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235647 (or (= lt!371518 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371518 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371518)))))

(assert (=> b!235647 (= lt!371518 ((_ sign_extend 32) (size!5440 (buf!5915 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!79518 res!197018) b!235646))

(assert (= (and b!235646 res!197019) b!235647))

(declare-fun m!358323 () Bool)

(assert (=> d!79518 m!358323))

(declare-fun m!358325 () Bool)

(assert (=> d!79518 m!358325))

(assert (=> b!235457 d!79518))

(declare-fun d!79520 () Bool)

(assert (=> d!79520 (= (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 lt!371007))) ((_ sign_extend 32) (currentByte!11006 lt!371007)) ((_ sign_extend 32) (currentBit!11001 lt!371007))) (bvsub (bvmul ((_ sign_extend 32) (size!5440 (buf!5915 lt!371007))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 lt!371007)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 lt!371007)))))))

(assert (=> d!79430 d!79520))

(declare-fun d!79522 () Bool)

(assert (=> d!79522 (= (invariant!0 (currentBit!11001 lt!371007) (currentByte!11006 lt!371007) (size!5440 (buf!5915 lt!371007))) (and (bvsge (currentBit!11001 lt!371007) #b00000000000000000000000000000000) (bvslt (currentBit!11001 lt!371007) #b00000000000000000000000000001000) (bvsge (currentByte!11006 lt!371007) #b00000000000000000000000000000000) (or (bvslt (currentByte!11006 lt!371007) (size!5440 (buf!5915 lt!371007))) (and (= (currentBit!11001 lt!371007) #b00000000000000000000000000000000) (= (currentByte!11006 lt!371007) (size!5440 (buf!5915 lt!371007)))))))))

(assert (=> d!79430 d!79522))

(assert (=> d!79424 d!79514))

(declare-fun d!79524 () Bool)

(assert (=> d!79524 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 bs!63))) ((_ sign_extend 32) (currentByte!11006 bs!63)) ((_ sign_extend 32) (currentBit!11001 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19820 () Bool)

(assert (= bs!19820 d!79524))

(assert (=> bs!19820 m!358077))

(assert (=> d!79424 d!79524))

(assert (=> b!235467 d!79376))

(assert (=> d!79434 d!79452))

(assert (=> d!79432 d!79428))

(assert (=> d!79432 d!79412))

(declare-fun d!79526 () Bool)

(declare-fun e!162850 () Bool)

(assert (=> d!79526 e!162850))

(declare-fun res!197020 () Bool)

(assert (=> d!79526 (=> (not res!197020) (not e!162850))))

(declare-fun lt!371525 () (_ BitVec 64))

(declare-fun lt!371521 () (_ BitVec 64))

(declare-fun lt!371520 () (_ BitVec 64))

(assert (=> d!79526 (= res!197020 (= lt!371525 (bvsub lt!371520 lt!371521)))))

(assert (=> d!79526 (or (= (bvand lt!371520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371520 lt!371521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79526 (= lt!371521 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371141)))) ((_ sign_extend 32) (currentByte!11006 (_2!10859 lt!371141))) ((_ sign_extend 32) (currentBit!11001 (_2!10859 lt!371141)))))))

(declare-fun lt!371523 () (_ BitVec 64))

(declare-fun lt!371522 () (_ BitVec 64))

(assert (=> d!79526 (= lt!371520 (bvmul lt!371523 lt!371522))))

(assert (=> d!79526 (or (= lt!371523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371522 (bvsdiv (bvmul lt!371523 lt!371522) lt!371523)))))

(assert (=> d!79526 (= lt!371522 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79526 (= lt!371523 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371141)))))))

(assert (=> d!79526 (= lt!371525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 (_2!10859 lt!371141))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 (_2!10859 lt!371141)))))))

(assert (=> d!79526 (invariant!0 (currentBit!11001 (_2!10859 lt!371141)) (currentByte!11006 (_2!10859 lt!371141)) (size!5440 (buf!5915 (_2!10859 lt!371141))))))

(assert (=> d!79526 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371141))) (currentByte!11006 (_2!10859 lt!371141)) (currentBit!11001 (_2!10859 lt!371141))) lt!371525)))

(declare-fun b!235648 () Bool)

(declare-fun res!197021 () Bool)

(assert (=> b!235648 (=> (not res!197021) (not e!162850))))

(assert (=> b!235648 (= res!197021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371525))))

(declare-fun b!235649 () Bool)

(declare-fun lt!371524 () (_ BitVec 64))

(assert (=> b!235649 (= e!162850 (bvsle lt!371525 (bvmul lt!371524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235649 (or (= lt!371524 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371524 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371524)))))

(assert (=> b!235649 (= lt!371524 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10859 lt!371141)))))))

(assert (= (and d!79526 res!197020) b!235648))

(assert (= (and b!235648 res!197021) b!235649))

(declare-fun m!358327 () Bool)

(assert (=> d!79526 m!358327))

(declare-fun m!358329 () Bool)

(assert (=> d!79526 m!358329))

(assert (=> b!235465 d!79526))

(assert (=> b!235465 d!79432))

(assert (=> b!235466 d!79380))

(assert (=> b!235464 d!79424))

(declare-fun b!235650 () Bool)

(declare-fun e!162853 () tuple2!19910)

(declare-fun lt!371531 () tuple2!19910)

(assert (=> b!235650 (= e!162853 (tuple2!19911 (_1!10859 lt!371531) (_2!10859 lt!371531)))))

(declare-fun lt!371529 () tuple2!19914)

(assert (=> b!235650 (= lt!371529 (readBit!0 (_2!10861 lt!371140)))))

(assert (=> b!235650 (= lt!371531 (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371529) nBits!274 (bvadd i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!118 (ite (_1!10861 lt!371140) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10861 lt!371529) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79528 () Bool)

(declare-fun e!162852 () Bool)

(assert (=> d!79528 e!162852))

(declare-fun res!197023 () Bool)

(assert (=> d!79528 (=> (not res!197023) (not e!162852))))

(declare-fun lt!371530 () tuple2!19910)

(assert (=> d!79528 (= res!197023 (= (buf!5915 (_2!10859 lt!371530)) (buf!5915 (_2!10861 lt!371140))))))

(assert (=> d!79528 (= lt!371530 e!162853)))

(declare-fun c!11320 () Bool)

(assert (=> d!79528 (= c!11320 (= nBits!274 (bvadd i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79528 (and (bvsle #b00000000000000000000000000000000 (bvadd i!546 #b00000000000000000000000000000001)) (bvsle (bvadd i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79528 (= (readNLeastSignificantBitsLoop!0 (_2!10861 lt!371140) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10861 lt!371140) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371530)))

(declare-fun b!235651 () Bool)

(declare-fun res!197022 () Bool)

(assert (=> b!235651 (=> (not res!197022) (not e!162852))))

(declare-fun lt!371527 () (_ BitVec 64))

(declare-fun lt!371533 () (_ BitVec 64))

(assert (=> b!235651 (= res!197022 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10859 lt!371530))) (currentByte!11006 (_2!10859 lt!371530)) (currentBit!11001 (_2!10859 lt!371530))) (bvadd lt!371533 lt!371527)))))

(assert (=> b!235651 (or (not (= (bvand lt!371533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371527 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371533 lt!371527) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235651 (= lt!371527 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235651 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235651 (= lt!371533 (bitIndex!0 (size!5440 (buf!5915 (_2!10861 lt!371140))) (currentByte!11006 (_2!10861 lt!371140)) (currentBit!11001 (_2!10861 lt!371140))))))

(declare-fun b!235652 () Bool)

(declare-fun res!197024 () Bool)

(assert (=> b!235652 (=> (not res!197024) (not e!162852))))

(assert (=> b!235652 (= res!197024 (= (bvand (_1!10859 lt!371530) (onesLSBLong!0 nBits!274)) (_1!10859 lt!371530)))))

(declare-fun e!162851 () Bool)

(declare-fun lt!371534 () (_ BitVec 64))

(declare-fun b!235653 () Bool)

(assert (=> b!235653 (= e!162851 (= (= (bvand (bvlshr (_1!10859 lt!371530) lt!371534) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10851 (readBitPure!0 (_2!10861 lt!371140)))))))

(assert (=> b!235653 (and (bvsge lt!371534 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371534 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371526 () (_ BitVec 32))

(assert (=> b!235653 (= lt!371534 ((_ sign_extend 32) (bvsub lt!371526 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235653 (or (= (bvand lt!371526 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371526 #b10000000000000000000000000000000) (bvand (bvsub lt!371526 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235653 (= lt!371526 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235653 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235654 () Bool)

(assert (=> b!235654 (= e!162853 (tuple2!19911 (bvor acc!118 (ite (_1!10861 lt!371140) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10861 lt!371140)))))

(declare-fun b!235655 () Bool)

(assert (=> b!235655 (= e!162852 e!162851)))

(declare-fun res!197025 () Bool)

(assert (=> b!235655 (=> res!197025 e!162851)))

(assert (=> b!235655 (= res!197025 (bvsge (bvadd i!546 #b00000000000000000000000000000001) nBits!274))))

(declare-fun b!235656 () Bool)

(declare-fun res!197026 () Bool)

(assert (=> b!235656 (=> (not res!197026) (not e!162852))))

(declare-fun lt!371532 () (_ BitVec 64))

(declare-fun lt!371528 () (_ BitVec 64))

(assert (=> b!235656 (= res!197026 (= (bvlshr (_1!10859 lt!371530) lt!371528) (bvlshr (bvor acc!118 (ite (_1!10861 lt!371140) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371532)))))

(assert (=> b!235656 (and (bvsge lt!371532 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371532 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235656 (= lt!371532 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235656 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235656 (and (bvsge lt!371528 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371528 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235656 (= lt!371528 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235656 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (= (and d!79528 c!11320) b!235654))

(assert (= (and d!79528 (not c!11320)) b!235650))

(assert (= (and d!79528 res!197023) b!235651))

(assert (= (and b!235651 res!197022) b!235656))

(assert (= (and b!235656 res!197026) b!235652))

(assert (= (and b!235652 res!197024) b!235655))

(assert (= (and b!235655 (not res!197025)) b!235653))

(declare-fun m!358331 () Bool)

(assert (=> b!235650 m!358331))

(declare-fun m!358333 () Bool)

(assert (=> b!235650 m!358333))

(declare-fun m!358335 () Bool)

(assert (=> b!235651 m!358335))

(declare-fun m!358337 () Bool)

(assert (=> b!235651 m!358337))

(assert (=> b!235652 m!357987))

(declare-fun m!358339 () Bool)

(assert (=> b!235653 m!358339))

(assert (=> b!235464 d!79528))

(declare-fun d!79530 () Bool)

(declare-fun lt!371535 () tuple2!19914)

(assert (=> d!79530 (= lt!371535 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!79530 (= (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!19895 (_2!10861 lt!371535) (_1!10861 lt!371535)))))

(declare-fun bs!19821 () Bool)

(assert (= bs!19821 d!79530))

(assert (=> bs!19821 m!357989))

(assert (=> bs!19821 m!358109))

(assert (=> b!235459 d!79530))

(assert (=> b!235555 d!79432))

(declare-fun d!79532 () Bool)

(declare-fun e!162854 () Bool)

(assert (=> d!79532 e!162854))

(declare-fun res!197027 () Bool)

(assert (=> d!79532 (=> (not res!197027) (not e!162854))))

(declare-fun lt!371537 () (_ BitVec 64))

(declare-fun lt!371536 () (_ BitVec 64))

(declare-fun lt!371541 () (_ BitVec 64))

(assert (=> d!79532 (= res!197027 (= lt!371541 (bvsub lt!371536 lt!371537)))))

(assert (=> d!79532 (or (= (bvand lt!371536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371536 lt!371537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79532 (= lt!371537 (remainingBits!0 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 lt!371302)))) ((_ sign_extend 32) (currentByte!11006 (_2!10860 lt!371302))) ((_ sign_extend 32) (currentBit!11001 (_2!10860 lt!371302)))))))

(declare-fun lt!371539 () (_ BitVec 64))

(declare-fun lt!371538 () (_ BitVec 64))

(assert (=> d!79532 (= lt!371536 (bvmul lt!371539 lt!371538))))

(assert (=> d!79532 (or (= lt!371539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371538 (bvsdiv (bvmul lt!371539 lt!371538) lt!371539)))))

(assert (=> d!79532 (= lt!371538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79532 (= lt!371539 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 lt!371302)))))))

(assert (=> d!79532 (= lt!371541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11006 (_2!10860 lt!371302))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11001 (_2!10860 lt!371302)))))))

(assert (=> d!79532 (invariant!0 (currentBit!11001 (_2!10860 lt!371302)) (currentByte!11006 (_2!10860 lt!371302)) (size!5440 (buf!5915 (_2!10860 lt!371302))))))

(assert (=> d!79532 (= (bitIndex!0 (size!5440 (buf!5915 (_2!10860 lt!371302))) (currentByte!11006 (_2!10860 lt!371302)) (currentBit!11001 (_2!10860 lt!371302))) lt!371541)))

(declare-fun b!235657 () Bool)

(declare-fun res!197028 () Bool)

(assert (=> b!235657 (=> (not res!197028) (not e!162854))))

(assert (=> b!235657 (= res!197028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371541))))

(declare-fun b!235658 () Bool)

(declare-fun lt!371540 () (_ BitVec 64))

(assert (=> b!235658 (= e!162854 (bvsle lt!371541 (bvmul lt!371540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235658 (or (= lt!371540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371540)))))

(assert (=> b!235658 (= lt!371540 ((_ sign_extend 32) (size!5440 (buf!5915 (_2!10860 lt!371302)))))))

(assert (= (and d!79532 res!197027) b!235657))

(assert (= (and b!235657 res!197028) b!235658))

(declare-fun m!358341 () Bool)

(assert (=> d!79532 m!358341))

(declare-fun m!358343 () Bool)

(assert (=> d!79532 m!358343))

(assert (=> b!235550 d!79532))

(assert (=> b!235550 d!79432))

(assert (=> b!235458 d!79380))

(push 1)

(assert (not b!235653))

(assert (not b!235632))

(assert (not b!235629))

(assert (not b!235651))

(assert (not d!79512))

(assert (not d!79526))

(assert (not d!79514))

(assert (not b!235631))

(assert (not d!79524))

(assert (not b!235628))

(assert (not d!79516))

(assert (not d!79530))

(assert (not d!79532))

(assert (not b!235642))

(assert (not d!79518))

(assert (not b!235630))

(assert (not b!235652))

(assert (not b!235650))

(assert (not d!79508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

