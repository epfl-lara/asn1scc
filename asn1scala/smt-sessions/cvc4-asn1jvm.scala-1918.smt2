; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50200 () Bool)

(assert start!50200)

(declare-fun res!197055 () Bool)

(declare-fun e!162942 () Bool)

(assert (=> start!50200 (=> (not res!197055) (not e!162942))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12418 0))(
  ( (array!12419 (arr!6441 (Array (_ BitVec 32) (_ BitVec 8))) (size!5454 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9872 0))(
  ( (BitStream!9873 (buf!5929 array!12418) (currentByte!11038 (_ BitVec 32)) (currentBit!11033 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9872)

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50200 (= res!197055 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5454 (buf!5929 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11038 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11033 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5454 (buf!5929 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11038 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11033 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50200 e!162942))

(assert (=> start!50200 true))

(declare-fun e!162944 () Bool)

(declare-fun inv!12 (BitStream!9872) Bool)

(assert (=> start!50200 (and (inv!12 thiss!1848) e!162944)))

(declare-fun b!235719 () Bool)

(declare-fun res!197054 () Bool)

(assert (=> b!235719 (=> (not res!197054) (not e!162942))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235719 (= res!197054 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11033 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11038 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5454 (buf!5929 thiss!1848))))))))

(declare-fun b!235720 () Bool)

(assert (=> b!235720 (= e!162942 (bvslt ((_ sign_extend 32) (bvsub nBits!593 i!756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235721 () Bool)

(declare-fun array_inv!5195 (array!12418) Bool)

(assert (=> b!235721 (= e!162944 (array_inv!5195 (buf!5929 thiss!1848)))))

(assert (= (and start!50200 res!197055) b!235719))

(assert (= (and b!235719 res!197054) b!235720))

(assert (= start!50200 b!235721))

(declare-fun m!358407 () Bool)

(assert (=> start!50200 m!358407))

(declare-fun m!358409 () Bool)

(assert (=> b!235719 m!358409))

(declare-fun m!358411 () Bool)

(assert (=> b!235721 m!358411))

(push 1)

(assert (not b!235719))

(assert (not b!235721))

(assert (not start!50200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

