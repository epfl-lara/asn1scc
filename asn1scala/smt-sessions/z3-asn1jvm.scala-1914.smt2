; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50056 () Bool)

(assert start!50056)

(declare-fun b!235382 () Bool)

(declare-fun e!162692 () (_ BitVec 64))

(assert (=> b!235382 (= e!162692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!235383 () Bool)

(declare-fun res!196806 () Bool)

(declare-fun e!162691 () Bool)

(assert (=> b!235383 (=> (not res!196806) (not e!162691))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235383 (= res!196806 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196803 () Bool)

(assert (=> start!50056 (=> (not res!196803) (not e!162691))))

(assert (=> start!50056 (= res!196803 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50056 e!162691))

(assert (=> start!50056 true))

(declare-datatypes ((array!12385 0))(
  ( (array!12386 (arr!6428 (Array (_ BitVec 32) (_ BitVec 8))) (size!5441 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9846 0))(
  ( (BitStream!9847 (buf!5916 array!12385) (currentByte!11007 (_ BitVec 32)) (currentBit!11002 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9846)

(declare-fun e!162690 () Bool)

(declare-fun inv!12 (BitStream!9846) Bool)

(assert (=> start!50056 (and (inv!12 bs!63) e!162690)))

(declare-fun b!235384 () Bool)

(declare-fun array_inv!5182 (array!12385) Bool)

(assert (=> b!235384 (= e!162690 (array_inv!5182 (buf!5916 bs!63)))))

(declare-fun b!235385 () Bool)

(declare-fun res!196804 () Bool)

(assert (=> b!235385 (=> (not res!196804) (not e!162691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235385 (= res!196804 (validate_offset_bits!1 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235386 () Bool)

(declare-fun res!196805 () Bool)

(assert (=> b!235386 (=> (not res!196805) (not e!162691))))

(assert (=> b!235386 (= res!196805 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235387 () Bool)

(assert (=> b!235387 (= e!162692 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235388 () Bool)

(declare-datatypes ((tuple2!19896 0))(
  ( (tuple2!19897 (_1!10852 BitStream!9846) (_2!10852 (_ BitVec 64))) )
))
(declare-fun lt!370976 () tuple2!19896)

(declare-fun lt!370977 () tuple2!19896)

(assert (=> b!235388 (= e!162691 (or (not (= (_2!10852 lt!370976) (_2!10852 lt!370977))) (not (= (_1!10852 lt!370976) (_1!10852 lt!370977)))))))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19896)

(declare-fun withMovedBitIndex!0 (BitStream!9846 (_ BitVec 64)) BitStream!9846)

(assert (=> b!235388 (= lt!370977 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162692)))))

(declare-fun c!11299 () Bool)

(declare-datatypes ((tuple2!19898 0))(
  ( (tuple2!19899 (_1!10853 BitStream!9846) (_2!10853 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9846) tuple2!19898)

(assert (=> b!235388 (= c!11299 (_2!10853 (readBitPure!0 bs!63)))))

(assert (=> b!235388 (= lt!370976 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!50056 res!196803) b!235385))

(assert (= (and b!235385 res!196804) b!235383))

(assert (= (and b!235383 res!196806) b!235386))

(assert (= (and b!235386 res!196805) b!235388))

(assert (= (and b!235388 c!11299) b!235387))

(assert (= (and b!235388 (not c!11299)) b!235382))

(assert (= start!50056 b!235384))

(declare-fun m!358003 () Bool)

(assert (=> b!235384 m!358003))

(declare-fun m!358005 () Bool)

(assert (=> b!235386 m!358005))

(declare-fun m!358007 () Bool)

(assert (=> b!235385 m!358007))

(declare-fun m!358009 () Bool)

(assert (=> b!235383 m!358009))

(declare-fun m!358011 () Bool)

(assert (=> start!50056 m!358011))

(declare-fun m!358013 () Bool)

(assert (=> b!235388 m!358013))

(assert (=> b!235388 m!358013))

(declare-fun m!358015 () Bool)

(assert (=> b!235388 m!358015))

(declare-fun m!358017 () Bool)

(assert (=> b!235388 m!358017))

(declare-fun m!358019 () Bool)

(assert (=> b!235388 m!358019))

(check-sat (not b!235384) (not b!235386) (not b!235385) (not start!50056) (not b!235388) (not b!235383))
(check-sat)
(get-model)

(declare-fun d!79342 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79342 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19801 () Bool)

(assert (= bs!19801 d!79342))

(declare-fun m!358039 () Bool)

(assert (=> bs!19801 m!358039))

(assert (=> b!235385 d!79342))

(declare-fun d!79344 () Bool)

(assert (=> d!79344 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!235383 d!79344))

(declare-fun d!79346 () Bool)

(assert (=> d!79346 (= (array_inv!5182 (buf!5916 bs!63)) (bvsge (size!5441 (buf!5916 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!235384 d!79346))

(declare-fun d!79348 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79348 (= (inv!12 bs!63) (invariant!0 (currentBit!11002 bs!63) (currentByte!11007 bs!63) (size!5441 (buf!5916 bs!63))))))

(declare-fun bs!19802 () Bool)

(assert (= bs!19802 d!79348))

(declare-fun m!358041 () Bool)

(assert (=> bs!19802 m!358041))

(assert (=> start!50056 d!79348))

(declare-datatypes ((tuple2!19904 0))(
  ( (tuple2!19905 (_1!10856 (_ BitVec 64)) (_2!10856 BitStream!9846)) )
))
(declare-fun lt!370986 () tuple2!19904)

(declare-fun d!79350 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19904)

(assert (=> d!79350 (= lt!370986 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162692)))))

(assert (=> d!79350 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162692)) (tuple2!19897 (_2!10856 lt!370986) (_1!10856 lt!370986)))))

(declare-fun bs!19803 () Bool)

(assert (= bs!19803 d!79350))

(assert (=> bs!19803 m!358013))

(declare-fun m!358043 () Bool)

(assert (=> bs!19803 m!358043))

(assert (=> b!235388 d!79350))

(declare-fun d!79352 () Bool)

(declare-fun e!162707 () Bool)

(assert (=> d!79352 e!162707))

(declare-fun res!196821 () Bool)

(assert (=> d!79352 (=> (not res!196821) (not e!162707))))

(declare-fun lt!370992 () (_ BitVec 64))

(declare-fun lt!370991 () BitStream!9846)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79352 (= res!196821 (= (bvadd lt!370992 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5441 (buf!5916 lt!370991)) (currentByte!11007 lt!370991) (currentBit!11002 lt!370991))))))

(assert (=> d!79352 (or (not (= (bvand lt!370992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370992 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79352 (= lt!370992 (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)))))

(declare-datatypes ((Unit!17321 0))(
  ( (Unit!17322) )
))
(declare-datatypes ((tuple2!19906 0))(
  ( (tuple2!19907 (_1!10857 Unit!17321) (_2!10857 BitStream!9846)) )
))
(declare-fun moveBitIndex!0 (BitStream!9846 (_ BitVec 64)) tuple2!19906)

(assert (=> d!79352 (= lt!370991 (_2!10857 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9846 (_ BitVec 64)) Bool)

(assert (=> d!79352 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79352 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370991)))

(declare-fun b!235412 () Bool)

(assert (=> b!235412 (= e!162707 (= (size!5441 (buf!5916 bs!63)) (size!5441 (buf!5916 lt!370991))))))

(assert (= (and d!79352 res!196821) b!235412))

(declare-fun m!358045 () Bool)

(assert (=> d!79352 m!358045))

(declare-fun m!358047 () Bool)

(assert (=> d!79352 m!358047))

(declare-fun m!358049 () Bool)

(assert (=> d!79352 m!358049))

(declare-fun m!358051 () Bool)

(assert (=> d!79352 m!358051))

(assert (=> b!235388 d!79352))

(declare-fun d!79354 () Bool)

(declare-datatypes ((tuple2!19908 0))(
  ( (tuple2!19909 (_1!10858 Bool) (_2!10858 BitStream!9846)) )
))
(declare-fun lt!370995 () tuple2!19908)

(declare-fun readBit!0 (BitStream!9846) tuple2!19908)

(assert (=> d!79354 (= lt!370995 (readBit!0 bs!63))))

(assert (=> d!79354 (= (readBitPure!0 bs!63) (tuple2!19899 (_2!10858 lt!370995) (_1!10858 lt!370995)))))

(declare-fun bs!19804 () Bool)

(assert (= bs!19804 d!79354))

(declare-fun m!358053 () Bool)

(assert (=> bs!19804 m!358053))

(assert (=> b!235388 d!79354))

(declare-fun d!79356 () Bool)

(declare-fun lt!370996 () tuple2!19904)

(assert (=> d!79356 (= lt!370996 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79356 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19897 (_2!10856 lt!370996) (_1!10856 lt!370996)))))

(declare-fun bs!19805 () Bool)

(assert (= bs!19805 d!79356))

(declare-fun m!358055 () Bool)

(assert (=> bs!19805 m!358055))

(assert (=> b!235388 d!79356))

(declare-fun d!79358 () Bool)

(assert (=> d!79358 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!235386 d!79358))

(check-sat (not d!79350) (not d!79352) (not d!79348) (not d!79342) (not d!79354) (not d!79356))
(check-sat)
(get-model)

(declare-fun d!79396 () Bool)

(assert (=> d!79396 (= (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 bs!63)))))))

(assert (=> d!79342 d!79396))

(declare-fun d!79398 () Bool)

(assert (=> d!79398 (= (invariant!0 (currentBit!11002 bs!63) (currentByte!11007 bs!63) (size!5441 (buf!5916 bs!63))) (and (bvsge (currentBit!11002 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!11002 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!11007 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!11007 bs!63) (size!5441 (buf!5916 bs!63))) (and (= (currentBit!11002 bs!63) #b00000000000000000000000000000000) (= (currentByte!11007 bs!63) (size!5441 (buf!5916 bs!63)))))))))

(assert (=> d!79348 d!79398))

(declare-fun d!79400 () Bool)

(declare-fun e!162716 () Bool)

(assert (=> d!79400 e!162716))

(declare-fun res!196833 () Bool)

(assert (=> d!79400 (=> (not res!196833) (not e!162716))))

(declare-fun lt!371039 () (_ BitVec 64))

(declare-fun lt!371038 () (_ BitVec 64))

(declare-fun lt!371037 () (_ BitVec 64))

(assert (=> d!79400 (= res!196833 (= lt!371038 (bvsub lt!371039 lt!371037)))))

(assert (=> d!79400 (or (= (bvand lt!371039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371039 lt!371037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79400 (= lt!371037 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 lt!370991))) ((_ sign_extend 32) (currentByte!11007 lt!370991)) ((_ sign_extend 32) (currentBit!11002 lt!370991))))))

(declare-fun lt!371040 () (_ BitVec 64))

(declare-fun lt!371035 () (_ BitVec 64))

(assert (=> d!79400 (= lt!371039 (bvmul lt!371040 lt!371035))))

(assert (=> d!79400 (or (= lt!371040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371035 (bvsdiv (bvmul lt!371040 lt!371035) lt!371040)))))

(assert (=> d!79400 (= lt!371035 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79400 (= lt!371040 ((_ sign_extend 32) (size!5441 (buf!5916 lt!370991))))))

(assert (=> d!79400 (= lt!371038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 lt!370991)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 lt!370991))))))

(assert (=> d!79400 (invariant!0 (currentBit!11002 lt!370991) (currentByte!11007 lt!370991) (size!5441 (buf!5916 lt!370991)))))

(assert (=> d!79400 (= (bitIndex!0 (size!5441 (buf!5916 lt!370991)) (currentByte!11007 lt!370991) (currentBit!11002 lt!370991)) lt!371038)))

(declare-fun b!235423 () Bool)

(declare-fun res!196832 () Bool)

(assert (=> b!235423 (=> (not res!196832) (not e!162716))))

(assert (=> b!235423 (= res!196832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371038))))

(declare-fun b!235424 () Bool)

(declare-fun lt!371036 () (_ BitVec 64))

(assert (=> b!235424 (= e!162716 (bvsle lt!371038 (bvmul lt!371036 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235424 (or (= lt!371036 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371036 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371036)))))

(assert (=> b!235424 (= lt!371036 ((_ sign_extend 32) (size!5441 (buf!5916 lt!370991))))))

(assert (= (and d!79400 res!196833) b!235423))

(assert (= (and b!235423 res!196832) b!235424))

(declare-fun m!358093 () Bool)

(assert (=> d!79400 m!358093))

(declare-fun m!358095 () Bool)

(assert (=> d!79400 m!358095))

(assert (=> d!79352 d!79400))

(declare-fun d!79402 () Bool)

(declare-fun e!162717 () Bool)

(assert (=> d!79402 e!162717))

(declare-fun res!196835 () Bool)

(assert (=> d!79402 (=> (not res!196835) (not e!162717))))

(declare-fun lt!371045 () (_ BitVec 64))

(declare-fun lt!371044 () (_ BitVec 64))

(declare-fun lt!371043 () (_ BitVec 64))

(assert (=> d!79402 (= res!196835 (= lt!371044 (bvsub lt!371045 lt!371043)))))

(assert (=> d!79402 (or (= (bvand lt!371045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371045 lt!371043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79402 (= lt!371043 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))))))

(declare-fun lt!371046 () (_ BitVec 64))

(declare-fun lt!371041 () (_ BitVec 64))

(assert (=> d!79402 (= lt!371045 (bvmul lt!371046 lt!371041))))

(assert (=> d!79402 (or (= lt!371046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371041 (bvsdiv (bvmul lt!371046 lt!371041) lt!371046)))))

(assert (=> d!79402 (= lt!371041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79402 (= lt!371046 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))))))

(assert (=> d!79402 (= lt!371044 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 bs!63))))))

(assert (=> d!79402 (invariant!0 (currentBit!11002 bs!63) (currentByte!11007 bs!63) (size!5441 (buf!5916 bs!63)))))

(assert (=> d!79402 (= (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)) lt!371044)))

(declare-fun b!235425 () Bool)

(declare-fun res!196834 () Bool)

(assert (=> b!235425 (=> (not res!196834) (not e!162717))))

(assert (=> b!235425 (= res!196834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371044))))

(declare-fun b!235426 () Bool)

(declare-fun lt!371042 () (_ BitVec 64))

(assert (=> b!235426 (= e!162717 (bvsle lt!371044 (bvmul lt!371042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235426 (or (= lt!371042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371042)))))

(assert (=> b!235426 (= lt!371042 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))))))

(assert (= (and d!79402 res!196835) b!235425))

(assert (= (and b!235425 res!196834) b!235426))

(assert (=> d!79402 m!358039))

(assert (=> d!79402 m!358041))

(assert (=> d!79352 d!79402))

(declare-fun d!79404 () Bool)

(declare-fun lt!371061 () (_ BitVec 32))

(assert (=> d!79404 (= lt!371061 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!371062 () (_ BitVec 32))

(assert (=> d!79404 (= lt!371062 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!162723 () Bool)

(assert (=> d!79404 e!162723))

(declare-fun res!196841 () Bool)

(assert (=> d!79404 (=> (not res!196841) (not e!162723))))

(assert (=> d!79404 (= res!196841 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!17327 () Unit!17321)

(declare-fun Unit!17328 () Unit!17321)

(declare-fun Unit!17329 () Unit!17321)

(assert (=> d!79404 (= (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11002 bs!63) lt!371061) #b00000000000000000000000000000000) (tuple2!19907 Unit!17327 (BitStream!9847 (buf!5916 bs!63) (bvsub (bvadd (currentByte!11007 bs!63) lt!371062) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371061 (currentBit!11002 bs!63)))) (ite (bvsge (bvadd (currentBit!11002 bs!63) lt!371061) #b00000000000000000000000000001000) (tuple2!19907 Unit!17328 (BitStream!9847 (buf!5916 bs!63) (bvadd (currentByte!11007 bs!63) lt!371062 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11002 bs!63) lt!371061) #b00000000000000000000000000001000))) (tuple2!19907 Unit!17329 (BitStream!9847 (buf!5916 bs!63) (bvadd (currentByte!11007 bs!63) lt!371062) (bvadd (currentBit!11002 bs!63) lt!371061))))))))

(declare-fun b!235431 () Bool)

(declare-fun e!162722 () Bool)

(assert (=> b!235431 (= e!162723 e!162722)))

(declare-fun res!196840 () Bool)

(assert (=> b!235431 (=> (not res!196840) (not e!162722))))

(declare-fun lt!371060 () (_ BitVec 64))

(declare-fun lt!371064 () tuple2!19906)

(assert (=> b!235431 (= res!196840 (= (bvadd lt!371060 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5441 (buf!5916 (_2!10857 lt!371064))) (currentByte!11007 (_2!10857 lt!371064)) (currentBit!11002 (_2!10857 lt!371064)))))))

(assert (=> b!235431 (or (not (= (bvand lt!371060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371060 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235431 (= lt!371060 (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)))))

(declare-fun lt!371059 () (_ BitVec 32))

(declare-fun lt!371063 () (_ BitVec 32))

(declare-fun Unit!17330 () Unit!17321)

(declare-fun Unit!17331 () Unit!17321)

(declare-fun Unit!17332 () Unit!17321)

(assert (=> b!235431 (= lt!371064 (ite (bvslt (bvadd (currentBit!11002 bs!63) lt!371059) #b00000000000000000000000000000000) (tuple2!19907 Unit!17330 (BitStream!9847 (buf!5916 bs!63) (bvsub (bvadd (currentByte!11007 bs!63) lt!371063) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!371059 (currentBit!11002 bs!63)))) (ite (bvsge (bvadd (currentBit!11002 bs!63) lt!371059) #b00000000000000000000000000001000) (tuple2!19907 Unit!17331 (BitStream!9847 (buf!5916 bs!63) (bvadd (currentByte!11007 bs!63) lt!371063 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11002 bs!63) lt!371059) #b00000000000000000000000000001000))) (tuple2!19907 Unit!17332 (BitStream!9847 (buf!5916 bs!63) (bvadd (currentByte!11007 bs!63) lt!371063) (bvadd (currentBit!11002 bs!63) lt!371059))))))))

(assert (=> b!235431 (= lt!371059 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235431 (= lt!371063 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!235432 () Bool)

(assert (=> b!235432 (= e!162722 (and (= (size!5441 (buf!5916 bs!63)) (size!5441 (buf!5916 (_2!10857 lt!371064)))) (= (buf!5916 bs!63) (buf!5916 (_2!10857 lt!371064)))))))

(assert (= (and d!79404 res!196841) b!235431))

(assert (= (and b!235431 res!196840) b!235432))

(assert (=> d!79404 m!358051))

(declare-fun m!358097 () Bool)

(assert (=> b!235431 m!358097))

(assert (=> b!235431 m!358047))

(assert (=> d!79352 d!79404))

(declare-fun d!79408 () Bool)

(declare-fun res!196844 () Bool)

(declare-fun e!162726 () Bool)

(assert (=> d!79408 (=> (not res!196844) (not e!162726))))

(assert (=> d!79408 (= res!196844 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63)))))))))

(assert (=> d!79408 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162726)))

(declare-fun b!235436 () Bool)

(declare-fun lt!371067 () (_ BitVec 64))

(assert (=> b!235436 (= e!162726 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371067) (bvsle lt!371067 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63)))))))))

(assert (=> b!235436 (= lt!371067 (bvadd (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79408 res!196844) b!235436))

(assert (=> b!235436 m!358047))

(assert (=> d!79352 d!79408))

(declare-fun d!79410 () Bool)

(declare-fun e!162733 () Bool)

(assert (=> d!79410 e!162733))

(declare-fun res!196847 () Bool)

(assert (=> d!79410 (=> (not res!196847) (not e!162733))))

(declare-fun increaseBitIndex!0 (BitStream!9846) tuple2!19906)

(assert (=> d!79410 (= res!196847 (= (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63))) (buf!5916 bs!63)))))

(declare-fun lt!371083 () Bool)

(assert (=> d!79410 (= lt!371083 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 bs!63)) (currentByte!11007 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371087 () tuple2!19908)

(assert (=> d!79410 (= lt!371087 (tuple2!19909 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 bs!63)) (currentByte!11007 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 bs!63)))) #b00000000000000000000000000000000)) (_2!10857 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79410 (validate_offset_bit!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63)))))

(assert (=> d!79410 (= (readBit!0 bs!63) lt!371087)))

(declare-fun lt!371084 () (_ BitVec 64))

(declare-fun lt!371086 () (_ BitVec 64))

(declare-fun b!235439 () Bool)

(assert (=> b!235439 (= e!162733 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63)))) (currentByte!11007 (_2!10857 (increaseBitIndex!0 bs!63))) (currentBit!11002 (_2!10857 (increaseBitIndex!0 bs!63)))) (bvadd lt!371086 lt!371084)))))

(assert (=> b!235439 (or (not (= (bvand lt!371086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371086 lt!371084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235439 (= lt!371084 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235439 (= lt!371086 (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)))))

(declare-fun lt!371082 () Bool)

(assert (=> b!235439 (= lt!371082 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 bs!63)) (currentByte!11007 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371085 () Bool)

(assert (=> b!235439 (= lt!371085 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 bs!63)) (currentByte!11007 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371088 () Bool)

(assert (=> b!235439 (= lt!371088 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 bs!63)) (currentByte!11007 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79410 res!196847) b!235439))

(declare-fun m!358099 () Bool)

(assert (=> d!79410 m!358099))

(declare-fun m!358101 () Bool)

(assert (=> d!79410 m!358101))

(declare-fun m!358103 () Bool)

(assert (=> d!79410 m!358103))

(declare-fun m!358105 () Bool)

(assert (=> d!79410 m!358105))

(assert (=> b!235439 m!358047))

(declare-fun m!358107 () Bool)

(assert (=> b!235439 m!358107))

(assert (=> b!235439 m!358101))

(assert (=> b!235439 m!358099))

(assert (=> b!235439 m!358103))

(assert (=> d!79354 d!79410))

(declare-fun b!235485 () Bool)

(declare-fun res!196881 () Bool)

(declare-fun e!162759 () Bool)

(assert (=> b!235485 (=> (not res!196881) (not e!162759))))

(declare-fun lt!371170 () tuple2!19904)

(assert (=> b!235485 (= res!196881 (= (bvand (_1!10856 lt!371170) (onesLSBLong!0 nBits!274)) (_1!10856 lt!371170)))))

(declare-fun b!235486 () Bool)

(declare-fun res!196885 () Bool)

(assert (=> b!235486 (=> (not res!196885) (not e!162759))))

(declare-fun lt!371168 () (_ BitVec 64))

(declare-fun lt!371166 () (_ BitVec 64))

(assert (=> b!235486 (= res!196885 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371170))) (currentByte!11007 (_2!10856 lt!371170)) (currentBit!11002 (_2!10856 lt!371170))) (bvadd lt!371168 lt!371166)))))

(assert (=> b!235486 (or (not (= (bvand lt!371168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371166 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371168 lt!371166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235486 (= lt!371166 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235486 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235486 (= lt!371168 (bitIndex!0 (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun d!79416 () Bool)

(assert (=> d!79416 e!162759))

(declare-fun res!196882 () Bool)

(assert (=> d!79416 (=> (not res!196882) (not e!162759))))

(assert (=> d!79416 (= res!196882 (= (buf!5916 (_2!10856 lt!371170)) (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!162760 () tuple2!19904)

(assert (=> d!79416 (= lt!371170 e!162760)))

(declare-fun c!11309 () Bool)

(assert (=> d!79416 (= c!11309 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(assert (=> d!79416 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)) (bvsle (bvadd #b00000000000000000000000000000001 i!546) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79416 (= (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162692)) lt!371170)))

(declare-fun b!235487 () Bool)

(declare-fun lt!371167 () tuple2!19904)

(assert (=> b!235487 (= e!162760 (tuple2!19905 (_1!10856 lt!371167) (_2!10856 lt!371167)))))

(declare-fun lt!371172 () tuple2!19908)

(assert (=> b!235487 (= lt!371172 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!235487 (= lt!371167 (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371172) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162692) (ite (_1!10858 lt!371172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!162761 () Bool)

(declare-fun b!235488 () Bool)

(declare-fun lt!371169 () (_ BitVec 64))

(assert (=> b!235488 (= e!162761 (= (= (bvand (bvlshr (_1!10856 lt!371170) lt!371169) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10853 (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!235488 (and (bvsge lt!371169 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371169 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371164 () (_ BitVec 32))

(assert (=> b!235488 (= lt!371169 ((_ sign_extend 32) (bvsub lt!371164 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235488 (or (= (bvand lt!371164 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand lt!371164 #b10000000000000000000000000000000) (bvand (bvsub lt!371164 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235488 (= lt!371164 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235488 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235489 () Bool)

(declare-fun res!196884 () Bool)

(assert (=> b!235489 (=> (not res!196884) (not e!162759))))

(declare-fun lt!371171 () (_ BitVec 64))

(declare-fun lt!371165 () (_ BitVec 64))

(assert (=> b!235489 (= res!196884 (= (bvlshr (_1!10856 lt!371170) lt!371171) (bvlshr (bvor acc!118 e!162692) lt!371165)))))

(assert (=> b!235489 (and (bvsge lt!371165 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371165 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235489 (= lt!371165 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235489 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(assert (=> b!235489 (and (bvsge lt!371171 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371171 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235489 (= lt!371171 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546))))))

(assert (=> b!235489 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)) #b10000000000000000000000000000000)))))

(declare-fun b!235490 () Bool)

(assert (=> b!235490 (= e!162759 e!162761)))

(declare-fun res!196883 () Bool)

(assert (=> b!235490 (=> res!196883 e!162761)))

(assert (=> b!235490 (= res!196883 (bvsge (bvadd #b00000000000000000000000000000001 i!546) nBits!274))))

(declare-fun b!235491 () Bool)

(assert (=> b!235491 (= e!162760 (tuple2!19905 (bvor acc!118 e!162692) (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!79416 c!11309) b!235491))

(assert (= (and d!79416 (not c!11309)) b!235487))

(assert (= (and d!79416 res!196882) b!235486))

(assert (= (and b!235486 res!196885) b!235489))

(assert (= (and b!235489 res!196884) b!235485))

(assert (= (and b!235485 res!196881) b!235490))

(assert (= (and b!235490 (not res!196883)) b!235488))

(assert (=> b!235485 m!358005))

(declare-fun m!358133 () Bool)

(assert (=> b!235486 m!358133))

(declare-fun m!358135 () Bool)

(assert (=> b!235486 m!358135))

(assert (=> b!235487 m!358013))

(declare-fun m!358137 () Bool)

(assert (=> b!235487 m!358137))

(declare-fun m!358139 () Bool)

(assert (=> b!235487 m!358139))

(assert (=> b!235488 m!358013))

(declare-fun m!358141 () Bool)

(assert (=> b!235488 m!358141))

(assert (=> d!79350 d!79416))

(declare-fun b!235492 () Bool)

(declare-fun res!196886 () Bool)

(declare-fun e!162766 () Bool)

(assert (=> b!235492 (=> (not res!196886) (not e!162766))))

(declare-fun lt!371179 () tuple2!19904)

(assert (=> b!235492 (= res!196886 (= (bvand (_1!10856 lt!371179) (onesLSBLong!0 nBits!274)) (_1!10856 lt!371179)))))

(declare-fun b!235493 () Bool)

(declare-fun res!196890 () Bool)

(assert (=> b!235493 (=> (not res!196890) (not e!162766))))

(declare-fun lt!371175 () (_ BitVec 64))

(declare-fun lt!371177 () (_ BitVec 64))

(assert (=> b!235493 (= res!196890 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371179))) (currentByte!11007 (_2!10856 lt!371179)) (currentBit!11002 (_2!10856 lt!371179))) (bvadd lt!371177 lt!371175)))))

(assert (=> b!235493 (or (not (= (bvand lt!371177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371177 lt!371175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235493 (= lt!371175 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235493 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235493 (= lt!371177 (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)))))

(declare-fun d!79426 () Bool)

(assert (=> d!79426 e!162766))

(declare-fun res!196887 () Bool)

(assert (=> d!79426 (=> (not res!196887) (not e!162766))))

(assert (=> d!79426 (= res!196887 (= (buf!5916 (_2!10856 lt!371179)) (buf!5916 bs!63)))))

(declare-fun e!162767 () tuple2!19904)

(assert (=> d!79426 (= lt!371179 e!162767)))

(declare-fun c!11310 () Bool)

(assert (=> d!79426 (= c!11310 (= nBits!274 i!546))))

(assert (=> d!79426 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79426 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!371179)))

(declare-fun b!235494 () Bool)

(declare-fun lt!371176 () tuple2!19904)

(assert (=> b!235494 (= e!162767 (tuple2!19905 (_1!10856 lt!371176) (_2!10856 lt!371176)))))

(declare-fun lt!371181 () tuple2!19908)

(assert (=> b!235494 (= lt!371181 (readBit!0 bs!63))))

(assert (=> b!235494 (= lt!371176 (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371181) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10858 lt!371181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235495 () Bool)

(declare-fun e!162768 () Bool)

(declare-fun lt!371178 () (_ BitVec 64))

(assert (=> b!235495 (= e!162768 (= (= (bvand (bvlshr (_1!10856 lt!371179) lt!371178) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10853 (readBitPure!0 bs!63))))))

(assert (=> b!235495 (and (bvsge lt!371178 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371178 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371173 () (_ BitVec 32))

(assert (=> b!235495 (= lt!371178 ((_ sign_extend 32) (bvsub lt!371173 i!546)))))

(assert (=> b!235495 (or (= (bvand lt!371173 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!371173 #b10000000000000000000000000000000) (bvand (bvsub lt!371173 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235495 (= lt!371173 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235495 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235496 () Bool)

(declare-fun res!196889 () Bool)

(assert (=> b!235496 (=> (not res!196889) (not e!162766))))

(declare-fun lt!371180 () (_ BitVec 64))

(declare-fun lt!371174 () (_ BitVec 64))

(assert (=> b!235496 (= res!196889 (= (bvlshr (_1!10856 lt!371179) lt!371180) (bvlshr acc!118 lt!371174)))))

(assert (=> b!235496 (and (bvsge lt!371174 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371174 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235496 (= lt!371174 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235496 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!235496 (and (bvsge lt!371180 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371180 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235496 (= lt!371180 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!235496 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!235497 () Bool)

(assert (=> b!235497 (= e!162766 e!162768)))

(declare-fun res!196888 () Bool)

(assert (=> b!235497 (=> res!196888 e!162768)))

(assert (=> b!235497 (= res!196888 (bvsge i!546 nBits!274))))

(declare-fun b!235498 () Bool)

(assert (=> b!235498 (= e!162767 (tuple2!19905 acc!118 bs!63))))

(assert (= (and d!79426 c!11310) b!235498))

(assert (= (and d!79426 (not c!11310)) b!235494))

(assert (= (and d!79426 res!196887) b!235493))

(assert (= (and b!235493 res!196890) b!235496))

(assert (= (and b!235496 res!196889) b!235492))

(assert (= (and b!235492 res!196886) b!235497))

(assert (= (and b!235497 (not res!196888)) b!235495))

(assert (=> b!235492 m!358005))

(declare-fun m!358143 () Bool)

(assert (=> b!235493 m!358143))

(assert (=> b!235493 m!358047))

(assert (=> b!235494 m!358053))

(declare-fun m!358145 () Bool)

(assert (=> b!235494 m!358145))

(assert (=> b!235495 m!358017))

(assert (=> d!79356 d!79426))

(check-sat (not d!79404) (not d!79400) (not b!235494) (not b!235486) (not b!235485) (not b!235487) (not b!235492) (not d!79402) (not b!235436) (not b!235439) (not b!235495) (not b!235493) (not d!79410) (not b!235488) (not b!235431))
(check-sat)
(get-model)

(assert (=> d!79402 d!79396))

(assert (=> d!79402 d!79398))

(declare-fun d!79482 () Bool)

(declare-fun e!162825 () Bool)

(assert (=> d!79482 e!162825))

(declare-fun res!196975 () Bool)

(assert (=> d!79482 (=> (not res!196975) (not e!162825))))

(assert (=> d!79482 (= res!196975 (= (buf!5916 (_2!10857 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371401 () Bool)

(assert (=> d!79482 (= lt!371401 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371405 () tuple2!19908)

(assert (=> d!79482 (= lt!371405 (tuple2!19909 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10857 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79482 (validate_offset_bit!0 ((_ sign_extend 32) (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79482 (= (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!371405)))

(declare-fun lt!371402 () (_ BitVec 64))

(declare-fun b!235597 () Bool)

(declare-fun lt!371404 () (_ BitVec 64))

(assert (=> b!235597 (= e!162825 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!11007 (_2!10857 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!11002 (_2!10857 (increaseBitIndex!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!371404 lt!371402)))))

(assert (=> b!235597 (or (not (= (bvand lt!371404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371402 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371404 lt!371402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235597 (= lt!371402 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!235597 (= lt!371404 (bitIndex!0 (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!371400 () Bool)

(assert (=> b!235597 (= lt!371400 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371403 () Bool)

(assert (=> b!235597 (= lt!371403 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!371406 () Bool)

(assert (=> b!235597 (= lt!371406 (not (= (bvand ((_ sign_extend 24) (select (arr!6428 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!79482 res!196975) b!235597))

(assert (=> d!79482 m!358013))

(declare-fun m!358237 () Bool)

(assert (=> d!79482 m!358237))

(declare-fun m!358239 () Bool)

(assert (=> d!79482 m!358239))

(declare-fun m!358241 () Bool)

(assert (=> d!79482 m!358241))

(declare-fun m!358243 () Bool)

(assert (=> d!79482 m!358243))

(assert (=> b!235597 m!358135))

(declare-fun m!358245 () Bool)

(assert (=> b!235597 m!358245))

(assert (=> b!235597 m!358239))

(assert (=> b!235597 m!358013))

(assert (=> b!235597 m!358237))

(assert (=> b!235597 m!358241))

(assert (=> b!235487 d!79482))

(declare-fun b!235598 () Bool)

(declare-fun res!196976 () Bool)

(declare-fun e!162826 () Bool)

(assert (=> b!235598 (=> (not res!196976) (not e!162826))))

(declare-fun lt!371413 () tuple2!19904)

(assert (=> b!235598 (= res!196976 (= (bvand (_1!10856 lt!371413) (onesLSBLong!0 nBits!274)) (_1!10856 lt!371413)))))

(declare-fun b!235599 () Bool)

(declare-fun res!196980 () Bool)

(assert (=> b!235599 (=> (not res!196980) (not e!162826))))

(declare-fun lt!371409 () (_ BitVec 64))

(declare-fun lt!371411 () (_ BitVec 64))

(assert (=> b!235599 (= res!196980 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371413))) (currentByte!11007 (_2!10856 lt!371413)) (currentBit!11002 (_2!10856 lt!371413))) (bvadd lt!371411 lt!371409)))))

(assert (=> b!235599 (or (not (= (bvand lt!371411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371409 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371411 lt!371409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235599 (= lt!371409 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235599 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235599 (= lt!371411 (bitIndex!0 (size!5441 (buf!5916 (_2!10858 lt!371172))) (currentByte!11007 (_2!10858 lt!371172)) (currentBit!11002 (_2!10858 lt!371172))))))

(declare-fun d!79484 () Bool)

(assert (=> d!79484 e!162826))

(declare-fun res!196977 () Bool)

(assert (=> d!79484 (=> (not res!196977) (not e!162826))))

(assert (=> d!79484 (= res!196977 (= (buf!5916 (_2!10856 lt!371413)) (buf!5916 (_2!10858 lt!371172))))))

(declare-fun e!162827 () tuple2!19904)

(assert (=> d!79484 (= lt!371413 e!162827)))

(declare-fun c!11317 () Bool)

(assert (=> d!79484 (= c!11317 (= nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79484 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79484 (= (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371172) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) (bvor (bvor acc!118 e!162692) (ite (_1!10858 lt!371172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371413)))

(declare-fun b!235600 () Bool)

(declare-fun lt!371410 () tuple2!19904)

(assert (=> b!235600 (= e!162827 (tuple2!19905 (_1!10856 lt!371410) (_2!10856 lt!371410)))))

(declare-fun lt!371415 () tuple2!19908)

(assert (=> b!235600 (= lt!371415 (readBit!0 (_2!10858 lt!371172)))))

(assert (=> b!235600 (= lt!371410 (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371415) nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!118 e!162692) (ite (_1!10858 lt!371172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10858 lt!371415) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235601 () Bool)

(declare-fun e!162828 () Bool)

(declare-fun lt!371412 () (_ BitVec 64))

(assert (=> b!235601 (= e!162828 (= (= (bvand (bvlshr (_1!10856 lt!371413) lt!371412) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10853 (readBitPure!0 (_2!10858 lt!371172)))))))

(assert (=> b!235601 (and (bvsge lt!371412 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371412 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371407 () (_ BitVec 32))

(assert (=> b!235601 (= lt!371412 ((_ sign_extend 32) (bvsub lt!371407 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235601 (or (= (bvand lt!371407 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371407 #b10000000000000000000000000000000) (bvand (bvsub lt!371407 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235601 (= lt!371407 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235601 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235602 () Bool)

(declare-fun res!196979 () Bool)

(assert (=> b!235602 (=> (not res!196979) (not e!162826))))

(declare-fun lt!371414 () (_ BitVec 64))

(declare-fun lt!371408 () (_ BitVec 64))

(assert (=> b!235602 (= res!196979 (= (bvlshr (_1!10856 lt!371413) lt!371414) (bvlshr (bvor (bvor acc!118 e!162692) (ite (_1!10858 lt!371172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371408)))))

(assert (=> b!235602 (and (bvsge lt!371408 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371408 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235602 (= lt!371408 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235602 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235602 (and (bvsge lt!371414 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371414 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235602 (= lt!371414 ((_ sign_extend 32) (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235602 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!235603 () Bool)

(assert (=> b!235603 (= e!162826 e!162828)))

(declare-fun res!196978 () Bool)

(assert (=> b!235603 (=> res!196978 e!162828)))

(assert (=> b!235603 (= res!196978 (bvsge (bvadd #b00000000000000000000000000000001 i!546 #b00000000000000000000000000000001) nBits!274))))

(declare-fun b!235604 () Bool)

(assert (=> b!235604 (= e!162827 (tuple2!19905 (bvor (bvor acc!118 e!162692) (ite (_1!10858 lt!371172) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!546)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10858 lt!371172)))))

(assert (= (and d!79484 c!11317) b!235604))

(assert (= (and d!79484 (not c!11317)) b!235600))

(assert (= (and d!79484 res!196977) b!235599))

(assert (= (and b!235599 res!196980) b!235602))

(assert (= (and b!235602 res!196979) b!235598))

(assert (= (and b!235598 res!196976) b!235603))

(assert (= (and b!235603 (not res!196978)) b!235601))

(assert (=> b!235598 m!358005))

(declare-fun m!358247 () Bool)

(assert (=> b!235599 m!358247))

(declare-fun m!358249 () Bool)

(assert (=> b!235599 m!358249))

(declare-fun m!358251 () Bool)

(assert (=> b!235600 m!358251))

(declare-fun m!358253 () Bool)

(assert (=> b!235600 m!358253))

(declare-fun m!358255 () Bool)

(assert (=> b!235601 m!358255))

(assert (=> b!235487 d!79484))

(declare-fun d!79486 () Bool)

(declare-fun e!162831 () Bool)

(assert (=> d!79486 e!162831))

(declare-fun res!196986 () Bool)

(assert (=> d!79486 (=> (not res!196986) (not e!162831))))

(declare-fun lt!371429 () (_ BitVec 64))

(declare-fun lt!371428 () (_ BitVec 64))

(declare-fun lt!371430 () tuple2!19906)

(assert (=> d!79486 (= res!196986 (= (bvadd lt!371428 lt!371429) (bitIndex!0 (size!5441 (buf!5916 (_2!10857 lt!371430))) (currentByte!11007 (_2!10857 lt!371430)) (currentBit!11002 (_2!10857 lt!371430)))))))

(assert (=> d!79486 (or (not (= (bvand lt!371428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371429 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371428 lt!371429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79486 (= lt!371429 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79486 (= lt!371428 (bitIndex!0 (size!5441 (buf!5916 bs!63)) (currentByte!11007 bs!63) (currentBit!11002 bs!63)))))

(declare-fun Unit!17347 () Unit!17321)

(declare-fun Unit!17348 () Unit!17321)

(assert (=> d!79486 (= lt!371430 (ite (bvslt (currentBit!11002 bs!63) #b00000000000000000000000000000111) (tuple2!19907 Unit!17347 (BitStream!9847 (buf!5916 bs!63) (currentByte!11007 bs!63) (bvadd (currentBit!11002 bs!63) #b00000000000000000000000000000001))) (tuple2!19907 Unit!17348 (BitStream!9847 (buf!5916 bs!63) (bvadd (currentByte!11007 bs!63) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79486 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79486 (= (increaseBitIndex!0 bs!63) lt!371430)))

(declare-fun b!235609 () Bool)

(declare-fun res!196985 () Bool)

(assert (=> b!235609 (=> (not res!196985) (not e!162831))))

(declare-fun lt!371427 () (_ BitVec 64))

(declare-fun lt!371426 () (_ BitVec 64))

(assert (=> b!235609 (= res!196985 (= (bvsub lt!371427 lt!371426) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!235609 (or (= (bvand lt!371427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371427 lt!371426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235609 (= lt!371426 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 lt!371430)))) ((_ sign_extend 32) (currentByte!11007 (_2!10857 lt!371430))) ((_ sign_extend 32) (currentBit!11002 (_2!10857 lt!371430)))))))

(assert (=> b!235609 (= lt!371427 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))))))

(declare-fun b!235610 () Bool)

(assert (=> b!235610 (= e!162831 (= (size!5441 (buf!5916 bs!63)) (size!5441 (buf!5916 (_2!10857 lt!371430)))))))

(assert (= (and d!79486 res!196986) b!235609))

(assert (= (and b!235609 res!196985) b!235610))

(declare-fun m!358257 () Bool)

(assert (=> d!79486 m!358257))

(assert (=> d!79486 m!358047))

(assert (=> d!79486 m!358039))

(declare-fun m!358259 () Bool)

(assert (=> b!235609 m!358259))

(assert (=> b!235609 m!358039))

(assert (=> d!79410 d!79486))

(declare-fun d!79488 () Bool)

(assert (=> d!79488 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 bs!63))) ((_ sign_extend 32) (currentByte!11007 bs!63)) ((_ sign_extend 32) (currentBit!11002 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19818 () Bool)

(assert (= bs!19818 d!79488))

(assert (=> bs!19818 m!358039))

(assert (=> d!79410 d!79488))

(declare-fun d!79490 () Bool)

(assert (=> d!79490 (= (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 lt!370991))) ((_ sign_extend 32) (currentByte!11007 lt!370991)) ((_ sign_extend 32) (currentBit!11002 lt!370991))) (bvsub (bvmul ((_ sign_extend 32) (size!5441 (buf!5916 lt!370991))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 lt!370991)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 lt!370991)))))))

(assert (=> d!79400 d!79490))

(declare-fun d!79492 () Bool)

(assert (=> d!79492 (= (invariant!0 (currentBit!11002 lt!370991) (currentByte!11007 lt!370991) (size!5441 (buf!5916 lt!370991))) (and (bvsge (currentBit!11002 lt!370991) #b00000000000000000000000000000000) (bvslt (currentBit!11002 lt!370991) #b00000000000000000000000000001000) (bvsge (currentByte!11007 lt!370991) #b00000000000000000000000000000000) (or (bvslt (currentByte!11007 lt!370991) (size!5441 (buf!5916 lt!370991))) (and (= (currentBit!11002 lt!370991) #b00000000000000000000000000000000) (= (currentByte!11007 lt!370991) (size!5441 (buf!5916 lt!370991)))))))))

(assert (=> d!79400 d!79492))

(declare-fun d!79494 () Bool)

(declare-fun lt!371431 () tuple2!19908)

(assert (=> d!79494 (= lt!371431 (readBit!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!79494 (= (readBitPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!19899 (_2!10858 lt!371431) (_1!10858 lt!371431)))))

(declare-fun bs!19819 () Bool)

(assert (= bs!19819 d!79494))

(assert (=> bs!19819 m!358013))

(assert (=> bs!19819 m!358137))

(assert (=> b!235488 d!79494))

(declare-fun d!79496 () Bool)

(declare-fun e!162832 () Bool)

(assert (=> d!79496 e!162832))

(declare-fun res!196988 () Bool)

(assert (=> d!79496 (=> (not res!196988) (not e!162832))))

(declare-fun lt!371435 () (_ BitVec 64))

(declare-fun lt!371436 () (_ BitVec 64))

(declare-fun lt!371434 () (_ BitVec 64))

(assert (=> d!79496 (= res!196988 (= lt!371435 (bvsub lt!371436 lt!371434)))))

(assert (=> d!79496 (or (= (bvand lt!371436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371436 lt!371434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79496 (= lt!371434 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371170)))) ((_ sign_extend 32) (currentByte!11007 (_2!10856 lt!371170))) ((_ sign_extend 32) (currentBit!11002 (_2!10856 lt!371170)))))))

(declare-fun lt!371437 () (_ BitVec 64))

(declare-fun lt!371432 () (_ BitVec 64))

(assert (=> d!79496 (= lt!371436 (bvmul lt!371437 lt!371432))))

(assert (=> d!79496 (or (= lt!371437 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371432 (bvsdiv (bvmul lt!371437 lt!371432) lt!371437)))))

(assert (=> d!79496 (= lt!371432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79496 (= lt!371437 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371170)))))))

(assert (=> d!79496 (= lt!371435 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 (_2!10856 lt!371170))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 (_2!10856 lt!371170)))))))

(assert (=> d!79496 (invariant!0 (currentBit!11002 (_2!10856 lt!371170)) (currentByte!11007 (_2!10856 lt!371170)) (size!5441 (buf!5916 (_2!10856 lt!371170))))))

(assert (=> d!79496 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371170))) (currentByte!11007 (_2!10856 lt!371170)) (currentBit!11002 (_2!10856 lt!371170))) lt!371435)))

(declare-fun b!235611 () Bool)

(declare-fun res!196987 () Bool)

(assert (=> b!235611 (=> (not res!196987) (not e!162832))))

(assert (=> b!235611 (= res!196987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371435))))

(declare-fun b!235612 () Bool)

(declare-fun lt!371433 () (_ BitVec 64))

(assert (=> b!235612 (= e!162832 (bvsle lt!371435 (bvmul lt!371433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235612 (or (= lt!371433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371433)))))

(assert (=> b!235612 (= lt!371433 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371170)))))))

(assert (= (and d!79496 res!196988) b!235611))

(assert (= (and b!235611 res!196987) b!235612))

(declare-fun m!358261 () Bool)

(assert (=> d!79496 m!358261))

(declare-fun m!358263 () Bool)

(assert (=> d!79496 m!358263))

(assert (=> b!235486 d!79496))

(declare-fun d!79498 () Bool)

(declare-fun e!162833 () Bool)

(assert (=> d!79498 e!162833))

(declare-fun res!196990 () Bool)

(assert (=> d!79498 (=> (not res!196990) (not e!162833))))

(declare-fun lt!371442 () (_ BitVec 64))

(declare-fun lt!371441 () (_ BitVec 64))

(declare-fun lt!371440 () (_ BitVec 64))

(assert (=> d!79498 (= res!196990 (= lt!371441 (bvsub lt!371442 lt!371440)))))

(assert (=> d!79498 (or (= (bvand lt!371442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371442 lt!371440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79498 (= lt!371440 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!371443 () (_ BitVec 64))

(declare-fun lt!371438 () (_ BitVec 64))

(assert (=> d!79498 (= lt!371442 (bvmul lt!371443 lt!371438))))

(assert (=> d!79498 (or (= lt!371443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371438 (bvsdiv (bvmul lt!371443 lt!371438) lt!371443)))))

(assert (=> d!79498 (= lt!371438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79498 (= lt!371443 ((_ sign_extend 32) (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79498 (= lt!371441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!79498 (invariant!0 (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!79498 (= (bitIndex!0 (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!11007 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!11002 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!371441)))

(declare-fun b!235613 () Bool)

(declare-fun res!196989 () Bool)

(assert (=> b!235613 (=> (not res!196989) (not e!162833))))

(assert (=> b!235613 (= res!196989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371441))))

(declare-fun b!235614 () Bool)

(declare-fun lt!371439 () (_ BitVec 64))

(assert (=> b!235614 (= e!162833 (bvsle lt!371441 (bvmul lt!371439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235614 (or (= lt!371439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371439)))))

(assert (=> b!235614 (= lt!371439 ((_ sign_extend 32) (size!5441 (buf!5916 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!79498 res!196990) b!235613))

(assert (= (and b!235613 res!196989) b!235614))

(declare-fun m!358265 () Bool)

(assert (=> d!79498 m!358265))

(declare-fun m!358267 () Bool)

(assert (=> d!79498 m!358267))

(assert (=> b!235486 d!79498))

(assert (=> b!235495 d!79354))

(declare-fun d!79500 () Bool)

(declare-fun e!162834 () Bool)

(assert (=> d!79500 e!162834))

(declare-fun res!196992 () Bool)

(assert (=> d!79500 (=> (not res!196992) (not e!162834))))

(declare-fun lt!371447 () (_ BitVec 64))

(declare-fun lt!371448 () (_ BitVec 64))

(declare-fun lt!371446 () (_ BitVec 64))

(assert (=> d!79500 (= res!196992 (= lt!371447 (bvsub lt!371448 lt!371446)))))

(assert (=> d!79500 (or (= (bvand lt!371448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371448 lt!371446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79500 (= lt!371446 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63))))) ((_ sign_extend 32) (currentByte!11007 (_2!10857 (increaseBitIndex!0 bs!63)))) ((_ sign_extend 32) (currentBit!11002 (_2!10857 (increaseBitIndex!0 bs!63))))))))

(declare-fun lt!371449 () (_ BitVec 64))

(declare-fun lt!371444 () (_ BitVec 64))

(assert (=> d!79500 (= lt!371448 (bvmul lt!371449 lt!371444))))

(assert (=> d!79500 (or (= lt!371449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371444 (bvsdiv (bvmul lt!371449 lt!371444) lt!371449)))))

(assert (=> d!79500 (= lt!371444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79500 (= lt!371449 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79500 (= lt!371447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 (_2!10857 (increaseBitIndex!0 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 (_2!10857 (increaseBitIndex!0 bs!63))))))))

(assert (=> d!79500 (invariant!0 (currentBit!11002 (_2!10857 (increaseBitIndex!0 bs!63))) (currentByte!11007 (_2!10857 (increaseBitIndex!0 bs!63))) (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63)))))))

(assert (=> d!79500 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63)))) (currentByte!11007 (_2!10857 (increaseBitIndex!0 bs!63))) (currentBit!11002 (_2!10857 (increaseBitIndex!0 bs!63)))) lt!371447)))

(declare-fun b!235615 () Bool)

(declare-fun res!196991 () Bool)

(assert (=> b!235615 (=> (not res!196991) (not e!162834))))

(assert (=> b!235615 (= res!196991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371447))))

(declare-fun b!235616 () Bool)

(declare-fun lt!371445 () (_ BitVec 64))

(assert (=> b!235616 (= e!162834 (bvsle lt!371447 (bvmul lt!371445 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235616 (or (= lt!371445 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371445 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371445)))))

(assert (=> b!235616 (= lt!371445 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 (increaseBitIndex!0 bs!63))))))))

(assert (= (and d!79500 res!196992) b!235615))

(assert (= (and b!235615 res!196991) b!235616))

(declare-fun m!358269 () Bool)

(assert (=> d!79500 m!358269))

(declare-fun m!358271 () Bool)

(assert (=> d!79500 m!358271))

(assert (=> b!235439 d!79500))

(assert (=> b!235439 d!79486))

(assert (=> b!235439 d!79402))

(declare-fun d!79502 () Bool)

(declare-fun e!162835 () Bool)

(assert (=> d!79502 e!162835))

(declare-fun res!196994 () Bool)

(assert (=> d!79502 (=> (not res!196994) (not e!162835))))

(declare-fun lt!371452 () (_ BitVec 64))

(declare-fun lt!371454 () (_ BitVec 64))

(declare-fun lt!371453 () (_ BitVec 64))

(assert (=> d!79502 (= res!196994 (= lt!371453 (bvsub lt!371454 lt!371452)))))

(assert (=> d!79502 (or (= (bvand lt!371454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371454 lt!371452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79502 (= lt!371452 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371179)))) ((_ sign_extend 32) (currentByte!11007 (_2!10856 lt!371179))) ((_ sign_extend 32) (currentBit!11002 (_2!10856 lt!371179)))))))

(declare-fun lt!371455 () (_ BitVec 64))

(declare-fun lt!371450 () (_ BitVec 64))

(assert (=> d!79502 (= lt!371454 (bvmul lt!371455 lt!371450))))

(assert (=> d!79502 (or (= lt!371455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371450 (bvsdiv (bvmul lt!371455 lt!371450) lt!371455)))))

(assert (=> d!79502 (= lt!371450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79502 (= lt!371455 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371179)))))))

(assert (=> d!79502 (= lt!371453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 (_2!10856 lt!371179))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 (_2!10856 lt!371179)))))))

(assert (=> d!79502 (invariant!0 (currentBit!11002 (_2!10856 lt!371179)) (currentByte!11007 (_2!10856 lt!371179)) (size!5441 (buf!5916 (_2!10856 lt!371179))))))

(assert (=> d!79502 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371179))) (currentByte!11007 (_2!10856 lt!371179)) (currentBit!11002 (_2!10856 lt!371179))) lt!371453)))

(declare-fun b!235617 () Bool)

(declare-fun res!196993 () Bool)

(assert (=> b!235617 (=> (not res!196993) (not e!162835))))

(assert (=> b!235617 (= res!196993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371453))))

(declare-fun b!235618 () Bool)

(declare-fun lt!371451 () (_ BitVec 64))

(assert (=> b!235618 (= e!162835 (bvsle lt!371453 (bvmul lt!371451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235618 (or (= lt!371451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371451)))))

(assert (=> b!235618 (= lt!371451 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10856 lt!371179)))))))

(assert (= (and d!79502 res!196994) b!235617))

(assert (= (and b!235617 res!196993) b!235618))

(declare-fun m!358273 () Bool)

(assert (=> d!79502 m!358273))

(declare-fun m!358275 () Bool)

(assert (=> d!79502 m!358275))

(assert (=> b!235493 d!79502))

(assert (=> b!235493 d!79402))

(declare-fun d!79504 () Bool)

(declare-fun e!162836 () Bool)

(assert (=> d!79504 e!162836))

(declare-fun res!196996 () Bool)

(assert (=> d!79504 (=> (not res!196996) (not e!162836))))

(declare-fun lt!371460 () (_ BitVec 64))

(declare-fun lt!371459 () (_ BitVec 64))

(declare-fun lt!371458 () (_ BitVec 64))

(assert (=> d!79504 (= res!196996 (= lt!371459 (bvsub lt!371460 lt!371458)))))

(assert (=> d!79504 (or (= (bvand lt!371460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371460 lt!371458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79504 (= lt!371458 (remainingBits!0 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 lt!371064)))) ((_ sign_extend 32) (currentByte!11007 (_2!10857 lt!371064))) ((_ sign_extend 32) (currentBit!11002 (_2!10857 lt!371064)))))))

(declare-fun lt!371461 () (_ BitVec 64))

(declare-fun lt!371456 () (_ BitVec 64))

(assert (=> d!79504 (= lt!371460 (bvmul lt!371461 lt!371456))))

(assert (=> d!79504 (or (= lt!371461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371456 (bvsdiv (bvmul lt!371461 lt!371456) lt!371461)))))

(assert (=> d!79504 (= lt!371456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79504 (= lt!371461 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 lt!371064)))))))

(assert (=> d!79504 (= lt!371459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11007 (_2!10857 lt!371064))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11002 (_2!10857 lt!371064)))))))

(assert (=> d!79504 (invariant!0 (currentBit!11002 (_2!10857 lt!371064)) (currentByte!11007 (_2!10857 lt!371064)) (size!5441 (buf!5916 (_2!10857 lt!371064))))))

(assert (=> d!79504 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10857 lt!371064))) (currentByte!11007 (_2!10857 lt!371064)) (currentBit!11002 (_2!10857 lt!371064))) lt!371459)))

(declare-fun b!235619 () Bool)

(declare-fun res!196995 () Bool)

(assert (=> b!235619 (=> (not res!196995) (not e!162836))))

(assert (=> b!235619 (= res!196995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371459))))

(declare-fun b!235620 () Bool)

(declare-fun lt!371457 () (_ BitVec 64))

(assert (=> b!235620 (= e!162836 (bvsle lt!371459 (bvmul lt!371457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!235620 (or (= lt!371457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371457)))))

(assert (=> b!235620 (= lt!371457 ((_ sign_extend 32) (size!5441 (buf!5916 (_2!10857 lt!371064)))))))

(assert (= (and d!79504 res!196996) b!235619))

(assert (= (and b!235619 res!196995) b!235620))

(declare-fun m!358277 () Bool)

(assert (=> d!79504 m!358277))

(declare-fun m!358279 () Bool)

(assert (=> d!79504 m!358279))

(assert (=> b!235431 d!79504))

(assert (=> b!235431 d!79402))

(assert (=> b!235485 d!79358))

(assert (=> b!235436 d!79402))

(assert (=> b!235494 d!79410))

(declare-fun b!235621 () Bool)

(declare-fun res!196997 () Bool)

(declare-fun e!162837 () Bool)

(assert (=> b!235621 (=> (not res!196997) (not e!162837))))

(declare-fun lt!371468 () tuple2!19904)

(assert (=> b!235621 (= res!196997 (= (bvand (_1!10856 lt!371468) (onesLSBLong!0 nBits!274)) (_1!10856 lt!371468)))))

(declare-fun b!235622 () Bool)

(declare-fun res!197001 () Bool)

(assert (=> b!235622 (=> (not res!197001) (not e!162837))))

(declare-fun lt!371466 () (_ BitVec 64))

(declare-fun lt!371464 () (_ BitVec 64))

(assert (=> b!235622 (= res!197001 (= (bitIndex!0 (size!5441 (buf!5916 (_2!10856 lt!371468))) (currentByte!11007 (_2!10856 lt!371468)) (currentBit!11002 (_2!10856 lt!371468))) (bvadd lt!371466 lt!371464)))))

(assert (=> b!235622 (or (not (= (bvand lt!371466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371464 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371466 lt!371464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!235622 (= lt!371464 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235622 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235622 (= lt!371466 (bitIndex!0 (size!5441 (buf!5916 (_2!10858 lt!371181))) (currentByte!11007 (_2!10858 lt!371181)) (currentBit!11002 (_2!10858 lt!371181))))))

(declare-fun d!79506 () Bool)

(assert (=> d!79506 e!162837))

(declare-fun res!196998 () Bool)

(assert (=> d!79506 (=> (not res!196998) (not e!162837))))

(assert (=> d!79506 (= res!196998 (= (buf!5916 (_2!10856 lt!371468)) (buf!5916 (_2!10858 lt!371181))))))

(declare-fun e!162838 () tuple2!19904)

(assert (=> d!79506 (= lt!371468 e!162838)))

(declare-fun c!11318 () Bool)

(assert (=> d!79506 (= c!11318 (= nBits!274 (bvadd i!546 #b00000000000000000000000000000001)))))

(assert (=> d!79506 (and (bvsle #b00000000000000000000000000000000 (bvadd i!546 #b00000000000000000000000000000001)) (bvsle (bvadd i!546 #b00000000000000000000000000000001) nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79506 (= (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371181) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10858 lt!371181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371468)))

(declare-fun b!235623 () Bool)

(declare-fun lt!371465 () tuple2!19904)

(assert (=> b!235623 (= e!162838 (tuple2!19905 (_1!10856 lt!371465) (_2!10856 lt!371465)))))

(declare-fun lt!371470 () tuple2!19908)

(assert (=> b!235623 (= lt!371470 (readBit!0 (_2!10858 lt!371181)))))

(assert (=> b!235623 (= lt!371465 (readNLeastSignificantBitsLoop!0 (_2!10858 lt!371470) nBits!274 (bvadd i!546 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!118 (ite (_1!10858 lt!371181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10858 lt!371470) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) (bvadd i!546 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!371467 () (_ BitVec 64))

(declare-fun e!162839 () Bool)

(declare-fun b!235624 () Bool)

(assert (=> b!235624 (= e!162839 (= (= (bvand (bvlshr (_1!10856 lt!371468) lt!371467) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10853 (readBitPure!0 (_2!10858 lt!371181)))))))

(assert (=> b!235624 (and (bvsge lt!371467 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371467 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371462 () (_ BitVec 32))

(assert (=> b!235624 (= lt!371467 ((_ sign_extend 32) (bvsub lt!371462 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235624 (or (= (bvand lt!371462 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!371462 #b10000000000000000000000000000000) (bvand (bvsub lt!371462 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235624 (= lt!371462 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!235624 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!235625 () Bool)

(declare-fun res!197000 () Bool)

(assert (=> b!235625 (=> (not res!197000) (not e!162837))))

(declare-fun lt!371463 () (_ BitVec 64))

(declare-fun lt!371469 () (_ BitVec 64))

(assert (=> b!235625 (= res!197000 (= (bvlshr (_1!10856 lt!371468) lt!371469) (bvlshr (bvor acc!118 (ite (_1!10858 lt!371181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371463)))))

(assert (=> b!235625 (and (bvsge lt!371463 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371463 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235625 (= lt!371463 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235625 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!235625 (and (bvsge lt!371469 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371469 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!235625 (= lt!371469 ((_ sign_extend 32) (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001))))))

(assert (=> b!235625 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvadd i!546 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 (bvadd i!546 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!235626 () Bool)

(assert (=> b!235626 (= e!162837 e!162839)))

(declare-fun res!196999 () Bool)

(assert (=> b!235626 (=> res!196999 e!162839)))

(assert (=> b!235626 (= res!196999 (bvsge (bvadd i!546 #b00000000000000000000000000000001) nBits!274))))

(declare-fun b!235627 () Bool)

(assert (=> b!235627 (= e!162838 (tuple2!19905 (bvor acc!118 (ite (_1!10858 lt!371181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10858 lt!371181)))))

(assert (= (and d!79506 c!11318) b!235627))

(assert (= (and d!79506 (not c!11318)) b!235623))

(assert (= (and d!79506 res!196998) b!235622))

(assert (= (and b!235622 res!197001) b!235625))

(assert (= (and b!235625 res!197000) b!235621))

(assert (= (and b!235621 res!196997) b!235626))

(assert (= (and b!235626 (not res!196999)) b!235624))

(assert (=> b!235621 m!358005))

(declare-fun m!358281 () Bool)

(assert (=> b!235622 m!358281))

(declare-fun m!358283 () Bool)

(assert (=> b!235622 m!358283))

(declare-fun m!358285 () Bool)

(assert (=> b!235623 m!358285))

(declare-fun m!358287 () Bool)

(assert (=> b!235623 m!358287))

(declare-fun m!358289 () Bool)

(assert (=> b!235624 m!358289))

(assert (=> b!235494 d!79506))

(assert (=> b!235492 d!79358))

(assert (=> d!79404 d!79408))

(check-sat (not d!79496) (not d!79486) (not b!235621) (not b!235609) (not b!235622) (not b!235623) (not d!79498) (not d!79502) (not b!235624) (not b!235599) (not d!79494) (not b!235598) (not d!79488) (not b!235600) (not d!79482) (not d!79500) (not d!79504) (not b!235601) (not b!235597))
(check-sat)
