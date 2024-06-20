; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31732 () Bool)

(assert start!31732)

(declare-datatypes ((array!7381 0))(
  ( (array!7382 (arr!4272 (Array (_ BitVec 32) (_ BitVec 8))) (size!3351 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5870 0))(
  ( (BitStream!5871 (buf!3809 array!7381) (currentByte!6997 (_ BitVec 32)) (currentBit!6992 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5870)

(declare-fun buf!77 () array!7381)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31732 (and (= (size!3351 (buf!3809 b1!99)) (size!3351 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3351 (buf!3809 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6997 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6992 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3351 (buf!3809 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6997 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6992 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!107755 () Bool)

(declare-fun inv!12 (BitStream!5870) Bool)

(assert (=> start!31732 (and (inv!12 b1!99) e!107755)))

(declare-fun array_inv!3098 (array!7381) Bool)

(assert (=> start!31732 (array_inv!3098 buf!77)))

(assert (=> start!31732 true))

(declare-fun b!158487 () Bool)

(assert (=> b!158487 (= e!107755 (array_inv!3098 (buf!3809 b1!99)))))

(assert (= start!31732 b!158487))

(declare-fun m!248965 () Bool)

(assert (=> start!31732 m!248965))

(declare-fun m!248967 () Bool)

(assert (=> start!31732 m!248967))

(declare-fun m!248969 () Bool)

(assert (=> b!158487 m!248969))

(push 1)

(assert (not start!31732))

(assert (not b!158487))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

