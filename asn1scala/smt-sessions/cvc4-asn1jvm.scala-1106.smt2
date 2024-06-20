; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31774 () Bool)

(assert start!31774)

(declare-fun res!132410 () Bool)

(declare-fun e!107829 () Bool)

(assert (=> start!31774 (=> (not res!132410) (not e!107829))))

(declare-datatypes ((array!7398 0))(
  ( (array!7399 (arr!4278 (Array (_ BitVec 32) (_ BitVec 8))) (size!3357 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5882 0))(
  ( (BitStream!5883 (buf!3815 array!7398) (currentByte!7007 (_ BitVec 32)) (currentBit!7002 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5882)

(declare-fun buf!77 () array!7398)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31774 (= res!132410 (and (= (size!3357 (buf!3815 b1!99)) (size!3357 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31774 e!107829))

(declare-fun e!107827 () Bool)

(declare-fun inv!12 (BitStream!5882) Bool)

(assert (=> start!31774 (and (inv!12 b1!99) e!107827)))

(declare-fun array_inv!3104 (array!7398) Bool)

(assert (=> start!31774 (array_inv!3104 buf!77)))

(assert (=> start!31774 true))

(declare-fun b!158530 () Bool)

(declare-fun res!132409 () Bool)

(assert (=> b!158530 (=> (not res!132409) (not e!107829))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158530 (= res!132409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3357 (buf!3815 b1!99))) ((_ sign_extend 32) (currentByte!7007 b1!99)) ((_ sign_extend 32) (currentBit!7002 b1!99)) bytes!14))))

(declare-fun b!158531 () Bool)

(assert (=> b!158531 (= e!107829 (or (bvsgt ((_ sign_extend 32) (size!3357 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7007 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7002 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!158532 () Bool)

(assert (=> b!158532 (= e!107827 (array_inv!3104 (buf!3815 b1!99)))))

(assert (= (and start!31774 res!132410) b!158530))

(assert (= (and b!158530 res!132409) b!158531))

(assert (= start!31774 b!158532))

(declare-fun m!249021 () Bool)

(assert (=> start!31774 m!249021))

(declare-fun m!249023 () Bool)

(assert (=> start!31774 m!249023))

(declare-fun m!249025 () Bool)

(assert (=> b!158530 m!249025))

(declare-fun m!249027 () Bool)

(assert (=> b!158532 m!249027))

(push 1)

(assert (not b!158530))

(assert (not start!31774))

(assert (not b!158532))

(check-sat)

