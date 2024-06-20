; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49958 () Bool)

(assert start!49958)

(declare-fun b!234949 () Bool)

(declare-fun res!196496 () Bool)

(declare-fun e!162416 () Bool)

(assert (=> b!234949 (=> (not res!196496) (not e!162416))))

(declare-fun lt!370744 () (_ BitVec 64))

(declare-fun lt!370747 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234949 (= res!196496 (= (bvand lt!370744 (onesLSBLong!0 lt!370747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234950 () Bool)

(declare-fun e!162411 () Bool)

(assert (=> b!234950 (= e!162411 e!162416)))

(declare-fun res!196495 () Bool)

(assert (=> b!234950 (=> (not res!196495) (not e!162416))))

(declare-datatypes ((array!12332 0))(
  ( (array!12333 (arr!6403 (Array (_ BitVec 32) (_ BitVec 8))) (size!5416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9796 0))(
  ( (BitStream!9797 (buf!5891 array!12332) (currentByte!10979 (_ BitVec 32)) (currentBit!10974 (_ BitVec 32))) )
))
(declare-fun lt!370748 () BitStream!9796)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234950 (= res!196495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5416 (buf!5891 lt!370748))) ((_ sign_extend 32) (currentByte!10979 lt!370748)) ((_ sign_extend 32) (currentBit!10974 lt!370748)) ((_ sign_extend 32) lt!370747)))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!234950 (= lt!370747 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun b!234951 () Bool)

(declare-fun e!162412 () Bool)

(assert (=> b!234951 (= e!162412 e!162411)))

(declare-fun res!196491 () Bool)

(assert (=> b!234951 (=> (not res!196491) (not e!162411))))

(assert (=> b!234951 (= res!196491 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19790 0))(
  ( (tuple2!19791 (_1!10799 BitStream!9796) (_2!10799 Bool)) )
))
(declare-fun lt!370745 () tuple2!19790)

(assert (=> b!234951 (= lt!370744 (bvor acc!118 (ite (_2!10799 lt!370745) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!63 () BitStream!9796)

(declare-fun withMovedBitIndex!0 (BitStream!9796 (_ BitVec 64)) BitStream!9796)

(assert (=> b!234951 (= lt!370748 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9796) tuple2!19790)

(assert (=> b!234951 (= lt!370745 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19792 0))(
  ( (tuple2!19793 (_1!10800 BitStream!9796) (_2!10800 (_ BitVec 64))) )
))
(declare-fun lt!370749 () tuple2!19792)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19792)

(assert (=> b!234951 (= lt!370749 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196493 () Bool)

(declare-fun e!162414 () Bool)

(assert (=> start!49958 (=> (not res!196493) (not e!162414))))

(assert (=> start!49958 (= res!196493 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49958 e!162414))

(assert (=> start!49958 true))

(declare-fun e!162415 () Bool)

(declare-fun inv!12 (BitStream!9796) Bool)

(assert (=> start!49958 (and (inv!12 bs!63) e!162415)))

(declare-fun b!234952 () Bool)

(declare-fun res!196492 () Bool)

(assert (=> b!234952 (=> (not res!196492) (not e!162414))))

(assert (=> b!234952 (= res!196492 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234953 () Bool)

(assert (=> b!234953 (= e!162414 e!162412)))

(declare-fun res!196494 () Bool)

(assert (=> b!234953 (=> (not res!196494) (not e!162412))))

(declare-fun lt!370746 () (_ BitVec 64))

(assert (=> b!234953 (= res!196494 (= (bvand acc!118 lt!370746) acc!118))))

(assert (=> b!234953 (= lt!370746 (onesLSBLong!0 nBits!274))))

(declare-fun b!234954 () Bool)

(declare-fun res!196497 () Bool)

(assert (=> b!234954 (=> (not res!196497) (not e!162414))))

(assert (=> b!234954 (= res!196497 (validate_offset_bits!1 ((_ sign_extend 32) (size!5416 (buf!5891 bs!63))) ((_ sign_extend 32) (currentByte!10979 bs!63)) ((_ sign_extend 32) (currentBit!10974 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234955 () Bool)

(declare-fun array_inv!5157 (array!12332) Bool)

(assert (=> b!234955 (= e!162415 (array_inv!5157 (buf!5891 bs!63)))))

(declare-fun b!234956 () Bool)

(assert (=> b!234956 (= e!162416 (not (= (bvand lt!370744 lt!370746) lt!370744)))))

(assert (= (and start!49958 res!196493) b!234954))

(assert (= (and b!234954 res!196497) b!234952))

(assert (= (and b!234952 res!196492) b!234953))

(assert (= (and b!234953 res!196494) b!234951))

(assert (= (and b!234951 res!196491) b!234950))

(assert (= (and b!234950 res!196495) b!234949))

(assert (= (and b!234949 res!196496) b!234956))

(assert (= start!49958 b!234955))

(declare-fun m!357553 () Bool)

(assert (=> b!234952 m!357553))

(declare-fun m!357555 () Bool)

(assert (=> b!234954 m!357555))

(declare-fun m!357557 () Bool)

(assert (=> start!49958 m!357557))

(declare-fun m!357559 () Bool)

(assert (=> b!234951 m!357559))

(declare-fun m!357561 () Bool)

(assert (=> b!234951 m!357561))

(declare-fun m!357563 () Bool)

(assert (=> b!234951 m!357563))

(declare-fun m!357565 () Bool)

(assert (=> b!234950 m!357565))

(declare-fun m!357567 () Bool)

(assert (=> b!234949 m!357567))

(declare-fun m!357569 () Bool)

(assert (=> b!234953 m!357569))

(declare-fun m!357571 () Bool)

(assert (=> b!234955 m!357571))

(push 1)

(assert (not b!234952))

(assert (not b!234951))

(assert (not b!234955))

(assert (not b!234953))

(assert (not b!234954))

(assert (not b!234950))

(assert (not b!234949))

(assert (not start!49958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79266 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5416 (buf!5891 bs!63))) ((_ sign_extend 32) (currentByte!10979 bs!63)) ((_ sign_extend 32) (currentBit!10974 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5416 (buf!5891 bs!63))) ((_ sign_extend 32) (currentByte!10979 bs!63)) ((_ sign_extend 32) (currentBit!10974 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19759 () Bool)

(assert (= bs!19759 d!79266))

(declare-fun m!357613 () Bool)

(assert (=> bs!19759 m!357613))

(assert (=> b!234954 d!79266))

(declare-fun d!79268 () Bool)

(assert (=> d!79268 (= (onesLSBLong!0 lt!370747) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370747))))))

(assert (=> b!234949 d!79268))

(declare-fun d!79270 () Bool)

(assert (=> d!79270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5416 (buf!5891 lt!370748))) ((_ sign_extend 32) (currentByte!10979 lt!370748)) ((_ sign_extend 32) (currentBit!10974 lt!370748)) ((_ sign_extend 32) lt!370747)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5416 (buf!5891 lt!370748))) ((_ sign_extend 32) (currentByte!10979 lt!370748)) ((_ sign_extend 32) (currentBit!10974 lt!370748))) ((_ sign_extend 32) lt!370747)))))

(declare-fun bs!19760 () Bool)

(assert (= bs!19760 d!79270))

(declare-fun m!357615 () Bool)

(assert (=> bs!19760 m!357615))

(assert (=> b!234950 d!79270))

(declare-fun d!79272 () Bool)

(assert (=> d!79272 (= (array_inv!5157 (buf!5891 bs!63)) (bvsge (size!5416 (buf!5891 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234955 d!79272))

(declare-fun d!79274 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79274 (= (inv!12 bs!63) (invariant!0 (currentBit!10974 bs!63) (currentByte!10979 bs!63) (size!5416 (buf!5891 bs!63))))))

(declare-fun bs!19761 () Bool)

(assert (= bs!19761 d!79274))

(declare-fun m!357617 () Bool)

(assert (=> bs!19761 m!357617))

(assert (=> start!49958 d!79274))

(declare-fun d!79276 () Bool)

(declare-fun e!162458 () Bool)

(assert (=> d!79276 e!162458))

(declare-fun res!196545 () Bool)

(assert (=> d!79276 (=> (not res!196545) (not e!162458))))

(declare-fun lt!370803 () (_ BitVec 64))

(declare-fun lt!370802 () BitStream!9796)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79276 (= res!196545 (= (bvadd lt!370803 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5416 (buf!5891 lt!370802)) (currentByte!10979 lt!370802) (currentBit!10974 lt!370802))))))

(assert (=> d!79276 (or (not (= (bvand lt!370803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370803 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79276 (= lt!370803 (bitIndex!0 (size!5416 (buf!5891 bs!63)) (currentByte!10979 bs!63) (currentBit!10974 bs!63)))))

(declare-datatypes ((Unit!17317 0))(
  ( (Unit!17318) )
))
(declare-datatypes ((tuple2!19808 0))(
  ( (tuple2!19809 (_1!10808 Unit!17317) (_2!10808 BitStream!9796)) )
))
(declare-fun moveBitIndex!0 (BitStream!9796 (_ BitVec 64)) tuple2!19808)

(assert (=> d!79276 (= lt!370802 (_2!10808 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9796 (_ BitVec 64)) Bool)

(assert (=> d!79276 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79276 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370802)))

(declare-fun b!235010 () Bool)

(assert (=> b!235010 (= e!162458 (= (size!5416 (buf!5891 bs!63)) (size!5416 (buf!5891 lt!370802))))))

(assert (= (and d!79276 res!196545) b!235010))

(declare-fun m!357633 () Bool)

(assert (=> d!79276 m!357633))

(declare-fun m!357637 () Bool)

(assert (=> d!79276 m!357637))

(declare-fun m!357639 () Bool)

(assert (=> d!79276 m!357639))

(declare-fun m!357641 () Bool)

(assert (=> d!79276 m!357641))

(assert (=> b!234951 d!79276))

(declare-fun d!79292 () Bool)

(declare-datatypes ((tuple2!19810 0))(
  ( (tuple2!19811 (_1!10809 Bool) (_2!10809 BitStream!9796)) )
))
(declare-fun lt!370806 () tuple2!19810)

(declare-fun readBit!0 (BitStream!9796) tuple2!19810)

(assert (=> d!79292 (= lt!370806 (readBit!0 bs!63))))

(assert (=> d!79292 (= (readBitPure!0 bs!63) (tuple2!19791 (_2!10809 lt!370806) (_1!10809 lt!370806)))))

(declare-fun bs!19767 () Bool)

(assert (= bs!19767 d!79292))

(declare-fun m!357645 () Bool)

(assert (=> bs!19767 m!357645))

(assert (=> b!234951 d!79292))

(declare-fun d!79298 () Bool)

(declare-datatypes ((tuple2!19812 0))(
  ( (tuple2!19813 (_1!10810 (_ BitVec 64)) (_2!10810 BitStream!9796)) )
))
(declare-fun lt!370809 () tuple2!19812)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19812)

(assert (=> d!79298 (= lt!370809 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79298 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19793 (_2!10810 lt!370809) (_1!10810 lt!370809)))))

(declare-fun bs!19768 () Bool)

(assert (= bs!19768 d!79298))

(declare-fun m!357647 () Bool)

(assert (=> bs!19768 m!357647))

(assert (=> b!234951 d!79298))

(declare-fun d!79302 () Bool)

(assert (=> d!79302 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234952 d!79302))

(declare-fun d!79304 () Bool)

(assert (=> d!79304 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234953 d!79304))

(push 1)

(assert (not d!79274))

(assert (not d!79276))

(assert (not d!79292))

(assert (not d!79270))

(assert (not d!79266))

(assert (not d!79298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

