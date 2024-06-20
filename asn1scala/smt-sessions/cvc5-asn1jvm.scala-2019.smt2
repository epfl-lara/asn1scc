; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51670 () Bool)

(assert start!51670)

(declare-fun res!199947 () Bool)

(declare-fun e!165716 () Bool)

(assert (=> start!51670 (=> (not res!199947) (not e!165716))))

(declare-datatypes ((array!12948 0))(
  ( (array!12949 (arr!6664 (Array (_ BitVec 32) (_ BitVec 8))) (size!5677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10276 0))(
  ( (BitStream!10277 (buf!6131 array!12948) (currentByte!11416 (_ BitVec 32)) (currentBit!11411 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10276)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51670 (= res!199947 (validate_offset_bits!1 ((_ sign_extend 32) (size!5677 (buf!6131 thiss!1854))) ((_ sign_extend 32) (currentByte!11416 thiss!1854)) ((_ sign_extend 32) (currentBit!11411 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51670 e!165716))

(declare-fun e!165715 () Bool)

(declare-fun inv!12 (BitStream!10276) Bool)

(assert (=> start!51670 (and (inv!12 thiss!1854) e!165715)))

(declare-fun b!239386 () Bool)

(declare-fun lt!374022 () (_ BitVec 32))

(assert (=> b!239386 (= e!165716 (and (bvsgt lt!374022 #b00000000000000000000000000000000) (bvsgt ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374022))) #b00000000000000000000000000100000)))))

(assert (=> b!239386 (= lt!374022 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11411 thiss!1854))))))

(declare-fun b!239387 () Bool)

(declare-fun array_inv!5418 (array!12948) Bool)

(assert (=> b!239387 (= e!165715 (array_inv!5418 (buf!6131 thiss!1854)))))

(assert (= (and start!51670 res!199947) b!239386))

(assert (= start!51670 b!239387))

(declare-fun m!361579 () Bool)

(assert (=> start!51670 m!361579))

(declare-fun m!361581 () Bool)

(assert (=> start!51670 m!361581))

(declare-fun m!361583 () Bool)

(assert (=> b!239387 m!361583))

(push 1)

(assert (not start!51670))

(assert (not b!239387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

