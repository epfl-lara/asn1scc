; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51674 () Bool)

(assert start!51674)

(declare-fun res!199953 () Bool)

(declare-fun e!165734 () Bool)

(assert (=> start!51674 (=> (not res!199953) (not e!165734))))

(declare-datatypes ((array!12952 0))(
  ( (array!12953 (arr!6666 (Array (_ BitVec 32) (_ BitVec 8))) (size!5679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10280 0))(
  ( (BitStream!10281 (buf!6133 array!12952) (currentByte!11418 (_ BitVec 32)) (currentBit!11413 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10280)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51674 (= res!199953 (validate_offset_bits!1 ((_ sign_extend 32) (size!5679 (buf!6133 thiss!1854))) ((_ sign_extend 32) (currentByte!11418 thiss!1854)) ((_ sign_extend 32) (currentBit!11413 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51674 e!165734))

(declare-fun e!165732 () Bool)

(declare-fun inv!12 (BitStream!10280) Bool)

(assert (=> start!51674 (and (inv!12 thiss!1854) e!165732)))

(declare-fun b!239398 () Bool)

(declare-fun lt!374028 () (_ BitVec 32))

(assert (=> b!239398 (= e!165734 (and (bvsgt lt!374028 #b00000000000000000000000000000000) (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374028))) #b00000000000000000000000000100000)))))

(assert (=> b!239398 (= lt!374028 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11413 thiss!1854))))))

(declare-fun b!239399 () Bool)

(declare-fun array_inv!5420 (array!12952) Bool)

(assert (=> b!239399 (= e!165732 (array_inv!5420 (buf!6133 thiss!1854)))))

(assert (= (and start!51674 res!199953) b!239398))

(assert (= start!51674 b!239399))

(declare-fun m!361591 () Bool)

(assert (=> start!51674 m!361591))

(declare-fun m!361593 () Bool)

(assert (=> start!51674 m!361593))

(declare-fun m!361595 () Bool)

(assert (=> b!239399 m!361595))

(push 1)

(assert (not start!51674))

(assert (not b!239399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

