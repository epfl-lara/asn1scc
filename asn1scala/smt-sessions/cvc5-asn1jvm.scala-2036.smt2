; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52002 () Bool)

(assert start!52002)

(declare-fun res!200172 () Bool)

(declare-fun e!166156 () Bool)

(assert (=> start!52002 (=> (not res!200172) (not e!166156))))

(declare-datatypes ((array!13065 0))(
  ( (array!13066 (arr!6709 (Array (_ BitVec 32) (_ BitVec 8))) (size!5722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10366 0))(
  ( (BitStream!10367 (buf!6176 array!13065) (currentByte!11515 (_ BitVec 32)) (currentBit!11510 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10366)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52002 (= res!200172 (validate_offset_bits!1 ((_ sign_extend 32) (size!5722 (buf!6176 thiss!1948))) ((_ sign_extend 32) (currentByte!11515 thiss!1948)) ((_ sign_extend 32) (currentBit!11510 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11515 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11510 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52002 e!166156))

(declare-fun e!166155 () Bool)

(declare-fun inv!12 (BitStream!10366) Bool)

(assert (=> start!52002 (and (inv!12 thiss!1948) e!166155)))

(declare-fun b!239746 () Bool)

(assert (=> b!239746 (= e!166156 false)))

(declare-datatypes ((Unit!17557 0))(
  ( (Unit!17558) )
))
(declare-datatypes ((tuple2!20262 0))(
  ( (tuple2!20263 (_1!11053 Unit!17557) (_2!11053 BitStream!10366)) )
))
(declare-fun lt!374436 () tuple2!20262)

(declare-fun alignToByte!0 (BitStream!10366) tuple2!20262)

(assert (=> b!239746 (= lt!374436 (alignToByte!0 thiss!1948))))

(declare-fun b!239747 () Bool)

(declare-fun array_inv!5463 (array!13065) Bool)

(assert (=> b!239747 (= e!166155 (array_inv!5463 (buf!6176 thiss!1948)))))

(assert (= (and start!52002 res!200172) b!239746))

(assert (= start!52002 b!239747))

(declare-fun m!362035 () Bool)

(assert (=> start!52002 m!362035))

(declare-fun m!362037 () Bool)

(assert (=> start!52002 m!362037))

(declare-fun m!362039 () Bool)

(assert (=> b!239746 m!362039))

(declare-fun m!362041 () Bool)

(assert (=> b!239747 m!362041))

(push 1)

(assert (not b!239747))

(assert (not start!52002))

(assert (not b!239746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

