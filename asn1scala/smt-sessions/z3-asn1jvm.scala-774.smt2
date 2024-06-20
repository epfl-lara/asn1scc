; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22316 () Bool)

(assert start!22316)

(declare-fun b!112821 () Bool)

(declare-fun e!74020 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!112821 (= e!74020 (and (bvslt i!615 nBits!396) (not (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!112820 () Bool)

(declare-fun res!93156 () Bool)

(assert (=> b!112820 (=> (not res!93156) (not e!74020))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112820 (= res!93156 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112822 () Bool)

(declare-fun e!74021 () Bool)

(declare-datatypes ((array!5107 0))(
  ( (array!5108 (arr!2914 (Array (_ BitVec 32) (_ BitVec 8))) (size!2321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4116 0))(
  ( (BitStream!4117 (buf!2729 array!5107) (currentByte!5303 (_ BitVec 32)) (currentBit!5298 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4116)

(declare-fun array_inv!2123 (array!5107) Bool)

(assert (=> b!112822 (= e!74021 (array_inv!2123 (buf!2729 thiss!1305)))))

(declare-fun res!93157 () Bool)

(assert (=> start!22316 (=> (not res!93157) (not e!74020))))

(assert (=> start!22316 (= res!93157 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22316 e!74020))

(assert (=> start!22316 true))

(declare-fun inv!12 (BitStream!4116) Bool)

(assert (=> start!22316 (and (inv!12 thiss!1305) e!74021)))

(declare-fun b!112819 () Bool)

(declare-fun res!93158 () Bool)

(assert (=> b!112819 (=> (not res!93158) (not e!74020))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112819 (= res!93158 (validate_offset_bits!1 ((_ sign_extend 32) (size!2321 (buf!2729 thiss!1305))) ((_ sign_extend 32) (currentByte!5303 thiss!1305)) ((_ sign_extend 32) (currentBit!5298 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!22316 res!93157) b!112819))

(assert (= (and b!112819 res!93158) b!112820))

(assert (= (and b!112820 res!93156) b!112821))

(assert (= start!22316 b!112822))

(declare-fun m!168921 () Bool)

(assert (=> b!112820 m!168921))

(declare-fun m!168923 () Bool)

(assert (=> b!112822 m!168923))

(declare-fun m!168925 () Bool)

(assert (=> start!22316 m!168925))

(declare-fun m!168927 () Bool)

(assert (=> b!112819 m!168927))

(check-sat (not b!112822) (not start!22316) (not b!112819) (not b!112820))
(check-sat)
