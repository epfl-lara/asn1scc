; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72754 () Bool)

(assert start!72754)

(declare-fun b!324438 () Bool)

(declare-fun e!233881 () Bool)

(declare-datatypes ((array!20852 0))(
  ( (array!20853 (arr!10156 (Array (_ BitVec 32) (_ BitVec 8))) (size!9064 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14290 0))(
  ( (BitStream!14291 (buf!8206 array!20852) (currentByte!15173 (_ BitVec 32)) (currentBit!15168 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14290)

(assert (=> b!324438 (= e!233881 (or (bvsgt ((_ sign_extend 32) (size!9064 (buf!8206 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15173 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15168 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!324439 () Bool)

(declare-fun e!233883 () Bool)

(declare-fun array_inv!8616 (array!20852) Bool)

(assert (=> b!324439 (= e!233883 (array_inv!8616 (buf!8206 thiss!877)))))

(declare-fun res!266266 () Bool)

(assert (=> start!72754 (=> (not res!266266) (not e!233881))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72754 (= res!266266 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9064 (buf!8206 thiss!877))) ((_ sign_extend 32) (currentByte!15173 thiss!877)) ((_ sign_extend 32) (currentBit!15168 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72754 e!233881))

(declare-fun inv!12 (BitStream!14290) Bool)

(assert (=> start!72754 (and (inv!12 thiss!877) e!233883)))

(declare-fun b!324436 () Bool)

(declare-fun res!266265 () Bool)

(assert (=> b!324436 (=> (not res!266265) (not e!233881))))

(assert (=> b!324436 (= res!266265 (bvslt (currentBit!15168 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324437 () Bool)

(declare-fun res!266264 () Bool)

(assert (=> b!324437 (=> (not res!266264) (not e!233881))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324437 (= res!266264 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9064 (buf!8206 thiss!877)) (currentByte!15173 thiss!877) (currentBit!15168 thiss!877))) (bitIndex!0 (size!9064 (buf!8206 thiss!877)) (currentByte!15173 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15168 thiss!877)))))))

(assert (= (and start!72754 res!266266) b!324436))

(assert (= (and b!324436 res!266265) b!324437))

(assert (= (and b!324437 res!266264) b!324438))

(assert (= start!72754 b!324439))

(declare-fun m!462559 () Bool)

(assert (=> b!324439 m!462559))

(declare-fun m!462561 () Bool)

(assert (=> start!72754 m!462561))

(declare-fun m!462563 () Bool)

(assert (=> start!72754 m!462563))

(declare-fun m!462565 () Bool)

(assert (=> b!324437 m!462565))

(declare-fun m!462567 () Bool)

(assert (=> b!324437 m!462567))

(push 1)

(assert (not start!72754))

(assert (not b!324439))

(assert (not b!324437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

