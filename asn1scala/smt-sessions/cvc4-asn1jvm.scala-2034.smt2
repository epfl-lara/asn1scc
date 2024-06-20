; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51952 () Bool)

(assert start!51952)

(declare-fun res!200118 () Bool)

(declare-fun e!166091 () Bool)

(assert (=> start!51952 (=> (not res!200118) (not e!166091))))

(declare-datatypes ((array!13054 0))(
  ( (array!13055 (arr!6705 (Array (_ BitVec 32) (_ BitVec 8))) (size!5718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10358 0))(
  ( (BitStream!10359 (buf!6172 array!13054) (currentByte!11499 (_ BitVec 32)) (currentBit!11494 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10358)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51952 (= res!200118 (validate_offset_bits!1 ((_ sign_extend 32) (size!5718 (buf!6172 thiss!1948))) ((_ sign_extend 32) (currentByte!11499 thiss!1948)) ((_ sign_extend 32) (currentBit!11494 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11499 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11494 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51952 e!166091))

(declare-fun e!166089 () Bool)

(declare-fun inv!12 (BitStream!10358) Bool)

(assert (=> start!51952 (and (inv!12 thiss!1948) e!166089)))

(declare-fun b!239680 () Bool)

(assert (=> b!239680 (= e!166091 false)))

(declare-datatypes ((Unit!17537 0))(
  ( (Unit!17538) )
))
(declare-datatypes ((tuple2!20254 0))(
  ( (tuple2!20255 (_1!11049 Unit!17537) (_2!11049 BitStream!10358)) )
))
(declare-fun lt!374325 () tuple2!20254)

(declare-fun alignToByte!0 (BitStream!10358) tuple2!20254)

(assert (=> b!239680 (= lt!374325 (alignToByte!0 thiss!1948))))

(declare-fun b!239681 () Bool)

(declare-fun array_inv!5459 (array!13054) Bool)

(assert (=> b!239681 (= e!166089 (array_inv!5459 (buf!6172 thiss!1948)))))

(assert (= (and start!51952 res!200118) b!239680))

(assert (= start!51952 b!239681))

(declare-fun m!361961 () Bool)

(assert (=> start!51952 m!361961))

(declare-fun m!361963 () Bool)

(assert (=> start!51952 m!361963))

(declare-fun m!361965 () Bool)

(assert (=> b!239680 m!361965))

(declare-fun m!361967 () Bool)

(assert (=> b!239681 m!361967))

(push 1)

(assert (not b!239681))

(assert (not start!51952))

(assert (not b!239680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

