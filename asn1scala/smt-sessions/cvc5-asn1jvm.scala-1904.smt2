; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49910 () Bool)

(assert start!49910)

(declare-fun b!234875 () Bool)

(declare-fun e!162358 () Bool)

(declare-datatypes ((array!12323 0))(
  ( (array!12324 (arr!6400 (Array (_ BitVec 32) (_ BitVec 8))) (size!5413 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9790 0))(
  ( (BitStream!9791 (buf!5888 array!12323) (currentByte!10973 (_ BitVec 32)) (currentBit!10968 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9790)

(declare-fun array_inv!5154 (array!12323) Bool)

(assert (=> b!234875 (= e!162358 (array_inv!5154 (buf!5888 bs!63)))))

(declare-fun b!234876 () Bool)

(declare-fun res!196430 () Bool)

(declare-fun e!162356 () Bool)

(assert (=> b!234876 (=> (not res!196430) (not e!162356))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234876 (= res!196430 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234877 () Bool)

(declare-fun e!162355 () Bool)

(declare-fun e!162359 () Bool)

(assert (=> b!234877 (= e!162355 e!162359)))

(declare-fun res!196428 () Bool)

(assert (=> b!234877 (=> (not res!196428) (not e!162359))))

(declare-fun lt!370671 () BitStream!9790)

(declare-fun lt!370668 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234877 (= res!196428 (validate_offset_bits!1 ((_ sign_extend 32) (size!5413 (buf!5888 lt!370671))) ((_ sign_extend 32) (currentByte!10973 lt!370671)) ((_ sign_extend 32) (currentBit!10968 lt!370671)) ((_ sign_extend 32) lt!370668)))))

(assert (=> b!234877 (= lt!370668 (bvsub nBits!274 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun res!196431 () Bool)

(assert (=> start!49910 (=> (not res!196431) (not e!162356))))

(assert (=> start!49910 (= res!196431 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49910 e!162356))

(assert (=> start!49910 true))

(declare-fun inv!12 (BitStream!9790) Bool)

(assert (=> start!49910 (and (inv!12 bs!63) e!162358)))

(declare-fun b!234878 () Bool)

(declare-datatypes ((tuple2!19760 0))(
  ( (tuple2!19761 (_1!10784 BitStream!9790) (_2!10784 Bool)) )
))
(declare-fun lt!370669 () tuple2!19760)

(assert (=> b!234878 (= e!162359 (not (= (bvand (bvor acc!118 (ite (_2!10784 lt!370669) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!370668)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234879 () Bool)

(declare-fun res!196429 () Bool)

(assert (=> b!234879 (=> (not res!196429) (not e!162356))))

(assert (=> b!234879 (= res!196429 (validate_offset_bits!1 ((_ sign_extend 32) (size!5413 (buf!5888 bs!63))) ((_ sign_extend 32) (currentByte!10973 bs!63)) ((_ sign_extend 32) (currentBit!10968 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234880 () Bool)

(declare-fun res!196427 () Bool)

(assert (=> b!234880 (=> (not res!196427) (not e!162356))))

(assert (=> b!234880 (= res!196427 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234881 () Bool)

(assert (=> b!234881 (= e!162356 e!162355)))

(declare-fun res!196426 () Bool)

(assert (=> b!234881 (=> (not res!196426) (not e!162355))))

(assert (=> b!234881 (= res!196426 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!546)))))

(declare-fun withMovedBitIndex!0 (BitStream!9790 (_ BitVec 64)) BitStream!9790)

(assert (=> b!234881 (= lt!370671 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9790) tuple2!19760)

(assert (=> b!234881 (= lt!370669 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19762 0))(
  ( (tuple2!19763 (_1!10785 BitStream!9790) (_2!10785 (_ BitVec 64))) )
))
(declare-fun lt!370670 () tuple2!19762)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19762)

(assert (=> b!234881 (= lt!370670 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!49910 res!196431) b!234879))

(assert (= (and b!234879 res!196429) b!234876))

(assert (= (and b!234876 res!196430) b!234880))

(assert (= (and b!234880 res!196427) b!234881))

(assert (= (and b!234881 res!196426) b!234877))

(assert (= (and b!234877 res!196428) b!234878))

(assert (= start!49910 b!234875))

(declare-fun m!357439 () Bool)

(assert (=> b!234876 m!357439))

(declare-fun m!357441 () Bool)

(assert (=> b!234879 m!357441))

(declare-fun m!357443 () Bool)

(assert (=> b!234880 m!357443))

(declare-fun m!357445 () Bool)

(assert (=> b!234881 m!357445))

(declare-fun m!357447 () Bool)

(assert (=> b!234881 m!357447))

(declare-fun m!357449 () Bool)

(assert (=> b!234881 m!357449))

(declare-fun m!357451 () Bool)

(assert (=> b!234878 m!357451))

(declare-fun m!357453 () Bool)

(assert (=> b!234877 m!357453))

(declare-fun m!357455 () Bool)

(assert (=> b!234875 m!357455))

(declare-fun m!357457 () Bool)

(assert (=> start!49910 m!357457))

(push 1)

(assert (not b!234878))

(assert (not b!234876))

(assert (not b!234879))

(assert (not b!234880))

(assert (not start!49910))

(assert (not b!234877))

(assert (not b!234875))

(assert (not b!234881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79222 () Bool)

(assert (=> d!79222 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234880 d!79222))

(declare-fun d!79224 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79224 (= (inv!12 bs!63) (invariant!0 (currentBit!10968 bs!63) (currentByte!10973 bs!63) (size!5413 (buf!5888 bs!63))))))

(declare-fun bs!19746 () Bool)

(assert (= bs!19746 d!79224))

(declare-fun m!357517 () Bool)

(assert (=> bs!19746 m!357517))

(assert (=> start!49910 d!79224))

(declare-fun d!79226 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5413 (buf!5888 bs!63))) ((_ sign_extend 32) (currentByte!10973 bs!63)) ((_ sign_extend 32) (currentBit!10968 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5413 (buf!5888 bs!63))) ((_ sign_extend 32) (currentByte!10973 bs!63)) ((_ sign_extend 32) (currentBit!10968 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19747 () Bool)

(assert (= bs!19747 d!79226))

(declare-fun m!357519 () Bool)

(assert (=> bs!19747 m!357519))

(assert (=> b!234879 d!79226))

(declare-fun d!79228 () Bool)

(declare-fun e!162395 () Bool)

(assert (=> d!79228 e!162395))

(declare-fun res!196473 () Bool)

(assert (=> d!79228 (=> (not res!196473) (not e!162395))))

(declare-fun lt!370713 () (_ BitVec 64))

(declare-fun lt!370712 () BitStream!9790)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!79228 (= res!196473 (= (bvadd lt!370713 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5413 (buf!5888 lt!370712)) (currentByte!10973 lt!370712) (currentBit!10968 lt!370712))))))

(assert (=> d!79228 (or (not (= (bvand lt!370713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370713 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79228 (= lt!370713 (bitIndex!0 (size!5413 (buf!5888 bs!63)) (currentByte!10973 bs!63) (currentBit!10968 bs!63)))))

(declare-datatypes ((Unit!17311 0))(
  ( (Unit!17312) )
))
(declare-datatypes ((tuple2!19778 0))(
  ( (tuple2!19779 (_1!10793 Unit!17311) (_2!10793 BitStream!9790)) )
))
(declare-fun moveBitIndex!0 (BitStream!9790 (_ BitVec 64)) tuple2!19778)

(assert (=> d!79228 (= lt!370712 (_2!10793 (moveBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!9790 (_ BitVec 64)) Bool)

(assert (=> d!79228 (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79228 (= (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) lt!370712)))

(declare-fun b!234929 () Bool)

(assert (=> b!234929 (= e!162395 (= (size!5413 (buf!5888 bs!63)) (size!5413 (buf!5888 lt!370712))))))

(assert (= (and d!79228 res!196473) b!234929))

(declare-fun m!357521 () Bool)

(assert (=> d!79228 m!357521))

(declare-fun m!357523 () Bool)

(assert (=> d!79228 m!357523))

(declare-fun m!357525 () Bool)

(assert (=> d!79228 m!357525))

(declare-fun m!357527 () Bool)

(assert (=> d!79228 m!357527))

(assert (=> b!234881 d!79228))

(declare-fun d!79230 () Bool)

(declare-datatypes ((tuple2!19780 0))(
  ( (tuple2!19781 (_1!10794 Bool) (_2!10794 BitStream!9790)) )
))
(declare-fun lt!370716 () tuple2!19780)

(declare-fun readBit!0 (BitStream!9790) tuple2!19780)

(assert (=> d!79230 (= lt!370716 (readBit!0 bs!63))))

(assert (=> d!79230 (= (readBitPure!0 bs!63) (tuple2!19761 (_2!10794 lt!370716) (_1!10794 lt!370716)))))

(declare-fun bs!19748 () Bool)

(assert (= bs!19748 d!79230))

(declare-fun m!357529 () Bool)

(assert (=> bs!19748 m!357529))

(assert (=> b!234881 d!79230))

(declare-fun d!79232 () Bool)

(declare-datatypes ((tuple2!19782 0))(
  ( (tuple2!19783 (_1!10795 (_ BitVec 64)) (_2!10795 BitStream!9790)) )
))
(declare-fun lt!370719 () tuple2!19782)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19782)

(assert (=> d!79232 (= lt!370719 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79232 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19763 (_2!10795 lt!370719) (_1!10795 lt!370719)))))

(declare-fun bs!19749 () Bool)

(assert (= bs!19749 d!79232))

(declare-fun m!357531 () Bool)

(assert (=> bs!19749 m!357531))

(assert (=> b!234881 d!79232))

(declare-fun d!79236 () Bool)

(assert (=> d!79236 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234876 d!79236))

(declare-fun d!79238 () Bool)

(assert (=> d!79238 (= (array_inv!5154 (buf!5888 bs!63)) (bvsge (size!5413 (buf!5888 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234875 d!79238))

(declare-fun d!79240 () Bool)

(assert (=> d!79240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5413 (buf!5888 lt!370671))) ((_ sign_extend 32) (currentByte!10973 lt!370671)) ((_ sign_extend 32) (currentBit!10968 lt!370671)) ((_ sign_extend 32) lt!370668)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5413 (buf!5888 lt!370671))) ((_ sign_extend 32) (currentByte!10973 lt!370671)) ((_ sign_extend 32) (currentBit!10968 lt!370671))) ((_ sign_extend 32) lt!370668)))))

(declare-fun bs!19750 () Bool)

(assert (= bs!19750 d!79240))

(declare-fun m!357533 () Bool)

(assert (=> bs!19750 m!357533))

(assert (=> b!234877 d!79240))

(declare-fun d!79242 () Bool)

(assert (=> d!79242 (= (onesLSBLong!0 lt!370668) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!370668))))))

(assert (=> b!234878 d!79242))

(push 1)

(assert (not d!79240))

(assert (not d!79228))

(assert (not d!79226))

(assert (not d!79232))

(assert (not d!79224))

(assert (not d!79230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

