; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52018 () Bool)

(assert start!52018)

(declare-fun res!200196 () Bool)

(declare-fun e!166227 () Bool)

(assert (=> start!52018 (=> (not res!200196) (not e!166227))))

(declare-datatypes ((array!13081 0))(
  ( (array!13082 (arr!6717 (Array (_ BitVec 32) (_ BitVec 8))) (size!5730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10382 0))(
  ( (BitStream!10383 (buf!6184 array!13081) (currentByte!11523 (_ BitVec 32)) (currentBit!11518 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10382)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52018 (= res!200196 (validate_offset_bits!1 ((_ sign_extend 32) (size!5730 (buf!6184 thiss!1948))) ((_ sign_extend 32) (currentByte!11523 thiss!1948)) ((_ sign_extend 32) (currentBit!11518 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11523 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11518 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52018 e!166227))

(declare-fun e!166229 () Bool)

(declare-fun inv!12 (BitStream!10382) Bool)

(assert (=> start!52018 (and (inv!12 thiss!1948) e!166229)))

(declare-fun b!239794 () Bool)

(declare-fun lt!374460 () (_ BitVec 32))

(assert (=> b!239794 (= e!166227 (and (not (= lt!374460 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000100 (bvsdiv (bvmul #b00000000000000000000000000000100 lt!374460) lt!374460)))))))

(declare-datatypes ((Unit!17573 0))(
  ( (Unit!17574) )
))
(declare-datatypes ((tuple2!20278 0))(
  ( (tuple2!20279 (_1!11061 Unit!17573) (_2!11061 BitStream!10382)) )
))
(declare-fun alignToByte!0 (BitStream!10382) tuple2!20278)

(assert (=> b!239794 (= lt!374460 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11523 (_2!11061 (alignToByte!0 thiss!1948)))) #b00000000000000000000000000000100))))

(declare-fun b!239795 () Bool)

(declare-fun array_inv!5471 (array!13081) Bool)

(assert (=> b!239795 (= e!166229 (array_inv!5471 (buf!6184 thiss!1948)))))

(assert (= (and start!52018 res!200196) b!239794))

(assert (= start!52018 b!239795))

(declare-fun m!362099 () Bool)

(assert (=> start!52018 m!362099))

(declare-fun m!362101 () Bool)

(assert (=> start!52018 m!362101))

(declare-fun m!362103 () Bool)

(assert (=> b!239794 m!362103))

(declare-fun m!362105 () Bool)

(assert (=> b!239795 m!362105))

(push 1)

(assert (not start!52018))

(assert (not b!239795))

(assert (not b!239794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

