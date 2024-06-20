; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27296 () Bool)

(assert start!27296)

(declare-fun b!140155 () Bool)

(declare-fun res!116852 () Bool)

(declare-fun e!93404 () Bool)

(assert (=> b!140155 (=> (not res!116852) (not e!93404))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140155 (= res!116852 (bvslt from!447 to!404))))

(declare-fun b!140156 () Bool)

(assert (=> b!140156 (= e!93404 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun res!116853 () Bool)

(assert (=> start!27296 (=> (not res!116853) (not e!93404))))

(declare-datatypes ((array!6389 0))(
  ( (array!6390 (arr!3598 (Array (_ BitVec 32) (_ BitVec 8))) (size!2891 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6389)

(assert (=> start!27296 (= res!116853 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2891 arr!237))))))

(assert (=> start!27296 e!93404))

(assert (=> start!27296 true))

(declare-fun array_inv!2680 (array!6389) Bool)

(assert (=> start!27296 (array_inv!2680 arr!237)))

(declare-datatypes ((BitStream!5040 0))(
  ( (BitStream!5041 (buf!3312 array!6389) (currentByte!6154 (_ BitVec 32)) (currentBit!6149 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5040)

(declare-fun e!93403 () Bool)

(declare-fun inv!12 (BitStream!5040) Bool)

(assert (=> start!27296 (and (inv!12 thiss!1634) e!93403)))

(declare-fun b!140157 () Bool)

(assert (=> b!140157 (= e!93403 (array_inv!2680 (buf!3312 thiss!1634)))))

(declare-fun b!140158 () Bool)

(declare-fun res!116851 () Bool)

(assert (=> b!140158 (=> (not res!116851) (not e!93404))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140158 (= res!116851 (invariant!0 (currentBit!6149 thiss!1634) (currentByte!6154 thiss!1634) (size!2891 (buf!3312 thiss!1634))))))

(declare-fun b!140159 () Bool)

(declare-fun res!116854 () Bool)

(assert (=> b!140159 (=> (not res!116854) (not e!93404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140159 (= res!116854 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2891 (buf!3312 thiss!1634))) ((_ sign_extend 32) (currentByte!6154 thiss!1634)) ((_ sign_extend 32) (currentBit!6149 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27296 res!116853) b!140159))

(assert (= (and b!140159 res!116854) b!140155))

(assert (= (and b!140155 res!116852) b!140158))

(assert (= (and b!140158 res!116851) b!140156))

(assert (= start!27296 b!140157))

(declare-fun m!215973 () Bool)

(assert (=> start!27296 m!215973))

(declare-fun m!215975 () Bool)

(assert (=> start!27296 m!215975))

(declare-fun m!215977 () Bool)

(assert (=> b!140157 m!215977))

(declare-fun m!215979 () Bool)

(assert (=> b!140158 m!215979))

(declare-fun m!215981 () Bool)

(assert (=> b!140159 m!215981))

(check-sat (not b!140158) (not b!140159) (not b!140157) (not start!27296))
(check-sat)
