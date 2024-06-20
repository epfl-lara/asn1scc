; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51950 () Bool)

(assert start!51950)

(declare-fun res!200115 () Bool)

(declare-fun e!166081 () Bool)

(assert (=> start!51950 (=> (not res!200115) (not e!166081))))

(declare-datatypes ((array!13052 0))(
  ( (array!13053 (arr!6704 (Array (_ BitVec 32) (_ BitVec 8))) (size!5717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10356 0))(
  ( (BitStream!10357 (buf!6171 array!13052) (currentByte!11498 (_ BitVec 32)) (currentBit!11493 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10356)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51950 (= res!200115 (validate_offset_bits!1 ((_ sign_extend 32) (size!5717 (buf!6171 thiss!1948))) ((_ sign_extend 32) (currentByte!11498 thiss!1948)) ((_ sign_extend 32) (currentBit!11493 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11498 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11493 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51950 e!166081))

(declare-fun e!166082 () Bool)

(declare-fun inv!12 (BitStream!10356) Bool)

(assert (=> start!51950 (and (inv!12 thiss!1948) e!166082)))

(declare-fun b!239674 () Bool)

(assert (=> b!239674 (= e!166081 false)))

(declare-datatypes ((Unit!17535 0))(
  ( (Unit!17536) )
))
(declare-datatypes ((tuple2!20252 0))(
  ( (tuple2!20253 (_1!11048 Unit!17535) (_2!11048 BitStream!10356)) )
))
(declare-fun lt!374322 () tuple2!20252)

(declare-fun alignToByte!0 (BitStream!10356) tuple2!20252)

(assert (=> b!239674 (= lt!374322 (alignToByte!0 thiss!1948))))

(declare-fun b!239675 () Bool)

(declare-fun array_inv!5458 (array!13052) Bool)

(assert (=> b!239675 (= e!166082 (array_inv!5458 (buf!6171 thiss!1948)))))

(assert (= (and start!51950 res!200115) b!239674))

(assert (= start!51950 b!239675))

(declare-fun m!361953 () Bool)

(assert (=> start!51950 m!361953))

(declare-fun m!361955 () Bool)

(assert (=> start!51950 m!361955))

(declare-fun m!361957 () Bool)

(assert (=> b!239674 m!361957))

(declare-fun m!361959 () Bool)

(assert (=> b!239675 m!361959))

(check-sat (not b!239675) (not start!51950) (not b!239674))
