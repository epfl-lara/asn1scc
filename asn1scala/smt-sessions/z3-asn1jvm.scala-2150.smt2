; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54668 () Bool)

(assert start!54668)

(declare-fun b!256179 () Bool)

(declare-fun res!214778 () Bool)

(declare-fun e!177487 () Bool)

(assert (=> b!256179 (=> (not res!214778) (not e!177487))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13815 0))(
  ( (array!13816 (arr!7049 (Array (_ BitVec 32) (_ BitVec 8))) (size!6062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11046 0))(
  ( (BitStream!11047 (buf!6579 array!13815) (currentByte!12058 (_ BitVec 32)) (currentBit!12053 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11046)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256179 (= res!214778 (validate_offset_bits!1 ((_ sign_extend 32) (size!6062 (buf!6579 thiss!1005))) ((_ sign_extend 32) (currentByte!12058 thiss!1005)) ((_ sign_extend 32) (currentBit!12053 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256180 () Bool)

(declare-fun res!214779 () Bool)

(assert (=> b!256180 (=> (not res!214779) (not e!177487))))

(assert (=> b!256180 (= res!214779 (bvsge from!289 nBits!297))))

(declare-fun res!214782 () Bool)

(assert (=> start!54668 (=> (not res!214782) (not e!177487))))

(assert (=> start!54668 (= res!214782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54668 e!177487))

(assert (=> start!54668 true))

(declare-fun e!177488 () Bool)

(declare-fun inv!12 (BitStream!11046) Bool)

(assert (=> start!54668 (and (inv!12 thiss!1005) e!177488)))

(declare-fun b!256181 () Bool)

(declare-fun array_inv!5803 (array!13815) Bool)

(assert (=> b!256181 (= e!177488 (array_inv!5803 (buf!6579 thiss!1005)))))

(declare-fun b!256182 () Bool)

(declare-fun e!177485 () Bool)

(declare-fun e!177484 () Bool)

(assert (=> b!256182 (= e!177485 e!177484)))

(declare-fun res!214781 () Bool)

(assert (=> b!256182 (=> res!214781 e!177484)))

(declare-fun lt!397637 () (_ BitVec 64))

(assert (=> b!256182 (= res!214781 (not (= lt!397637 (bvadd lt!397637 (bvsub nBits!297 from!289)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256182 (= lt!397637 (bitIndex!0 (size!6062 (buf!6579 thiss!1005)) (currentByte!12058 thiss!1005) (currentBit!12053 thiss!1005)))))

(declare-fun b!256183 () Bool)

(assert (=> b!256183 (= e!177487 (not e!177485))))

(declare-fun res!214780 () Bool)

(assert (=> b!256183 (=> res!214780 e!177485)))

(assert (=> b!256183 (= res!214780 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!11046 BitStream!11046) Bool)

(assert (=> b!256183 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18332 0))(
  ( (Unit!18333) )
))
(declare-fun lt!397636 () Unit!18332)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11046) Unit!18332)

(assert (=> b!256183 (= lt!397636 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!256184 () Bool)

(assert (=> b!256184 (= e!177484 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!21920 0))(
  ( (tuple2!21921 (_1!11894 BitStream!11046) (_2!11894 BitStream!11046)) )
))
(declare-fun lt!397638 () tuple2!21920)

(declare-fun reader!0 (BitStream!11046 BitStream!11046) tuple2!21920)

(assert (=> b!256184 (= lt!397638 (reader!0 thiss!1005 thiss!1005))))

(assert (= (and start!54668 res!214782) b!256179))

(assert (= (and b!256179 res!214778) b!256180))

(assert (= (and b!256180 res!214779) b!256183))

(assert (= (and b!256183 (not res!214780)) b!256182))

(assert (= (and b!256182 (not res!214781)) b!256184))

(assert (= start!54668 b!256181))

(declare-fun m!385811 () Bool)

(assert (=> start!54668 m!385811))

(declare-fun m!385813 () Bool)

(assert (=> b!256184 m!385813))

(declare-fun m!385815 () Bool)

(assert (=> b!256183 m!385815))

(declare-fun m!385817 () Bool)

(assert (=> b!256183 m!385817))

(declare-fun m!385819 () Bool)

(assert (=> b!256181 m!385819))

(declare-fun m!385821 () Bool)

(assert (=> b!256182 m!385821))

(declare-fun m!385823 () Bool)

(assert (=> b!256179 m!385823))

(check-sat (not b!256179) (not b!256182) (not b!256184) (not b!256181) (not start!54668) (not b!256183))
