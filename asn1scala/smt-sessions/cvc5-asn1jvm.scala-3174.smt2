; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72962 () Bool)

(assert start!72962)

(declare-fun b!324821 () Bool)

(declare-fun res!266576 () Bool)

(declare-fun e!234155 () Bool)

(assert (=> b!324821 (=> (not res!266576) (not e!234155))))

(declare-datatypes ((array!20918 0))(
  ( (array!20919 (arr!10180 (Array (_ BitVec 32) (_ BitVec 8))) (size!9088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14338 0))(
  ( (BitStream!14339 (buf!8230 array!20918) (currentByte!15241 (_ BitVec 32)) (currentBit!15236 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14338)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324821 (= res!266576 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9088 (buf!8230 thiss!877)) (currentByte!15241 thiss!877) (currentBit!15236 thiss!877))) (bitIndex!0 (size!9088 (buf!8230 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15241 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!324823 () Bool)

(declare-fun e!234154 () Bool)

(declare-fun array_inv!8640 (array!20918) Bool)

(assert (=> b!324823 (= e!234154 (array_inv!8640 (buf!8230 thiss!877)))))

(declare-fun b!324822 () Bool)

(assert (=> b!324822 (= e!234155 (or (bvsgt ((_ sign_extend 32) (size!9088 (buf!8230 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15241 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15236 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!324820 () Bool)

(declare-fun res!266577 () Bool)

(assert (=> b!324820 (=> (not res!266577) (not e!234155))))

(assert (=> b!324820 (= res!266577 (bvsge (currentBit!15236 thiss!877) #b00000000000000000000000000000111))))

(declare-fun res!266578 () Bool)

(assert (=> start!72962 (=> (not res!266578) (not e!234155))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72962 (= res!266578 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9088 (buf!8230 thiss!877))) ((_ sign_extend 32) (currentByte!15241 thiss!877)) ((_ sign_extend 32) (currentBit!15236 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72962 e!234155))

(declare-fun inv!12 (BitStream!14338) Bool)

(assert (=> start!72962 (and (inv!12 thiss!877) e!234154)))

(assert (= (and start!72962 res!266578) b!324820))

(assert (= (and b!324820 res!266577) b!324821))

(assert (= (and b!324821 res!266576) b!324822))

(assert (= start!72962 b!324823))

(declare-fun m!462877 () Bool)

(assert (=> b!324821 m!462877))

(declare-fun m!462879 () Bool)

(assert (=> b!324821 m!462879))

(declare-fun m!462881 () Bool)

(assert (=> b!324823 m!462881))

(declare-fun m!462883 () Bool)

(assert (=> start!72962 m!462883))

(declare-fun m!462885 () Bool)

(assert (=> start!72962 m!462885))

(push 1)

(assert (not start!72962))

(assert (not b!324821))

(assert (not b!324823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

