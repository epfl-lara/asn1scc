; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49672 () Bool)

(assert start!49672)

(declare-fun res!195978 () Bool)

(declare-fun e!161973 () Bool)

(assert (=> start!49672 (=> (not res!195978) (not e!161973))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12268 0))(
  ( (array!12269 (arr!6377 (Array (_ BitVec 32) (_ BitVec 8))) (size!5390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9744 0))(
  ( (BitStream!9745 (buf!5865 array!12268) (currentByte!10920 (_ BitVec 32)) (currentBit!10915 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9744)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49672 (= res!195978 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5390 (buf!5865 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10920 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10915 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5390 (buf!5865 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10920 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10915 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49672 e!161973))

(assert (=> start!49672 true))

(declare-fun e!161975 () Bool)

(declare-fun inv!12 (BitStream!9744) Bool)

(assert (=> start!49672 (and (inv!12 bs!63) e!161975)))

(declare-fun b!234315 () Bool)

(declare-fun res!195977 () Bool)

(assert (=> b!234315 (=> (not res!195977) (not e!161973))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234315 (= res!195977 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10915 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10920 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5390 (buf!5865 bs!63))))))))

(declare-fun b!234316 () Bool)

(assert (=> b!234316 (= e!161973 (bvslt ((_ sign_extend 32) (bvsub nBits!274 i!546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234317 () Bool)

(declare-fun array_inv!5131 (array!12268) Bool)

(assert (=> b!234317 (= e!161975 (array_inv!5131 (buf!5865 bs!63)))))

(assert (= (and start!49672 res!195978) b!234315))

(assert (= (and b!234315 res!195977) b!234316))

(assert (= start!49672 b!234317))

(declare-fun m!356959 () Bool)

(assert (=> start!49672 m!356959))

(declare-fun m!356961 () Bool)

(assert (=> b!234315 m!356961))

(declare-fun m!356963 () Bool)

(assert (=> b!234317 m!356963))

(check-sat (not b!234317) (not b!234315) (not start!49672))
(check-sat)
