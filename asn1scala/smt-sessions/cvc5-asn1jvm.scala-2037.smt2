; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52008 () Bool)

(assert start!52008)

(declare-fun res!200181 () Bool)

(declare-fun e!166184 () Bool)

(assert (=> start!52008 (=> (not res!200181) (not e!166184))))

(declare-datatypes ((array!13071 0))(
  ( (array!13072 (arr!6712 (Array (_ BitVec 32) (_ BitVec 8))) (size!5725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10372 0))(
  ( (BitStream!10373 (buf!6179 array!13071) (currentByte!11518 (_ BitVec 32)) (currentBit!11513 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10372)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52008 (= res!200181 (validate_offset_bits!1 ((_ sign_extend 32) (size!5725 (buf!6179 thiss!1948))) ((_ sign_extend 32) (currentByte!11518 thiss!1948)) ((_ sign_extend 32) (currentBit!11513 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11518 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11513 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52008 e!166184))

(declare-fun e!166183 () Bool)

(declare-fun inv!12 (BitStream!10372) Bool)

(assert (=> start!52008 (and (inv!12 thiss!1948) e!166183)))

(declare-fun b!239764 () Bool)

(assert (=> b!239764 (= e!166184 false)))

(declare-datatypes ((Unit!17563 0))(
  ( (Unit!17564) )
))
(declare-datatypes ((tuple2!20268 0))(
  ( (tuple2!20269 (_1!11056 Unit!17563) (_2!11056 BitStream!10372)) )
))
(declare-fun lt!374445 () tuple2!20268)

(declare-fun alignToByte!0 (BitStream!10372) tuple2!20268)

(assert (=> b!239764 (= lt!374445 (alignToByte!0 thiss!1948))))

(declare-fun b!239765 () Bool)

(declare-fun array_inv!5466 (array!13071) Bool)

(assert (=> b!239765 (= e!166183 (array_inv!5466 (buf!6179 thiss!1948)))))

(assert (= (and start!52008 res!200181) b!239764))

(assert (= start!52008 b!239765))

(declare-fun m!362059 () Bool)

(assert (=> start!52008 m!362059))

(declare-fun m!362061 () Bool)

(assert (=> start!52008 m!362061))

(declare-fun m!362063 () Bool)

(assert (=> b!239764 m!362063))

(declare-fun m!362065 () Bool)

(assert (=> b!239765 m!362065))

(push 1)

(assert (not b!239764))

(assert (not start!52008))

(assert (not b!239765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

