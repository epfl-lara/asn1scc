; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50038 () Bool)

(assert start!50038)

(declare-fun b!235201 () Bool)

(declare-fun res!196697 () Bool)

(declare-fun e!162587 () Bool)

(assert (=> b!235201 (=> (not res!196697) (not e!162587))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235201 (= res!196697 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235202 () Bool)

(declare-fun res!196695 () Bool)

(assert (=> b!235202 (=> (not res!196695) (not e!162587))))

(declare-datatypes ((array!12367 0))(
  ( (array!12368 (arr!6419 (Array (_ BitVec 32) (_ BitVec 8))) (size!5432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9828 0))(
  ( (BitStream!9829 (buf!5907 array!12367) (currentByte!10998 (_ BitVec 32)) (currentBit!10993 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9828)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235202 (= res!196695 (validate_offset_bits!1 ((_ sign_extend 32) (size!5432 (buf!5907 bs!63))) ((_ sign_extend 32) (currentByte!10998 bs!63)) ((_ sign_extend 32) (currentBit!10993 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235203 () Bool)

(declare-fun res!196698 () Bool)

(assert (=> b!235203 (=> (not res!196698) (not e!162587))))

(assert (=> b!235203 (= res!196698 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235204 () Bool)

(declare-fun e!162586 () Bool)

(declare-fun array_inv!5173 (array!12367) Bool)

(assert (=> b!235204 (= e!162586 (array_inv!5173 (buf!5907 bs!63)))))

(declare-fun b!235205 () Bool)

(assert (=> b!235205 (= e!162587 (and (= (bvand i!546 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!546 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!546) #b10000000000000000000000000000000)))))))

(declare-fun lt!370920 () BitStream!9828)

(declare-fun withMovedBitIndex!0 (BitStream!9828 (_ BitVec 64)) BitStream!9828)

(assert (=> b!235205 (= lt!370920 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!19860 0))(
  ( (tuple2!19861 (_1!10834 BitStream!9828) (_2!10834 Bool)) )
))
(declare-fun lt!370919 () tuple2!19860)

(declare-fun readBitPure!0 (BitStream!9828) tuple2!19860)

(assert (=> b!235205 (= lt!370919 (readBitPure!0 bs!63))))

(declare-datatypes ((tuple2!19862 0))(
  ( (tuple2!19863 (_1!10835 BitStream!9828) (_2!10835 (_ BitVec 64))) )
))
(declare-fun lt!370918 () tuple2!19862)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19862)

(assert (=> b!235205 (= lt!370918 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun res!196696 () Bool)

(assert (=> start!50038 (=> (not res!196696) (not e!162587))))

(assert (=> start!50038 (= res!196696 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50038 e!162587))

(assert (=> start!50038 true))

(declare-fun inv!12 (BitStream!9828) Bool)

(assert (=> start!50038 (and (inv!12 bs!63) e!162586)))

(assert (= (and start!50038 res!196696) b!235202))

(assert (= (and b!235202 res!196695) b!235201))

(assert (= (and b!235201 res!196697) b!235203))

(assert (= (and b!235203 res!196698) b!235205))

(assert (= start!50038 b!235204))

(declare-fun m!357845 () Bool)

(assert (=> b!235202 m!357845))

(declare-fun m!357847 () Bool)

(assert (=> b!235204 m!357847))

(declare-fun m!357849 () Bool)

(assert (=> b!235203 m!357849))

(declare-fun m!357851 () Bool)

(assert (=> b!235205 m!357851))

(declare-fun m!357853 () Bool)

(assert (=> b!235205 m!357853))

(declare-fun m!357855 () Bool)

(assert (=> b!235205 m!357855))

(declare-fun m!357857 () Bool)

(assert (=> b!235201 m!357857))

(declare-fun m!357859 () Bool)

(assert (=> start!50038 m!357859))

(check-sat (not b!235203) (not b!235201) (not b!235202) (not b!235204) (not b!235205) (not start!50038))
(check-sat)
