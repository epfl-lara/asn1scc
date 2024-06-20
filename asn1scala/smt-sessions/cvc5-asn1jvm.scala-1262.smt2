; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35852 () Bool)

(assert start!35852)

(declare-fun res!138641 () Bool)

(declare-fun e!115360 () Bool)

(assert (=> start!35852 (=> (not res!138641) (not e!115360))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35852 (= res!138641 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35852 e!115360))

(assert (=> start!35852 true))

(declare-datatypes ((array!8532 0))(
  ( (array!8533 (arr!4720 (Array (_ BitVec 32) (_ BitVec 8))) (size!3799 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6754 0))(
  ( (BitStream!6755 (buf!4251 array!8532) (currentByte!8016 (_ BitVec 32)) (currentBit!8011 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6754)

(declare-fun e!115362 () Bool)

(declare-fun inv!12 (BitStream!6754) Bool)

(assert (=> start!35852 (and (inv!12 thiss!1577) e!115362)))

(declare-fun b!166510 () Bool)

(declare-fun res!138640 () Bool)

(assert (=> b!166510 (=> (not res!138640) (not e!115360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166510 (= res!138640 (validate_offset_bits!1 ((_ sign_extend 32) (size!3799 (buf!4251 thiss!1577))) ((_ sign_extend 32) (currentByte!8016 thiss!1577)) ((_ sign_extend 32) (currentBit!8011 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166511 () Bool)

(assert (=> b!166511 (= e!115360 (and (bvsgt (bvadd (currentBit!8011 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8011 thiss!1577) nBits!511) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!166512 () Bool)

(declare-fun array_inv!3540 (array!8532) Bool)

(assert (=> b!166512 (= e!115362 (array_inv!3540 (buf!4251 thiss!1577)))))

(assert (= (and start!35852 res!138641) b!166510))

(assert (= (and b!166510 res!138640) b!166511))

(assert (= start!35852 b!166512))

(declare-fun m!264535 () Bool)

(assert (=> start!35852 m!264535))

(declare-fun m!264537 () Bool)

(assert (=> b!166510 m!264537))

(declare-fun m!264539 () Bool)

(assert (=> b!166512 m!264539))

(push 1)

(assert (not b!166512))

(assert (not b!166510))

(assert (not start!35852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

