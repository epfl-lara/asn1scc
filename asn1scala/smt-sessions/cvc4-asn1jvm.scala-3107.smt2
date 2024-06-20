; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71526 () Bool)

(assert start!71526)

(declare-fun res!264012 () Bool)

(declare-fun e!231707 () Bool)

(assert (=> start!71526 (=> (not res!264012) (not e!231707))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71526 (= res!264012 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71526 e!231707))

(assert (=> start!71526 true))

(declare-datatypes ((array!20446 0))(
  ( (array!20447 (arr!9993 (Array (_ BitVec 32) (_ BitVec 8))) (size!8901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13964 0))(
  ( (BitStream!13965 (buf!8043 array!20446) (currentByte!14840 (_ BitVec 32)) (currentBit!14835 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13964)

(declare-fun e!231706 () Bool)

(declare-fun inv!12 (BitStream!13964) Bool)

(assert (=> start!71526 (and (inv!12 thiss!1811) e!231706)))

(declare-fun b!321593 () Bool)

(declare-fun res!264013 () Bool)

(assert (=> b!321593 (=> (not res!264013) (not e!231707))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321593 (= res!264013 (validate_offset_bits!1 ((_ sign_extend 32) (size!8901 (buf!8043 thiss!1811))) ((_ sign_extend 32) (currentByte!14840 thiss!1811)) ((_ sign_extend 32) (currentBit!14835 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321594 () Bool)

(assert (=> b!321594 (= e!231707 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!747)))))

(declare-fun b!321595 () Bool)

(declare-fun array_inv!8453 (array!20446) Bool)

(assert (=> b!321595 (= e!231706 (array_inv!8453 (buf!8043 thiss!1811)))))

(assert (= (and start!71526 res!264012) b!321593))

(assert (= (and b!321593 res!264013) b!321594))

(assert (= start!71526 b!321595))

(declare-fun m!459951 () Bool)

(assert (=> start!71526 m!459951))

(declare-fun m!459953 () Bool)

(assert (=> b!321593 m!459953))

(declare-fun m!459955 () Bool)

(assert (=> b!321595 m!459955))

(push 1)

(assert (not start!71526))

(assert (not b!321595))

(assert (not b!321593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

