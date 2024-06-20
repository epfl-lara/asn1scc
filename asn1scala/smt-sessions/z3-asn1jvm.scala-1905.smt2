; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49960 () Bool)

(assert start!49960)

(declare-fun b!234973 () Bool)

(declare-fun e!162433 () Bool)

(declare-fun e!162434 () Bool)

(assert (=> b!234973 (= e!162433 e!162434)))

(declare-fun res!196514 () Bool)

(assert (=> b!234973 (=> (not res!196514) (not e!162434))))

(declare-datatypes ((array!12334 0))(
  ( (array!12335 (arr!6404 (Array (_ BitVec 32) (_ BitVec 8))) (size!5417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9798 0))(
  ( (BitStream!9799 (buf!5892 array!12334) (currentByte!10980 (_ BitVec 32)) (currentBit!10975 (_ BitVec 32))) )
))
(declare-fun lt!370762 () BitStream!9798)

(declare-fun lt!370765 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234973 (= res!196514 (validate_offset_bits!1 ((_ sign_extend 32) (size!5417 (buf!5892 lt!370762))) ((_ sign_extend 32) (currentByte!10980 lt!370762)) ((_ sign_extend 32) (currentBit!10975 lt!370762)) ((_ sign_extend 32) lt!370765)))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!234973 (= lt!370765 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun res!196515 () Bool)

(declare-fun e!162429 () Bool)

(assert (=> start!49960 (=> (not res!196515) (not e!162429))))

(assert (=> start!49960 (= res!196515 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49960 e!162429))

(assert (=> start!49960 true))

(declare-fun bs!63 () BitStream!9798)

(declare-fun e!162431 () Bool)

(declare-fun inv!12 (BitStream!9798) Bool)

(assert (=> start!49960 (and (inv!12 bs!63) e!162431)))

(declare-fun b!234974 () Bool)

(declare-fun e!162432 () Bool)

(assert (=> b!234974 (= e!162432 e!162433)))

(declare-fun res!196513 () Bool)

(assert (=> b!234974 (=> (not res!196513) (not e!162433))))

(assert (=> b!234974 (= res!196513 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun lt!370763 () (_ BitVec 64))

(declare-datatypes ((tuple2!19794 0))(
  ( (tuple2!19795 (_1!10801 BitStream!9798) (_2!10801 Bool)) )
))
(declare-fun lt!370764 () tuple2!19794)

(assert (=> b!234974 (= lt!370763 (bvor acc!118 (ite (_2!10801 lt!370764) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun withMovedBitIndex!0 (BitStream!9798 (_ BitVec 64)) BitStream!9798)

(assert (=> b!234974 (= lt!370762 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9798) tuple2!19794)

(assert (=> b!234974 (= lt!370764 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19796 0))(
  ( (tuple2!19797 (_1!10802 BitStream!9798) (_2!10802 (_ BitVec 64))) )
))
(declare-fun lt!370766 () tuple2!19796)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19796)

(assert (=> b!234974 (= lt!370766 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234975 () Bool)

(declare-fun lt!370767 () (_ BitVec 64))

(assert (=> b!234975 (= e!162434 (not (= (bvand lt!370763 lt!370767) lt!370763)))))

(declare-fun b!234976 () Bool)

(declare-fun res!196512 () Bool)

(assert (=> b!234976 (=> (not res!196512) (not e!162429))))

(assert (=> b!234976 (= res!196512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5417 (buf!5892 bs!63))) ((_ sign_extend 32) (currentByte!10980 bs!63)) ((_ sign_extend 32) (currentBit!10975 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234977 () Bool)

(assert (=> b!234977 (= e!162429 e!162432)))

(declare-fun res!196516 () Bool)

(assert (=> b!234977 (=> (not res!196516) (not e!162432))))

(assert (=> b!234977 (= res!196516 (= (bvand acc!118 lt!370767) acc!118))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234977 (= lt!370767 (onesLSBLong!0 nBits!274))))

(declare-fun b!234978 () Bool)

(declare-fun res!196517 () Bool)

(assert (=> b!234978 (=> (not res!196517) (not e!162429))))

(assert (=> b!234978 (= res!196517 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234979 () Bool)

(declare-fun res!196518 () Bool)

(assert (=> b!234979 (=> (not res!196518) (not e!162434))))

(assert (=> b!234979 (= res!196518 (= (bvand lt!370763 (onesLSBLong!0 lt!370765)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234980 () Bool)

(declare-fun array_inv!5158 (array!12334) Bool)

(assert (=> b!234980 (= e!162431 (array_inv!5158 (buf!5892 bs!63)))))

(assert (= (and start!49960 res!196515) b!234976))

(assert (= (and b!234976 res!196512) b!234978))

(assert (= (and b!234978 res!196517) b!234977))

(assert (= (and b!234977 res!196516) b!234974))

(assert (= (and b!234974 res!196513) b!234973))

(assert (= (and b!234973 res!196514) b!234979))

(assert (= (and b!234979 res!196518) b!234975))

(assert (= start!49960 b!234980))

(declare-fun m!357573 () Bool)

(assert (=> b!234974 m!357573))

(declare-fun m!357575 () Bool)

(assert (=> b!234974 m!357575))

(declare-fun m!357577 () Bool)

(assert (=> b!234974 m!357577))

(declare-fun m!357579 () Bool)

(assert (=> b!234979 m!357579))

(declare-fun m!357581 () Bool)

(assert (=> b!234977 m!357581))

(declare-fun m!357583 () Bool)

(assert (=> b!234978 m!357583))

(declare-fun m!357585 () Bool)

(assert (=> b!234973 m!357585))

(declare-fun m!357587 () Bool)

(assert (=> b!234980 m!357587))

(declare-fun m!357589 () Bool)

(assert (=> start!49960 m!357589))

(declare-fun m!357591 () Bool)

(assert (=> b!234976 m!357591))

(check-sat (not b!234973) (not b!234976) (not b!234977) (not b!234978) (not start!49960) (not b!234980) (not b!234979) (not b!234974))
(check-sat)
(get-model)

(declare-fun d!79264 () Bool)

(declare-fun e!162455 () Bool)

(assert (=> d!79264 e!162455))

(declare-fun res!196542 () Bool)

(assert (=> d!79264 (=> (not res!196542) (not e!162455))))

(declare-fun lt!370791 () (_ BitVec 64))

(declare-fun lt!370790 () BitStream!9798)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79264 (= res!196542 (= (bvadd lt!370791 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5417 (buf!5892 lt!370790)) (currentByte!10980 lt!370790) (currentBit!10975 lt!370790))))))

(assert (=> d!79264 (or (not (= (bvand lt!370791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370791 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79264 (= lt!370791 (bitIndex!0 (size!5417 (buf!5892 bs!63)) (currentByte!10980 bs!63) (currentBit!10975 bs!63)))))

(declare-datatypes ((Unit!17315 0))(
  ( (Unit!17316) )
))
(declare-datatypes ((tuple2!19802 0))(
  ( (tuple2!19803 (_1!10805 Unit!17315) (_2!10805 BitStream!9798)) )
))
(declare-fun moveBitIndex!0 (BitStream!9798 (_ BitVec 64)) tuple2!19802)

(assert (=> d!79264 (= lt!370790 (_2!10805 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9798 (_ BitVec 64)) Bool)

(assert (=> d!79264 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79264 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370790)))

(declare-fun b!235007 () Bool)

(assert (=> b!235007 (= e!162455 (= (size!5417 (buf!5892 bs!63)) (size!5417 (buf!5892 lt!370790))))))

(assert (= (and d!79264 res!196542) b!235007))

(declare-fun m!357619 () Bool)

(assert (=> d!79264 m!357619))

(declare-fun m!357621 () Bool)

(assert (=> d!79264 m!357621))

(declare-fun m!357623 () Bool)

(assert (=> d!79264 m!357623))

(declare-fun m!357625 () Bool)

(assert (=> d!79264 m!357625))

(assert (=> b!234974 d!79264))

(declare-fun d!79278 () Bool)

(declare-datatypes ((tuple2!19804 0))(
  ( (tuple2!19805 (_1!10806 Bool) (_2!10806 BitStream!9798)) )
))
(declare-fun lt!370794 () tuple2!19804)

(declare-fun readBit!0 (BitStream!9798) tuple2!19804)

(assert (=> d!79278 (= lt!370794 (readBit!0 bs!63))))

(assert (=> d!79278 (= (readBitPure!0 bs!63) (tuple2!19795 (_2!10806 lt!370794) (_1!10806 lt!370794)))))

(declare-fun bs!19762 () Bool)

(assert (= bs!19762 d!79278))

(declare-fun m!357627 () Bool)

(assert (=> bs!19762 m!357627))

(assert (=> b!234974 d!79278))

(declare-fun d!79280 () Bool)

(declare-datatypes ((tuple2!19806 0))(
  ( (tuple2!19807 (_1!10807 (_ BitVec 64)) (_2!10807 BitStream!9798)) )
))
(declare-fun lt!370797 () tuple2!19806)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19806)

(assert (=> d!79280 (= lt!370797 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79280 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19797 (_2!10807 lt!370797) (_1!10807 lt!370797)))))

(declare-fun bs!19763 () Bool)

(assert (= bs!19763 d!79280))

(declare-fun m!357629 () Bool)

(assert (=> bs!19763 m!357629))

(assert (=> b!234974 d!79280))

(declare-fun d!79282 () Bool)

(assert (=> d!79282 (= (array_inv!5158 (buf!5892 bs!63)) (bvsge (size!5417 (buf!5892 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234980 d!79282))

(declare-fun d!79284 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79284 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5417 (buf!5892 bs!63))) ((_ sign_extend 32) (currentByte!10980 bs!63)) ((_ sign_extend 32) (currentBit!10975 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5417 (buf!5892 bs!63))) ((_ sign_extend 32) (currentByte!10980 bs!63)) ((_ sign_extend 32) (currentBit!10975 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19764 () Bool)

(assert (= bs!19764 d!79284))

(declare-fun m!357631 () Bool)

(assert (=> bs!19764 m!357631))

(assert (=> b!234976 d!79284))

(declare-fun d!79286 () Bool)

(assert (=> d!79286 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234977 d!79286))

(declare-fun d!79288 () Bool)

(assert (=> d!79288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5417 (buf!5892 lt!370762))) ((_ sign_extend 32) (currentByte!10980 lt!370762)) ((_ sign_extend 32) (currentBit!10975 lt!370762)) ((_ sign_extend 32) lt!370765)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5417 (buf!5892 lt!370762))) ((_ sign_extend 32) (currentByte!10980 lt!370762)) ((_ sign_extend 32) (currentBit!10975 lt!370762))) ((_ sign_extend 32) lt!370765)))))

(declare-fun bs!19765 () Bool)

(assert (= bs!19765 d!79288))

(declare-fun m!357635 () Bool)

(assert (=> bs!19765 m!357635))

(assert (=> b!234973 d!79288))

(declare-fun d!79290 () Bool)

(assert (=> d!79290 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234978 d!79290))

(declare-fun d!79294 () Bool)

(assert (=> d!79294 (= (onesLSBLong!0 lt!370765) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370765))))))

(assert (=> b!234979 d!79294))

(declare-fun d!79296 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79296 (= (inv!12 bs!63) (invariant!0 (currentBit!10975 bs!63) (currentByte!10980 bs!63) (size!5417 (buf!5892 bs!63))))))

(declare-fun bs!19766 () Bool)

(assert (= bs!19766 d!79296))

(declare-fun m!357643 () Bool)

(assert (=> bs!19766 m!357643))

(assert (=> start!49960 d!79296))

(check-sat (not d!79264) (not d!79280) (not d!79296) (not d!79284) (not d!79288) (not d!79278))
(check-sat)
