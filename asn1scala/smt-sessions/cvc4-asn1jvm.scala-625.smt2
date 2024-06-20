; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17684 () Bool)

(assert start!17684)

(declare-fun b!85376 () Bool)

(declare-fun res!70047 () Bool)

(declare-fun e!56869 () Bool)

(assert (=> b!85376 (=> res!70047 e!56869)))

(declare-datatypes ((array!4060 0))(
  ( (array!4061 (arr!2471 (Array (_ BitVec 32) (_ BitVec 8))) (size!1834 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3230 0))(
  ( (BitStream!3231 (buf!2224 array!4060) (currentByte!4421 (_ BitVec 32)) (currentBit!4416 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3230)

(declare-fun thiss!1151 () BitStream!3230)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85376 (= res!70047 (not (= (bitIndex!0 (size!1834 (buf!2224 thiss!1152)) (currentByte!4421 thiss!1152) (currentBit!4416 thiss!1152)) (bvadd (bitIndex!0 (size!1834 (buf!2224 thiss!1151)) (currentByte!4421 thiss!1151) (currentBit!4416 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(declare-fun b!85377 () Bool)

(declare-fun res!70049 () Bool)

(assert (=> b!85377 (=> res!70049 e!56869)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85377 (= res!70049 (not (invariant!0 (currentBit!4416 thiss!1152) (currentByte!4421 thiss!1152) (size!1834 (buf!2224 thiss!1152)))))))

(declare-fun b!85378 () Bool)

(declare-fun e!56871 () Bool)

(declare-fun array_inv!1680 (array!4060) Bool)

(assert (=> b!85378 (= e!56871 (array_inv!1680 (buf!2224 thiss!1152)))))

(declare-fun res!70050 () Bool)

(declare-fun e!56874 () Bool)

(assert (=> start!17684 (=> (not res!70050) (not e!56874))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17684 (= res!70050 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17684 e!56874))

(assert (=> start!17684 true))

(declare-fun e!56873 () Bool)

(declare-fun inv!12 (BitStream!3230) Bool)

(assert (=> start!17684 (and (inv!12 thiss!1151) e!56873)))

(assert (=> start!17684 (and (inv!12 thiss!1152) e!56871)))

(declare-fun b!85379 () Bool)

(declare-fun res!70045 () Bool)

(assert (=> b!85379 (=> (not res!70045) (not e!56874))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85379 (= res!70045 (validate_offset_bits!1 ((_ sign_extend 32) (size!1834 (buf!2224 thiss!1151))) ((_ sign_extend 32) (currentByte!4421 thiss!1151)) ((_ sign_extend 32) (currentBit!4416 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85380 () Bool)

(declare-fun res!70048 () Bool)

(assert (=> b!85380 (=> res!70048 e!56869)))

(assert (=> b!85380 (= res!70048 (or (bvsgt i!576 nBits!336) (not (= (size!1834 (buf!2224 thiss!1152)) (size!1834 (buf!2224 thiss!1151))))))))

(declare-fun b!85381 () Bool)

(declare-fun res!70046 () Bool)

(assert (=> b!85381 (=> res!70046 e!56869)))

(assert (=> b!85381 (= res!70046 (bvslt i!576 #b00000000000000000000000000000000))))

(declare-fun b!85382 () Bool)

(assert (=> b!85382 (= e!56873 (array_inv!1680 (buf!2224 thiss!1151)))))

(declare-fun b!85383 () Bool)

(assert (=> b!85383 (= e!56869 true)))

(declare-fun b!85384 () Bool)

(assert (=> b!85384 (= e!56874 false)))

(declare-fun lt!134637 () Bool)

(assert (=> b!85384 (= lt!134637 e!56869)))

(declare-fun res!70051 () Bool)

(assert (=> b!85384 (=> res!70051 e!56869)))

(assert (=> b!85384 (= res!70051 (not (invariant!0 (currentBit!4416 thiss!1151) (currentByte!4421 thiss!1151) (size!1834 (buf!2224 thiss!1151)))))))

(assert (= (and start!17684 res!70050) b!85379))

(assert (= (and b!85379 res!70045) b!85384))

(assert (= (and b!85384 (not res!70051)) b!85381))

(assert (= (and b!85381 (not res!70046)) b!85377))

(assert (= (and b!85377 (not res!70049)) b!85380))

(assert (= (and b!85380 (not res!70048)) b!85376))

(assert (= (and b!85376 (not res!70047)) b!85383))

(assert (= start!17684 b!85382))

(assert (= start!17684 b!85378))

(declare-fun m!131561 () Bool)

(assert (=> b!85377 m!131561))

(declare-fun m!131563 () Bool)

(assert (=> start!17684 m!131563))

(declare-fun m!131565 () Bool)

(assert (=> start!17684 m!131565))

(declare-fun m!131567 () Bool)

(assert (=> b!85376 m!131567))

(declare-fun m!131569 () Bool)

(assert (=> b!85376 m!131569))

(declare-fun m!131571 () Bool)

(assert (=> b!85378 m!131571))

(declare-fun m!131573 () Bool)

(assert (=> b!85379 m!131573))

(declare-fun m!131575 () Bool)

(assert (=> b!85382 m!131575))

(declare-fun m!131577 () Bool)

(assert (=> b!85384 m!131577))

(push 1)

(assert (not b!85384))

(assert (not b!85379))

(assert (not b!85378))

(assert (not b!85377))

(assert (not b!85376))

(assert (not b!85382))

(assert (not start!17684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

