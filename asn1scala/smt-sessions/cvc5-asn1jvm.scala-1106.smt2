; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31770 () Bool)

(assert start!31770)

(declare-fun res!132398 () Bool)

(declare-fun e!107803 () Bool)

(assert (=> start!31770 (=> (not res!132398) (not e!107803))))

(declare-datatypes ((array!7394 0))(
  ( (array!7395 (arr!4276 (Array (_ BitVec 32) (_ BitVec 8))) (size!3355 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5878 0))(
  ( (BitStream!5879 (buf!3813 array!7394) (currentByte!7005 (_ BitVec 32)) (currentBit!7000 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5878)

(declare-fun buf!77 () array!7394)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31770 (= res!132398 (and (= (size!3355 (buf!3813 b1!99)) (size!3355 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31770 e!107803))

(declare-fun e!107804 () Bool)

(declare-fun inv!12 (BitStream!5878) Bool)

(assert (=> start!31770 (and (inv!12 b1!99) e!107804)))

(declare-fun array_inv!3102 (array!7394) Bool)

(assert (=> start!31770 (array_inv!3102 buf!77)))

(assert (=> start!31770 true))

(declare-fun b!158512 () Bool)

(declare-fun res!132397 () Bool)

(assert (=> b!158512 (=> (not res!132397) (not e!107803))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158512 (= res!132397 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3355 (buf!3813 b1!99))) ((_ sign_extend 32) (currentByte!7005 b1!99)) ((_ sign_extend 32) (currentBit!7000 b1!99)) bytes!14))))

(declare-fun b!158513 () Bool)

(assert (=> b!158513 (= e!107803 (or (bvsgt ((_ sign_extend 32) (size!3355 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7005 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7000 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!158514 () Bool)

(assert (=> b!158514 (= e!107804 (array_inv!3102 (buf!3813 b1!99)))))

(assert (= (and start!31770 res!132398) b!158512))

(assert (= (and b!158512 res!132397) b!158513))

(assert (= start!31770 b!158514))

(declare-fun m!249005 () Bool)

(assert (=> start!31770 m!249005))

(declare-fun m!249007 () Bool)

(assert (=> start!31770 m!249007))

(declare-fun m!249009 () Bool)

(assert (=> b!158512 m!249009))

(declare-fun m!249011 () Bool)

(assert (=> b!158514 m!249011))

(push 1)

(assert (not b!158514))

(assert (not start!31770))

(assert (not b!158512))

(check-sat)

