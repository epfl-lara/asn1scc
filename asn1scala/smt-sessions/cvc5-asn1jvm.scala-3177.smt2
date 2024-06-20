; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73034 () Bool)

(assert start!73034)

(declare-fun b!324985 () Bool)

(declare-fun res!266714 () Bool)

(declare-fun e!234260 () Bool)

(assert (=> b!324985 (=> (not res!266714) (not e!234260))))

(declare-datatypes ((array!20942 0))(
  ( (array!20943 (arr!10189 (Array (_ BitVec 32) (_ BitVec 8))) (size!9097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14356 0))(
  ( (BitStream!14357 (buf!8239 array!20942) (currentByte!15265 (_ BitVec 32)) (currentBit!15260 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14356)

(assert (=> b!324985 (= res!266714 (bvsge (currentBit!15260 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324988 () Bool)

(declare-fun e!234261 () Bool)

(declare-fun array_inv!8649 (array!20942) Bool)

(assert (=> b!324988 (= e!234261 (array_inv!8649 (buf!8239 thiss!877)))))

(declare-fun b!324986 () Bool)

(declare-fun res!266716 () Bool)

(assert (=> b!324986 (=> (not res!266716) (not e!234260))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324986 (= res!266716 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9097 (buf!8239 thiss!877)) (currentByte!15265 thiss!877) (currentBit!15260 thiss!877))) (bitIndex!0 (size!9097 (buf!8239 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15265 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266715 () Bool)

(assert (=> start!73034 (=> (not res!266715) (not e!234260))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73034 (= res!266715 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9097 (buf!8239 thiss!877))) ((_ sign_extend 32) (currentByte!15265 thiss!877)) ((_ sign_extend 32) (currentBit!15260 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73034 e!234260))

(declare-fun inv!12 (BitStream!14356) Bool)

(assert (=> start!73034 (and (inv!12 thiss!877) e!234261)))

(declare-fun b!324987 () Bool)

(assert (=> b!324987 (= e!234260 (or (bvsgt ((_ sign_extend 32) (size!9097 (buf!8239 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15265 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!73034 res!266715) b!324985))

(assert (= (and b!324985 res!266714) b!324986))

(assert (= (and b!324986 res!266716) b!324987))

(assert (= start!73034 b!324988))

(declare-fun m!463009 () Bool)

(assert (=> b!324988 m!463009))

(declare-fun m!463011 () Bool)

(assert (=> b!324986 m!463011))

(declare-fun m!463013 () Bool)

(assert (=> b!324986 m!463013))

(declare-fun m!463015 () Bool)

(assert (=> start!73034 m!463015))

(declare-fun m!463017 () Bool)

(assert (=> start!73034 m!463017))

(push 1)

(assert (not b!324986))

(assert (not b!324988))

(assert (not start!73034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

