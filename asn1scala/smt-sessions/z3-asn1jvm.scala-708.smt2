; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19908 () Bool)

(assert start!19908)

(declare-fun res!81289 () Bool)

(declare-fun e!64872 () Bool)

(assert (=> start!19908 (=> (not res!81289) (not e!64872))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!19908 (= res!81289 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19908 e!64872))

(assert (=> start!19908 true))

(declare-datatypes ((array!4658 0))(
  ( (array!4659 (arr!2719 (Array (_ BitVec 32) (_ BitVec 8))) (size!2126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3726 0))(
  ( (BitStream!3727 (buf!2483 array!4658) (currentByte!4923 (_ BitVec 32)) (currentBit!4918 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3726)

(declare-fun e!64871 () Bool)

(declare-fun inv!12 (BitStream!3726) Bool)

(assert (=> start!19908 (and (inv!12 thiss!1305) e!64871)))

(declare-fun b!99123 () Bool)

(declare-fun res!81290 () Bool)

(assert (=> b!99123 (=> (not res!81290) (not e!64872))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99123 (= res!81290 (validate_offset_bits!1 ((_ sign_extend 32) (size!2126 (buf!2483 thiss!1305))) ((_ sign_extend 32) (currentByte!4923 thiss!1305)) ((_ sign_extend 32) (currentBit!4918 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99124 () Bool)

(assert (=> b!99124 (= e!64872 (bvsgt #b00000000000000000000000000000000 nBits!396))))

(declare-fun b!99125 () Bool)

(declare-fun array_inv!1928 (array!4658) Bool)

(assert (=> b!99125 (= e!64871 (array_inv!1928 (buf!2483 thiss!1305)))))

(assert (= (and start!19908 res!81289) b!99123))

(assert (= (and b!99123 res!81290) b!99124))

(assert (= start!19908 b!99125))

(declare-fun m!144553 () Bool)

(assert (=> start!19908 m!144553))

(declare-fun m!144555 () Bool)

(assert (=> b!99123 m!144555))

(declare-fun m!144557 () Bool)

(assert (=> b!99125 m!144557))

(check-sat (not b!99125) (not start!19908) (not b!99123))
(check-sat)
