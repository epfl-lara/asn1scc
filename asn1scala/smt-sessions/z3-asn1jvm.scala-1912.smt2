; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50044 () Bool)

(assert start!50044)

(declare-fun b!235256 () Bool)

(declare-fun e!162617 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> b!235256 (= e!162617 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))))))

(declare-fun b!235258 () Bool)

(declare-fun res!196732 () Bool)

(declare-fun e!162619 () Bool)

(assert (=> b!235258 (=> (not res!196732) (not e!162619))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235258 (= res!196732 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!235259 () Bool)

(declare-fun e!162620 () Bool)

(declare-datatypes ((array!12373 0))(
  ( (array!12374 (arr!6422 (Array (_ BitVec 32) (_ BitVec 8))) (size!5435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9834 0))(
  ( (BitStream!9835 (buf!5910 array!12373) (currentByte!11001 (_ BitVec 32)) (currentBit!10996 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9834)

(declare-fun array_inv!5176 (array!12373) Bool)

(assert (=> b!235259 (= e!162620 (array_inv!5176 (buf!5910 bs!63)))))

(declare-fun b!235260 () Bool)

(declare-fun res!196731 () Bool)

(assert (=> b!235260 (=> (not res!196731) (not e!162619))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235260 (= res!196731 (validate_offset_bits!1 ((_ sign_extend 32) (size!5435 (buf!5910 bs!63))) ((_ sign_extend 32) (currentByte!11001 bs!63)) ((_ sign_extend 32) (currentBit!10996 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235261 () Bool)

(assert (=> b!235261 (= e!162619 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19872 0))(
  ( (tuple2!19873 (_1!10840 BitStream!9834) (_2!10840 (_ BitVec 64))) )
))
(declare-fun lt!370940 () tuple2!19872)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19872)

(declare-fun withMovedBitIndex!0 (BitStream!9834 (_ BitVec 64)) BitStream!9834)

(assert (=> b!235261 (= lt!370940 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!274 (bvadd #b00000000000000000000000000000001 i!546) (bvor acc!118 e!162617)))))

(declare-fun c!11281 () Bool)

(declare-datatypes ((tuple2!19874 0))(
  ( (tuple2!19875 (_1!10841 BitStream!9834) (_2!10841 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9834) tuple2!19874)

(assert (=> b!235261 (= c!11281 (_2!10841 (readBitPure!0 bs!63)))))

(declare-fun lt!370941 () tuple2!19872)

(assert (=> b!235261 (= lt!370941 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!235262 () Bool)

(declare-fun res!196734 () Bool)

(assert (=> b!235262 (=> (not res!196734) (not e!162619))))

(assert (=> b!235262 (= res!196734 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235257 () Bool)

(assert (=> b!235257 (= e!162617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!196733 () Bool)

(assert (=> start!50044 (=> (not res!196733) (not e!162619))))

(assert (=> start!50044 (= res!196733 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50044 e!162619))

(assert (=> start!50044 true))

(declare-fun inv!12 (BitStream!9834) Bool)

(assert (=> start!50044 (and (inv!12 bs!63) e!162620)))

(assert (= (and start!50044 res!196733) b!235260))

(assert (= (and b!235260 res!196731) b!235262))

(assert (= (and b!235262 res!196734) b!235258))

(assert (= (and b!235258 res!196732) b!235261))

(assert (= (and b!235261 c!11281) b!235256))

(assert (= (and b!235261 (not c!11281)) b!235257))

(assert (= start!50044 b!235259))

(declare-fun m!357895 () Bool)

(assert (=> start!50044 m!357895))

(declare-fun m!357897 () Bool)

(assert (=> b!235261 m!357897))

(assert (=> b!235261 m!357897))

(declare-fun m!357899 () Bool)

(assert (=> b!235261 m!357899))

(declare-fun m!357901 () Bool)

(assert (=> b!235261 m!357901))

(declare-fun m!357903 () Bool)

(assert (=> b!235261 m!357903))

(declare-fun m!357905 () Bool)

(assert (=> b!235260 m!357905))

(declare-fun m!357907 () Bool)

(assert (=> b!235262 m!357907))

(declare-fun m!357909 () Bool)

(assert (=> b!235258 m!357909))

(declare-fun m!357911 () Bool)

(assert (=> b!235259 m!357911))

(check-sat (not b!235259) (not b!235261) (not start!50044) (not b!235258) (not b!235260) (not b!235262))
(check-sat)
