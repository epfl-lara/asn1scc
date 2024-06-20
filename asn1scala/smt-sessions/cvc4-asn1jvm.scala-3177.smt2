; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73038 () Bool)

(assert start!73038)

(declare-fun b!325012 () Bool)

(declare-fun e!234279 () Bool)

(declare-datatypes ((array!20946 0))(
  ( (array!20947 (arr!10191 (Array (_ BitVec 32) (_ BitVec 8))) (size!9099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14360 0))(
  ( (BitStream!14361 (buf!8241 array!20946) (currentByte!15267 (_ BitVec 32)) (currentBit!15262 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14360)

(declare-fun array_inv!8651 (array!20946) Bool)

(assert (=> b!325012 (= e!234279 (array_inv!8651 (buf!8241 thiss!877)))))

(declare-fun b!325010 () Bool)

(declare-fun res!266732 () Bool)

(declare-fun e!234277 () Bool)

(assert (=> b!325010 (=> (not res!266732) (not e!234277))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325010 (= res!266732 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9099 (buf!8241 thiss!877)) (currentByte!15267 thiss!877) (currentBit!15262 thiss!877))) (bitIndex!0 (size!9099 (buf!8241 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15267 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!325009 () Bool)

(declare-fun res!266733 () Bool)

(assert (=> b!325009 (=> (not res!266733) (not e!234277))))

(assert (=> b!325009 (= res!266733 (bvsge (currentBit!15262 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325011 () Bool)

(assert (=> b!325011 (= e!234277 (or (bvsgt ((_ sign_extend 32) (size!9099 (buf!8241 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15267 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!266734 () Bool)

(assert (=> start!73038 (=> (not res!266734) (not e!234277))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73038 (= res!266734 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9099 (buf!8241 thiss!877))) ((_ sign_extend 32) (currentByte!15267 thiss!877)) ((_ sign_extend 32) (currentBit!15262 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73038 e!234277))

(declare-fun inv!12 (BitStream!14360) Bool)

(assert (=> start!73038 (and (inv!12 thiss!877) e!234279)))

(assert (= (and start!73038 res!266734) b!325009))

(assert (= (and b!325009 res!266733) b!325010))

(assert (= (and b!325010 res!266732) b!325011))

(assert (= start!73038 b!325012))

(declare-fun m!463029 () Bool)

(assert (=> b!325012 m!463029))

(declare-fun m!463031 () Bool)

(assert (=> b!325010 m!463031))

(declare-fun m!463033 () Bool)

(assert (=> b!325010 m!463033))

(declare-fun m!463035 () Bool)

(assert (=> start!73038 m!463035))

(declare-fun m!463037 () Bool)

(assert (=> start!73038 m!463037))

(push 1)

(assert (not start!73038))

(assert (not b!325010))

(assert (not b!325012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

