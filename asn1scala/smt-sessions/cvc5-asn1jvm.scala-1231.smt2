; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34982 () Bool)

(assert start!34982)

(declare-fun res!137344 () Bool)

(declare-fun e!113949 () Bool)

(assert (=> start!34982 (=> (not res!137344) (not e!113949))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34982 (= res!137344 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34982 e!113949))

(assert (=> start!34982 true))

(declare-datatypes ((array!8289 0))(
  ( (array!8290 (arr!4627 (Array (_ BitVec 32) (_ BitVec 8))) (size!3706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6568 0))(
  ( (BitStream!6569 (buf!4158 array!8289) (currentByte!7768 (_ BitVec 32)) (currentBit!7763 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6568)

(declare-fun e!113948 () Bool)

(declare-fun inv!12 (BitStream!6568) Bool)

(assert (=> start!34982 (and (inv!12 thiss!1577) e!113948)))

(declare-fun b!164830 () Bool)

(declare-fun res!137345 () Bool)

(assert (=> b!164830 (=> (not res!137345) (not e!113949))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164830 (= res!137345 (validate_offset_bits!1 ((_ sign_extend 32) (size!3706 (buf!4158 thiss!1577))) ((_ sign_extend 32) (currentByte!7768 thiss!1577)) ((_ sign_extend 32) (currentBit!7763 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164831 () Bool)

(assert (=> b!164831 (= e!113949 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7763 thiss!1577))))) #b00000000000000000000000010000000))))

(declare-fun b!164832 () Bool)

(declare-fun array_inv!3447 (array!8289) Bool)

(assert (=> b!164832 (= e!113948 (array_inv!3447 (buf!4158 thiss!1577)))))

(assert (= (and start!34982 res!137344) b!164830))

(assert (= (and b!164830 res!137345) b!164831))

(assert (= start!34982 b!164832))

(declare-fun m!262195 () Bool)

(assert (=> start!34982 m!262195))

(declare-fun m!262197 () Bool)

(assert (=> b!164830 m!262197))

(declare-fun m!262199 () Bool)

(assert (=> b!164831 m!262199))

(declare-fun m!262201 () Bool)

(assert (=> b!164832 m!262201))

(push 1)

