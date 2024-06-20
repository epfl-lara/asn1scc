; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52290 () Bool)

(assert start!52290)

(declare-fun res!200963 () Bool)

(declare-fun e!166832 () Bool)

(assert (=> start!52290 (=> (not res!200963) (not e!166832))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52290 (= res!200963 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52290 e!166832))

(assert (=> start!52290 true))

(declare-datatypes ((array!13170 0))(
  ( (array!13171 (arr!6755 (Array (_ BitVec 32) (_ BitVec 8))) (size!5768 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10458 0))(
  ( (BitStream!10459 (buf!6231 array!13170) (currentByte!11588 (_ BitVec 32)) (currentBit!11583 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10458)

(declare-fun e!166831 () Bool)

(declare-fun inv!12 (BitStream!10458) Bool)

(assert (=> start!52290 (and (inv!12 thiss!982) e!166831)))

(declare-fun b!240729 () Bool)

(declare-fun res!200964 () Bool)

(assert (=> b!240729 (=> (not res!200964) (not e!166832))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240729 (= res!200964 (validate_offset_bits!1 ((_ sign_extend 32) (size!5768 (buf!6231 thiss!982))) ((_ sign_extend 32) (currentByte!11588 thiss!982)) ((_ sign_extend 32) (currentBit!11583 thiss!982)) nBits!288))))

(declare-fun b!240730 () Bool)

(assert (=> b!240730 (= e!166832 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5768 (buf!6231 thiss!982))) ((_ sign_extend 32) (currentByte!11588 thiss!982)) ((_ sign_extend 32) (currentBit!11583 thiss!982)) nBits!288)))))

(declare-fun b!240731 () Bool)

(declare-fun array_inv!5509 (array!13170) Bool)

(assert (=> b!240731 (= e!166831 (array_inv!5509 (buf!6231 thiss!982)))))

(assert (= (and start!52290 res!200963) b!240729))

(assert (= (and b!240729 res!200964) b!240730))

(assert (= start!52290 b!240731))

(declare-fun m!363327 () Bool)

(assert (=> start!52290 m!363327))

(declare-fun m!363329 () Bool)

(assert (=> b!240729 m!363329))

(assert (=> b!240730 m!363329))

(declare-fun m!363331 () Bool)

(assert (=> b!240731 m!363331))

(check-sat (not b!240731) (not b!240729) (not start!52290) (not b!240730))
