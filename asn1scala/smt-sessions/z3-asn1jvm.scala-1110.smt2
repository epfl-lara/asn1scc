; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31860 () Bool)

(assert start!31860)

(declare-fun res!132485 () Bool)

(declare-fun e!107959 () Bool)

(assert (=> start!31860 (=> (not res!132485) (not e!107959))))

(declare-datatypes ((array!7429 0))(
  ( (array!7430 (arr!4289 (Array (_ BitVec 32) (_ BitVec 8))) (size!3368 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5904 0))(
  ( (BitStream!5905 (buf!3826 array!7429) (currentByte!7032 (_ BitVec 32)) (currentBit!7027 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5904)

(declare-fun buf!77 () array!7429)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31860 (= res!132485 (and (= (size!3368 (buf!3826 b1!99)) (size!3368 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31860 e!107959))

(declare-fun e!107961 () Bool)

(declare-fun inv!12 (BitStream!5904) Bool)

(assert (=> start!31860 (and (inv!12 b1!99) e!107961)))

(declare-fun array_inv!3115 (array!7429) Bool)

(assert (=> start!31860 (array_inv!3115 buf!77)))

(assert (=> start!31860 true))

(declare-fun b!158638 () Bool)

(declare-fun res!132484 () Bool)

(assert (=> b!158638 (=> (not res!132484) (not e!107959))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158638 (= res!132484 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3368 (buf!3826 b1!99))) ((_ sign_extend 32) (currentByte!7032 b1!99)) ((_ sign_extend 32) (currentBit!7027 b1!99)) bytes!14))))

(declare-fun b!158639 () Bool)

(assert (=> b!158639 (= e!107959 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3368 buf!77)) ((_ sign_extend 32) (currentByte!7032 b1!99)) ((_ sign_extend 32) (currentBit!7027 b1!99)) bytes!14)))))

(declare-fun b!158640 () Bool)

(assert (=> b!158640 (= e!107961 (array_inv!3115 (buf!3826 b1!99)))))

(assert (= (and start!31860 res!132485) b!158638))

(assert (= (and b!158638 res!132484) b!158639))

(assert (= start!31860 b!158640))

(declare-fun m!249165 () Bool)

(assert (=> start!31860 m!249165))

(declare-fun m!249167 () Bool)

(assert (=> start!31860 m!249167))

(declare-fun m!249169 () Bool)

(assert (=> b!158638 m!249169))

(declare-fun m!249171 () Bool)

(assert (=> b!158639 m!249171))

(declare-fun m!249173 () Bool)

(assert (=> b!158640 m!249173))

(check-sat (not b!158639) (not start!31860) (not b!158640) (not b!158638))
(check-sat)
