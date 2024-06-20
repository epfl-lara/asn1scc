; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22310 () Bool)

(assert start!22310)

(declare-fun res!93129 () Bool)

(declare-fun e!73993 () Bool)

(assert (=> start!22310 (=> (not res!93129) (not e!73993))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22310 (= res!93129 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22310 e!73993))

(assert (=> start!22310 true))

(declare-datatypes ((array!5101 0))(
  ( (array!5102 (arr!2911 (Array (_ BitVec 32) (_ BitVec 8))) (size!2318 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4110 0))(
  ( (BitStream!4111 (buf!2726 array!5101) (currentByte!5300 (_ BitVec 32)) (currentBit!5295 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4110)

(declare-fun e!73995 () Bool)

(declare-fun inv!12 (BitStream!4110) Bool)

(assert (=> start!22310 (and (inv!12 thiss!1305) e!73995)))

(declare-fun b!112785 () Bool)

(assert (=> b!112785 (= e!73993 (and (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000))) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun b!112786 () Bool)

(declare-fun array_inv!2120 (array!5101) Bool)

(assert (=> b!112786 (= e!73995 (array_inv!2120 (buf!2726 thiss!1305)))))

(declare-fun b!112783 () Bool)

(declare-fun res!93131 () Bool)

(assert (=> b!112783 (=> (not res!93131) (not e!73993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112783 (= res!93131 (validate_offset_bits!1 ((_ sign_extend 32) (size!2318 (buf!2726 thiss!1305))) ((_ sign_extend 32) (currentByte!5300 thiss!1305)) ((_ sign_extend 32) (currentBit!5295 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112784 () Bool)

(declare-fun res!93130 () Bool)

(assert (=> b!112784 (=> (not res!93130) (not e!73993))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112784 (= res!93130 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22310 res!93129) b!112783))

(assert (= (and b!112783 res!93131) b!112784))

(assert (= (and b!112784 res!93130) b!112785))

(assert (= start!22310 b!112786))

(declare-fun m!168897 () Bool)

(assert (=> start!22310 m!168897))

(declare-fun m!168899 () Bool)

(assert (=> b!112786 m!168899))

(declare-fun m!168901 () Bool)

(assert (=> b!112783 m!168901))

(declare-fun m!168903 () Bool)

(assert (=> b!112784 m!168903))

(check-sat (not b!112786) (not start!22310) (not b!112783) (not b!112784))
(check-sat)
