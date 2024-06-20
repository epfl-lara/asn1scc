; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22328 () Bool)

(assert start!22328)

(declare-fun b!112892 () Bool)

(declare-fun res!93211 () Bool)

(declare-fun e!74074 () Bool)

(assert (=> b!112892 (=> (not res!93211) (not e!74074))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112892 (= res!93211 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93210 () Bool)

(assert (=> start!22328 (=> (not res!93210) (not e!74074))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22328 (= res!93210 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22328 e!74074))

(assert (=> start!22328 true))

(declare-datatypes ((array!5119 0))(
  ( (array!5120 (arr!2920 (Array (_ BitVec 32) (_ BitVec 8))) (size!2327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4128 0))(
  ( (BitStream!4129 (buf!2735 array!5119) (currentByte!5309 (_ BitVec 32)) (currentBit!5304 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4128)

(declare-fun e!74076 () Bool)

(declare-fun inv!12 (BitStream!4128) Bool)

(assert (=> start!22328 (and (inv!12 thiss!1305) e!74076)))

(declare-fun b!112891 () Bool)

(declare-fun res!93212 () Bool)

(assert (=> b!112891 (=> (not res!93212) (not e!74074))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112891 (= res!93212 (validate_offset_bits!1 ((_ sign_extend 32) (size!2327 (buf!2735 thiss!1305))) ((_ sign_extend 32) (currentByte!5309 thiss!1305)) ((_ sign_extend 32) (currentBit!5304 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112893 () Bool)

(assert (=> b!112893 (= e!74074 (and (bvslt i!615 nBits!396) (let ((bdg!5565 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) (or (bvslt bdg!5565 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!5565 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!112894 () Bool)

(declare-fun array_inv!2129 (array!5119) Bool)

(assert (=> b!112894 (= e!74076 (array_inv!2129 (buf!2735 thiss!1305)))))

(assert (= (and start!22328 res!93210) b!112891))

(assert (= (and b!112891 res!93212) b!112892))

(assert (= (and b!112892 res!93211) b!112893))

(assert (= start!22328 b!112894))

(declare-fun m!168969 () Bool)

(assert (=> b!112892 m!168969))

(declare-fun m!168971 () Bool)

(assert (=> start!22328 m!168971))

(declare-fun m!168973 () Bool)

(assert (=> b!112891 m!168973))

(declare-fun m!168975 () Bool)

(assert (=> b!112894 m!168975))

(check-sat (not start!22328) (not b!112891) (not b!112892) (not b!112894))
(check-sat)
