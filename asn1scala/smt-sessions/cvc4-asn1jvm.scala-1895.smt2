; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49658 () Bool)

(assert start!49658)

(declare-fun res!195966 () Bool)

(declare-fun e!161955 () Bool)

(assert (=> start!49658 (=> (not res!195966) (not e!161955))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12262 0))(
  ( (array!12263 (arr!6375 (Array (_ BitVec 32) (_ BitVec 8))) (size!5388 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9740 0))(
  ( (BitStream!9741 (buf!5863 array!12262) (currentByte!10916 (_ BitVec 32)) (currentBit!10911 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9740)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49658 (= res!195966 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5388 (buf!5863 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10916 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10911 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5388 (buf!5863 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10916 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10911 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49658 e!161955))

(assert (=> start!49658 true))

(declare-fun e!161956 () Bool)

(declare-fun inv!12 (BitStream!9740) Bool)

(assert (=> start!49658 (and (inv!12 bs!63) e!161956)))

(declare-fun b!234298 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234298 (= e!161955 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10911 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10916 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5388 (buf!5863 bs!63)))))))))

(declare-fun b!234299 () Bool)

(declare-fun array_inv!5129 (array!12262) Bool)

(assert (=> b!234299 (= e!161956 (array_inv!5129 (buf!5863 bs!63)))))

(assert (= (and start!49658 res!195966) b!234298))

(assert (= start!49658 b!234299))

(declare-fun m!356945 () Bool)

(assert (=> start!49658 m!356945))

(declare-fun m!356947 () Bool)

(assert (=> b!234298 m!356947))

(declare-fun m!356949 () Bool)

(assert (=> b!234299 m!356949))

(push 1)

(assert (not start!49658))

(assert (not b!234299))

(assert (not b!234298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

