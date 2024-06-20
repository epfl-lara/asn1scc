; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52004 () Bool)

(assert start!52004)

(declare-fun res!200175 () Bool)

(declare-fun e!166164 () Bool)

(assert (=> start!52004 (=> (not res!200175) (not e!166164))))

(declare-datatypes ((array!13067 0))(
  ( (array!13068 (arr!6710 (Array (_ BitVec 32) (_ BitVec 8))) (size!5723 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10368 0))(
  ( (BitStream!10369 (buf!6177 array!13067) (currentByte!11516 (_ BitVec 32)) (currentBit!11511 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10368)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52004 (= res!200175 (validate_offset_bits!1 ((_ sign_extend 32) (size!5723 (buf!6177 thiss!1948))) ((_ sign_extend 32) (currentByte!11516 thiss!1948)) ((_ sign_extend 32) (currentBit!11511 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11516 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11511 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52004 e!166164))

(declare-fun e!166165 () Bool)

(declare-fun inv!12 (BitStream!10368) Bool)

(assert (=> start!52004 (and (inv!12 thiss!1948) e!166165)))

(declare-fun b!239752 () Bool)

(assert (=> b!239752 (= e!166164 false)))

(declare-datatypes ((Unit!17559 0))(
  ( (Unit!17560) )
))
(declare-datatypes ((tuple2!20264 0))(
  ( (tuple2!20265 (_1!11054 Unit!17559) (_2!11054 BitStream!10368)) )
))
(declare-fun lt!374439 () tuple2!20264)

(declare-fun alignToByte!0 (BitStream!10368) tuple2!20264)

(assert (=> b!239752 (= lt!374439 (alignToByte!0 thiss!1948))))

(declare-fun b!239753 () Bool)

(declare-fun array_inv!5464 (array!13067) Bool)

(assert (=> b!239753 (= e!166165 (array_inv!5464 (buf!6177 thiss!1948)))))

(assert (= (and start!52004 res!200175) b!239752))

(assert (= start!52004 b!239753))

(declare-fun m!362043 () Bool)

(assert (=> start!52004 m!362043))

(declare-fun m!362045 () Bool)

(assert (=> start!52004 m!362045))

(declare-fun m!362047 () Bool)

(assert (=> b!239752 m!362047))

(declare-fun m!362049 () Bool)

(assert (=> b!239753 m!362049))

(check-sat (not start!52004) (not b!239752) (not b!239753))
