; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51482 () Bool)

(assert start!51482)

(declare-fun res!199890 () Bool)

(declare-fun e!165545 () Bool)

(assert (=> start!51482 (=> (not res!199890) (not e!165545))))

(declare-datatypes ((array!12895 0))(
  ( (array!12896 (arr!6645 (Array (_ BitVec 32) (_ BitVec 8))) (size!5658 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10238 0))(
  ( (BitStream!10239 (buf!6112 array!12895) (currentByte!11352 (_ BitVec 32)) (currentBit!11347 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10238)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51482 (= res!199890 (validate_offset_bits!1 ((_ sign_extend 32) (size!5658 (buf!6112 thiss!1854))) ((_ sign_extend 32) (currentByte!11352 thiss!1854)) ((_ sign_extend 32) (currentBit!11347 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51482 e!165545))

(declare-fun e!165544 () Bool)

(declare-fun inv!12 (BitStream!10238) Bool)

(assert (=> start!51482 (and (inv!12 thiss!1854) e!165544)))

(declare-fun b!239272 () Bool)

(declare-fun lt!374010 () (_ BitVec 32))

(assert (=> b!239272 (= e!165545 (and (not (= #b00000000000000000000000000000000 (bvand lt!374010 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!374010) #b10000000000000000000000000000000)))))))

(assert (=> b!239272 (= lt!374010 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11347 thiss!1854))))))

(declare-fun b!239273 () Bool)

(declare-fun array_inv!5399 (array!12895) Bool)

(assert (=> b!239273 (= e!165544 (array_inv!5399 (buf!6112 thiss!1854)))))

(assert (= (and start!51482 res!199890) b!239272))

(assert (= start!51482 b!239273))

(declare-fun m!361393 () Bool)

(assert (=> start!51482 m!361393))

(declare-fun m!361395 () Bool)

(assert (=> start!51482 m!361395))

(declare-fun m!361397 () Bool)

(assert (=> b!239273 m!361397))

(push 1)

