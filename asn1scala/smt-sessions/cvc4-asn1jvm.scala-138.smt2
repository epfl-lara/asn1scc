; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3278 () Bool)

(assert start!3278)

(declare-fun res!13697 () Bool)

(declare-fun e!9106 () Bool)

(assert (=> start!3278 (=> (not res!13697) (not e!9106))))

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!838 0))(
  ( (array!839 (arr!786 (Array (_ BitVec 32) (_ BitVec 8))) (size!357 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!674 0))(
  ( (BitStream!675 (buf!708 array!838) (currentByte!1851 (_ BitVec 32)) (currentBit!1846 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!674)

(assert (=> start!3278 (= res!13697 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!357 (buf!708 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1851 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1846 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!357 (buf!708 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1851 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1846 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3278 e!9106))

(assert (=> start!3278 true))

(declare-fun e!9107 () Bool)

(declare-fun inv!12 (BitStream!674) Bool)

(assert (=> start!3278 (and (inv!12 thiss!1862) e!9107)))

(declare-fun b!14614 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14614 (= e!9106 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1846 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1851 thiss!1862))) ((_ extract 31 0) ((_ sign_extend 32) (size!357 (buf!708 thiss!1862)))))))))

(declare-fun b!14615 () Bool)

(declare-fun array_inv!346 (array!838) Bool)

(assert (=> b!14615 (= e!9107 (array_inv!346 (buf!708 thiss!1862)))))

(assert (= (and start!3278 res!13697) b!14614))

(assert (= start!3278 b!14615))

(declare-fun m!21049 () Bool)

(assert (=> start!3278 m!21049))

(declare-fun m!21051 () Bool)

(assert (=> b!14614 m!21051))

(declare-fun m!21053 () Bool)

(assert (=> b!14615 m!21053))

(push 1)

(assert (not b!14614))

(assert (not b!14615))

(assert (not start!3278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4796 () Bool)

