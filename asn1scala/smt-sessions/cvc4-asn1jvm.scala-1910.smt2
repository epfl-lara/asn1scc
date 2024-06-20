; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50034 () Bool)

(assert start!50034)

(declare-fun b!235171 () Bool)

(declare-fun res!196671 () Bool)

(declare-fun e!162569 () Bool)

(assert (=> b!235171 (=> (not res!196671) (not e!162569))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235171 (= res!196671 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235172 () Bool)

(declare-fun e!162567 () Bool)

(declare-datatypes ((array!12363 0))(
  ( (array!12364 (arr!6417 (Array (_ BitVec 32) (_ BitVec 8))) (size!5430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9824 0))(
  ( (BitStream!9825 (buf!5905 array!12363) (currentByte!10996 (_ BitVec 32)) (currentBit!10991 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9824)

(declare-fun array_inv!5171 (array!12363) Bool)

(assert (=> b!235172 (= e!162567 (array_inv!5171 (buf!5905 bs!63)))))

(declare-fun res!196673 () Bool)

(assert (=> start!50034 (=> (not res!196673) (not e!162569))))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!50034 (= res!196673 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50034 e!162569))

(assert (=> start!50034 true))

(declare-fun inv!12 (BitStream!9824) Bool)

(assert (=> start!50034 (and (inv!12 bs!63) e!162567)))

(declare-fun b!235173 () Bool)

(declare-fun res!196672 () Bool)

(assert (=> b!235173 (=> (not res!196672) (not e!162569))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235173 (= res!196672 (validate_offset_bits!1 ((_ sign_extend 32) (size!5430 (buf!5905 bs!63))) ((_ sign_extend 32) (currentByte!10996 bs!63)) ((_ sign_extend 32) (currentBit!10991 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235174 () Bool)

(declare-fun res!196674 () Bool)

(assert (=> b!235174 (=> (not res!196674) (not e!162569))))

(assert (=> b!235174 (= res!196674 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235175 () Bool)

(declare-datatypes ((tuple2!19852 0))(
  ( (tuple2!19853 (_1!10830 BitStream!9824) (_2!10830 Bool)) )
))
(declare-fun lt!370901 () tuple2!19852)

(assert (=> b!235175 (= e!162569 (and (_2!10830 lt!370901) (let ((bdg!14496 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546)))) (or (bvslt bdg!14496 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14496 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun lt!370900 () BitStream!9824)

(declare-fun withMovedBitIndex!0 (BitStream!9824 (_ BitVec 64)) BitStream!9824)

(assert (=> b!235175 (= lt!370900 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!9824) tuple2!19852)

(assert (=> b!235175 (= lt!370901 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19854 0))(
  ( (tuple2!19855 (_1!10831 BitStream!9824) (_2!10831 (_ BitVec 64))) )
))
(declare-fun lt!370902 () tuple2!19854)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19854)

(assert (=> b!235175 (= lt!370902 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(assert (= (and start!50034 res!196673) b!235173))

(assert (= (and b!235173 res!196672) b!235174))

(assert (= (and b!235174 res!196674) b!235171))

(assert (= (and b!235171 res!196671) b!235175))

(assert (= start!50034 b!235172))

(declare-fun m!357813 () Bool)

(assert (=> b!235175 m!357813))

(declare-fun m!357815 () Bool)

(assert (=> b!235175 m!357815))

(declare-fun m!357817 () Bool)

(assert (=> b!235175 m!357817))

(declare-fun m!357819 () Bool)

(assert (=> b!235174 m!357819))

(declare-fun m!357821 () Bool)

(assert (=> b!235172 m!357821))

(declare-fun m!357823 () Bool)

(assert (=> b!235171 m!357823))

(declare-fun m!357825 () Bool)

(assert (=> b!235173 m!357825))

(declare-fun m!357827 () Bool)

(assert (=> start!50034 m!357827))

(push 1)

(assert (not b!235172))

(assert (not b!235171))

(assert (not b!235174))

(assert (not b!235173))

(assert (not start!50034))

(assert (not b!235175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

