; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52006 () Bool)

(assert start!52006)

(declare-fun res!200178 () Bool)

(declare-fun e!166175 () Bool)

(assert (=> start!52006 (=> (not res!200178) (not e!166175))))

(declare-datatypes ((array!13069 0))(
  ( (array!13070 (arr!6711 (Array (_ BitVec 32) (_ BitVec 8))) (size!5724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10370 0))(
  ( (BitStream!10371 (buf!6178 array!13069) (currentByte!11517 (_ BitVec 32)) (currentBit!11512 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10370)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52006 (= res!200178 (validate_offset_bits!1 ((_ sign_extend 32) (size!5724 (buf!6178 thiss!1948))) ((_ sign_extend 32) (currentByte!11517 thiss!1948)) ((_ sign_extend 32) (currentBit!11512 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11517 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11512 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52006 e!166175))

(declare-fun e!166174 () Bool)

(declare-fun inv!12 (BitStream!10370) Bool)

(assert (=> start!52006 (and (inv!12 thiss!1948) e!166174)))

(declare-fun b!239758 () Bool)

(assert (=> b!239758 (= e!166175 false)))

(declare-datatypes ((Unit!17561 0))(
  ( (Unit!17562) )
))
(declare-datatypes ((tuple2!20266 0))(
  ( (tuple2!20267 (_1!11055 Unit!17561) (_2!11055 BitStream!10370)) )
))
(declare-fun lt!374442 () tuple2!20266)

(declare-fun alignToByte!0 (BitStream!10370) tuple2!20266)

(assert (=> b!239758 (= lt!374442 (alignToByte!0 thiss!1948))))

(declare-fun b!239759 () Bool)

(declare-fun array_inv!5465 (array!13069) Bool)

(assert (=> b!239759 (= e!166174 (array_inv!5465 (buf!6178 thiss!1948)))))

(assert (= (and start!52006 res!200178) b!239758))

(assert (= start!52006 b!239759))

(declare-fun m!362051 () Bool)

(assert (=> start!52006 m!362051))

(declare-fun m!362053 () Bool)

(assert (=> start!52006 m!362053))

(declare-fun m!362055 () Bool)

(assert (=> b!239758 m!362055))

(declare-fun m!362057 () Bool)

(assert (=> b!239759 m!362057))

(push 1)

(assert (not start!52006))

(assert (not b!239759))

(assert (not b!239758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

