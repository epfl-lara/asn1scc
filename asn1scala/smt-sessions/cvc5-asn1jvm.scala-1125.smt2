; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31998 () Bool)

(assert start!31998)

(declare-fun res!132527 () Bool)

(declare-fun e!108106 () Bool)

(assert (=> start!31998 (=> (not res!132527) (not e!108106))))

(declare-datatypes ((array!7476 0))(
  ( (array!7477 (arr!4309 (Array (_ BitVec 32) (_ BitVec 8))) (size!3388 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5944 0))(
  ( (BitStream!5945 (buf!3846 array!7476) (currentByte!7057 (_ BitVec 32)) (currentBit!7052 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5944)

(assert (=> start!31998 (= res!132527 (and (bvsle ((_ sign_extend 32) (size!3388 (buf!3846 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7057 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7052 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3388 (buf!3846 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7057 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7052 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31998 e!108106))

(declare-fun e!108107 () Bool)

(declare-fun inv!12 (BitStream!5944) Bool)

(assert (=> start!31998 (and (inv!12 thiss!1602) e!108107)))

(declare-fun b!158735 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158735 (= e!108106 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7052 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7057 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3388 (buf!3846 thiss!1602)))))))))

(declare-fun b!158736 () Bool)

(declare-fun array_inv!3135 (array!7476) Bool)

(assert (=> b!158736 (= e!108107 (array_inv!3135 (buf!3846 thiss!1602)))))

(assert (= (and start!31998 res!132527) b!158735))

(assert (= start!31998 b!158736))

(declare-fun m!249295 () Bool)

(assert (=> start!31998 m!249295))

(declare-fun m!249297 () Bool)

(assert (=> b!158735 m!249297))

(declare-fun m!249299 () Bool)

(assert (=> b!158736 m!249299))

(push 1)

(assert (not start!31998))

(assert (not b!158735))

(assert (not b!158736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

