; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50014 () Bool)

(assert start!50014)

(declare-fun res!196559 () Bool)

(declare-fun e!162479 () Bool)

(assert (=> start!50014 (=> (not res!196559) (not e!162479))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50014 (= res!196559 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50014 e!162479))

(assert (=> start!50014 true))

(declare-datatypes ((array!12343 0))(
  ( (array!12344 (arr!6407 (Array (_ BitVec 32) (_ BitVec 8))) (size!5420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9804 0))(
  ( (BitStream!9805 (buf!5895 array!12343) (currentByte!10986 (_ BitVec 32)) (currentBit!10981 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9804)

(declare-fun e!162478 () Bool)

(declare-fun inv!12 (BitStream!9804) Bool)

(assert (=> start!50014 (and (inv!12 bs!63) e!162478)))

(declare-fun b!235029 () Bool)

(declare-fun res!196560 () Bool)

(assert (=> b!235029 (=> (not res!196560) (not e!162479))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235029 (= res!196560 (validate_offset_bits!1 ((_ sign_extend 32) (size!5420 (buf!5895 bs!63))) ((_ sign_extend 32) (currentByte!10986 bs!63)) ((_ sign_extend 32) (currentBit!10981 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235030 () Bool)

(assert (=> b!235030 (= e!162479 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-fun b!235031 () Bool)

(declare-fun array_inv!5161 (array!12343) Bool)

(assert (=> b!235031 (= e!162478 (array_inv!5161 (buf!5895 bs!63)))))

(assert (= (and start!50014 res!196559) b!235029))

(assert (= (and b!235029 res!196560) b!235030))

(assert (= start!50014 b!235031))

(declare-fun m!357673 () Bool)

(assert (=> start!50014 m!357673))

(declare-fun m!357675 () Bool)

(assert (=> b!235029 m!357675))

(declare-fun m!357677 () Bool)

(assert (=> b!235031 m!357677))

(check-sat (not b!235031) (not start!50014) (not b!235029))
(check-sat)
