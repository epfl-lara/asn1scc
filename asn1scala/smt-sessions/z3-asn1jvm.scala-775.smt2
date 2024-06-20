; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22322 () Bool)

(assert start!22322)

(declare-fun b!112855 () Bool)

(declare-fun res!93184 () Bool)

(declare-fun e!74049 () Bool)

(assert (=> b!112855 (=> (not res!93184) (not e!74049))))

(declare-datatypes ((array!5113 0))(
  ( (array!5114 (arr!2917 (Array (_ BitVec 32) (_ BitVec 8))) (size!2324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4122 0))(
  ( (BitStream!4123 (buf!2732 array!5113) (currentByte!5306 (_ BitVec 32)) (currentBit!5301 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4122)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112855 (= res!93184 (validate_offset_bits!1 ((_ sign_extend 32) (size!2324 (buf!2732 thiss!1305))) ((_ sign_extend 32) (currentByte!5306 thiss!1305)) ((_ sign_extend 32) (currentBit!5301 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112856 () Bool)

(declare-fun res!93183 () Bool)

(assert (=> b!112856 (=> (not res!93183) (not e!74049))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112856 (= res!93183 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112857 () Bool)

(assert (=> b!112857 (= e!74049 (and (bvslt i!615 nBits!396) (let ((bdg!5564 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!5564 (bvand i!615 #b10000000000000000000000000000000))) (not (= bdg!5564 (bvand (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615) #b10000000000000000000000000000000)))))))))

(declare-fun res!93185 () Bool)

(assert (=> start!22322 (=> (not res!93185) (not e!74049))))

(assert (=> start!22322 (= res!93185 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22322 e!74049))

(assert (=> start!22322 true))

(declare-fun e!74048 () Bool)

(declare-fun inv!12 (BitStream!4122) Bool)

(assert (=> start!22322 (and (inv!12 thiss!1305) e!74048)))

(declare-fun b!112858 () Bool)

(declare-fun array_inv!2126 (array!5113) Bool)

(assert (=> b!112858 (= e!74048 (array_inv!2126 (buf!2732 thiss!1305)))))

(assert (= (and start!22322 res!93185) b!112855))

(assert (= (and b!112855 res!93184) b!112856))

(assert (= (and b!112856 res!93183) b!112857))

(assert (= start!22322 b!112858))

(declare-fun m!168945 () Bool)

(assert (=> b!112855 m!168945))

(declare-fun m!168947 () Bool)

(assert (=> b!112856 m!168947))

(declare-fun m!168949 () Bool)

(assert (=> start!22322 m!168949))

(declare-fun m!168951 () Bool)

(assert (=> b!112858 m!168951))

(check-sat (not b!112856) (not b!112858) (not b!112855) (not start!22322))
(check-sat)
