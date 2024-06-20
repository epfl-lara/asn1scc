; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50030 () Bool)

(assert start!50030)

(declare-fun b!235141 () Bool)

(declare-fun res!196647 () Bool)

(declare-fun e!162549 () Bool)

(assert (=> b!235141 (=> (not res!196647) (not e!162549))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235141 (= res!196647 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235142 () Bool)

(declare-fun res!196649 () Bool)

(assert (=> b!235142 (=> (not res!196649) (not e!162549))))

(assert (=> b!235142 (= res!196649 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235143 () Bool)

(declare-fun e!162550 () Bool)

(declare-datatypes ((array!12359 0))(
  ( (array!12360 (arr!6415 (Array (_ BitVec 32) (_ BitVec 8))) (size!5428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9820 0))(
  ( (BitStream!9821 (buf!5903 array!12359) (currentByte!10994 (_ BitVec 32)) (currentBit!10989 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9820)

(declare-fun array_inv!5169 (array!12359) Bool)

(assert (=> b!235143 (= e!162550 (array_inv!5169 (buf!5903 bs!63)))))

(declare-fun res!196650 () Bool)

(assert (=> start!50030 (=> (not res!196650) (not e!162549))))

(assert (=> start!50030 (= res!196650 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50030 e!162549))

(assert (=> start!50030 true))

(declare-fun inv!12 (BitStream!9820) Bool)

(assert (=> start!50030 (and (inv!12 bs!63) e!162550)))

(declare-datatypes ((tuple2!19844 0))(
  ( (tuple2!19845 (_1!10826 BitStream!9820) (_2!10826 Bool)) )
))
(declare-fun lt!370882 () tuple2!19844)

(declare-fun b!235144 () Bool)

(assert (=> b!235144 (= e!162549 (and (_2!10826 lt!370882) (let ((bdg!14496 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546)))) (or (bvslt bdg!14496 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14496 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun lt!370884 () BitStream!9820)

(declare-fun withMovedBitIndex!0 (BitStream!9820 (_ BitVec 64)) BitStream!9820)

(assert (=> b!235144 (= lt!370884 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9820) tuple2!19844)

(assert (=> b!235144 (= lt!370882 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19846 0))(
  ( (tuple2!19847 (_1!10827 BitStream!9820) (_2!10827 (_ BitVec 64))) )
))
(declare-fun lt!370883 () tuple2!19846)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19846)

(assert (=> b!235144 (= lt!370883 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235145 () Bool)

(declare-fun res!196648 () Bool)

(assert (=> b!235145 (=> (not res!196648) (not e!162549))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235145 (= res!196648 (validate_offset_bits!1 ((_ sign_extend 32) (size!5428 (buf!5903 bs!63))) ((_ sign_extend 32) (currentByte!10994 bs!63)) ((_ sign_extend 32) (currentBit!10989 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!50030 res!196650) b!235145))

(assert (= (and b!235145 res!196648) b!235141))

(assert (= (and b!235141 res!196647) b!235142))

(assert (= (and b!235142 res!196649) b!235144))

(assert (= start!50030 b!235143))

(declare-fun m!357781 () Bool)

(assert (=> b!235141 m!357781))

(declare-fun m!357783 () Bool)

(assert (=> start!50030 m!357783))

(declare-fun m!357785 () Bool)

(assert (=> b!235144 m!357785))

(declare-fun m!357787 () Bool)

(assert (=> b!235144 m!357787))

(declare-fun m!357789 () Bool)

(assert (=> b!235144 m!357789))

(declare-fun m!357791 () Bool)

(assert (=> b!235143 m!357791))

(declare-fun m!357793 () Bool)

(assert (=> b!235145 m!357793))

(declare-fun m!357795 () Bool)

(assert (=> b!235142 m!357795))

(push 1)

(assert (not b!235142))

(assert (not start!50030))

(assert (not b!235144))

(assert (not b!235145))

(assert (not b!235141))

(assert (not b!235143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

