; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71054 () Bool)

(assert start!71054)

(declare-fun res!263536 () Bool)

(declare-fun e!231042 () Bool)

(assert (=> start!71054 (=> (not res!263536) (not e!231042))))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> start!71054 (= res!263536 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71054 e!231042))

(assert (=> start!71054 true))

(declare-datatypes ((array!20284 0))(
  ( (array!20285 (arr!9933 (Array (_ BitVec 32) (_ BitVec 8))) (size!8841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13844 0))(
  ( (BitStream!13845 (buf!7983 array!20284) (currentByte!14718 (_ BitVec 32)) (currentBit!14713 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13844)

(declare-fun e!231040 () Bool)

(declare-fun inv!12 (BitStream!13844) Bool)

(assert (=> start!71054 (and (inv!12 thiss!1780) e!231040)))

(declare-fun b!320849 () Bool)

(declare-fun res!263535 () Bool)

(assert (=> b!320849 (=> (not res!263535) (not e!231042))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320849 (= res!263535 (validate_offset_bits!1 ((_ sign_extend 32) (size!8841 (buf!7983 thiss!1780))) ((_ sign_extend 32) (currentByte!14718 thiss!1780)) ((_ sign_extend 32) (currentBit!14713 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320850 () Bool)

(assert (=> b!320850 (= e!231042 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8841 (buf!7983 thiss!1780))) ((_ sign_extend 32) (currentByte!14718 thiss!1780)) ((_ sign_extend 32) (currentBit!14713 thiss!1780)) ((_ sign_extend 32) nBits!542))))))

(declare-fun b!320851 () Bool)

(declare-fun array_inv!8393 (array!20284) Bool)

(assert (=> b!320851 (= e!231040 (array_inv!8393 (buf!7983 thiss!1780)))))

(assert (= (and start!71054 res!263536) b!320849))

(assert (= (and b!320849 res!263535) b!320850))

(assert (= start!71054 b!320851))

(declare-fun m!459207 () Bool)

(assert (=> start!71054 m!459207))

(declare-fun m!459209 () Bool)

(assert (=> b!320849 m!459209))

(assert (=> b!320850 m!459209))

(declare-fun m!459211 () Bool)

(assert (=> b!320851 m!459211))

(push 1)

(assert (not start!71054))

(assert (not b!320851))

(assert (not b!320850))

(assert (not b!320849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

