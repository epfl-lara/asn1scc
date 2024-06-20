; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49670 () Bool)

(assert start!49670)

(declare-fun res!195972 () Bool)

(declare-fun e!161964 () Bool)

(assert (=> start!49670 (=> (not res!195972) (not e!161964))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12266 0))(
  ( (array!12267 (arr!6376 (Array (_ BitVec 32) (_ BitVec 8))) (size!5389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9742 0))(
  ( (BitStream!9743 (buf!5864 array!12266) (currentByte!10919 (_ BitVec 32)) (currentBit!10914 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9742)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49670 (= res!195972 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5389 (buf!5864 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10919 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10914 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5389 (buf!5864 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10919 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10914 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49670 e!161964))

(assert (=> start!49670 true))

(declare-fun e!161965 () Bool)

(declare-fun inv!12 (BitStream!9742) Bool)

(assert (=> start!49670 (and (inv!12 bs!63) e!161965)))

(declare-fun b!234306 () Bool)

(declare-fun res!195971 () Bool)

(assert (=> b!234306 (=> (not res!195971) (not e!161964))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234306 (= res!195971 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10914 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10919 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5389 (buf!5864 bs!63))))))))

(declare-fun b!234307 () Bool)

(assert (=> b!234307 (= e!161964 (bvslt ((_ sign_extend 32) (bvsub nBits!274 i!546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234308 () Bool)

(declare-fun array_inv!5130 (array!12266) Bool)

(assert (=> b!234308 (= e!161965 (array_inv!5130 (buf!5864 bs!63)))))

(assert (= (and start!49670 res!195972) b!234306))

(assert (= (and b!234306 res!195971) b!234307))

(assert (= start!49670 b!234308))

(declare-fun m!356953 () Bool)

(assert (=> start!49670 m!356953))

(declare-fun m!356955 () Bool)

(assert (=> b!234306 m!356955))

(declare-fun m!356957 () Bool)

(assert (=> b!234308 m!356957))

(push 1)

(assert (not b!234306))

(assert (not start!49670))

(assert (not b!234308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

