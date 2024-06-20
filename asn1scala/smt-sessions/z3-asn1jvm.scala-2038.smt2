; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52016 () Bool)

(assert start!52016)

(declare-fun res!200193 () Bool)

(declare-fun e!166219 () Bool)

(assert (=> start!52016 (=> (not res!200193) (not e!166219))))

(declare-datatypes ((array!13079 0))(
  ( (array!13080 (arr!6716 (Array (_ BitVec 32) (_ BitVec 8))) (size!5729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10380 0))(
  ( (BitStream!10381 (buf!6183 array!13079) (currentByte!11522 (_ BitVec 32)) (currentBit!11517 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10380)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52016 (= res!200193 (validate_offset_bits!1 ((_ sign_extend 32) (size!5729 (buf!6183 thiss!1948))) ((_ sign_extend 32) (currentByte!11522 thiss!1948)) ((_ sign_extend 32) (currentBit!11517 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11522 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11517 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52016 e!166219))

(declare-fun e!166220 () Bool)

(declare-fun inv!12 (BitStream!10380) Bool)

(assert (=> start!52016 (and (inv!12 thiss!1948) e!166220)))

(declare-fun b!239788 () Bool)

(declare-fun lt!374457 () (_ BitVec 32))

(assert (=> b!239788 (= e!166219 (and (not (= lt!374457 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000100 (bvsdiv (bvmul #b00000000000000000000000000000100 lt!374457) lt!374457)))))))

(declare-datatypes ((Unit!17571 0))(
  ( (Unit!17572) )
))
(declare-datatypes ((tuple2!20276 0))(
  ( (tuple2!20277 (_1!11060 Unit!17571) (_2!11060 BitStream!10380)) )
))
(declare-fun alignToByte!0 (BitStream!10380) tuple2!20276)

(assert (=> b!239788 (= lt!374457 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11522 (_2!11060 (alignToByte!0 thiss!1948)))) #b00000000000000000000000000000100))))

(declare-fun b!239789 () Bool)

(declare-fun array_inv!5470 (array!13079) Bool)

(assert (=> b!239789 (= e!166220 (array_inv!5470 (buf!6183 thiss!1948)))))

(assert (= (and start!52016 res!200193) b!239788))

(assert (= start!52016 b!239789))

(declare-fun m!362091 () Bool)

(assert (=> start!52016 m!362091))

(declare-fun m!362093 () Bool)

(assert (=> start!52016 m!362093))

(declare-fun m!362095 () Bool)

(assert (=> b!239788 m!362095))

(declare-fun m!362097 () Bool)

(assert (=> b!239789 m!362097))

(check-sat (not b!239789) (not b!239788) (not start!52016))
(check-sat)
