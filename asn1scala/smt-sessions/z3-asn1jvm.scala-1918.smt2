; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50198 () Bool)

(assert start!50198)

(declare-fun res!197048 () Bool)

(declare-fun e!162934 () Bool)

(assert (=> start!50198 (=> (not res!197048) (not e!162934))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12416 0))(
  ( (array!12417 (arr!6440 (Array (_ BitVec 32) (_ BitVec 8))) (size!5453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9870 0))(
  ( (BitStream!9871 (buf!5928 array!12416) (currentByte!11037 (_ BitVec 32)) (currentBit!11032 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9870)

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50198 (= res!197048 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5453 (buf!5928 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11037 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11032 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5453 (buf!5928 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11037 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11032 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50198 e!162934))

(assert (=> start!50198 true))

(declare-fun e!162933 () Bool)

(declare-fun inv!12 (BitStream!9870) Bool)

(assert (=> start!50198 (and (inv!12 thiss!1848) e!162933)))

(declare-fun b!235710 () Bool)

(declare-fun res!197049 () Bool)

(assert (=> b!235710 (=> (not res!197049) (not e!162934))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235710 (= res!197049 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11032 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11037 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5453 (buf!5928 thiss!1848))))))))

(declare-fun b!235711 () Bool)

(assert (=> b!235711 (= e!162934 (bvslt ((_ sign_extend 32) (bvsub nBits!593 i!756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235712 () Bool)

(declare-fun array_inv!5194 (array!12416) Bool)

(assert (=> b!235712 (= e!162933 (array_inv!5194 (buf!5928 thiss!1848)))))

(assert (= (and start!50198 res!197048) b!235710))

(assert (= (and b!235710 res!197049) b!235711))

(assert (= start!50198 b!235712))

(declare-fun m!358401 () Bool)

(assert (=> start!50198 m!358401))

(declare-fun m!358403 () Bool)

(assert (=> b!235710 m!358403))

(declare-fun m!358405 () Bool)

(assert (=> b!235712 m!358405))

(check-sat (not b!235710) (not start!50198) (not b!235712))
(check-sat)
