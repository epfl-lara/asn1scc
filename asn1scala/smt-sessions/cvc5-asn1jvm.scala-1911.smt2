; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50036 () Bool)

(assert start!50036)

(declare-fun b!235186 () Bool)

(declare-fun e!162577 () Bool)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!235186 (= e!162577 (and (= (bvand i!546 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!546 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!12365 0))(
  ( (array!12366 (arr!6418 (Array (_ BitVec 32) (_ BitVec 8))) (size!5431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9826 0))(
  ( (BitStream!9827 (buf!5906 array!12365) (currentByte!10997 (_ BitVec 32)) (currentBit!10992 (_ BitVec 32))) )
))
(declare-fun lt!370911 () BitStream!9826)

(declare-fun bs!63 () BitStream!9826)

(declare-fun withMovedBitIndex!0 (BitStream!9826 (_ BitVec 64)) BitStream!9826)

(assert (=> b!235186 (= lt!370911 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19856 0))(
  ( (tuple2!19857 (_1!10832 BitStream!9826) (_2!10832 Bool)) )
))
(declare-fun lt!370909 () tuple2!19856)

(declare-fun readBitPure!0 (BitStream!9826) tuple2!19856)

(assert (=> b!235186 (= lt!370909 (readBitPure!0 bs!63))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-datatypes ((tuple2!19858 0))(
  ( (tuple2!19859 (_1!10833 BitStream!9826) (_2!10833 (_ BitVec 64))) )
))
(declare-fun lt!370910 () tuple2!19858)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19858)

(assert (=> b!235186 (= lt!370910 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235188 () Bool)

(declare-fun res!196683 () Bool)

(assert (=> b!235188 (=> (not res!196683) (not e!162577))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235188 (= res!196683 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235189 () Bool)

(declare-fun e!162576 () Bool)

(declare-fun array_inv!5172 (array!12365) Bool)

(assert (=> b!235189 (= e!162576 (array_inv!5172 (buf!5906 bs!63)))))

(declare-fun b!235190 () Bool)

(declare-fun res!196686 () Bool)

(assert (=> b!235190 (=> (not res!196686) (not e!162577))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235190 (= res!196686 (validate_offset_bits!1 ((_ sign_extend 32) (size!5431 (buf!5906 bs!63))) ((_ sign_extend 32) (currentByte!10997 bs!63)) ((_ sign_extend 32) (currentBit!10992 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235187 () Bool)

(declare-fun res!196685 () Bool)

(assert (=> b!235187 (=> (not res!196685) (not e!162577))))

(assert (=> b!235187 (= res!196685 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196684 () Bool)

(assert (=> start!50036 (=> (not res!196684) (not e!162577))))

(assert (=> start!50036 (= res!196684 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50036 e!162577))

(assert (=> start!50036 true))

(declare-fun inv!12 (BitStream!9826) Bool)

(assert (=> start!50036 (and (inv!12 bs!63) e!162576)))

(assert (= (and start!50036 res!196684) b!235190))

(assert (= (and b!235190 res!196686) b!235187))

(assert (= (and b!235187 res!196685) b!235188))

(assert (= (and b!235188 res!196683) b!235186))

(assert (= start!50036 b!235189))

(declare-fun m!357829 () Bool)

(assert (=> b!235190 m!357829))

(declare-fun m!357831 () Bool)

(assert (=> b!235188 m!357831))

(declare-fun m!357833 () Bool)

(assert (=> b!235187 m!357833))

(declare-fun m!357835 () Bool)

(assert (=> b!235189 m!357835))

(declare-fun m!357837 () Bool)

(assert (=> b!235186 m!357837))

(declare-fun m!357839 () Bool)

(assert (=> b!235186 m!357839))

(declare-fun m!357841 () Bool)

(assert (=> b!235186 m!357841))

(declare-fun m!357843 () Bool)

(assert (=> start!50036 m!357843))

(push 1)

(assert (not b!235188))

(assert (not b!235186))

(assert (not b!235189))

(assert (not start!50036))

(assert (not b!235190))

(assert (not b!235187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

