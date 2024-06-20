; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19386 () Bool)

(assert start!19386)

(declare-fun res!79492 () Bool)

(declare-fun e!63475 () Bool)

(assert (=> start!19386 (=> (not res!79492) (not e!63475))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4519 0))(
  ( (array!4520 (arr!2660 (Array (_ BitVec 32) (_ BitVec 8))) (size!2067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3608 0))(
  ( (BitStream!3609 (buf!2413 array!4519) (currentByte!4819 (_ BitVec 32)) (currentBit!4814 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3608)

(assert (=> start!19386 (= res!79492 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2067 (buf!2413 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4819 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4814 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2067 (buf!2413 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4819 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4814 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19386 e!63475))

(assert (=> start!19386 true))

(declare-fun e!63476 () Bool)

(declare-fun inv!12 (BitStream!3608) Bool)

(assert (=> start!19386 (and (inv!12 thiss!1288) e!63476)))

(declare-fun b!96851 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96851 (= e!63475 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4814 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4819 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2067 (buf!2413 thiss!1288)))))))))

(declare-fun b!96852 () Bool)

(declare-fun array_inv!1869 (array!4519) Bool)

(assert (=> b!96852 (= e!63476 (array_inv!1869 (buf!2413 thiss!1288)))))

(assert (= (and start!19386 res!79492) b!96851))

(assert (= start!19386 b!96852))

(declare-fun m!140503 () Bool)

(assert (=> start!19386 m!140503))

(declare-fun m!140505 () Bool)

(assert (=> b!96851 m!140505))

(declare-fun m!140507 () Bool)

(assert (=> b!96852 m!140507))

(push 1)

(assert (not start!19386))

(assert (not b!96852))

(assert (not b!96851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

