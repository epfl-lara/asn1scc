; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50160 () Bool)

(assert start!50160)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12396 0))(
  ( (array!12397 (arr!6432 (Array (_ BitVec 32) (_ BitVec 8))) (size!5445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9854 0))(
  ( (BitStream!9855 (buf!5920 array!12396) (currentByte!11026 (_ BitVec 32)) (currentBit!11021 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9854)

(assert (=> start!50160 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5445 (buf!5920 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11026 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11021 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50160 true))

(declare-fun e!162871 () Bool)

(declare-fun inv!12 (BitStream!9854) Bool)

(assert (=> start!50160 (and (inv!12 thiss!1848) e!162871)))

(declare-fun b!235667 () Bool)

(declare-fun array_inv!5186 (array!12396) Bool)

(assert (=> b!235667 (= e!162871 (array_inv!5186 (buf!5920 thiss!1848)))))

(assert (= start!50160 b!235667))

(declare-fun m!358353 () Bool)

(assert (=> start!50160 m!358353))

(declare-fun m!358355 () Bool)

(assert (=> b!235667 m!358355))

(push 1)

(assert (not b!235667))

(assert (not start!50160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

