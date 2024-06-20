; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51478 () Bool)

(assert start!51478)

(declare-fun res!199884 () Bool)

(declare-fun e!165525 () Bool)

(assert (=> start!51478 (=> (not res!199884) (not e!165525))))

(declare-datatypes ((array!12891 0))(
  ( (array!12892 (arr!6643 (Array (_ BitVec 32) (_ BitVec 8))) (size!5656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10234 0))(
  ( (BitStream!10235 (buf!6110 array!12891) (currentByte!11350 (_ BitVec 32)) (currentBit!11345 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10234)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51478 (= res!199884 (validate_offset_bits!1 ((_ sign_extend 32) (size!5656 (buf!6110 thiss!1854))) ((_ sign_extend 32) (currentByte!11350 thiss!1854)) ((_ sign_extend 32) (currentBit!11345 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51478 e!165525))

(declare-fun e!165526 () Bool)

(declare-fun inv!12 (BitStream!10234) Bool)

(assert (=> start!51478 (and (inv!12 thiss!1854) e!165526)))

(declare-fun b!239260 () Bool)

(declare-fun lt!374004 () (_ BitVec 32))

(assert (=> b!239260 (= e!165525 (and (not (= #b00000000000000000000000000000000 (bvand lt!374004 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!374004) #b10000000000000000000000000000000)))))))

(assert (=> b!239260 (= lt!374004 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11345 thiss!1854))))))

(declare-fun b!239261 () Bool)

(declare-fun array_inv!5397 (array!12891) Bool)

(assert (=> b!239261 (= e!165526 (array_inv!5397 (buf!6110 thiss!1854)))))

(assert (= (and start!51478 res!199884) b!239260))

(assert (= start!51478 b!239261))

(declare-fun m!361381 () Bool)

(assert (=> start!51478 m!361381))

(declare-fun m!361383 () Bool)

(assert (=> start!51478 m!361383))

(declare-fun m!361385 () Bool)

(assert (=> b!239261 m!361385))

(push 1)

(assert (not start!51478))

(assert (not b!239261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

