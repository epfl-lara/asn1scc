; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38160 () Bool)

(assert start!38160)

(declare-fun res!142358 () Bool)

(declare-fun e!120052 () Bool)

(assert (=> start!38160 (=> (not res!142358) (not e!120052))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38160 (= res!142358 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38160 e!120052))

(assert (=> start!38160 true))

(declare-datatypes ((array!9189 0))(
  ( (array!9190 (arr!4990 (Array (_ BitVec 32) (_ BitVec 8))) (size!4060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7228 0))(
  ( (BitStream!7229 (buf!4488 array!9189) (currentByte!8525 (_ BitVec 32)) (currentBit!8520 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7228)

(declare-fun e!120051 () Bool)

(declare-fun inv!12 (BitStream!7228) Bool)

(assert (=> start!38160 (and (inv!12 thiss!1817) e!120051)))

(declare-fun b!171790 () Bool)

(declare-fun res!142359 () Bool)

(assert (=> b!171790 (=> (not res!142359) (not e!120052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171790 (= res!142359 (validate_offset_bits!1 ((_ sign_extend 32) (size!4060 (buf!4488 thiss!1817))) ((_ sign_extend 32) (currentByte!8525 thiss!1817)) ((_ sign_extend 32) (currentBit!8520 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!171791 () Bool)

(assert (=> b!171791 (= e!120052 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4060 (buf!4488 thiss!1817))) ((_ sign_extend 32) (currentByte!8525 thiss!1817)) ((_ sign_extend 32) (currentBit!8520 thiss!1817)) ((_ sign_extend 32) nBits!575))))))

(declare-fun b!171792 () Bool)

(declare-fun array_inv!3801 (array!9189) Bool)

(assert (=> b!171792 (= e!120051 (array_inv!3801 (buf!4488 thiss!1817)))))

(assert (= (and start!38160 res!142358) b!171790))

(assert (= (and b!171790 res!142359) b!171791))

(assert (= start!38160 b!171792))

(declare-fun m!271037 () Bool)

(assert (=> start!38160 m!271037))

(declare-fun m!271039 () Bool)

(assert (=> b!171790 m!271039))

(assert (=> b!171791 m!271039))

(declare-fun m!271041 () Bool)

(assert (=> b!171792 m!271041))

(push 1)

(assert (not b!171790))

(assert (not start!38160))

(assert (not b!171791))

(assert (not b!171792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

