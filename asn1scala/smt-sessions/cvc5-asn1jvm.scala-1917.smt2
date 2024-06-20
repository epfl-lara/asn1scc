; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50178 () Bool)

(assert start!50178)

(declare-fun res!197031 () Bool)

(declare-fun e!162897 () Bool)

(assert (=> start!50178 (=> (not res!197031) (not e!162897))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12406 0))(
  ( (array!12407 (arr!6436 (Array (_ BitVec 32) (_ BitVec 8))) (size!5449 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9862 0))(
  ( (BitStream!9863 (buf!5924 array!12406) (currentByte!11031 (_ BitVec 32)) (currentBit!11026 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9862)

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50178 (= res!197031 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5449 (buf!5924 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11031 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11026 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5449 (buf!5924 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11031 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11026 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50178 e!162897))

(assert (=> start!50178 true))

(declare-fun e!162898 () Bool)

(declare-fun inv!12 (BitStream!9862) Bool)

(assert (=> start!50178 (and (inv!12 thiss!1848) e!162898)))

(declare-fun b!235681 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235681 (= e!162897 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11026 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11031 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5449 (buf!5924 thiss!1848)))))))))

(declare-fun b!235682 () Bool)

(declare-fun array_inv!5190 (array!12406) Bool)

(assert (=> b!235682 (= e!162898 (array_inv!5190 (buf!5924 thiss!1848)))))

(assert (= (and start!50178 res!197031) b!235681))

(assert (= start!50178 b!235682))

(declare-fun m!358373 () Bool)

(assert (=> start!50178 m!358373))

(declare-fun m!358375 () Bool)

(assert (=> b!235681 m!358375))

(declare-fun m!358377 () Bool)

(assert (=> b!235682 m!358377))

(push 1)

(assert (not start!50178))

(assert (not b!235682))

(assert (not b!235681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

