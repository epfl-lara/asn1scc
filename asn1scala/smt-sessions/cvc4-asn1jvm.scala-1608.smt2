; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45668 () Bool)

(assert start!45668)

(declare-fun b!220775 () Bool)

(declare-fun res!185975 () Bool)

(declare-fun e!149928 () Bool)

(assert (=> b!220775 (=> (not res!185975) (not e!149928))))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220775 (= res!185975 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220776 () Bool)

(declare-fun res!185972 () Bool)

(assert (=> b!220776 (=> (not res!185972) (not e!149928))))

(declare-datatypes ((array!10781 0))(
  ( (array!10782 (arr!5664 (Array (_ BitVec 32) (_ BitVec 8))) (size!4734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8576 0))(
  ( (BitStream!8577 (buf!5281 array!10781) (currentByte!9917 (_ BitVec 32)) (currentBit!9912 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8576)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220776 (= res!185972 (validate_offset_bits!1 ((_ sign_extend 32) (size!4734 (buf!5281 bs!62))) ((_ sign_extend 32) (currentByte!9917 bs!62)) ((_ sign_extend 32) (currentBit!9912 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!185974 () Bool)

(assert (=> start!45668 (=> (not res!185974) (not e!149928))))

(assert (=> start!45668 (= res!185974 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45668 e!149928))

(assert (=> start!45668 true))

(declare-fun e!149926 () Bool)

(declare-fun inv!12 (BitStream!8576) Bool)

(assert (=> start!45668 (and (inv!12 bs!62) e!149926)))

(declare-fun b!220777 () Bool)

(declare-fun res!185973 () Bool)

(assert (=> b!220777 (=> (not res!185973) (not e!149928))))

(assert (=> b!220777 (= res!185973 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220778 () Bool)

(declare-fun array_inv!4475 (array!10781) Bool)

(assert (=> b!220778 (= e!149926 (array_inv!4475 (buf!5281 bs!62)))))

(declare-fun b!220779 () Bool)

(assert (=> b!220779 (= e!149928 (and (= (bvand i!541 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!541 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)))))))

(declare-fun lt!348625 () BitStream!8576)

(declare-fun withMovedBitIndex!0 (BitStream!8576 (_ BitVec 64)) BitStream!8576)

(assert (=> b!220779 (= lt!348625 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18928 0))(
  ( (tuple2!18929 (_1!10122 BitStream!8576) (_2!10122 Bool)) )
))
(declare-fun lt!348626 () tuple2!18928)

(declare-fun readBitPure!0 (BitStream!8576) tuple2!18928)

(assert (=> b!220779 (= lt!348626 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18930 0))(
  ( (tuple2!18931 (_1!10123 BitStream!8576) (_2!10123 (_ BitVec 64))) )
))
(declare-fun lt!348624 () tuple2!18930)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18930)

(assert (=> b!220779 (= lt!348624 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45668 res!185974) b!220776))

(assert (= (and b!220776 res!185972) b!220775))

(assert (= (and b!220775 res!185975) b!220777))

(assert (= (and b!220777 res!185973) b!220779))

(assert (= start!45668 b!220778))

(declare-fun m!339461 () Bool)

(assert (=> b!220775 m!339461))

(declare-fun m!339463 () Bool)

(assert (=> b!220779 m!339463))

(declare-fun m!339465 () Bool)

(assert (=> b!220779 m!339465))

(declare-fun m!339467 () Bool)

(assert (=> b!220779 m!339467))

(declare-fun m!339469 () Bool)

(assert (=> b!220778 m!339469))

(declare-fun m!339471 () Bool)

(assert (=> start!45668 m!339471))

(declare-fun m!339473 () Bool)

(assert (=> b!220776 m!339473))

(push 1)

(assert (not start!45668))

(assert (not b!220779))

(assert (not b!220775))

(assert (not b!220778))

(assert (not b!220776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

