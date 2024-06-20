; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52012 () Bool)

(assert start!52012)

(declare-fun res!200187 () Bool)

(declare-fun e!166202 () Bool)

(assert (=> start!52012 (=> (not res!200187) (not e!166202))))

(declare-datatypes ((array!13075 0))(
  ( (array!13076 (arr!6714 (Array (_ BitVec 32) (_ BitVec 8))) (size!5727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10376 0))(
  ( (BitStream!10377 (buf!6181 array!13075) (currentByte!11520 (_ BitVec 32)) (currentBit!11515 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10376)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52012 (= res!200187 (validate_offset_bits!1 ((_ sign_extend 32) (size!5727 (buf!6181 thiss!1948))) ((_ sign_extend 32) (currentByte!11520 thiss!1948)) ((_ sign_extend 32) (currentBit!11515 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11520 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11515 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52012 e!166202))

(declare-fun e!166201 () Bool)

(declare-fun inv!12 (BitStream!10376) Bool)

(assert (=> start!52012 (and (inv!12 thiss!1948) e!166201)))

(declare-fun b!239776 () Bool)

(assert (=> b!239776 (= e!166202 false)))

(declare-datatypes ((Unit!17567 0))(
  ( (Unit!17568) )
))
(declare-datatypes ((tuple2!20272 0))(
  ( (tuple2!20273 (_1!11058 Unit!17567) (_2!11058 BitStream!10376)) )
))
(declare-fun lt!374451 () tuple2!20272)

(declare-fun alignToByte!0 (BitStream!10376) tuple2!20272)

(assert (=> b!239776 (= lt!374451 (alignToByte!0 thiss!1948))))

(declare-fun b!239777 () Bool)

(declare-fun array_inv!5468 (array!13075) Bool)

(assert (=> b!239777 (= e!166201 (array_inv!5468 (buf!6181 thiss!1948)))))

(assert (= (and start!52012 res!200187) b!239776))

(assert (= start!52012 b!239777))

(declare-fun m!362075 () Bool)

(assert (=> start!52012 m!362075))

(declare-fun m!362077 () Bool)

(assert (=> start!52012 m!362077))

(declare-fun m!362079 () Bool)

(assert (=> b!239776 m!362079))

(declare-fun m!362081 () Bool)

(assert (=> b!239777 m!362081))

(push 1)

(assert (not b!239776))

(assert (not start!52012))

(assert (not b!239777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

