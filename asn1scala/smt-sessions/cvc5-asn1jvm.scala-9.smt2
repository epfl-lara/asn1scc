; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!154 () Bool)

(assert start!154)

(declare-fun res!2512 () Bool)

(declare-fun e!150 () Bool)

(assert (=> start!154 (=> (not res!2512) (not e!150))))

(declare-datatypes ((array!63 0))(
  ( (array!64 (arr!412 (Array (_ BitVec 32) (_ BitVec 8))) (size!25 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!34 0))(
  ( (BitStream!35 (buf!337 array!63) (currentByte!1232 (_ BitVec 32)) (currentBit!1227 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!34)

(assert (=> start!154 (= res!2512 (and (bvsle ((_ sign_extend 32) (size!25 (buf!337 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1232 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1227 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!25 (buf!337 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1232 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1227 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!154 e!150))

(declare-fun e!151 () Bool)

(declare-fun inv!12 (BitStream!34) Bool)

(assert (=> start!154 (and (inv!12 thiss!932) e!151)))

(declare-fun b!399 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!399 (= e!150 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1227 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1232 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!25 (buf!337 thiss!932)))))))))

(declare-fun b!400 () Bool)

(declare-fun array_inv!22 (array!63) Bool)

(assert (=> b!400 (= e!151 (array_inv!22 (buf!337 thiss!932)))))

(assert (= (and start!154 res!2512) b!399))

(assert (= start!154 b!400))

(declare-fun m!151 () Bool)

(assert (=> start!154 m!151))

(declare-fun m!153 () Bool)

(assert (=> b!399 m!153))

(declare-fun m!155 () Bool)

(assert (=> b!400 m!155))

(push 1)

(assert (not b!400))

(assert (not start!154))

(assert (not b!399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

