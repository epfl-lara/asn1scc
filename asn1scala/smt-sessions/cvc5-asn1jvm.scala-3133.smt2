; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72050 () Bool)

(assert start!72050)

(declare-fun res!265183 () Bool)

(declare-fun e!232740 () Bool)

(assert (=> start!72050 (=> (not res!265183) (not e!232740))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72050 (= res!265183 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72050 e!232740))

(assert (=> start!72050 true))

(declare-datatypes ((array!20614 0))(
  ( (array!20615 (arr!10063 (Array (_ BitVec 32) (_ BitVec 8))) (size!8971 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14104 0))(
  ( (BitStream!14105 (buf!8113 array!20614) (currentByte!14978 (_ BitVec 32)) (currentBit!14973 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14104)

(declare-fun e!232739 () Bool)

(declare-fun inv!12 (BitStream!14104) Bool)

(assert (=> start!72050 (and (inv!12 thiss!1793) e!232739)))

(declare-fun b!323033 () Bool)

(declare-fun res!265182 () Bool)

(assert (=> b!323033 (=> (not res!265182) (not e!232740))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323033 (= res!265182 (validate_offset_bits!1 ((_ sign_extend 32) (size!8971 (buf!8113 thiss!1793))) ((_ sign_extend 32) (currentByte!14978 thiss!1793)) ((_ sign_extend 32) (currentBit!14973 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323034 () Bool)

(assert (=> b!323034 (= e!232740 (and (not (= #b00000000000000000000000000000000 (bvand i!743 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!743) #b10000000000000000000000000000000)))))))

(declare-fun b!323035 () Bool)

(declare-fun array_inv!8523 (array!20614) Bool)

(assert (=> b!323035 (= e!232739 (array_inv!8523 (buf!8113 thiss!1793)))))

(assert (= (and start!72050 res!265183) b!323033))

(assert (= (and b!323033 res!265182) b!323034))

(assert (= start!72050 b!323035))

(declare-fun m!461247 () Bool)

(assert (=> start!72050 m!461247))

(declare-fun m!461249 () Bool)

(assert (=> b!323033 m!461249))

(declare-fun m!461251 () Bool)

(assert (=> b!323035 m!461251))

(push 1)

(assert (not b!323035))

(assert (not b!323033))

(assert (not start!72050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

