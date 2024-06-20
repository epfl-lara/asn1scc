; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52010 () Bool)

(assert start!52010)

(declare-fun res!200184 () Bool)

(declare-fun e!166191 () Bool)

(assert (=> start!52010 (=> (not res!200184) (not e!166191))))

(declare-datatypes ((array!13073 0))(
  ( (array!13074 (arr!6713 (Array (_ BitVec 32) (_ BitVec 8))) (size!5726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10374 0))(
  ( (BitStream!10375 (buf!6180 array!13073) (currentByte!11519 (_ BitVec 32)) (currentBit!11514 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10374)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52010 (= res!200184 (validate_offset_bits!1 ((_ sign_extend 32) (size!5726 (buf!6180 thiss!1948))) ((_ sign_extend 32) (currentByte!11519 thiss!1948)) ((_ sign_extend 32) (currentBit!11514 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11519 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11514 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52010 e!166191))

(declare-fun e!166192 () Bool)

(declare-fun inv!12 (BitStream!10374) Bool)

(assert (=> start!52010 (and (inv!12 thiss!1948) e!166192)))

(declare-fun b!239770 () Bool)

(assert (=> b!239770 (= e!166191 false)))

(declare-datatypes ((Unit!17565 0))(
  ( (Unit!17566) )
))
(declare-datatypes ((tuple2!20270 0))(
  ( (tuple2!20271 (_1!11057 Unit!17565) (_2!11057 BitStream!10374)) )
))
(declare-fun lt!374448 () tuple2!20270)

(declare-fun alignToByte!0 (BitStream!10374) tuple2!20270)

(assert (=> b!239770 (= lt!374448 (alignToByte!0 thiss!1948))))

(declare-fun b!239771 () Bool)

(declare-fun array_inv!5467 (array!13073) Bool)

(assert (=> b!239771 (= e!166192 (array_inv!5467 (buf!6180 thiss!1948)))))

(assert (= (and start!52010 res!200184) b!239770))

(assert (= start!52010 b!239771))

(declare-fun m!362067 () Bool)

(assert (=> start!52010 m!362067))

(declare-fun m!362069 () Bool)

(assert (=> start!52010 m!362069))

(declare-fun m!362071 () Bool)

(assert (=> b!239770 m!362071))

(declare-fun m!362073 () Bool)

(assert (=> b!239771 m!362073))

(check-sat (not b!239771) (not b!239770) (not start!52010))
