; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50222 () Bool)

(assert start!50222)

(declare-fun res!197112 () Bool)

(declare-fun e!163016 () Bool)

(assert (=> start!50222 (=> (not res!197112) (not e!163016))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50222 (= res!197112 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50222 e!163016))

(assert (=> start!50222 true))

(declare-datatypes ((array!12434 0))(
  ( (array!12435 (arr!6449 (Array (_ BitVec 32) (_ BitVec 8))) (size!5462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9888 0))(
  ( (BitStream!9889 (buf!5937 array!12434) (currentByte!11046 (_ BitVec 32)) (currentBit!11041 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9888)

(declare-fun e!163014 () Bool)

(declare-fun inv!12 (BitStream!9888) Bool)

(assert (=> start!50222 (and (inv!12 thiss!1848) e!163014)))

(declare-fun b!235800 () Bool)

(declare-fun res!197111 () Bool)

(assert (=> b!235800 (=> (not res!197111) (not e!163016))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235800 (= res!197111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5462 (buf!5937 thiss!1848))) ((_ sign_extend 32) (currentByte!11046 thiss!1848)) ((_ sign_extend 32) (currentBit!11041 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235801 () Bool)

(assert (=> b!235801 (= e!163016 (and (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand i!756 #b10000000000000000000000000000000))) (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand (bvsub nBits!593 i!756) #b10000000000000000000000000000000)))))))

(declare-fun b!235802 () Bool)

(declare-fun array_inv!5203 (array!12434) Bool)

(assert (=> b!235802 (= e!163014 (array_inv!5203 (buf!5937 thiss!1848)))))

(assert (= (and start!50222 res!197112) b!235800))

(assert (= (and b!235800 res!197111) b!235801))

(assert (= start!50222 b!235802))

(declare-fun m!358461 () Bool)

(assert (=> start!50222 m!358461))

(declare-fun m!358463 () Bool)

(assert (=> b!235800 m!358463))

(declare-fun m!358465 () Bool)

(assert (=> b!235802 m!358465))

(check-sat (not b!235800) (not start!50222) (not b!235802))
(check-sat)
